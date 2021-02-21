"""
Create permission groups
"""
import logging

from django.contrib.auth.models import Group
from django.contrib.auth.models import Permission
from django.core.management.base import BaseCommand

GROUPS = {
    'Chief': {
        'PERMISSIONS': {
            'meet': ['add', 'change', 'delete', 'view'],
            'client': ['add', 'change', 'delete', 'view'],
            'consultant': ['add', 'change', 'delete', 'view'],
            'team member': ['add', 'change', 'view'],
        }
    },
    'Sales': {
        'PERMISSIONS': {
            'meet': ['add', 'change', 'view', 'delete'],
            'client': ['add', 'change', 'view', 'delete'],
            'consultant': ['add', 'change', 'view'],
        }
    },
    'Consultant': {
        'PERMISSIONS': {
            'meet': ['view'],
            'consultant': ['change', 'view'],
            'consultant_schedule': ['add', 'change', 'view', 'delete'],
        }
    },
    'Finance': {
        'PERMISSIONS': {
        }
    }
}


class Command(BaseCommand):
    help = 'Creates read only default permission groups for users'

    def handle(self, *args, **options):
        for group_name in GROUPS.keys():
            group_permission = GROUPS[group_name]['PERMISSIONS']
            new_group, created = Group.objects.get_or_create(name=group_name)
            for model in group_permission.keys():
                for permission in group_permission[model]:
                    name = 'Can {} {}'.format(permission, model)
                    print("Creating {} {}".format(group_name, name))

                    try:
                        model_add_perm = Permission.objects.get(name=name)
                    except Permission.DoesNotExist:
                        logging.warning("Permission not found with name '{}'.".format(name))
                        continue

                    new_group.permissions.add(model_add_perm)

        print("Created default group and permissions.")
