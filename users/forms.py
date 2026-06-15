from django import forms

from users.models import User
from utils.validators import normalize_phone, validate_github_url

FORM_CONTROL_CLASS = "form-control"


class _StyledFormMixin:

    def _style_fields(self):
        for field in self.fields.values():
            field.widget.attrs["class"] = FORM_CONTROL_CLASS


class RegisterForm(_StyledFormMixin, forms.ModelForm):
    password = forms.CharField(label="Пароль", widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ("name", "surname", "email", "password")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._style_fields()


class LoginForm(_StyledFormMixin, forms.Form):
    email = forms.EmailField(label="Email")
    password = forms.CharField(label="Пароль", widget=forms.PasswordInput)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._style_fields()


class EditProfileForm(_StyledFormMixin, forms.ModelForm):


    phone = forms.CharField(label="Телефон", required=False)

    class Meta:
        model = User
        fields = ("avatar", "name", "surname", "about", "phone", "github_url")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._style_fields()

    def clean_phone(self):
        return normalize_phone(self.cleaned_data.get("phone", "")) or None

    def clean_github_url(self):
        return validate_github_url(self.cleaned_data.get("github_url", ""))
