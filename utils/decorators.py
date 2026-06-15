from functools import wraps
from http import HTTPStatus

from django.http import Http404, HttpResponseForbidden, JsonResponse

from projects.models import Project


def ajax_login_required(view_func):
    @wraps(view_func)
    def _wrapped(request, *args, **kwargs):
        if not request.user.is_authenticated:
            return JsonResponse(
                {"status": "error", "error": "Требуется авторизация."},
                status=HTTPStatus.UNAUTHORIZED,
            )
        return view_func(request, *args, **kwargs)

    return _wrapped


def require_author(view_func):
    @wraps(view_func)
    def _wrapped(request, *args, **kwargs):
        target_project = (
            Project.objects.with_full_details().filter(pk=kwargs.get("pk")).first()
        )
        if target_project is None:
            raise Http404("Проект не найден.")

        if target_project.owner_id != request.user.id:
            return HttpResponseForbidden("Недостаточно прав.")

        kwargs["target_project"] = target_project
        return view_func(request, *args, **kwargs)

    return _wrapped
