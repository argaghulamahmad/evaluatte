# Generated by Django 3.1.6 on 2021-02-28 07:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_consultant_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='consultantschedule',
            name='is_booked',
            field=models.BooleanField(default=False),
        ),
    ]