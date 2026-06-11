import os
import django
import random

# On connecte le script à ton projet Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'banque_films.settings')
django.setup()

from films.models import Personne, Film, Acteur, Casting, Commentaire

print("🚀 Démarrage de la génération de masse...")

# 1. Création de 100 utilisateurs
print("👤 Création de 100 utilisateurs...")
utilisateurs = []
for i in range(1, 101):
    # create_user permet de crypter le mot de passe pour qu'ils puissent se connecter
    user = Personne.objects.create_user(
        username=f"Cinephile_{i}",
        password="password123", # Tous les comptes auront ce mot de passe
        email=f"cinephile{i}@test.fr",
        type=random.choice(['professionnel', 'amateur'])
    )
    utilisateurs.append(user)

# 2. Création de 50 acteurs
print("🎭 Création de 50 acteurs...")
acteurs = []
for i in range(1, 51):
    acteur = Acteur.objects.create(
        nom=f"Star_{i}", 
        prenom="Acteur", 
        age=random.randint(20, 80)
    )
    acteurs.append(acteur)

# 3. Création de 100 films et de leurs castings
print("🎬 Création de 100 films et des castings...")
films = []
for i in range(1, 101):
    film = Film.objects.create(
        titre=f"Projet Mystère n°{i} - L'Aventure",
        annee_sortie=random.randint(1980, 2024),
        realisateur=f"Réalisateur {random.randint(1, 20)}"
    )
    films.append(film)
    
    # On ajoute entre 2 et 4 acteurs au hasard pour ce film
    acteurs_du_film = random.sample(acteurs, random.randint(2, 4))
    for a in acteurs_du_film:
        Casting.objects.create(film=film, acteur=a)

# 4. Création de 500+ commentaires aléatoires
print("📝 Génération d'une avalanche de commentaires...")
phrases = [
    "Un chef-d'œuvre absolu, je recommande !",
    "Vraiment déçu par la fin...",
    "Les acteurs jouent super bien, mais le scénario est moyen.",
    "Incroyable ! À voir absolument au cinéma.",
    "Bof, j'ai failli m'endormir.",
    "Une vraie claque visuelle !"
]

for film in films:
    # Chaque film reçoit entre 3 et 8 commentaires
    for _ in range(random.randint(3, 8)):
        Commentaire.objects.create(
            film=film,
            personne=random.choice(utilisateurs),
            note=random.randint(1, 10),
            commentaire=random.choice(phrases)
        )

print("✅ Terminé ! Ta base de données est maintenant gigantesque !")
