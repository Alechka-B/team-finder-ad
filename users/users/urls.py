from django.urls import path

from users import views

app_name = "users"

urlpatterns = [
    path("list/", views.participants_list, name="list"),
    path("login/", views.login_view, name="login"),
    path("register/", views.register, name="register"),
    path("logout/", views.logout_view, name="logout"),
    path("edit-profile/", views.edit_profile, name="edit-profile"),
    path("change-password/", views.change_password, name="change-password"),
    path("<int:pk>/", views.user_detail, name="detail"),
]
