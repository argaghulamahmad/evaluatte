from django.conf.urls import url
from django.urls import re_path

from . import views

urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^about/$', views.about, name='about'),
    url(r'^services/$', views.services, name='services'),
    url(r'^services/resume$', views.service_resume, name='service_resume'),
    url(r'^services/interview$', views.service_interview, name='service_interview'),
    url(r'^services/webinar$', views.service_webinar, name='service_webinar'),
    re_path(r'^consultants/(?P<type>[-\w]+)$', views.ConsultantListView.as_view(), name='consultants'),
    re_path(r'^consultant/(?P<pk>\d+)$', views.ConsultantDetailView.as_view(),
            name='consultant-detail-pk'),
    re_path(r'^consultant/(?P<pk>\d+)/(?P<type>[-\w]+)$', views.ConsultantDetailView.as_view(),
            name='consultant-detail-pk-type'),
    url(r'^testimonials/$', views.testimonials, name='testimonials'),
    url(r'^contact/$', views.contact, name='contact'),
]
