from django.contrib import admin

from .models import Consultant, Client, Meet, MeetPayroll, MeetPayment, Company

admin.site.site_header = 'Evaluatte Administration'


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


class MeetAdmin(AdminWithoutModified):
    list_display = (
        'type',
        'client',
        'consultant',
        'datetime',
        'note',
    )
    list_display_links = (
        'client',
        'consultant',
    )
    list_filter = (
        'datetime',
    )
    ordering = ['id']
    search_fields = ('id', 'client',
                     'consultant', 'datetime', 'note')
    list_per_page = 10


class MeetPayrollAdmin(AdminWithoutModified):
    def get_readonly_fields(self, request, obj=None):
        return [
            'consultant',
            'for_consultant',
            'for_company',
            'is_consultant_paid',
        ]

    list_display = (
        'consultant',
        'meet',
        'price',
        'for_consultant',
        'for_company',
        'is_consultant_paid',
    )
    list_display_links = (
        'consultant',
    )
    list_filter = (
        'is_consultant_paid',
        'consultant',
    )
    ordering = ['id']
    search_fields = ('id', 'consultant')
    list_per_page = 10


class MeetPaymentAdmin(AdminWithoutModified):
    def get_readonly_fields(self, request, obj=None):
        return ['total']

    list_display = (
        'meet',
        'due_datetime',
        'method',
        'price',
        'admin_cost',
        'total',
        'note',
    )
    list_display_links = (
        'meet',
    )
    list_filter = (
        'method',
    )
    ordering = ['id']
    search_fields = ('id', 'method')
    list_per_page = 10


class CompanyAdmin(AdminWithoutModified):
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
    search_fields = ('id', 'name')
    list_per_page = 10


admin.site.register(Client, ClientAdmin)
admin.site.register(Consultant, ConsultantAdmin)
admin.site.register(Meet, MeetAdmin)
admin.site.register(MeetPayroll, MeetPayrollAdmin)
admin.site.register(MeetPayment, MeetPaymentAdmin)
admin.site.register(Company, CompanyAdmin)
