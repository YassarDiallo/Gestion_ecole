import secrets
from django.db import models
from utils.BaseClasse  import ClasseBasique
# Create your models here.

class Client(ClasseBasique):
    nom=models.CharField(max_length=200,verbose_name="Nom complet du client",unique=True)
    telephone=models.CharField(max_length=100,verbose_name="Telephone",unique=True)
    adresse=models.CharField(max_length=100,verbose_name="Adresse")
    email=models.EmailField(null=True)
    
    def __str__(self):
        return f"{self.nom}"
    
    class Meta:
        db_table="clients"
