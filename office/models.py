from django.db import models

from core.models import ModelWithAutoTimestamp


class TeamMember(ModelWithAutoTimestamp):
    profile_image = models.URLField(max_length=254)
    full_name = models.CharField(max_length=254)
    position = models.CharField(max_length=254)
    is_show = models.BooleanField(null=True, blank=True)
    linkedin_profile = models.URLField(null=True, blank=True, max_length=254)
    instagram_profile = models.URLField(null=True, blank=True, max_length=254)

    class Meta:
        db_table = 'office_team_member'

    def __str__(self):
        return self.full_name + ' | ' + self.position
