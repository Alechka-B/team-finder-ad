from projects.models import Project, Skill


def create_project(*, owner, name, description="", github_url="", status=Project.Status.OPEN):
    target_project = Project.objects.create(
        owner=owner,
        name=name,
        description=description,
        github_url=github_url,
        status=status,
    )
    return target_project


def update_project(*, target_project, name, description, github_url, status):
    target_project.name = name
    target_project.description = description
    target_project.github_url = github_url
    target_project.status = status
    target_project.save(
        update_fields=["name", "description", "github_url", "status"]
    )
    return target_project


def complete_project(*, target_project):
    if target_project.status == Project.Status.CLOSED:
        return target_project

    target_project.status = Project.Status.CLOSED
    target_project.save(update_fields=["status"])
    return target_project


def toggle_participation(*, target_project, current_user):
    if target_project.participants.filter(pk=current_user.pk).exists():
        target_project.participants.remove(current_user)
        return False

    target_project.participants.add(current_user)
    return True


def add_skill_to_project(*, target_project, skill_id=None, name=None):
    target_skill = None

    if skill_id is not None:
        target_skill = Skill.objects.filter(pk=skill_id).first()

    if target_skill is None and name:
        normalized = name.strip()
        if normalized:
            target_skill, _ = Skill.objects.get_or_create(name=normalized)

    if target_skill is None:
        return None

    target_project.skills.add(target_skill)
    return target_skill


def remove_skill_from_project(*, target_project, skill_id):
    target_skill = target_project.skills.filter(pk=skill_id).first()
    if target_skill is None:
        return False

    target_project.skills.remove(target_skill)
    return True
