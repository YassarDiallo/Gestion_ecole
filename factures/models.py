from django.db import models
from utils.BaseClasse  import ClasseBasique
from utils.fonctions import montant_en_lettres
from produits.models import Produit
from django.db.models import Sum


class Facture(ClasseBasique):
    TYPES={
        'cheque':'Chèque',
        'virement':'Virement',
        'espece':'Espece'
    }    
    numero_facture = models.CharField(max_length=100, unique=True)
    clients= models.ForeignKey('clients.Client', on_delete=models.CASCADE)
    date_facture = models.DateField()
    mode_paiement = models.CharField(max_length=100, blank=True, null=True,choices=TYPES)
    note = models.CharField(max_length=200,verbose_name='Note')

    def __str__(self):
        return self.numero_facture


    @property
    def montant_total(self):
        total=self.lignes.aggregate(total=Sum('montant')) or 0

    @property
    def montant_lettre(self):
        return montant_en_lettres(self.montant_total)
    
    class Meta:
        db_table='factures'

class LigneFacture(ClasseBasique):
    factures = models.ForeignKey(Facture,on_delete=models.CASCADE,related_name='lignes')
    produits = models.ForeignKey(Produit,on_delete=models.CASCADE)
    quantite = models.DecimalField(max_digits=15,decimal_places=2)
    prix_unitaire = models.DecimalField(max_digits=15,decimal_places=2)
    montant = models.DecimalField(max_digits=15,decimal_places=2, editable=False)

    def save(self, *args, **kwargs):
        self.montant = self.quantite * self.prix_unitaire
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.factures.numero_facture} - {self.produits.nom_produit}"
    
    class Meta:
        db_table='lignefactures'
        

class GenereReference(models.Model):
    annee=models.CharField(max_length=100)
    
    
