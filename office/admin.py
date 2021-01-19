from django.contrib import admin

from core.admin import AdminWithoutModified
from office.models import Employee


class EmployeeAdmin(AdminWithoutModified):
    list_display = (
        'full_name',
        'position',
        'type',
        'is_show'
    )
    list_display_links = (
        'full_name',
    )
    list_filter = (
        'type',
        'position',
    )
    ordering = ['id']
    search_fields = ('id', 'full_name',
                     'position')
    list_per_page = 10


admin.site.register(Employee, EmployeeAdmin)
