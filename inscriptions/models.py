from django.db import models
from utils.BaseClasse  import ClasseBasique
from eleves.models import Eleve
# Create your models here.

class Inscription(ClasseBasique):
    STATUT_CHOICES = [
        ("en_attente", "En attente"),
        ("validee", "Validée"),
        ("annulee", "Annulée"),
        ("refusee", "Refusée"),
        ("terminee", "Terminée"),
    ]
    eleves=models.ForeignKey(Eleve,verbose_name="Elève",on_delete=models.SET_NULL,null=True)
    date_inscription=models.DateField(verbose_name="Date inscription")
    status=models.CharField(max_length=100,verbose_name="Statut",choices=STATUT_CHOICES)
    
    def __str__(self):
        return f"{self.eleves} "
    
    class Meta:
        db_table="inscriptions"
