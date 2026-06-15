from django.conf import settings
from django.db import models

from constants import (
    PROJECT_NAME_MAX_LENGTH,
    SKILL_NAME_MAX_LENGTH,
    STATUS_MAX_LENGTH,
)
from projects.managers import ProjectQuerySet, SkillQuerySet


class Skill(models.Model):
    name = models.CharField(
        "Название навыка",
        max_length=SKILL_NAME_MAX_LENGTH,
        unique=True,
    )

    objects = SkillQuerySet.as_manager()

    class Meta:
        verbose_name = "Навык"
        verbose_name_plural = "Навыки"
        ordering = ("name",)

    def __str__(self):
        return self.name


class Project(models.Model):
    class Status(models.TextChoices):
        OPEN = "open", "Открыт"
        CLOSED = "closed", "Закрыт"

    name = models.CharField(
        "Название проекта",
        max_length=PROJECT_NAME_MAX_LENGTH,
    )
    description = models.TextField(
        "Описание проекта",
        default="",
        blank=True,
    )
    owner = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        verbose_name="Автор",
        on_delete=models.CASCADE,
        related_name="owned_projects",
    )
    created_at = models.DateTimeField(
        "Дата публикации",
        auto_now_add=True,
    )
    github_url = models.URLField(
        "Ссылка на GitHub",
        default="",
        blank=True,
    )
    status = models.CharField(
        "Статус",
        max_length=STATUS_MAX_LENGTH,
        choices=Status.choices,
        default=Status.OPEN,
    )
    participants = models.ManyToManyField(
        settings.AUTH_USER_MODEL,
        verbose_name="Участники",
        related_name="participated_projects",
        blank=True,
    )
    skills = models.ManyToManyField(
        Skill,
        verbose_name="Необходимые навыки",
        related_name="projects",
        blank=True,
    )

    objects = ProjectQuerySet.as_manager()

    class Meta:
        verbose_name = "Проект"
        verbose_name_plural = "Проекты"
        ordering = ("-created_at",)

    def __str__(self):
        return self.name
