import os
import django
import urllib.request
from django.core.files.base import ContentFile

# 1. INITIALISATION DE DJANGO STRICTEMENT EN PREMIER
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'banque_films.settings')
django.setup()

# 2. ON IMPORTE LES MODÈLES SEULEMENT APRÈS
from films.models import Film, Acteur, Casting

def telecharger_image(url):
    """Télécharge l'image en se faisant passer pour un navigateur"""
    try:
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        response = urllib.request.urlopen(req)
        return response.read()
    except Exception as e:
        print(f"Erreur téléchargement: {e}")
        return None

# Les 12 acteurs qui correspondent EXACTEMENT à tes 12 films
vrais_acteurs = [
    {"prenom": "Leonardo", "nom": "DiCaprio", "film": "Inception", "url": "https://upload.wikimedia.org/wikipedia/commons/4/46/Leonardo_Dicaprio_Cannes_2019.jpg"},
    {"prenom": "Keanu", "nom": "Reeves", "film": "Matrix", "url": "https://upload.wikimedia.org/wikipedia/commons/3/33/Reeves_at_the_2045_Movie_premiere_in_Tokyo_in_2015_%28cropped%29.jpg"},
    {"prenom": "Matthew", "nom": "McConaughey", "film": "Interstellar", "url": "https://upload.wikimedia.org/wikipedia/commons/8/8e/Matthew_McConaughey_-_Goldene_Kamera_2014_-_Berlin.jpg"},
    {"prenom": "Kate", "nom": "Winslet", "film": "Titanic", "url": "https://upload.wikimedia.org/wikipedia/commons/d/d7/Kate_Winslet_2016.jpg"},
    {"prenom": "Zoe", "nom": "Saldana", "film": "Avatar", "url": "https://upload.wikimedia.org/wikipedia/commons/0/00/Zoe_Saldana_by_Gage_Skidmore_2.jpg"},
    {"prenom": "Christian", "nom": "Bale", "film": "The Dark Knight", "url": "https://upload.wikimedia.org/wikipedia/commons/d/d3/Christian_Bale_2019.jpg"},
    {"prenom": "John", "nom": "Travolta", "film": "Pulp Fiction", "url": "https://upload.wikimedia.org/wikipedia/commons/6/69/John_Travolta_Cannes_2018.jpg"},
    {"prenom": "Tom", "nom": "Hanks", "film": "Forrest Gump", "url": "https://upload.wikimedia.org/wikipedia/commons/a/a9/Tom_Hanks_TIFF_2019.jpg"},
    {"prenom": "Russell", "nom": "Crowe", "film": "Gladiator", "url": "https://upload.wikimedia.org/wikipedia/commons/9/91/Russell_Crowe_2011.jpg"},
    {"prenom": "Brad", "nom": "Pitt", "film": "Fight Club", "url": "https://upload.wikimedia.org/wikipedia/commons/4/4c/Brad_Pitt_2011_Cannes.jpg"},
    {"prenom": "Elijah", "nom": "Wood", "film": "Le Seigneur des Anneaux", "url": "https://upload.wikimedia.org/wikipedia/commons/e/e0/Elijah_Wood_%2848419614486%29_%28cropped%29.jpg"},
    {"prenom": "Tom", "nom": "Holland", "film": "Spider-Man: No Way Home", "url": "https://upload.wikimedia.org/wikipedia/commons/3/3c/Tom_Holland_by_Gage_Skidmore.jpg"}
]

print("🎭 Démarrage du Casting VIP...")

for data in vrais_acteurs:
    # Créer ou récupérer l'acteur
    acteur, created = Acteur.objects.get_or_create(nom=data["nom"], prenom=data["prenom"])
    
    # Télécharger sa vraie photo s'il n'en a pas
    if created or not acteur.photo:
        img_content = telecharger_image(data["url"])
        if img_content:
            nom_image = f"{data['prenom'].lower()}_{data['nom'].lower()}.jpg"
            acteur.photo.save(nom_image, ContentFile(img_content), save=True)
    
    # Lier l'acteur à son film spécifique
    try:
        film = Film.objects.get(titre=data["film"])
        Casting.objects.get_or_create(film=film, acteur=acteur)
        print(f"✅ {data['prenom']} {data['nom']} a bien été rattaché au film '{data['film']}'.")
    except Film.DoesNotExist:
        print(f"❌ Le film '{data['film']}' est introuvable. As-tu bien lancé le script des films avant ?")

print("✨ Terminé ! Le casting est complet et les photos sont téléchargées.")
