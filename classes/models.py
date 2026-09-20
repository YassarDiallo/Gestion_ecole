import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
from annee_scolaires.models import AnneeScolaire
from enseignants.models import Enseignant
# Create your models here.

class Classe(ClasseBasique):
    NIVEAUX = [
        ("CP1", "CP1"),
        ("CP2", "CP2"),
        ("CE1", "CE1"),
        ("CE2", "CE2"),
        ("CM1", "CM1"),
        ("CM2", "CM2"),
    ]
    annees=models.ForeignKey(AnneeScolaire,max_length=200,verbose_name="Année scolaire",on_delete=models.PROTECT)
    enseignants=models.ForeignKey(Enseignant,max_length=200,verbose_name="Enseignant",on_delete=models.PROTECT)
    nom=models.CharField(max_length=200,verbose_name="Nom  de la classe ")
    niveau=models.CharField(max_length=200,verbose_name="Niveau",choices=NIVEAUX)
    effectif_max=models.PositiveIntegerField(max_length=30,verbose_name="Effectif maximum")
    
    def __str__(self):
        return f"{self.nom} {self.niveau}"
    
    class Meta:
        db_table="classes"
