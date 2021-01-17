from django.contrib import admin

from .models import TeamMember, Consultant, Client, Meet

admin.site.register(Client)
admin.site.register(Consultant)
admin.site.register(Meet)
admin.site.register(TeamMember)
