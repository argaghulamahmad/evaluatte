from django.contrib import admin

from .models import TeamMember, Consultant

admin.site.register(Consultant)
admin.site.register(TeamMember)
