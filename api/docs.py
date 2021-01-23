from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework.permissions import BasePermission


class IsSuperUser(BasePermission):
    """
    Allows access only to super users.
    """

    def has_permission(self, request, view):
        return bool(request.user and request.user.is_superuser)


schema_view = get_schema_view(
    openapi.Info(
        title="Evaluatte API",
        default_version='v1',
    ),
    public=True,
    permission_classes=(IsSuperUser,),
)
