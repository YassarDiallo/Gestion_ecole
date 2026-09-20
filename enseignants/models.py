import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
# Create your models here.

class Enseignant(ClasseBasique):
    nom=models.CharField(max_length=200,verbose_name="Nom de l'enseignant",unique=True)
    prenoms=models.CharField(max_length=200,verbose_name="Prénoms de l'enseignant",unique=True)
    telephone=models.CharField(max_length=200,verbose_name="Telephone de l'enseignant",unique=True)
    date_embauche=models.DateField(verbose_name="Date d'embauche")
    
    def __str__(self):
        return f"{self.prenoms} {self.nom}"
    
    class Meta:
        db_table="enseignants"
