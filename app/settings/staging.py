import django_heroku

from app.settings.defaults import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# Activate Django-Heroku.
django_heroku.settings(locals())

# AWS
AWS_ACCESS_KEY_ID = 'AKIAYUZSJ2AQIYJ2CNYJ'
AWS_SECRET_ACCESS_KEY = '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'
AWS_STORAGE_BUCKET_NAME = 'evaluatte-system-test'
AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME


# Django Debug Toolbar
def show_toolbar(request):
    return True


DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK": show_toolbar,
}
