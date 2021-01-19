from django.contrib import admin

from core.admin import AdminWithoutModified
from office.models import TeamMember


class TeamMemberAdmin(AdminWithoutModified):
    list_display = (
        'full_name',
        'position',
        'is_show'
    )
    list_display_links = (
        'full_name',
    )
    list_filter = (
        'position',
    )
    ordering = ['id']
    search_fields = ('id', 'full_name',
                     'position')
    list_per_page = 10


admin.site.register(TeamMember, TeamMemberAdmin)
