from rest_framework import routers

from api import viewsets

router = routers.DefaultRouter()
router.register(r'users', viewsets.UserViewSet)
router.register(r'groups', viewsets.GroupViewSet)
router.register(r'consultants', viewsets.ConsultantViewSet)
router.register(r'companies', viewsets.CompanyViewSet, basename='Company')
router.register(r'consultant-schedule', viewsets.ConsultantScheduleViewSet, basename='ConsultantSchedule')
