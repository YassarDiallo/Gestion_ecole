from django.db import models
from utils.BaseClasse  import ClasseBasique
from eleves.models import Eleve
from parents.models import Parent
# Create your models here.

class ParentEleve(ClasseBasique):
    eleves=models.ForeignKey(Eleve,on_delete=models.SET_NULL,null=True)
    parents=models.ForeignKey(Parent,on_delete=models.SET_NULL,null=True)
    liens_parente=models.CharField(max_length=150,verbose_name="Liens de parenté")
    
    def __str__(self):
        return f"{self.eleves} {self.parents}"
    
    class Meta:
        db_table="parent_eleves"
