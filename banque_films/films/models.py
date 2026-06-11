from django.db import models
from django.contrib.auth.models import AbstractUser


class Personne(AbstractUser):
    TYPE_CHOICES = [
        ('professionnel', 'Professionnel'),
        ('amateur', 'Amateur'),
    ]
    type = models.CharField(max_length=20, choices=TYPE_CHOICES, default='amateur')

    class Meta:
        verbose_name = 'Personne'
        verbose_name_plural = 'Personnes'

    def __str__(self):
        return self.username


class Categorie(models.Model):
    nom = models.CharField(max_length=100, verbose_name='Nom')
    descriptif = models.TextField(blank=True, verbose_name='Descriptif')

    class Meta:
        verbose_name = 'Catégorie'
        verbose_name_plural = 'Catégories'
        ordering = ['nom']

    def __str__(self):
        return self.nom


class Acteur(models.Model):
    nom = models.CharField(max_length=100, verbose_name='Nom')
    prenom = models.CharField(max_length=100, verbose_name='Prénom')
    age = models.IntegerField(null=True, blank=True, verbose_name='Âge')
    photo = models.ImageField(upload_to='acteurs/', null=True, blank=True, verbose_name='Photo')

    class Meta:
        verbose_name = 'Acteur'
        verbose_name_plural = 'Acteurs'
        ordering = ['nom', 'prenom']

    def __str__(self):
        return f"{self.prenom} {self.nom}"


class Film(models.Model):
    titre = models.CharField(max_length=200, verbose_name='Titre')
    annee_sortie = models.IntegerField(null=True, blank=True, verbose_name='Année de sortie')
    affiche = models.ImageField(upload_to='affiches/', null=True, blank=True, verbose_name='Affiche')
    realisateur = models.CharField(max_length=100, blank=True, verbose_name='Réalisateur')
    categorie = models.ForeignKey(
        Categorie, on_delete=models.SET_NULL, null=True, blank=True,
        verbose_name='Catégorie', related_name='films'
    )
    acteurs = models.ManyToManyField(Acteur, through='Casting', blank=True, verbose_name='Acteurs')

    class Meta:
        verbose_name = 'Film'
        verbose_name_plural = 'Films'
        ordering = ['-annee_sortie', 'titre']

    def __str__(self):
        return self.titre

    def moyenne_notes(self):
        commentaires = list(self.commentaires.all())
        if not commentaires:
            return None
        return round(sum(c.note for c in commentaires) / len(commentaires), 1)

    def moyenne_par_type(self, type_personne):
        commentaires = list(self.commentaires.filter(personne__type=type_personne))
        if not commentaires:
            return None
        return round(sum(c.note for c in commentaires) / len(commentaires), 1)

    def meilleur_commentaire(self):
        return self.commentaires.order_by('-note', '-date').first()

    def pire_commentaire(self):
        return self.commentaires.order_by('note', '-date').first()


class Casting(models.Model):
    film = models.ForeignKey(Film, on_delete=models.CASCADE, verbose_name='Film')
    acteur = models.ForeignKey(Acteur, on_delete=models.CASCADE, verbose_name='Acteur')

    class Meta:
        unique_together = ('film', 'acteur')
        verbose_name = 'Casting'
        verbose_name_plural = 'Castings'

    def __str__(self):
        return f"{self.acteur} dans {self.film}"


class Commentaire(models.Model):
    NOTE_CHOICES = [(i, f"{i}/10") for i in range(1, 11)]

    film = models.ForeignKey(Film, on_delete=models.CASCADE, related_name='commentaires', verbose_name='Film')
    personne = models.ForeignKey(Personne, on_delete=models.CASCADE, verbose_name='Personne')
    note = models.IntegerField(choices=NOTE_CHOICES, verbose_name='Note')
    commentaire = models.TextField(verbose_name='Commentaire')
    date = models.DateTimeField(auto_now_add=True, verbose_name='Date')

    class Meta:
        verbose_name = 'Commentaire'
        verbose_name_plural = 'Commentaires'
        ordering = ['-date']

    def __str__(self):
        return f"{self.personne.username} — {self.film.titre} ({self.note}/10)"
