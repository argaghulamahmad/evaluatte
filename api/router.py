from rest_framework import routers

from api import viewsets

router = routers.DefaultRouter()
router.register(r'consultants', viewsets.ConsultantViewSet, basename='Consultants')
router.register(r'companies', viewsets.CompanyViewSet, basename='Company')
router.register(
    r'consultant-schedule/consultant/(?P<consultant_id>\d+)',
    viewsets.ConsultantScheduleViewSet,
    basename='ConsultantScheduleOfConsultant',
)
