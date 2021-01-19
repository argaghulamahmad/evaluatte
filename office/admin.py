from django.contrib import admin

from core.admin import AdminWithoutModified
from office.models import Employee, EmployeePayroll


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


class EmployeePayrollAdmin(AdminWithoutModified):
    list_display = (
        'employee',
        'date',
        'total',
        'employee_paid_proof',
        'is_employee_paid',
        'note',
    )
    list_display_links = (
        'employee',
    )
    list_filter = (
        'is_employee_paid',
        'date',
    )
    ordering = ['id']
    search_fields = ('id',)
    list_per_page = 10


admin.site.register(Employee, EmployeeAdmin)
admin.site.register(EmployeePayroll, EmployeePayrollAdmin)
