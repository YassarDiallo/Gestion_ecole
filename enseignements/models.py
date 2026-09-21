import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
from classes.models import Classe
from matieres.models import Matiere
from enseignants.models import Enseignant
# Create your models here.

class Enseignement(ClasseBasique):
    classes=models.ForeignKey(Classe,verbose_name="Classe",on_delete=models.PROTECT)
    matieres=models.ForeignKey(Matiere,verbose_name="Matière",on_delete=models.SET_NULL,null=True)
    enseignants=models.ForeignKey(Enseignant,verbose_name="Enseignant",on_delete=models.SET_NULL,null=True)
    
    def __str__(self):
        return f"{self.enseignants} {self.matieres} "
    
    class Meta:
        db_table="enseignements"
