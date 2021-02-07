from rest_framework import routers

from api import views

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'groups', views.GroupViewSet)
router.register(r'consultants', views.ConsultantViewSet)
router.register(r'companies', views.CompanyViewSet, basename='Company')
