from defaults import *

AWS_ACCESS_KEY_ID = 'REDACTED_AWS_ACCESS_KEY_ID_2'
AWS_SECRET_ACCESS_KEY = 'REDACTED_SECRET_ASSIGN_4'
AWS_STORAGE_BUCKET_NAME = 'evaluatte-system'
AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME


# Django Debug Toolbar
def show_toolbar(request):
    return True


DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK": show_toolbar,
}
