import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
from annee_scolaires.models import AnneeScolaire
from enseignants.models import Enseignant
# Create your models here.

class Parent(ClasseBasique):
    nom=models.CharField(max_length=200,verbose_name="Nom")
    prenoms=models.CharField(max_length=200,verbose_name="Prénoms ")
    telephone=models.CharField(max_length=200,verbose_name="Téléphone")
    profession=models.CharField(max_length=100,verbose_name="Profession")
    
    def __str__(self):
        return f"{self.nom} {self.prenoms}"
    
    class Meta:
        db_table="parents"
