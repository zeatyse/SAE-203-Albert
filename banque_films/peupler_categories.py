import os
import django
import random

# Connexion à ton projet Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'banque_films.settings')
django.setup()

from films.models import Categorie, Film

print("🏷️ Démarrage de la génération des catégories...")

liste_categories = [
    "Action", "Aventure", "Comédie", "Drame", "Science-Fiction",
    "Horreur", "Thriller", "Romance", "Animation", "Documentaire",
    "Fantastique", "Mystère", "Crime", "Guerre", "Histoire",
    "Western", "Comédie musicale", "Biographie", "Famille", "Sport",
    "Film Noir", "Court-métrage", "Épique", "Espionnage", "Super-héros",
    "Post-apocalyptique", "Cyberpunk", "Steampunk", "Comédie romantique", "Slasher",
    "Zombies", "Vampires", "Arts Martiaux", "Catastrophe", "Mockumentaire",
    "Expérimental", "Muet", "Road Movie", "Satire", "Space Opera"
]

# 1. Création des 40 catégories
print("Création en base de données...")
categories_objets = []
for nom in liste_categories:
    # get_or_create permet de ne pas créer de doublons si tu relances le script
    cat, created = Categorie.objects.get_or_create(
        nom=nom,
        defaults={'descriptif': f"Retrouvez ici tous nos chefs-d'œuvre du genre {nom}."}
    )
    categories_objets.append(cat)

# 2. Mise à jour de tes films existants
print("🎬 Attribution des catégories à tes films existants...")
films = Film.objects.all()
compteur = 0

for film in films:
    # On ajoute une catégorie au hasard uniquement si le film n'en a pas déjà une
    if not film.categorie:
        film.categorie = random.choice(categories_objets)
        film.save()
        compteur += 1

print(f"✅ Terminé ! 40 catégories créées et {compteur} films mis à jour !")
