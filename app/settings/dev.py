from app.settings.defaults import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

AWS_ACCESS_KEY_ID = 'AKIAYUZSJ2AQPTBCC3E3'
AWS_SECRET_ACCESS_KEY = '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'
AWS_STORAGE_BUCKET_NAME = 'evaluatte-system'
AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME


# Django Debug Toolbar
def show_toolbar(request):
    return True


DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK": show_toolbar,
}
