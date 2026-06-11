from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import Personne, Categorie, Film, Acteur, Commentaire


class InscriptionForm(UserCreationForm):
    email = forms.EmailField(required=True, label='Email')

    class Meta:
        model = Personne
        fields = ('username', 'first_name', 'last_name', 'email', 'type', 'password1', 'password2')
        labels = {
            'username': 'Pseudo',
            'first_name': 'Prénom',
            'last_name': 'Nom',
            'type': 'Type de compte',
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields.values():
            field.widget.attrs['class'] = 'form-control'
        self.fields['type'].widget.attrs['class'] = 'form-select'


class ConnexionForm(forms.Form):
    username = forms.CharField(label='Pseudo', widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label='Mot de passe', widget=forms.PasswordInput(attrs={'class': 'form-control'}))


class PersonneUpdateForm(forms.ModelForm):
    class Meta:
        model = Personne
        fields = ('username', 'first_name', 'last_name', 'email', 'type', 'is_staff')
        labels = {
            'username': 'Pseudo',
            'first_name': 'Prénom',
            'last_name': 'Nom',
            'email': 'Email',
            'type': 'Type de compte',
            'is_staff': 'Administrateur',
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():
            if name in ('type',):
                field.widget.attrs['class'] = 'form-select'
            elif name not in ('is_staff',):
                field.widget.attrs['class'] = 'form-control'


class CategorieForm(forms.ModelForm):
    class Meta:
        model = Categorie
        fields = '__all__'
        widgets = {
            'nom': forms.TextInput(attrs={'class': 'form-control'}),
            'descriptif': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
        }


class FilmForm(forms.ModelForm):
    class Meta:
        model = Film
        fields = ['titre', 'annee_sortie', 'affiche', 'realisateur', 'categorie']
        widgets = {
            'titre': forms.TextInput(attrs={'class': 'form-control'}),
            'annee_sortie': forms.NumberInput(attrs={'class': 'form-control', 'min': 1888, 'max': 2100}),
            'realisateur': forms.TextInput(attrs={'class': 'form-control'}),
            'categorie': forms.Select(attrs={'class': 'form-select'}),
            'affiche': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }


class ActeurForm(forms.ModelForm):
    class Meta:
        model = Acteur
        fields = '__all__'
        widgets = {
            'nom': forms.TextInput(attrs={'class': 'form-control'}),
            'prenom': forms.TextInput(attrs={'class': 'form-control'}),
            'age': forms.NumberInput(attrs={'class': 'form-control', 'min': 0, 'max': 120}),
            'photo': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }


class CommentaireForm(forms.ModelForm):
    class Meta:
        model = Commentaire
        fields = ['note', 'commentaire']
        widgets = {
            'note': forms.Select(attrs={'class': 'form-select'}),
            'commentaire': forms.Textarea(attrs={'rows': 4, 'class': 'form-control',
                                                  'placeholder': 'Votre commentaire sur ce film...'}),
        }


class ImportFilmForm(forms.Form):
    fichier = forms.FileField(
        label='Fichier CSV',
        widget=forms.ClearableFileInput(attrs={'class': 'form-control', 'accept': '.csv'}),
    )
