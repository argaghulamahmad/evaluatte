from django.contrib import admin

from core.admin import AdminWithoutModified
from seo.models import JobPostCompany, JobPost


class JobPostAdmin(AdminWithoutModified):
    list_display = (
        'position',
        'company_name',
        'location',
    )
    list_display_links = (
        'position',
    )
    list_filter = (
        'position',
        'company',
        'location',
    )

    @staticmethod
    def company_name(obj):
        return obj.company.name

    ordering = ['id']
    search_fields = ('id', 'position')
    list_per_page = 10


class JobPostCompanyAdmin(AdminWithoutModified):
    list_display = (
        'name',
        'industry',
    )
    list_display_links = (
        'name',
    )
    list_filter = (
        'industry',
    )
    ordering = ['id']
    search_fields = ('id',)
    list_per_page = 10


admin.site.register(JobPost, JobPostAdmin)
admin.site.register(JobPostCompany, JobPostCompanyAdmin)
