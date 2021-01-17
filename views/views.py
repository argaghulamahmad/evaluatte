from django.shortcuts import render

from core.models import Consultant, TeamMember, Interview


def home(request):
    all_consultants = Consultant.objects.all()
    three_latest_testimonials = Interview.objects.filter(testimony__isnull=False, show_testimony=True) \
        .only('client', 'testimony').order_by('-id')[:3]

    data = {
        "consultants": all_consultants,
        "testimonials": three_latest_testimonials
    }

    return render(request, 'pages/home.html', data)


def about(request):
    all_team_members = TeamMember.objects.all().filter(is_show=True)

    data = {
        "team_members": all_team_members
    }

    return render(request, 'pages/about.html', data)


def services(request):
    return render(request, 'pages/services.html')


def consultants(request):
    return render(request, 'pages/consultants.html')


def testimonials(request):
    return render(request, 'pages/testimonials.html')


def inspirations(request):
    return render(request, 'pages/inspirations.html')


def careers(request):
    return render(request, 'pages/careers.html')


def subscribe(request):
    return render(request, 'pages/subscribe.html')
