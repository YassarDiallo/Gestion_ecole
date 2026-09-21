import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
# Create your models here.

class Eleve(ClasseBasique):
    SEXE=[
        ("Masculin","Masculin"),
        ("Feminin","Feminin"),
        ("Autres","Autres"),
    ]
    nom=models.CharField(max_length=200,verbose_name="Nom")
    prenoms=models.CharField(max_length=200,verbose_name="Prenoms")
    date_naissance=models.CharField(max_length=100,verbose_name="Date de naissance")
    sexe=models.CharField(max_length=100,verbose_name="Sexe",choices=SEXE)
    adresse=models.CharField(max_length=100,verbose_name="Adresse")
    
    def __str__(self):
        return f"{self.nom} {self.prenoms}"
    
    class Meta:
        db_table="eleves"
