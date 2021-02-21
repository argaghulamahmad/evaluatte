from django.contrib import admin

from .actions import export_as_csv_action
from .models import Consultant, Client, Meet, MeetPayroll, MeetPayment, Company, ConsultantSchedule

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

    actions = [export_as_csv_action("CSV Export", fields=['full_name',
                                                          'cv_url',
                                                          'email',
                                                          'phone_number',
                                                          'linkedin_profile',
                                                          'instagram_profile',
                                                          'title'])]

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

    actions = [export_as_csv_action("CSV Export", fields=['full_name',
                                                          'role',
                                                          'company',
                                                          'email',
                                                          'phone_number', ])]

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

    def get_queryset(self, request):
        qs = super(ConsultantAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs

        user_id = request.user.id

        consultant_objects_filter = Consultant.objects.filter(user_id=user_id)
        return consultant_objects_filter

    def has_add_permission(self, request, obj=None):
        qs = super(ConsultantAdmin, self).has_add_permission(request)
        if request.user.is_superuser:
            return qs

        user_id = request.user.id

        consultant_objects_filter = Consultant.objects.filter(user_id=user_id)
        is_consultant = len(consultant_objects_filter) == 1
        if is_consultant:
            return False


class MeetAdmin(AdminWithoutModified):
    list_display = (
        'type',
        'client',
        'consultant',
        'start_datetime',
        'end_datetime',
        'note',
    )

    actions = [export_as_csv_action("CSV Export", fields=['type',
                                                          'client',
                                                          'consultant',
                                                          'start_datetime',
                                                          'end_datetime',
                                                          'note', ])]

    list_display_links = (
        'client',
        'consultant',
    )
    list_filter = (
        'start_datetime',
    )
    ordering = ['id']
    search_fields = ('id', 'client',
                     'consultant', 'start_datetime', 'note')
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

    actions = [export_as_csv_action("CSV Export", fields=['consultant',
                                                          'meet',
                                                          'price',
                                                          'for_consultant',
                                                          'for_company',
                                                          'is_consultant_paid', ])]

    list_display_links = (
        'consultant',
    )
    list_filter = (
        'meet__start_datetime',
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

    actions = [export_as_csv_action("CSV Export", fields=['meet',
                                                          'due_datetime',
                                                          'method',
                                                          'price',
                                                          'admin_cost',
                                                          'total',
                                                          'note', ])]

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

    actions = [export_as_csv_action("CSV Export", fields=['name',
                                                          'industry', ])]

    list_display_links = (
        'name',
    )
    list_filter = (
        'industry',
    )
    ordering = ['id']
    search_fields = ('id', 'name')
    list_per_page = 10


class ConsultantScheduleAdmin(AdminWithoutModified):
    list_display = (
        'consultant',
        'start_date',
        'end_date',
        'start_time',
        'end_time',
    )

    actions = [export_as_csv_action("CSV Export", fields=['consultant',
                                                          'start_date',
                                                          'end_date',
                                                          'start_time',
                                                          'end_time', ])]

    list_display_links = (
        'consultant',
    )
    list_filter = (
        'consultant',
        'start_date',
        'end_date',
    )
    ordering = ['id']
    search_fields = ('id', 'consultant')
    list_per_page = 10


admin.site.register(Client, ClientAdmin)
admin.site.register(Consultant, ConsultantAdmin)
admin.site.register(Meet, MeetAdmin)
admin.site.register(MeetPayroll, MeetPayrollAdmin)
admin.site.register(MeetPayment, MeetPaymentAdmin)
admin.site.register(Company, CompanyAdmin)
admin.site.register(ConsultantSchedule, ConsultantScheduleAdmin)
