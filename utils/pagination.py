from django.core.paginator import Paginator

from constants import PAGINATION_PER_PAGE


def paginate(request, queryset, per_page=PAGINATION_PER_PAGE):
    paginator = Paginator(queryset, per_page)
    page_obj = paginator.get_page(request.GET.get("page"))

    params = request.GET.copy()
    params.pop("page", None)
    encoded = params.urlencode()
    query_prefix = f"{encoded}&" if encoded else ""

    return page_obj, query_prefix
