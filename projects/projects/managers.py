from django.db import models


class ProjectQuerySet(models.QuerySet):
    def with_full_details(self):
        return self.select_related("owner").prefetch_related(
            "participants", "skills"
        )

    def filter_by_skill(self, skill_name):
        if not skill_name:
            return self
        return self.filter(skills__name=skill_name).distinct()

    def open(self):
        return self.filter(status="open")


class SkillQuerySet(models.QuerySet):
    def search(self, query):
        if not query:
            return self.none()
        return self.filter(name__icontains=query)
