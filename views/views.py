from datetime import date

from django.core.paginator import Paginator
from django.db.models import Q, Avg
from django.shortcuts import render
from django.views.generic import ListView, DetailView

from cms.models import Product
from core.models import Consultant, Meet
from office.models import Employee
from seo.models import JobPost, JobPostCompany


def home(request):
    consultants = (
        Consultant.objects
            .filter(~Q(is_active=False))
            .order_by('id')
    )

    products = Product.objects.all()

    total_variant_of_companies = Consultant.objects.values('company').distinct().count()
    total_success_meets = Meet.objects.filter(is_paid=True).values('client').distinct().count()
    average_rating = Meet.objects.filter(show_rating=True).aggregate(Avg('rating'))

    data = {
        "average_rating": average_rating,
        "consultants": consultants,
        "products": products,
        "total_success_meets": total_success_meets,
        "total_variant_of_companies": total_variant_of_companies,
    }

    return render(request, 'pages/home.html', data)


def about(request):
    consultants = (
        Consultant.objects
            .filter(~Q(is_active=False))
            .order_by('id')
    )

    all_team_members = Employee.objects.all().filter(is_show=True).order_by('id')
    total_variant_of_companies = Consultant.objects.values('company').distinct().count()
    total_success_meets = Meet.objects.filter(is_paid=True).values('client').distinct().count()
    average_rating = Meet.objects.filter(show_rating=True).aggregate(Avg('rating'))

    data = {
        "consultants": consultants,
        "team_members": all_team_members,
        "total_variant_of_companies": total_variant_of_companies,
        "total_success_meets": total_success_meets,
        "average_rating": average_rating,
    }

    return render(request, 'pages/about.html', data)


def services(request):
    products = Product.objects.all()

    data = {
        "products": products
    }

    return render(request, 'pages/services.html', data)


class ServiceDetailView(DetailView):
    model = Product
    template_name = 'pages/services/detail.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context


class ConsultantListView(ListView):
    model = Consultant
    template_name = 'pages/consultants.html'
    paginate_by = 9

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def get_queryset(self):
        consultant_type = self.kwargs['type']

        if consultant_type == 'all':
            active_consultants = Consultant.objects.filter(is_active=True)
            return active_consultants
        elif consultant_type == 'cv':
            active_cv_consultants = Consultant.objects.filter(is_active=True, is_cv=True)
            return active_cv_consultants
        elif consultant_type == 'interview':
            active_interview_consultants = Consultant.objects.filter(is_active=True, is_interview=True)
            return active_interview_consultants
        else:
            active_consultants = Consultant.objects.filter(is_active=True)
            return active_consultants


class JobPostCompaniesListView(ListView):
    model = JobPost
    template_name = 'pages/jobs/companies.html'
    paginate_by = 10

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def get_queryset(self):
        job_posts_companies = JobPostCompany.objects.all()
        return job_posts_companies


class JobPostListView(ListView):
    model = JobPost
    template_name = 'pages/jobs/list.html'
    paginate_by = 10

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        slug = self.kwargs['slug']
        company = JobPostCompany.objects.get(slug=slug)
        context['company'] = company

        return context

    def get_queryset(self):
        slug = self.kwargs['slug']

        job_posts = (
            JobPost.objects
                .filter(due_date__gte=date.today(), company__slug=slug)
                .order_by('-due_date')
        )

        return job_posts


class JobPostDetailView(DetailView):
    model = JobPost
    template_name = 'pages/jobs/detail.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['type'] = (dict((x, y) for x, y in context['object'].JOB_TYPES))[context['object'].type]
        return context


def testimonials(request):
    all_testimonials = (
        Meet.objects
            .filter(testimony__isnull=False, show_testimony=True)
            .only('client', 'testimony')
            .order_by('-id')
    )

    paginator = Paginator(all_testimonials, 10)

    page_number = request.GET.get('page')
    testimonials_page = paginator.get_page(page_number)

    return render(request, 'pages/testimonials.html', {'testimonials_page': testimonials_page})


def contact(request):
    return render(request, 'pages/contact.html')


def payment_redirect(request):
    request_path = request.path
    if request_path == '/payment/finish':
        order_id = request.GET['order_id']
        status_code = request.GET['status_code']
        transaction_status = request.GET['transaction_status']

        data = {
            'status': 'Payment Finished!',

            'order_id': order_id,
            'status_code': status_code,
            'transaction_status': transaction_status
        }

        return render(request, 'pages/payment/index.html', data)
    if request_path == '/payment/unfinish':
        data = {
            'status': 'Payment Unfinished!',
        }

        return render(request, 'pages/payment/index.html', data)
    if request_path == '/payment/error':
        data = {
            'status': 'Payment Error!',
        }

        return render(request, 'pages/payment/index.html', data)
