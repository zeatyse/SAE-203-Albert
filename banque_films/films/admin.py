from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Personne, Categorie, Film, Acteur, Casting, Commentaire


@admin.register(Personne)
class PersonneAdmin(UserAdmin):
    fieldsets = UserAdmin.fieldsets + (
        ('Type de compte', {'fields': ('type',)}),
    )
    list_display = ('username', 'email', 'first_name', 'last_name', 'type', 'is_staff')
    list_filter = ('type', 'is_staff', 'is_active')


@admin.register(Categorie)
class CategorieAdmin(admin.ModelAdmin):
    list_display = ('nom', 'descriptif')
    search_fields = ('nom',)


class CastingInline(admin.TabularInline):
    model = Casting
    extra = 1


@admin.register(Film)
class FilmAdmin(admin.ModelAdmin):
    list_display = ('titre', 'realisateur', 'annee_sortie', 'categorie')
    list_filter = ('categorie', 'annee_sortie')
    search_fields = ('titre', 'realisateur')
    inlines = [CastingInline]


@admin.register(Acteur)
class ActeurAdmin(admin.ModelAdmin):
    list_display = ('nom', 'prenom', 'age')
    search_fields = ('nom', 'prenom')


@admin.register(Casting)
class CastingAdmin(admin.ModelAdmin):
    list_display = ('film', 'acteur')
    list_filter = ('film',)


@admin.register(Commentaire)
class CommentaireAdmin(admin.ModelAdmin):
    list_display = ('film', 'personne', 'note', 'date')
    list_filter = ('note', 'personne__type')
    search_fields = ('film__titre', 'personne__username')
