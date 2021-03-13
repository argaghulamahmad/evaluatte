from django.contrib import admin

from seo.models import JobPostCompany, JobPost


class JobPostAdmin(admin.ModelAdmin):
    exclude = ['modified', 'slug']

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


class JobPostCompanyAdmin(admin.ModelAdmin, ):
    exclude = ['modified', 'slug']

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

    def get_form(self, request, obj=None, **kwargs):
        self.exclude = ("slug",)
        form = super(JobPostCompanyAdmin, self).get_form(request, obj, **kwargs)
        return form


admin.site.register(JobPost, JobPostAdmin)
admin.site.register(JobPostCompany, JobPostCompanyAdmin)
