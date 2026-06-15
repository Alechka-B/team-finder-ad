from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Project",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "name",
                    models.CharField(max_length=200, verbose_name="Название проекта"),
                ),
                (
                    "description",
                    models.TextField(
                        blank=True, default="", verbose_name="Описание проекта"
                    ),
                ),
                (
                    "created_at",
                    models.DateTimeField(
                        auto_now_add=True, verbose_name="Дата публикации"
                    ),
                ),
                (
                    "github_url",
                    models.URLField(
                        blank=True, default="", verbose_name="Ссылка на GitHub"
                    ),
                ),
                (
                    "status",
                    models.CharField(
                        choices=[("open", "Открыт"), ("closed", "Закрыт")],
                        default="open",
                        max_length=6,
                        verbose_name="Статус",
                    ),
                ),
            ],
            options={
                "verbose_name": "Проект",
                "verbose_name_plural": "Проекты",
                "ordering": ("-created_at",),
            },
        ),
        migrations.CreateModel(
            name="Skill",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "name",
                    models.CharField(
                        max_length=124, unique=True, verbose_name="Название навыка"
                    ),
                ),
            ],
            options={
                "verbose_name": "Навык",
                "verbose_name_plural": "Навыки",
                "ordering": ("name",),
            },
        ),
    ]
