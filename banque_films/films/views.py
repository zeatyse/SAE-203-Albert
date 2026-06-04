import csv
import io
from functools import wraps
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.db.models import Q

from .models import Categorie, Film, Acteur, Casting, Commentaire, Personne
from .forms import (
    CategorieForm, FilmForm, ActeurForm, CommentaireForm,
    InscriptionForm, ConnexionForm, PersonneUpdateForm, ImportFilmForm,
)


# ─── DÉCORATEURS DE SÉCURITÉ PERSONNALISÉS ────────────────────────────────────

def pro_required(view_func):
    """Autorise uniquement les Professionnels et les Super Admins"""
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        if not request.user.is_authenticated:
            messages.warning(request, "Veuillez vous connecter pour accéder à cette page.")
            return redirect('login_view')  # Assure-toi que le nom de l'URL est bien 'login_view' ou 'login' dans tes urls.py
        
        # On vérifie si l'utilisateur est pro ou super admin
        if request.user.is_superuser or getattr(request.user, 'type', '') == 'professionnel':
            return view_func(request, *args, **kwargs)
            
        messages.error(request, "Accès refusé : Cette action est réservée aux professionnels.")
        return redirect('index')
    return _wrapped_view


def admin_required(view_func):
    """Autorise UNIQUEMENT les Super Admins"""
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        if not request.user.is_authenticated:
            messages.warning(request, "Veuillez vous connecter en tant qu'administrateur.")
            return redirect('login_view')
            
        if request.user.is_superuser:
            return view_func(request, *args, **kwargs)
            
        messages.error(request, "Accès refusé : Réservé aux administrateurs du site.")
        return redirect('index')
    return _wrapped_view


# ─── Accueil ──────────────────────────────────────────────────────────────────

def index(request):
    films_recents = Film.objects.select_related('categorie').all()[:8]
    return render(request, 'films/index.html', {
        'films_recents': films_recents,
        'nb_films': Film.objects.count(),
        'nb_acteurs': Acteur.objects.count(),
        'nb_commentaires': Commentaire.objects.count(),
        'nb_personnes': Personne.objects.count(),
    })


# ─── Authentification ─────────────────────────────────────────────────────────

def login_view(request):
    form = ConnexionForm(request.POST or None)
    if request.method == 'POST' and form.is_valid():
        user = authenticate(
            request,
            username=form.cleaned_data['username'],
            password=form.cleaned_data['password'],
        )
        if user:
            login(request, user)
            messages.success(request, f'Bienvenue, {user.username} !')
            return redirect(request.GET.get('next', 'index'))
        messages.error(request, 'Pseudo ou mot de passe incorrect.')
    return render(request, 'films/auth/login.html', {'form': form})


def logout_view(request):
    logout(request)
    messages.info(request, 'Vous êtes déconnecté.')
    return redirect('index')


def register(request):
    form = InscriptionForm(request.POST or None)
    if request.method == 'POST' and form.is_valid():
        user = form.save()
        login(request, user)
        messages.success(request, f'Compte créé ! Bienvenue, {user.username} !')
        return redirect('index')
    return render(request, 'films/auth/register.html', {'form': form})


# ─── Catégories ───────────────────────────────────────────────────────────────

def categorie_list(request):
    categories = Categorie.objects.all()
    return render(request, 'films/categories/list.html', {'categories': categories})


@pro_required
def categorie_create(request):
    form = CategorieForm(request.POST or None)
    if request.method == 'POST' and form.is_valid():
        form.save()
        messages.success(request, 'Catégorie ajoutée avec succès.')
        return redirect('categorie_list')
    return render(request, 'films/categories/form.html', {'form': form, 'title': 'Nouvelle catégorie'})


@pro_required
def categorie_update(request, pk):
    categorie = get_object_or_404(Categorie, pk=pk)
    form = CategorieForm(request.POST or None, instance=categorie)
    if request.method == 'POST' and form.is_valid():
        form.save()
        messages.success(request, 'Catégorie modifiée.')
        return redirect('categorie_list')
    return render(request, 'films/categories/form.html', {'form': form, 'title': 'Modifier la catégorie', 'objet': categorie})


@admin_required
def categorie_delete(request, pk):
    categorie = get_object_or_404(Categorie, pk=pk)
    if request.method == 'POST':
        categorie.delete()
        messages.success(request, 'Catégorie supprimée.')
        return redirect('categorie_list')
    return render(request, 'films/categories/confirm_delete.html', {'objet': categorie, 'type': 'la catégorie'})


# ─── Films ────────────────────────────────────────────────────────────────────

