from django import forms

from projects.models import Project
from utils.validators import validate_github_url

FORM_CONTROL_CLASS = "form-control"


class ProjectForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = ("name", "description", "github_url", "status")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        for field in self.fields.values():
            field.widget.attrs["class"] = FORM_CONTROL_CLASS

    def clean_github_url(self):
        return validate_github_url(self.cleaned_data.get("github_url", ""))
