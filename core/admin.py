from django.contrib import admin

from .models import TeamMember, Consultant, Client, Meet


class AdminWithoutModified(admin.ModelAdmin):
    exclude = ['modified']

    class Meta:
        abstract = True


class ClientAdmin(AdminWithoutModified):
    list_display = (
        'full_name',
        'cv_url',
        'email',
        'phone_number',
        'linkedin_profile',
        'instagram_profile',
        'title'
    )
    list_display_links = (
        'full_name',
    )
    list_filter = (
        'title',
    )
    ordering = ['id']
    search_fields = ('id', 'full_name', 'email')
    list_per_page = 10


class ConsultantAdmin(AdminWithoutModified):
    list_display = (
        'full_name',
        'role',
        'company',
        'email',
        'phone_number',
    )
    list_display_links = (
        'full_name',
    )
    list_filter = (
        'company',
        'role'
    )
    ordering = ['id']
    search_fields = ('id', 'full_name', 'role', 'company', 'email', 'phone_number')
    list_per_page = 10


admin.site.register(Client, ClientAdmin)
admin.site.register(Consultant, ConsultantAdmin)
admin.site.register(Meet)
admin.site.register(TeamMember)
