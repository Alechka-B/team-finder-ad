import re

from django.core.exceptions import ValidationError

PHONE_DIGITS_COUNT = 11
LOCAL_PHONE_DIGITS_COUNT = 10
ALLOWED_GITHUB_PREFIXES = ("https://github.com/", "http://github.com/")


def normalize_phone(phone):
    if not phone:
        return ""

    digits = re.sub(r"\D", "", phone)
    if not digits:
        raise ValidationError("Некорректный номер телефона.")

    if digits.startswith("8"):
        digits = "7" + digits[1:]
    elif len(digits) == LOCAL_PHONE_DIGITS_COUNT:
        digits = "7" + digits

    if len(digits) != PHONE_DIGITS_COUNT or not digits.startswith("7"):
        raise ValidationError("Телефон должен содержать 11 цифр и начинаться с +7.")

    return "+" + digits


def validate_github_url(url):
    if not url:
        return url

    if not url.startswith(ALLOWED_GITHUB_PREFIXES):
        raise ValidationError("Ссылка должна вести на github.com.")

    return url