def film_list(request):
    q = request.GET.get('q', '').strip()
    cat = request.GET.get('categorie', '')
    films = Film.objects.select_related('categorie').all()
    if q:
        films = films.filter(Q(titre__icontains=q) | Q(realisateur__icontains=q))
    if cat:
        films = films.filter(categorie_id=cat)
    categories = Categorie.objects.all()
    return render(request, 'films/films/list.html', {
        'films': films,
        'categories': categories,
        'q': q,
        'cat_selected': cat,
    })


def film_detail(request, pk):
    film = get_object_or_404(Film, pk=pk)
    commentaires = film.commentaires.select_related('personne').all()
    casting = Casting.objects.filter(film=film).select_related('acteur')

    user_a_commente = (
        request.user.is_authenticated and
        film.commentaires.filter(personne=request.user).exists()
    )

    return render(request, 'films/films/detail.html', {
        'film': film,
        'commentaires': commentaires,
        'casting': casting,
        'form': CommentaireForm(),
        'moy_globale': film.moyenne_notes(),
        'moy_pro': film.moyenne_par_type('professionnel'),
        'moy_amateur': film.moyenne_par_type('amateur'),
        'meilleur': film.meilleur_commentaire(),
        'pire': film.pire_commentaire(),
        'user_a_commente': user_a_commente,
    })


@pro_required
def film_create(request):
    form = FilmForm(request.POST or None, request.FILES or None)
    acteurs = Acteur.objects.all()
    if request.method == 'POST' and form.is_valid():
        film = form.save()
        for aid in request.POST.getlist('acteurs'):
            try:
                Casting.objects.get_or_create(film=film, acteur_id=int(aid))
            except (ValueError, Acteur.DoesNotExist):
                pass
        messages.success(request, f'Film « {film.titre} » ajouté.')
        return redirect('film_detail', pk=film.pk)
    return render(request, 'films/films/form.html', {
        'form': form, 'acteurs': acteurs, 'title': 'Nouveau film', 'casting_ids': [],
    })


@pro_required
def film_update(request, pk):
    film = get_object_or_404(Film, pk=pk)
    form = FilmForm(request.POST or None, request.FILES or None, instance=film)
    acteurs = Acteur.objects.all()
    casting_ids = list(Casting.objects.filter(film=film).values_list('acteur_id', flat=True))
    if request.method == 'POST' and form.is_valid():
        film = form.save()
        Casting.objects.filter(film=film).delete()
        for aid in request.POST.getlist('acteurs'):
            try:
                Casting.objects.get_or_create(film=film, acteur_id=int(aid))
            except (ValueError, Acteur.DoesNotExist):
                pass
        messages.success(request, f'Film « {film.titre} » modifié.')
        return redirect('film_detail', pk=film.pk)
    return render(request, 'films/films/form.html', {
        'form': form, 'acteurs': acteurs, 'title': 'Modifier le film',
        'casting_ids': casting_ids, 'objet': film,
    })


@admin_required
def film_delete(request, pk):
    film = get_object_or_404(Film, pk=pk)
    if request.method == 'POST':
        film.delete()
        messages.success(request, 'Film supprimé.')
        return redirect('film_list')
    return render(request, 'films/films/confirm_delete.html', {'objet': film, 'type': 'le film'})


@pro_required
def film_import(request):
    form = ImportFilmForm(request.POST or None, request.FILES or None)
    succes, erreurs = 0, []

    if request.method == 'POST' and form.is_valid():
        try:
            contenu = request.FILES['fichier'].read().decode('utf-8-sig')
            reader = csv.DictReader(io.StringIO(contenu), delimiter=';')
            for i, row in enumerate(reader, start=2):
                try:
                    cat_nom = row.get('categorie', '').strip()
                    categorie = None
                    if cat_nom:
                        categorie, _ = Categorie.objects.get_or_create(nom=cat_nom)

                    film, _ = Film.objects.get_or_create(
                        titre=row['titre'].strip(),
                        defaults={
                            'annee_sortie': int(row.get('annee_sortie') or 0) or None,
                            'realisateur': row.get('realisateur', '').strip(),
                            'categorie': categorie,
                        },
                    )

                    acteurs_str = row.get('acteurs', '').strip()
                    if acteurs_str:
                        for acteur_str in acteurs_str.split('|'):
                            parties = acteur_str.strip().split(' ', 1)
                            if len(parties) == 2:
                                acteur, _ = Acteur.objects.get_or_create(
                                    prenom=parties[0].strip(),
                                    nom=parties[1].strip(),
                                )
                                Casting.objects.get_or_create(film=film, acteur=acteur)
                    succes += 1
                except KeyError as e:
                    erreurs.append(f"Ligne {i} : colonne manquante {e}")
                except Exception as e:
                    erreurs.append(f"Ligne {i} : {e}")
        except Exception as e:
            erreurs.append(f"Erreur de lecture du fichier : {e}")

        if succes:
            messages.success(request, f'{succes} film(s) importé(s) avec succès.')

    return render(request, 'films/films/import.html', {'form': form, 'erreurs': erreurs})


