import json
from http import HTTPStatus

from django.contrib.auth.decorators import login_required
from django.http import Http404, JsonResponse
from django.shortcuts import redirect, render
from django.views.decorators.http import require_GET, require_POST

from constants import SKILL_SUGGESTIONS_LIMIT
from projects import services as project_services
from projects.forms import ProjectForm
from projects.models import Project, Skill
from utils.decorators import ajax_login_required, require_author
from utils.pagination import paginate


def project_list(request):
    active_skill = request.GET.get("skill", "")

    qs = Project.objects.with_full_details().filter_by_skill(active_skill)
    page_obj, query_prefix = paginate(request, qs)

    all_skills = Skill.objects.values_list("name", flat=True)

    ctx = {
        "projects": qs,
        "page_obj": page_obj,
        "query_prefix": query_prefix,
        "all_skills": all_skills,
        "active_skill": active_skill,
    }
    return render(request, "projects/project_list.html", ctx)


def project_detail(request, pk):
    target_project = (
        Project.objects.with_full_details().filter(pk=pk).first()
    )
    if target_project is None:
        raise Http404("Проект не найден.")

    return render(request, "projects/project-details.html", {"project": target_project})


@login_required
def project_create(request):
    frm = ProjectForm(request.POST or None)

    if request.method != "POST":
        return render(request, "projects/create-project.html", {"form": frm, "is_edit": False})

    if not frm.is_valid():
        return render(request, "projects/create-project.html", {"form": frm, "is_edit": False})

    target_project = project_services.create_project(
        owner=request.user,
        **frm.cleaned_data,
    )
    return redirect(f"/projects/{target_project.id}/")


@login_required
@require_author
def project_edit(request, pk, target_project):
    frm = ProjectForm(request.POST or None, instance=target_project)

    if request.method != "POST":
        return render(request, "projects/create-project.html", {"form": frm, "is_edit": True})

    if not frm.is_valid():
        return render(request, "projects/create-project.html", {"form": frm, "is_edit": True})

    project_services.update_project(target_project=target_project, **frm.cleaned_data)
    return redirect(f"/projects/{target_project.id}/")


@require_POST
@ajax_login_required
@require_author
def project_complete(request, pk, target_project):
    project_services.complete_project(target_project=target_project)
    return JsonResponse({"status": "ok", "project_status": target_project.status})


@require_POST
@ajax_login_required
def toggle_participate(request, pk):
    target_project = Project.objects.filter(pk=pk).first()
    if target_project is None:
        return JsonResponse(
            {"status": "error", "error": "Проект не найден."},
            status=HTTPStatus.NOT_FOUND,
        )

    joined = project_services.toggle_participation(
        target_project=target_project,
        current_user=request.user,
    )
    return JsonResponse({"status": "ok", "participant": joined})


@require_GET
def skills_search(request):
    query = request.GET.get("q", "").strip()
    qs = Skill.objects.search(query).order_by("name")[:SKILL_SUGGESTIONS_LIMIT]
    data = list(qs.values("id", "name"))
    return JsonResponse(data, safe=False)


def _parse_json_body(request):
    try:
        return json.loads(request.body or b"{}")
    except (ValueError, TypeError):
        return {}


@require_POST
@ajax_login_required
@require_author
def project_skill_add(request, pk, target_project):
    payload = _parse_json_body(request)

    target_skill = project_services.add_skill_to_project(
        target_project=target_project,
        skill_id=payload.get("skill_id"),
        name=payload.get("name"),
    )
    if target_skill is None:
        return JsonResponse(
            {"status": "error", "error": "Не удалось добавить навык."},
            status=HTTPStatus.BAD_REQUEST,
        )

    return JsonResponse(
        {
            "status": "ok",
            "added": True,
            "skill_id": target_skill.id,
            "id": target_skill.id,
            "name": target_skill.name,
        }
    )


@require_POST
@ajax_login_required
@require_author
def project_skill_remove(request, pk, skill_id, target_project):
    project_services.remove_skill_from_project(
        target_project=target_project,
        skill_id=skill_id,
    )
    return JsonResponse({"status": "ok"})
