import os
import django
from django.utils import timezone

# 1. INITIALISATION DE DJANGO
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'banque_films.settings')
django.setup()

# 2. IMPORT DES MODÈLES
from films.models import Film, Commentaire, Personne

print("👥 1. Création des comptes utilisateurs de test (Amateur & Pro)...")

# Création de l'utilisateur Amateur
user_amateur, _ = Personne.objects.get_or_create(
    username="Lucas_Cinephile",
    defaults={
        "email": "lucas@exemple.com",
        "type": "amateur"
    }
)
if _:
    user_amateur.set_password("motdepasseSAE")
    user_amateur.save()

# Création de l'utilisateur Professionnel
user_pro, _ = Personne.objects.get_or_create(
    username="Marie_Critique_Presse",
    defaults={
        "email": "marie.presse@exemple.com",
        "type": "professionnel"
    }
)
if _:
    user_pro.set_password("motdepasseSAE")
    user_pro.save()


print("✍️ 2. Rédaction des avis et notes sur-mesure...")

avis_data = {
    "Inception": [
        {"user": user_pro, "note": 9, "texte": "Une mise en scène vertigineuse et un scénario d'une complexité rare. Christopher Nolan signe un chef-d'œuvre de science-fiction moderne."},
        {"user": user_amateur, "note": 8, "texte": "Incroyable ! Le concept des rêves emboîtés est fou. J'ai dû le regarder deux fois pour tout comprendre mais ça vaut le coup !"}
    ],
    "Matrix": [
        {"user": user_pro, "note": 10, "texte": "Une révolution philosophique et visuelle qui a redéfini le cinéma d'action et d'anticipation pour le XXIe siècle."},
        {"user": user_amateur, "note": 9, "texte": "Les effets spéciaux et les combats n'ont pas vieilli. La pilule rouge ou la pilule bleue... culte !"}
    ],
    "Interstellar": [
        {"user": user_pro, "note": 9, "texte": "Une odyssée spatiale ambitieuse, scientifiquement fascinante et portée par une bande originale magistrale de Hans Zimmer."},
        {"user": user_amateur, "note": 10, "texte": "Mon film préféré. La relation entre le père et sa fille au travers de l'espace m'a fait pleurer du début à la fin."}
    ],
    "Titanic": [
        {"user": user_pro, "note": 8, "texte": "Une fresque historique et romantique d'une efficacité redoutable. James Cameron maîtrise son sujet de bout en bout."},
        {"user": user_amateur, "note": 9, "texte": "Un classique absolu. La fin me brise le cœur à chaque fois, il y avait de la place pour deux sur cette planche !"}
    ],
    "Avatar": [
        {"user": user_pro, "note": 7, "texte": "Si le scénario reste très classique et prévisible, la claque visuelle et l'univers de Pandora restent révolutionnaires."},
        {"user": user_amateur, "note": 9, "texte": "Les décors sont magnifiques, on plonge complètement dans un autre monde. Hâte de voir la suite à chaque visionnage."}
    ],
    "The Dark Knight": [
        {"user": user_pro, "note": 10, "texte": "Le sommet du film de super-héros. La performance mémorable et habitée d'Heath Ledger en Joker fait entrer ce film dans l'histoire."},
        {"user": user_amateur, "note": 10, "texte": "Le meilleur Batman de tous les temps. Sombre, tendu, et un Joker terrifiant du début à la fin !"}
    ],
    "Pulp Fiction": [
        {"user": user_pro, "note": 9, "texte": "Des dialogues acérés, une narration déstructurée brillante et une bande-son mythique. Du grand Quentin Tarantino."},
        {"user": user_amateur, "note": 8, "texte": "Un film un peu déjanté mais super cool. Les scènes de danse et de braquages sont légendaires."}
    ],
    "Forrest Gump": [
        {"user": user_pro, "note": 9, "texte": "Une traversée poignante et optimiste de l'histoire américaine, sublimée par la performance historique de Tom Hanks."},
        {"user": user_amateur, "note": 10, "texte": "La vie c'est comme une boîte de chocolats... Une leçon de vie magnifique, drôle et touchante."}
    ],
    "Gladiator": [
        {"user": user_pro, "note": 8, "texte": "Le péplum renaît de ses cendres grâce à la réalisation épique de Ridley Scott et un Russell Crowe impérial."},
        {"user": user_amateur, "note": 9, "texte": "Des combats dantesques et une histoire de vengeance ultra captivante. Force et honneur !"}
    ],
    "Fight Club": [
        {"user": user_pro, "note": 9, "texte": "Une satire féroce de la société de consommation doublée d'un thriller psychologique au twist final mémorable."},
        {"user": user_amateur, "note": 9, "texte": "La première règle du Fight Club est qu'on ne parle pas du Fight Club. Le duo Brad Pitt / Edward Norton fonctionne à merveille."}
    ],
    "Le Seigneur des Anneaux": [
        {"user": user_pro, "note": 10, "texte": "Une adaptation monumentale de l'œuvre de Tolkien. Peter Jackson signe le plus grand film de fantasy de l'histoire du cinéma."},
        {"user": user_amateur, "note": 10, "texte": "Une aventure inoubliable ! Les musiques, les paysages, les batailles... Tout est parfait dans la Communauté de l'Anneau."}
    ],
    "Spider-Man: No Way Home": [
        {"user": user_pro, "note": 6, "texte": "Le film repose énormément sur le fan service et la nostalgie, au détriment d'un scénario parfois bancal et de facilités scénaristiques."},
        {"user": user_amateur, "note": 8, "texte": "Revoir les trois Spider-Man ensemble sur le même écran était un rêve de gosse ! Un pur moment de plaisir pour les fans."}
    ]
}

for titre, liste_avis in avis_data.items():
    try:
        film = Film.objects.get(titre=titre)
        for avis in liste_avis:
            # Utilisation du champ exact 'commentaire' validé par les modèles Django
            commentaire_obj, created = Commentaire.objects.get_or_create(
                film=film,
                personne=avis["user"],
                defaults={
                    "note": avis["note"],
                    "commentaire": avis["texte"],  # Correction ici : de 'texte' à 'commentaire'
                    "date": timezone.now()
                }
            )
            if created:
                print(f"   ✅ Avis ajouté pour '{titre}' par {avis['user'].username} ({avis['note']}/10)")
            else:
                print(f"   🟢 Avis déjà présent pour '{titre}' par {avis['user'].username}")
    except Film.DoesNotExist:
        print(f"   ⚠️ Impossible d'ajouter l'avis : le film '{titre}' n'existe pas en base.")

print("\n✨ Terminé ! Ton site affiche maintenant de vraies notes et commentaires.")
print("💡 Les moyennes globales, amateurs et professionnelles vont se calculer toutes seules !")