# ─── Commentaires ─────────────────────────────────────────────────────────────

@login_required
def commentaire_create(request, pk):
    film = get_object_or_404(Film, pk=pk)
    if film.commentaires.filter(personne=request.user).exists():
        messages.warning(request, 'Vous avez déjà commenté ce film.')
        return redirect('film_detail', pk=pk)
    form = CommentaireForm(request.POST)
    if form.is_valid():
        c = form.save(commit=False)
        c.film = film
        c.personne = request.user
        c.save()
        messages.success(request, 'Commentaire publié !')
    else:
        messages.error(request, 'Formulaire invalide.')
    return redirect('film_detail', pk=pk)


@admin_required
def commentaire_list(request):
    commentaires = Commentaire.objects.select_related('film', 'personne').all()
    return render(request, 'films/commentaires/list.html', {'commentaires': commentaires})


@admin_required
def commentaire_delete(request, pk):
    commentaire = get_object_or_404(Commentaire, pk=pk)
    film_pk = commentaire.film.pk
    if request.method == 'POST':
        commentaire.delete()
        messages.success(request, 'Commentaire supprimé.')
        return redirect('film_detail', pk=film_pk)
    return render(request, 'films/commentaires/confirm_delete.html', {
        'objet': commentaire, 'type': 'le commentaire',
    })


# ─── Acteurs ──────────────────────────────────────────────────────────────────

def acteur_list(request):
    q = request.GET.get('q', '').strip()
    acteurs = Acteur.objects.all()
    if q:
        acteurs = acteurs.filter(Q(nom__icontains=q) | Q(prenom__icontains=q))
    return render(request, 'films/acteurs/list.html', {'acteurs': acteurs, 'q': q})


def acteur_detail(request, pk):
    acteur = get_object_or_404(Acteur, pk=pk)
    films = Film.objects.filter(casting__acteur=acteur).select_related('categorie')
    return render(request, 'films/acteurs/detail.html', {'acteur': acteur, 'films': films})


@pro_required
def acteur_create(request):
    form = ActeurForm(request.POST or None, request.FILES or None)
    if request.method == 'POST' and form.is_valid():
        acteur = form.save()
        messages.success(request, f'Acteur {acteur} ajouté.')
        return redirect('acteur_list')
    return render(request, 'films/acteurs/form.html', {'form': form, 'title': 'Nouvel acteur'})


@pro_required
def acteur_update(request, pk):
    acteur = get_object_or_404(Acteur, pk=pk)
    form = ActeurForm(request.POST or None, request.FILES or None, instance=acteur)
    if request.method == 'POST' and form.is_valid():
        form.save()
        messages.success(request, f'Acteur {acteur} modifié.')
        return redirect('acteur_detail', pk=pk)
    return render(request, 'films/acteurs/form.html', {'form': form, 'title': "Modifier l'acteur", 'objet': acteur})


@admin_required
def acteur_delete(request, pk):
    acteur = get_object_or_404(Acteur, pk=pk)
    if request.method == 'POST':
        acteur.delete()
        messages.success(request, 'Acteur supprimé.')
        return redirect('acteur_list')
    return render(request, 'films/acteurs/confirm_delete.html', {'objet': acteur, 'type': "l'acteur"})


# ─── Personnes ────────────────────────────────────────────────────────────────

@admin_required
def personne_list(request):
    personnes = Personne.objects.all().order_by('username')
    return render(request, 'films/personnes/list.html', {'personnes': personnes})


@admin_required
def personne_update(request, pk):
    personne = get_object_or_404(Personne, pk=pk)
    form = PersonneUpdateForm(request.POST or None, instance=personne)
    if request.method == 'POST' and form.is_valid():
        form.save()
        messages.success(request, 'Utilisateur modifié.')
        return redirect('personne_list')
    return render(request, 'films/personnes/form.html', {'form': form, 'personne': personne})


@admin_required
def personne_delete(request, pk):
    personne = get_object_or_404(Personne, pk=pk)
    if personne == request.user:
        messages.error(request, 'Vous ne pouvez pas supprimer votre propre compte.')
        return redirect('personne_list')
    if request.method == 'POST':
        personne.delete()
        messages.success(request, 'Utilisateur supprimé.')
        return redirect('personne_list')
    return render(request, 'films/personnes/confirm_delete.html', {'objet': personne, 'type': "l'utilisateur"})
