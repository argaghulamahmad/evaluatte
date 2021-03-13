from django.conf.urls import url
from django.contrib.sitemaps.views import sitemap
from django.urls import re_path, path

from . import views
from .sitemaps import StaticViewSitemap

sitemaps = {
    'static': StaticViewSitemap,
}

urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^about/$', views.about, name='about'),
    url(r'^services/$', views.services, name='services'),
    url(r'^services/resume$', views.service_resume, name='service_resume'),
    url(r'^services/interview$', views.service_interview, name='service_interview'),
    url(r'^services/webinar$', views.service_webinar, name='service_webinar'),
    url(r'^testimonials/$', views.testimonials, name='testimonials'),
    url(r'^contact/$', views.contact, name='contact'),

    re_path(r'^consultants/(?P<type>[-\w]+)$', views.ConsultantListView.as_view(), name='consultants'),

    re_path(r'^jobs/(?P<slug>[-\w]+)$', views.JobPostListView.as_view(), name='jobs_company_list'),
    re_path(r'^jobs', views.JobPostCompaniesListView.as_view(), name='jobs_companies'),
    # re_path(r'^job/(?P<slug>[-\w]+)$', views.JobPostListView.as_view(), name='job_detail'),

    path('sitemap.xml', sitemap, {'sitemaps': sitemaps},
         name='django.contrib.sitemaps.views.sitemap')
]
