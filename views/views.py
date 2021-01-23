from django.core.paginator import Paginator
from django.db.models import Q
from django.shortcuts import render
from django.views.generic import DetailView

from core.models import Consultant, Meet
from office.models import Employee


def home(request):
    three_first_consultants = (
        Consultant.objects
            .filter(~Q(is_active=False))
            .order_by('id')[:3]
    )

    three_latest_testimonials = (
        Meet.objects
            .filter(testimony__isnull=False, show_testimony=True)
            .only('client', 'testimony')
            .order_by('-id')[:3]
    )

    data = {
        "consultants": three_first_consultants,
        "testimonials": three_latest_testimonials
    }

    return render(request, 'pages/home.html', data)


def about(request):
    all_team_members = Employee.objects.all().filter(is_show=True).order_by('id')

    data = {
        "team_members": all_team_members
    }

    return render(request, 'pages/about.html', data)


def services(request):
    return render(request, 'pages/services.html')


def consultants(request):
    all_consultants = (
        Consultant.objects
            .filter(~Q(is_active=False))
            .order_by('id')
    )

    paginator = Paginator(all_consultants, 9)

    page_number = request.GET.get('page')
    consultants_page = paginator.get_page(page_number)

    return render(request, 'pages/consultants.html', {'consultants_page': consultants_page})


class ConsultantDetailView(DetailView):
    model = Consultant
    template_name = 'detail/consultant.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def get_queryset(self):
        consultant_type = self.kwargs['type']
        consultant_id = self.kwargs['pk']

        if consultant_type == 'cv':
            return Consultant.objects.filter(id=consultant_id, is_cv=True)
        elif consultant_type == 'interview':
            return Consultant.objects.filter(id=consultant_id, is_interview=True)


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


def inspirations(request):
    return render(request, 'pages/inspirations.html')


def careers(request):
    return render(request, 'pages/careers.html')


def subscribe(request):
    return render(request, 'pages/subscribe.html')
