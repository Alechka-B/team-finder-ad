from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db import models

from constants import (
    ABOUT_MAX_LENGTH,
    AVATAR_UPLOAD_TO,
    FIRST_NAME_MAX_LENGTH,
    LAST_NAME_MAX_LENGTH,
    PHONE_MAX_LENGTH,
)
from users.managers import UserManager


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(
        "Email",
        unique=True,
    )

    name = models.CharField(
        "Имя",
        max_length=FIRST_NAME_MAX_LENGTH,
    )
    surname = models.CharField(
        "Фамилия",
        max_length=LAST_NAME_MAX_LENGTH,
    )
    avatar = models.ImageField(
        "Аватар",
        upload_to=AVATAR_UPLOAD_TO,
        blank=True,
    )

    phone = models.CharField(
        "Телефон",
        max_length=PHONE_MAX_LENGTH,
        unique=True,
        null=True,
        blank=True,
    )
    github_url = models.URLField(
        "Ссылка на GitHub",
        default="",
        blank=True,
    )
    about = models.TextField(
        "О себе",
        max_length=ABOUT_MAX_LENGTH,
        default="",
        blank=True,
    )
    is_active = models.BooleanField(
        "Активен",
        default=True,
    )
    is_staff = models.BooleanField(
        "Доступ в админку",
        default=False,
    )
    date_joined = models.DateTimeField(
        "Дата регистрации",
        auto_now_add=True,
    )

    objects = UserManager()

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ("name", "surname")

    class Meta:
        verbose_name = "Пользователь"
        verbose_name_plural = "Пользователи"
        ordering = ("-date_joined",)

    def __str__(self):
        return f"{self.name} {self.surname}".strip() or self.email

    def get_full_name(self):
        return f"{self.name} {self.surname}".strip()

    def get_short_name(self):
        return self.name
