from django.contrib import admin

from cms.models import Product, Banner


class ProductAdmin(admin.ModelAdmin):
    exclude = ['modified', 'slug']

    list_display = (
        'name',
        'link',
        'slug',
    )
    list_display_links = (
        'name',
    )
    list_filter = (
        'name',
    )

    ordering = ['id']
    search_fields = ('id', 'name')
    list_per_page = 10


class BannerAdmin(admin.ModelAdmin):
    exclude = ['modified']

    list_display = (
        'name',
        'image',
        'link',
    )
    list_display_links = (
        'name',
    )
    list_filter = (
        'name',
    )

    ordering = ['id']
    search_fields = ('id', 'name')
    list_per_page = 10


admin.site.register(Product, ProductAdmin)
admin.site.register(Banner, BannerAdmin)
