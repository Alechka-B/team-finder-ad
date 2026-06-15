from django.urls import path

from projects import views

app_name = "projects"

urlpatterns = [
    path("list/", views.project_list, name="list"),
    path("create-project/", views.project_create, name="create"),
    path("skills/", views.skills_search, name="skills-search"),
    path("<int:pk>/", views.project_detail, name="detail"),
    path("<int:pk>/edit/", views.project_edit, name="edit"),
    path("<int:pk>/complete/", views.project_complete, name="complete"),
    path("<int:pk>/toggle-participate/", views.toggle_participate, name="toggle-participate"),
    path("<int:pk>/skills/add/", views.project_skill_add, name="skill-add"),
    path("<int:pk>/skills/<int:skill_id>/remove/", views.project_skill_remove, name="skill-remove"),
]
