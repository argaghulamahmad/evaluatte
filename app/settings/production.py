# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

AWS_ACCESS_KEY_ID = 'AKIAYUZSJ2AQPTBCC3E3'
AWS_SECRET_ACCESS_KEY = '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'
AWS_STORAGE_BUCKET_NAME = 'evaluatte-system'
AWS_S3_CUSTOM_DOMAIN = '%s.s3.amazonaws.com' % AWS_STORAGE_BUCKET_NAME

MIDTRANS_SERVER_KEY = 'SB-Mid-server-AURmn6plVIEOIpFE26Pr2kp0'


# Django Debug Toolbar
def show_toolbar(request):
    return False


DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK": show_toolbar,
}

# Logging
LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'verbose': {
            'format': '{levelname} [{asctime}] {message} {pathname} {lineno} {funcName}',
            'style': '{',
        },
    },
    'handlers': {
        'evaluatte-file-handler': {
            'level': 'INFO',
            'class': 'logging.FileHandler',
            'filename': '/home/argaghulamahmad/logs/evaluatte.log',
            'formatter': 'verbose'
        },
        'evaluatte-file-handler-debug': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/home/argaghulamahmad/logs/evaluatte.debug.log',
            'formatter': 'verbose'
        },
        'sql-debug-handler': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/home/argaghulamahmad/logs/evaluatte.sql-debug.log'
        },
        'django-error-handler': {
            'level': 'WARNING',
            'class': 'logging.FileHandler',
            'filename': '/home/argaghulamahmad/logs/evaluatte.django.log'
        },
    },
    'loggers': {
        'evaluatte': {
            'handlers': ['evaluatte-file-handler'],
            'level': 'INFO',
            'propagate': True
        },
        'evaluatte.debug': {
            'handlers': ['evaluatte-file-handler-debug'],
            'level': 'DEBUG',
            'propagate': False
        },
        'django.db.backends': {
            'handlers': ['sql-debug-handler'],
            'level': 'DEBUG',
            'propagate': False
        },
        'django': {
            'handlers': ['django-error-handler'],
            'level': 'ERROR',
            'propagate': False
        },

        'api-views': {
            'handlers': ['evaluatte-file-handler-debug'],
            'level': 'DEBUG',
            'propagate': False
        }
    },
}
