from django.urls import path
from . import views

urlpatterns = [
    # Accueil
    path('', views.index, name='index'),

    # Auth
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('register/', views.register, name='register'),

    # Catégories
    path('categories/', views.categorie_list, name='categorie_list'),
    path('categories/new/', views.categorie_create, name='categorie_create'),
    path('categories/<int:pk>/edit/', views.categorie_update, name='categorie_update'),
    path('categories/<int:pk>/delete/', views.categorie_delete, name='categorie_delete'),
    path('categories/<int:pk>/', views.categorie_detail, name='categorie_detail'),
    # Films
    path('films/', views.film_list, name='film_list'),
    path('films/import/', views.film_import, name='film_import'),
    path('films/new/', views.film_create, name='film_create'),
    path('films/<int:pk>/', views.film_detail, name='film_detail'),
    path('films/<int:pk>/edit/', views.film_update, name='film_update'),
    path('films/<int:pk>/delete/', views.film_delete, name='film_delete'),
    path('films/<int:pk>/commenter/', views.commentaire_create, name='commentaire_create'),

    # Acteurs
    path('acteurs/', views.acteur_list, name='acteur_list'),
    path('acteurs/new/', views.acteur_create, name='acteur_create'),
    path('acteurs/<int:pk>/', views.acteur_detail, name='acteur_detail'),
    path('acteurs/<int:pk>/edit/', views.acteur_update, name='acteur_update'),
    path('acteurs/<int:pk>/delete/', views.acteur_delete, name='acteur_delete'),

    # Personnes
    path('personnes/', views.personne_list, name='personne_list'),
    path('personnes/<int:pk>/edit/', views.personne_update, name='personne_update'),
    path('personnes/<int:pk>/delete/', views.personne_delete, name='personne_delete'),

    # Commentaires
    path('commentaires/', views.commentaire_list, name='commentaire_list'),
    path('commentaires/<int:pk>/delete/', views.commentaire_delete, name='commentaire_delete'),
]
