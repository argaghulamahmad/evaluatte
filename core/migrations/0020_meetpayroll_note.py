# Generated by Django 3.1.5 on 2021-01-19 00:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0019_auto_20210119_0728'),
    ]

    operations = [
        migrations.AddField(
            model_name='meetpayroll',
            name='note',
            field=models.TextField(blank=True, null=True),
        ),
    ]