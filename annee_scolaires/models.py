import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
# Create your models here.

class AnneeScolaire(ClasseBasique):
    libele=models.CharField(max_length=200,verbose_name="Année scolaire",unique=True)
    date_debut=models.DateField(verbose_name="Date debut",unique=True)
    date_fin=models.DateField(verbose_name="Date fin")
    
    def __str__(self):
        return f"{self.libele}"
    
    class Meta:
        db_table="anneescolaires"
