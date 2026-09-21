import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
from inscriptions.models import Inscription
# Create your models here.

class Paiement(ClasseBasique):
    TYPE_FRAIS_CHOICES = [
        ("inscription", "Frais d'inscription"),
        ("scolarite", "Scolarité"),
        ("cantine", "Cantine"),
        ("transport", "Transport"),
        ("fournitures", "Fournitures"),
    ]

    MODE_PAIEMENT_CHOICES = [
        ("especes", "Espèces"),
        ("virement", "Virement bancaire"),
        ("cheque", "Chèque"),
        ("mobile_money", "Mobile Money"),
    ]

    inscriptions=models.ForeignKey(Inscription,on_delete=models.SET_NULL,null=True)
    montant=models.DecimalField(max_digits=20,decimal_places=2,verbose_name="Montant")
    date_paiement=models.DateField()
    type_frais=models.CharField(max_length=100,verbose_name="Type frais",choices=TYPE_FRAIS_CHOICES)
    mode_paiement=models.CharField(max_length=100,verbose_name="Mode de paiement",choices=MODE_PAIEMENT_CHOICES)
    
    def __str__(self):
        return f"{self.inscriptions}"
    
    class Meta:
        db_table="paiements"
