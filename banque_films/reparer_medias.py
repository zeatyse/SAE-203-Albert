import os
import django
import time
import urllib.request
from django.core.files.base import ContentFile

# 1. Initialisation de Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'banque_films.settings')
django.setup()

from films.models import Film, Acteur

def telecharger_image_robuste(url, nom_element):
    """Télécharge une image avec un User-Agent respectueux et une pause pour éviter les blocs"""
    print(f"🌍 Téléchargement forcé pour [{nom_element}]...")
    try:
        # User-Agent personnalisé exigé par les règles de Wikimedia/Wikipédia
        headers = {
            'User-Agent': 'CineBaseBot/1.0 (contact: zeatyse@exemple.com) Educational Project'
        }
        req = urllib.request.Request(url, headers=headers)
        
        with urllib.request.urlopen(req, timeout=10) as response:
            data = response.read()
            print(f"   ✅ Succès ({len(data)} octets)")
            # On attend 1.5 seconde avant la prochaine requête pour ne pas être banni
            time.sleep(1.5)
            return data
    except Exception as e:
        print(f"   ❌ Échec pour {nom_element} : {e}")
        time.sleep(1.5)
        return None

# --- PARTIE 1 : LES FILMS ---
print("\n🎬 Téléchargement forcé de TOUTES les affiches de films...")
films_data = {
    "Inception": "https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg",
    "Matrix": "https://upload.wikimedia.org/wikipedia/en/c/c1/The_Matrix_Poster.jpg",
    "Interstellar": "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg",
    "Titanic": "https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png",
    "Avatar": "https://upload.wikimedia.org/wikipedia/en/d/d6/Avatar_%282009_film%29_poster.jpg",
    "The Dark Knight": "https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg",
    "Pulp Fiction": "https://upload.wikimedia.org/wikipedia/en/3/3b/Pulp_Fiction_%281994%29_poster.jpg",
    "Forrest Gump": "https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg",
    "Gladiator": "https://upload.wikimedia.org/wikipedia/en/f/fb/Gladiator_%282000_film_poster%29.png",
    "Fight Club": "https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg",
    "Le Seigneur des Anneaux": "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg",
    "Spider-Man: No Way Home": "https://upload.wikimedia.org/wikipedia/en/0/00/Spider-Man_No_Way_Home_poster.jpg"
}

for titre, url in films_data.items():
    try:
        film = Film.objects.get(titre=titre)
        # SUPPRESSION DU IF : On télécharge et on écrase systématiquement
        img_content = telecharger_image_robuste(url, titre)
        if img_content:
            nom_fichier = f"{titre.replace(' ', '_').lower()}.jpg"
            film.affiche.save(nom_fichier, ContentFile(img_content), save=True)
    except Film.DoesNotExist:
        print(f"⚠️ Le film '{titre}' n'existe pas dans la base.")

# --- PARTIE 2 : LES ACTEURS ---
print("\n🎭 Téléchargement forcé de TOUTES les photos d'acteurs...")
acteurs_data = [
    {"prenom": "Leonardo", "nom": "DiCaprio", "url": "https://upload.wikimedia.org/wikipedia/commons/4/46/Leonardo_Dicaprio_Cannes_2019.jpg"},
    {"prenom": "Keanu", "nom": "Reeves", "url": "https://upload.wikimedia.org/wikipedia/commons/3/33/Reeves_at_the_2045_Movie_premiere_in_Tokyo_in_2015_%28cropped%29.jpg"},
    {"prenom": "Matthew", "nom": "McConaughey", "url": "https://upload.wikimedia.org/wikipedia/commons/8/8e/Matthew_McConaughey_-_Goldene_Kamera_2014_-_Berlin.jpg"},
    {"prenom": "Kate", "nom": "Winslet", "url": "https://upload.wikimedia.org/wikipedia/commons/d/d7/Kate_Winslet_2016.jpg"},
    {"prenom": "Zoe", "nom": "Saldana", "url": "https://upload.wikimedia.org/wikipedia/commons/0/00/Zoe_Saldana_by_Gage_Skidmore_2.jpg"},
    {"prenom": "Christian", "nom": "Bale", "url": "https://upload.wikimedia.org/wikipedia/commons/d/d3/Christian_Bale_2019.jpg"},
    {"prenom": "John", "nom": "Travolta", "url": "https://upload.wikimedia.org/wikipedia/commons/6/69/John_Travolta_Cannes_2018.jpg"},
    {"prenom": "Tom", "nom": "Hanks", "url": "https://upload.wikimedia.org/wikipedia/commons/a/a9/Tom_Hanks_TIFF_2019.jpg"},
    {"prenom": "Russell", "nom": "Crowe", "url": "https://upload.wikimedia.org/wikipedia/commons/9/91/Russell_Crowe_2011.jpg"},
    {"prenom": "Brad", "nom": "Pitt", "url": "https://upload.wikimedia.org/wikipedia/commons/4/4c/Brad_Pitt_2011_Cannes.jpg"},
    {"prenom": "Elijah", "nom": "Wood", "url": "https://upload.wikimedia.org/wikipedia/commons/e/e0/Elijah_Wood_%2848419614486%29_%28cropped%29.jpg"},
    {"prenom": "Tom", "nom": "Holland", "url": "https://upload.wikimedia.org/wikipedia/commons/3/3c/Tom_Holland_by_Gage_Skidmore.jpg"}
]

for act in acteurs_data:
    nom_complet = f"{act['prenom']} {act['nom']}"
    try:
        acteur = Acteur.objects.get(nom=act['nom'], prenom=act['prenom'])
        # SUPPRESSION DU IF : On télécharge et on écrase systématiquement
        img_content = telecharger_image_robuste(act['url'], nom_complet)
        if img_content:
            nom_fichier = f"{act['prenom'].lower()}_{act['nom'].lower()}.jpg"
            acteur.photo.save(nom_fichier, ContentFile(img_content), save=True)
    except Acteur.DoesNotExist:
        print(f"⚠️ L'acteur '{nom_complet}' n'existe pas dans la base.")

print("\n✨ Terminé ! Toutes les images ont été retéléchargées avec succès.")
