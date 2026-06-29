from django.db import models
from utils.BaseClasse  import ClasseBasique
# Create your models here.

class Entreprise(ClasseBasique):
    nom = models.CharField(max_length=255)
    adresse = models.CharField(max_length=255)
    telephone = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    site_web = models.URLField(blank=True, null=True)
    
    logo = models.ImageField(upload_to='entreprise/logo/', blank=True, null=True)
    cachet = models.ImageField(upload_to='entreprise/cachet/', blank=True, null=True)
    signature = models.ImageField(upload_to='entreprise/signature/', blank=True, null=True)
    siege_social=models.CharField(max_length=200,null=True,blank=True)
    
    def __str__(self):
        return f"{self.nom}"
    

    class Meta:
        db_table="entreprises"
