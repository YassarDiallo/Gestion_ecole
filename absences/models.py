import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
from inscriptions.models import Inscription
# Create your models here.

class Absence(ClasseBasique):
    JUSTIFICATION_LIST=[
        ('justifie',"Justifié"),
        ('non_justifie',"Non justifié"),
    ]
    inscriptions=models.ForeignKey(Inscription,max_length=200,verbose_name="Inscription",on_delete=models.SET_NULL,null=True)
    date_absence=models.DateField(max_length=200,verbose_name="Date absence")
    motif=models.CharField(max_length=200,verbose_name="Motif")
    justifie=models.CharField(max_length=100,verbose_name="Justification",choices=JUSTIFICATION_LIST)
    
    def __str__(self):
        return f"{self.inscriptions}"
    
    class Meta:
        db_table="absences"
