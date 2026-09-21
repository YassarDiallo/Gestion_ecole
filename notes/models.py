import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
from inscriptions.models import Inscription
from matieres.models import Matiere
from periodes.models import Periode
# Create your models here.

class Note(ClasseBasique):
    TYPE_EVALUATION_CHOICES = [
        ("devoir","Devoir"),
        ("interrogation","Interrogation"),
        ("examen","Examen"),
        ("oral","Oral"),
    ]
    inscriptions=models.ForeignKey(Inscription,max_length=200,verbose_name="Inscription",on_delete=models.SET_NULL,null=True)
    matieres=models.ForeignKey(Matiere,max_length=200,verbose_name="Matière",on_delete=models.SET_NULL,null=True)
    periodes=models.ForeignKey(Periode,max_length=200,verbose_name="Période",on_delete=models.SET_NULL,null=True)
    valeur=models.DecimalField(verbose_name="Valeur",max_digits=5,decimal_places=2)
    type_evaluation=models.CharField(max_length=100,verbose_name="Type d'évaluation",choices=TYPE_EVALUATION_CHOICES,default='devoir')
    
    def __str__(self):
        return f"{self.inscriptions} {self.niveau}"
    
    class Meta:
        db_table="notes"
