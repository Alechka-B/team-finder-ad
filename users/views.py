from django.contrib.auth import authenticate, login, logout, update_session_auth_hash
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.http import Http404
from django.shortcuts import redirect, render

from users import services as user_services
from users.forms import EditProfileForm, LoginForm, RegisterForm
from users.models import User
from utils.pagination import paginate

PROJECTS_LIST_URL = "/projects/list/"


def register(request):
    if request.user.is_authenticated:
        return redirect(PROJECTS_LIST_URL)

    frm = RegisterForm(request.POST or None)

    if request.method != "POST":
        return render(request, "users/register.html", {"form": frm})

    if not frm.is_valid():
        return render(request, "users/register.html", {"form": frm})

    user_services.register_user(**frm.cleaned_data)
    return redirect("/users/login/")


def login_view(request):
    if request.user.is_authenticated:
        return redirect(PROJECTS_LIST_URL)

    frm = LoginForm(request.POST or None)

    if request.method != "POST":
        return render(request, "users/login.html", {"form": frm})

    if not frm.is_valid():
        return render(request, "users/login.html", {"form": frm})

    target_user = authenticate(
        request,
        username=frm.cleaned_data["email"],
        password=frm.cleaned_data["password"],
    )
    if target_user is None:
        frm.add_error(None, "Неверный email или пароль.")
        return render(request, "users/login.html", {"form": frm})

    login(request, target_user)
    return redirect(PROJECTS_LIST_URL)


@login_required
def logout_view(request):
    logout(request)
    return redirect(PROJECTS_LIST_URL)


def participants_list(request):
    qs = User.objects.active()
    page_obj, query_prefix = paginate(request, qs)

    ctx = {
        "participants": qs,
        "page_obj": page_obj,
        "query_prefix": query_prefix,
    }
    return render(request, "users/participants.html", ctx)


def user_detail(request, pk):
    target_user = User.objects.with_projects().filter(pk=pk).first()
    if target_user is None:
        raise Http404("Пользователь не найден.")

    return render(request, "users/user-details.html", {"user": target_user})


@login_required
def edit_profile(request):
    frm = EditProfileForm(
        request.POST or None,
        request.FILES or None,
        instance=request.user,
    )

    if request.method != "POST":
        return render(request, "users/edit_profile.html", {"form": frm, "user": request.user})

    if not frm.is_valid():
        return render(request, "users/edit_profile.html", {"form": frm, "user": request.user})

    user_services.update_profile(target_user=request.user, **frm.cleaned_data)
    return redirect(f"/users/{request.user.id}/")


@login_required
def change_password(request):
    frm = PasswordChangeForm(user=request.user, data=request.POST or None)

    if request.method != "POST":
        return render(request, "users/change_password.html", {"form": frm})

    if not frm.is_valid():
        return render(request, "users/change_password.html", {"form": frm})

    target_user = frm.save()
    update_session_auth_hash(request, target_user)
    return redirect(f"/users/{request.user.id}/")
