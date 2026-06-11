import os
import django
import urllib.request
from django.core.files.base import ContentFile

# Connexion à Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'banque_films.settings')
django.setup()

from films.models import Film, Acteur, Categorie, Casting

def telecharger_image(url):
    """Télécharge l'image en se faisant passer pour un vrai navigateur web"""
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'})
    response = urllib.request.urlopen(req)
    return response.read()

print("🧹 1. Nettoyage des anciennes données fictives...")
# On supprime les vieux films générés
Film.objects.filter(titre__startswith="Projet Mystère").delete()
# On supprime les vieux acteurs générés
Acteur.objects.filter(nom__startswith="Star_").delete()

print("🎬 2. Ajout des vrais chefs-d'œuvre du cinéma...")

vrais_films = [
    {"titre": "Inception", "annee": 2010, "realisateur": "Christopher Nolan", "cat": "Science-Fiction", "url": "https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg"},
    {"titre": "Matrix", "annee": 1999, "realisateur": "Lana & Lilly Wachowski", "cat": "Science-Fiction", "url": "https://upload.wikimedia.org/wikipedia/en/c/c1/The_Matrix_Poster.jpg"},
    {"titre": "Interstellar", "annee": 2014, "realisateur": "Christopher Nolan", "cat": "Science-Fiction", "url": "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg"},
    {"titre": "Titanic", "annee": 1997, "realisateur": "James Cameron", "cat": "Romance", "url": "https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png"},
    {"titre": "Avatar", "annee": 2009, "realisateur": "James Cameron", "cat": "Science-Fiction", "url": "https://upload.wikimedia.org/wikipedia/en/d/d6/Avatar_%282009_film%29_poster.jpg"},
    {"titre": "The Dark Knight", "annee": 2008, "realisateur": "Christopher Nolan", "cat": "Action", "url": "https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg"},
    {"titre": "Pulp Fiction", "annee": 1994, "realisateur": "Quentin Tarantino", "cat": "Crime", "url": "https://upload.wikimedia.org/wikipedia/en/3/3b/Pulp_Fiction_%281994%29_poster.jpg"},
    {"titre": "Forrest Gump", "annee": 1994, "realisateur": "Robert Zemeckis", "cat": "Drame", "url": "https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg"},
    {"titre": "Gladiator", "annee": 2000, "realisateur": "Ridley Scott", "cat": "Action", "url": "https://upload.wikimedia.org/wikipedia/en/f/fb/Gladiator_%282000_film_poster%29.png"},
    {"titre": "Fight Club", "annee": 1999, "realisateur": "David Fincher", "cat": "Drame", "url": "https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg"},
    {"titre": "Le Seigneur des Anneaux", "annee": 2001, "realisateur": "Peter Jackson", "cat": "Fantastique", "url": "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg"},
    {"titre": "Spider-Man: No Way Home", "annee": 2021, "realisateur": "Jon Watts", "cat": "Super-héros", "url": "https://upload.wikimedia.org/wikipedia/en/0/00/Spider-Man_No_Way_Home_poster.jpg"}
]

for data in vrais_films:
    print(f"-> Création de {data['titre']}...")
    
    # Récupérer ou créer la catégorie correspondante
    categorie, _ = Categorie.objects.get_or_create(nom=data["cat"])
    
    # Créer le film
    film, created = Film.objects.get_or_create(
        titre=data["titre"],
        defaults={
            'annee_sortie': data["annee"],
            'realisateur': data["realisateur"],
            'categorie': categorie
        }
    )
    
    # Télécharger et lier la vraie affiche
    if created or not film.affiche:
        try:
            img_content = telecharger_image(data["url"])
            nom_image = f"{data['titre'].replace(' ', '_').lower()}.jpg"
            film.affiche.save(nom_image, ContentFile(img_content), save=True)
        except Exception as e:
            print(f"   [Erreur image] Impossible de télécharger l'affiche pour {data['titre']} : {e}")

print("✨ Terminé ! Ton catalogue a désormais fière allure pour la soutenance.")
