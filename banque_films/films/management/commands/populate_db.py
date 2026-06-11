from django.core.management.base import BaseCommand
from films.models import Categorie, Film, Acteur, Casting, Commentaire, Personne


CATEGORIES = [
    ('Action', 'Films d\'action avec effets spéciaux et scènes de combat.'),
    ('Drame', 'Films centrés sur des émotions et des situations de vie réelles.'),
    ('Comédie', 'Films légers destinés à faire rire le public.'),
    ('Science-Fiction', 'Films explorant la technologie, l\'espace et le futur.'),
    ('Thriller', 'Films de suspense et de tension psychologique.'),
    ('Horreur', 'Films conçus pour effrayer et créer de l\'angoisse.'),
    ('Aventure', 'Films mettant en scène des voyages et des quêtes épiques.'),
    ('Animation', 'Films d\'animation pour tous les publics.'),
]

ACTEURS = [
    ('Leonardo', 'DiCaprio', 49),
    ('Meryl', 'Streep', 74),
    ('Tom', 'Hanks', 67),
    ('Natalie', 'Portman', 42),
    ('Brad', 'Pitt', 60),
    ('Cate', 'Blanchett', 54),
    ('Joaquin', 'Phoenix', 49),
    ('Scarlett', 'Johansson', 39),
    ('Matt', 'Damon', 53),
    ('Charlize', 'Theron', 48),
    ('Joseph', 'Gordon-Levitt', 42),
    ('Ellen', 'Page', 37),
    ('Morgan', 'Freeman', 86),
    ('Anthony', 'Hopkins', 86),
    ('Jodie', 'Foster', 61),
    ('Al', 'Pacino', 84),
    ('Robert', 'De Niro', 80),
    ('Kate', 'Winslet', 48),
    ('Christian', 'Bale', 50),
    ('Heath', 'Ledger', 28),
]

FILMS = [
    {
        'titre': 'Inception',
        'annee_sortie': 2010,
        'realisateur': 'Christopher Nolan',
        'categorie': 'Science-Fiction',
        'acteurs': ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Ellen Page'],
    },
    {
        'titre': 'Forrest Gump',
        'annee_sortie': 1994,
        'realisateur': 'Robert Zemeckis',
        'categorie': 'Drame',
        'acteurs': ['Tom Hanks'],
    },
    {
        'titre': 'Fight Club',
        'annee_sortie': 1999,
        'realisateur': 'David Fincher',
        'categorie': 'Thriller',
        'acteurs': ['Brad Pitt'],
    },
    {
        'titre': 'Black Swan',
        'annee_sortie': 2010,
        'realisateur': 'Darren Aronofsky',
        'categorie': 'Thriller',
        'acteurs': ['Natalie Portman'],
    },
    {
        'titre': 'The Dark Knight',
        'annee_sortie': 2008,
        'realisateur': 'Christopher Nolan',
        'categorie': 'Action',
        'acteurs': ['Christian Bale', 'Heath Ledger', 'Morgan Freeman'],
    },
    {
        'titre': 'Joker',
        'annee_sortie': 2019,
        'realisateur': 'Todd Phillips',
        'categorie': 'Drame',
        'acteurs': ['Joaquin Phoenix'],
    },
    {
        'titre': 'Avengers: Endgame',
        'annee_sortie': 2019,
        'realisateur': 'Anthony et Joe Russo',
        'categorie': 'Action',
        'acteurs': ['Scarlett Johansson'],
    },
    {
        'titre': 'Mad Max: Fury Road',
        'annee_sortie': 2015,
        'realisateur': 'George Miller',
        'categorie': 'Action',
        'acteurs': ['Charlize Theron'],
    },
    {
        'titre': 'Le Silence des agneaux',
        'annee_sortie': 1991,
        'realisateur': 'Jonathan Demme',
        'categorie': 'Thriller',
        'acteurs': ['Jodie Foster', 'Anthony Hopkins'],
    },
    {
        'titre': 'The Departed',
        'annee_sortie': 2006,
        'realisateur': 'Martin Scorsese',
        'categorie': 'Thriller',
        'acteurs': ['Leonardo DiCaprio', 'Matt Damon', 'Jack Nicholson'],
    },
    {
        'titre': 'Titanic',
        'annee_sortie': 1997,
        'realisateur': 'James Cameron',
        'categorie': 'Drame',
        'acteurs': ['Leonardo DiCaprio', 'Kate Winslet'],
    },
    {
        'titre': 'Pulp Fiction',
        'annee_sortie': 1994,
        'realisateur': 'Quentin Tarantino',
        'categorie': 'Thriller',
        'acteurs': ['Brad Pitt'],
    },
]

