from app.settings.defaults import *

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

MIDTRANS_SERVER_KEY = 'SB-Mid-server-AURmn6plVIEOIpFE26Pr2kp0'
MIDTRANS_IS_PRODUCTION = False


# Django Debug Toolbar
def show_toolbar(request):
    return True


DEBUG_TOOLBAR_CONFIG = {
    "SHOW_TOOLBAR_CALLBACK": show_toolbar,
}
