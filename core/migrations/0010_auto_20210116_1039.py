# Generated by Django 3.1.5 on 2021-01-16 10:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0009_teammember_order'),
    ]

    operations = [
        migrations.AddField(
            model_name='teammember',
            name='is_show',
            field=models.BooleanField(default=False),
        ),
    ]
