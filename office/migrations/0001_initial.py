# Generated by Django 3.1.5 on 2021-01-19 01:16

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='TeamMember',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created', models.DateTimeField(editable=False)),
                ('modified', models.DateTimeField()),
                ('profile_image', models.URLField(max_length=254)),
                ('full_name', models.CharField(max_length=254)),
                ('position', models.CharField(max_length=254)),
                ('is_show', models.BooleanField(blank=True, null=True)),
                ('linkedin_profile', models.URLField(blank=True, max_length=254, null=True)),
                ('instagram_profile', models.URLField(blank=True, max_length=254, null=True)),
            ],
            options={
                'db_table': 'office_team_member',
            },
        ),
    ]
