# Generated by Django 3.1.5 on 2021-01-16 08:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_auto_20210116_0805'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeamMember',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('full_name', models.CharField(max_length=100)),
                ('position', models.CharField(max_length=100)),
            ],
        ),
        migrations.DeleteModel(
            name='Person',
        ),
        migrations.RenameField(
            model_name='consultant',
            old_name='fullname',
            new_name='full_name',
        ),
        migrations.AlterField(
            model_name='consultant',
            name='is_active',
            field=models.BooleanField(),
        ),
    ]
