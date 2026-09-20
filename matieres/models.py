import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
# Create your models here.

class Matiere(ClasseBasique):
    nom=models.CharField(max_length=200,verbose_name="Nom de la matière",unique=True)
    coefficient=models.CharField(max_length=200,verbose_name="Coefficient",unique=True)
    
    
    def __str__(self):
        return f"{self.nom} {self.coefficient}"
    
    class Meta:
        db_table="matieres"
