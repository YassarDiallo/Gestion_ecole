import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
from annee_scolaires.models import AnneeScolaire
# Create your models here.

class Periode(ClasseBasique):
    LIBELLE=[
        ("Trimestre 1","Trimestre 1"),
        ('Trimestre 2',"Trimestre 2"),
        ('Trimestre 3',"Trimestre 3"),
    ]
    annees=models.ForeignKey(AnneeScolaire,on_delete=models.SET_NULL,null=True,blank=False)
    libelle=models.CharField(max_length=100,choices=LIBELLE,verbose_name="Trimestre ")
    date_debut=models.DateField(verbose_name="Date debut")
    date_fin=models.DateField(verbose_name="Date fin")
    
    def __str__(self):
        return f"{self.libelle} de l'année {self.annees} "
    
    class Meta:
        db_table="periodes"
