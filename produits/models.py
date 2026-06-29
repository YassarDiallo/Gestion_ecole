from django.db import models
from utils.BaseClasse import ClasseBasique


# Create your models here.
class Produit(ClasseBasique):
    nom_produit = models.CharField(max_length=255)
    unite = models.CharField(max_length=50)
    prix_unitaire = models.DecimalField(max_digits=15, decimal_places=2)
    description = models.CharField(max_length=200,verbose_name="Description",null=True,blank=True)

    def __str__(self):
        return self.nom_produit
    
    class Meta:
        db_table='produits'