from io import BytesIO
from uuid import uuid4

from django.conf import settings
from django.core.files.base import ContentFile
from PIL import Image, ImageDraw, ImageFont

from constants import (
    AVATAR_COLORS,
    AVATAR_FONT_RATIO,
    AVATAR_SIZE,
    AVATAR_TEXT_COLOR,
)
from users.models import User

_FONT_PATH = settings.BASE_DIR / "static" / "fonts" / "Neue_Haas_Grotesk_Display_Pro_75_Bold.otf"


def _pick_color(seed):
    index = sum(ord(char) for char in seed) % len(AVATAR_COLORS)
    return AVATAR_COLORS[index]


def _load_font(size):
    try:
        return ImageFont.truetype(str(_FONT_PATH), size)
    except (OSError, ValueError):
        return ImageFont.load_default()


def generate_avatar(user):
    letter = (user.name[:1] or user.email[:1] or "?").upper()
    background = _pick_color(user.email or user.name)

    image = Image.new("RGB", (AVATAR_SIZE, AVATAR_SIZE), background)
    draw = ImageDraw.Draw(image)
    font = _load_font(int(AVATAR_SIZE * AVATAR_FONT_RATIO))

    left, top, right, bottom = draw.textbbox((0, 0), letter, font=font)
    text_x = (AVATAR_SIZE - (right - left)) / 2 - left
    text_y = (AVATAR_SIZE - (bottom - top)) / 2 - top
    draw.text((text_x, text_y), letter, fill=AVATAR_TEXT_COLOR, font=font)

    buffer = BytesIO()
    image.save(buffer, format="PNG")
    filename = f"avatar_{uuid4()}.png"
    user.avatar.save(filename, ContentFile(buffer.getvalue()), save=False)


def register_user(*, name, surname, email, password):
    target_user = User.objects.create_user(
        email=email,
        password=password,
        name=name,
        surname=surname,
    )
    generate_avatar(target_user)
    target_user.save(update_fields=["avatar"])
    return target_user


def update_profile(*, target_user, name, surname, about, phone, github_url, avatar=None):
    target_user.name = name
    target_user.surname = surname
    target_user.about = about
    target_user.phone = phone or None
    target_user.github_url = github_url
    if avatar is not None:
        target_user.avatar = avatar
    target_user.save()
    return target_user
