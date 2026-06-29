from django.db import models
from django.contrib.auth.models import AbstractUser
from autoslug import AutoSlugField
import secrets
# Create your models here.

class Utilisateur(AbstractUser):
    nom=models.CharField(max_length=100,verbose_name="Nom utilisateur",null=True,blank=True)
    prenoms=models.CharField(max_length=200,verbose_name="Prénom de l'utilisateur",null=True,blank=True)
    username=models.CharField(max_length=200,verbose_name="Identifiant",unique=True)
    telephone=models.CharField(max_length=100,verbose_name="Numéro du telephone",null=True,blank=True,unique=True)
    email=models.EmailField(verbose_name="Adresse email")
    photo=models.ImageField(upload_to='users/',null=True,blank=True)
    
    # ---------------------------------------------------------------------------------
    slug=AutoSlugField(unique=True,editable=False)
    created_at=models.DateField(auto_now_add=True)
    updated_at=models.DateTimeField(auto_now=True,null=True)
    edited_by=models.IntegerField(null=True,blank=True)
    
    def __str__(self):
        return f'{self.username}'
    
    def save(self,*args,**kwargs):
        if not self.slug:
            self.slug=secrets.token_urlsafe(32)
        if self.email=="":
            self.email=None
        if self.telephone=="":
            self.telephone=None
        super().save(*args,**kwargs)   
        
    
    class Meta:
        db_table="utilisateurs" 
    

