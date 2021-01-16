from django.contrib import admin

from .models import TeamMember, Consultant, Client, Interview

admin.site.register(Client)
admin.site.register(Consultant)
admin.site.register(Interview)
admin.site.register(TeamMember)