UTILISATEURS = [
    {'username': 'jean_pro', 'first_name': 'Jean', 'last_name': 'Martin', 'email': 'jean@pro.fr', 'type': 'professionnel', 'password': 'Cinema2024!'},
    {'username': 'marie_cine', 'first_name': 'Marie', 'last_name': 'Dupont', 'email': 'marie@email.fr', 'type': 'amateur', 'password': 'Cinema2024!'},
    {'username': 'lucas_film', 'first_name': 'Lucas', 'last_name': 'Bernard', 'email': 'lucas@email.fr', 'type': 'professionnel', 'password': 'Cinema2024!'},
    {'username': 'sarah_watch', 'first_name': 'Sarah', 'last_name': 'Leroy', 'email': 'sarah@email.fr', 'type': 'amateur', 'password': 'Cinema2024!'},
]

COMMENTAIRES = [
    ('Inception', 'jean_pro', 9, 'Un chef-d\'œuvre de la narration cinématographique. Nolan à son meilleur.'),
    ('Inception', 'marie_cine', 8, 'Film incroyable, j\'ai adoré les effets visuels et le concept des rêves imbriqués !'),
    ('Inception', 'lucas_film', 10, 'Probablement le meilleur film de science-fiction de la décennie. Scénario impeccable.'),
    ('Forrest Gump', 'marie_cine', 10, 'Un film magnifique qui m\'a fait rire et pleurer. Tom Hanks est génial !'),
    ('Forrest Gump', 'jean_pro', 7, 'Bon film grand public, mais un peu trop sentimental pour mon goût.'),
    ('The Dark Knight', 'sarah_watch', 10, 'Heath Ledger en Joker... inoubliable. Le meilleur film de super-héros jamais fait.'),
    ('The Dark Knight', 'lucas_film', 9, 'Nolan redéfinit le genre super-héros. Réalisation et jeu d\'acteurs exceptionnels.'),
    ('Joker', 'jean_pro', 8, 'Joaquin Phoenix livre une performance ahurissante. Film sombre et mature.'),
    ('Joker', 'sarah_watch', 9, 'Wow, quelle performance ! Un film qui fait réfléchir sur la société.'),
    ('Titanic', 'marie_cine', 8, 'Un classique romantique. La fin me fait pleurer à chaque fois.'),
    ('Le Silence des agneaux', 'lucas_film', 10, 'Hopkins et Foster sont extraordinaires. Un thriller psychologique parfait.'),
    ('Fight Club', 'jean_pro', 9, 'Fincher maîtrise parfaitement la mise en scène. Twist final mémorable.'),
]


class Command(BaseCommand):
    help = 'Peuple la base de données avec des données de démonstration'

    def handle(self, *args, **options):
        self.stdout.write('Création des catégories...')
        cats = {}
        for nom, desc in CATEGORIES:
            c, _ = Categorie.objects.get_or_create(nom=nom, defaults={'descriptif': desc})
            cats[nom] = c

        self.stdout.write('Création des acteurs...')
        acteurs_map = {}
        for prenom, nom, age in ACTEURS:
            a, _ = Acteur.objects.get_or_create(
                prenom=prenom, nom=nom,
                defaults={'age': age}
            )
            acteurs_map[f"{prenom} {nom}"] = a

        self.stdout.write('Création des films...')
        films_map = {}
        for data in FILMS:
            cat = cats.get(data['categorie'])
            film, _ = Film.objects.get_or_create(
                titre=data['titre'],
                defaults={
                    'annee_sortie': data['annee_sortie'],
                    'realisateur': data['realisateur'],
                    'categorie': cat,
                }
            )
            films_map[data['titre']] = film
            for nom_acteur in data.get('acteurs', []):
                if nom_acteur in acteurs_map:
                    Casting.objects.get_or_create(film=film, acteur=acteurs_map[nom_acteur])

        self.stdout.write('Création des utilisateurs...')
        users_map = {}
        for u in UTILISATEURS:
            personne, created = Personne.objects.get_or_create(
                username=u['username'],
                defaults={
                    'first_name': u['first_name'],
                    'last_name': u['last_name'],
                    'email': u['email'],
                    'type': u['type'],
                }
            )
            if created:
                personne.set_password(u['password'])
                personne.save()
            users_map[u['username']] = personne

        self.stdout.write('Création des commentaires...')
        for titre, username, note, texte in COMMENTAIRES:
            film = films_map.get(titre)
            personne = users_map.get(username)
            if film and personne:
                Commentaire.objects.get_or_create(
                    film=film, personne=personne,
                    defaults={'note': note, 'commentaire': texte}
                )

        # Compte admin
        if not Personne.objects.filter(username='admin').exists():
            admin = Personne.objects.create_superuser(
                username='admin',
                email='admin@cinebase.fr',
                password='admin123',
            )
            admin.type = 'professionnel'
            admin.save()
            self.stdout.write(self.style.SUCCESS('Compte admin créé (admin / admin123)'))

        self.stdout.write(self.style.SUCCESS(
            f'\nBase peuplée : {Film.objects.count()} films, {Acteur.objects.count()} acteurs, '
            f'{Personne.objects.count()} utilisateurs, {Commentaire.objects.count()} commentaires.'
        ))
        self.stdout.write('\nComptes de démonstration (mot de passe : Cinema2024!) :')
        for u in UTILISATEURS:
            self.stdout.write(f"  - {u['username']} ({u['type']})")
