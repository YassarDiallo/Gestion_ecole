from django.shortcuts import render
from django.urls import reverse_lazy
from django.contrib.auth.mixins import PermissionRequiredMixin
from utils.fonctions import get_include_template
from .models import Facture,LigneFacture,GenereReference
from .forms import FactureForm,LigneFactureForm
from django.views.generic import CreateView,ListView,DeleteView
from django.shortcuts import get_object_or_404
from django.utils import timezone
from django.contrib import messages
from django.db.models import Sum
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.platypus import Table,TableStyle,SimpleDocTemplate,Spacer,Paragraph,Image
from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_RIGHT
from io import BytesIO
from django.http import HttpResponse, HttpResponseRedirect
from entreprises.models import Entreprise
from utils.fonctions import *
from xml.sax.saxutils import escape
import os
from datetime import date

# Create your views here.


def rapport(request,pk):
    context={}
    facture=Facture.objects.get(id=pk)
    context['facture']=facture
    lignes=LigneFacture.objects.filter(factures=facture)
    context['lignes']=lignes    
    entreprise = Entreprise.objects.first()

    buffer=BytesIO()
    doc=SimpleDocTemplate(
        buffer,
        pagesize=A4,
        leftMargin=45,
        rightMargin=45,
        topMargin=25,
        bottomMargin=35
    )
    styles=getSampleStyleSheet()
    elements=[]

    style_normal = ParagraphStyle(
        'FactureNormal',
        parent=styles['Normal'],
        fontName='Helvetica',
        fontSize=10,
        leading=9.5,
        leftIndent=30
    )
    style_bold = ParagraphStyle(
        'FactureBold',
        parent=style_normal,
        fontName='Helvetica-Bold'
    )
    style_center = ParagraphStyle(
        'FactureCenter',
        parent=style_bold,
        alignment=TA_CENTER,
        fontSize=10.5,
        leading=12
    )
    style_title = ParagraphStyle(
        'FactureTitle',
        parent=style_bold,
        alignment=TA_CENTER,
        fontSize=10,
        leading=12
    )
    style_right = ParagraphStyle(
        'FactureRight',
        parent=style_bold,
        alignment=TA_RIGHT,
        fontSize=8,
        leading=10
    )

    def image_path(image_field, defaut="static/assets/logo/logo_senke.jpg"):
        if image_field and hasattr(image_field, "path") and os.path.exists(image_field.path):
            return image_field.path
        return defaut

    def texte(valeur, defaut=""):
        return valeur if valeur else defaut

    def safe(valeur):
        return escape(str(valeur))

    def formater_nombre(nombre):
        nombre = float(nombre)
        if nombre.is_integer():
            return f"{int(nombre):,}".replace(",", " ")
        return f"{nombre:,.2f}".replace(",", " ").replace(".", ",")

    def formater_montant(montant):
        return f"{float(montant):,.0f}".replace(",", " ")
    
    logo_gauche = Image("static/assets/logo/logo_senke.jpg", width=50, height=58)
    Spacer(1,2)
    logo_droite = Image("static/assets/logo/logo_senke.jpg", width=50, height=58)

    infos = [
        Paragraph("Partenariat des Jeunes pour le Développement Durable (PJDDD-SARLU)", style_center),
        Spacer(1,3),
        Paragraph("Ferme Agropastorale de Famoila", style_title),
        Spacer(1,3),
        Paragraph(
            "Siège social : Ferme d’Etat Famoila, Beyla / Tel : +224 628 53 92 11 / 660 00 65 95",
            style_normal
        ),
        Spacer(1,3),
        Paragraph(
            "E-mail : pjddguinee@gmail.com site : https://pjdd.asso224.com",
            style_normal
        ),
    ]
    Spacer(1,3)
            
    entete = Table([[logo_gauche, infos, logo_droite]], colWidths=[60, 400, 60])
    
    entete.setStyle(TableStyle([
        ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
        ('ALIGN', (0, 0), (0, 0), 'LEFT'),
        ('ALIGN', (1, 0), (1, 0), 'CENTER'),
        ('ALIGN', (2, 0), (2, 0), 'RIGHT'),
        ('LEFTPADDING', (0, 0), (-1, -1), 0),
        ('RIGHTPADDING', (0, 0), (-1, -1), 0),
        ('TOPPADDING', (0, 0), (-1, -1), 0),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 0),
    ]))
    
    elements.append(entete)
    elements.append(Spacer(1,5))
    elements.append(Table([[""]], colWidths=[600], rowHeights=[15], style=[
        ('BACKGROUND', (0, 0), (-1, -1), colors.HexColor("#4f8f2f")),
        ('LINEBELOW', (0, 0), (-1, -1), 1, colors.HexColor("#263f20")),
        ('GRID',(0,0),(-1,-1),1,colors.white),
    ]))
    elements.append(Spacer(1,38))

    client = facture.clients
    client_box = Table(
        [[
            Paragraph("<u>Coordonnees du Client</u>", ParagraphStyle('ClientTitre', parent=style_bold, fontSize=14, leading=16)),
        ], [
            Paragraph(f"<b>Nom du client :</b> {safe(client.nom)}", style_normal),
        ], [
            Paragraph(f"<b>Contact :</b> {safe(client.telephone)}", style_normal),
        ]],
        colWidths=[245]
    )
    client_box.setStyle(TableStyle([
        ('BOX', (0, 0), (-1, -1), 1, colors.HexColor("#20395f")),
        ('ROUNDEDCORNERS', [10, 10, 10, 10]),
        ('LEFTPADDING', (0, 0), (-1, -1), 10),
        ('RIGHTPADDING', (0, 0), (-1, -1), 10),
        ('TOPPADDING', (0, 0), (-1, -1), 4),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 5),
    ]))

    infos_facture = [
        Paragraph(f"DATE FACTURE : {facture.date_facture.strftime('%d/%m/%Y')}", style_right),
        Paragraph(f"FACTURE N° : {facture.numero_facture}", style_right),
    ]
    elements.append(Table([[client_box, infos_facture]], colWidths=[275,245], style=[
        ('VALIGN', (0, 0), (-1, -1), 'TOP'),
        ('ALIGN', (1, 0), (1, 0), 'RIGHT'),
    ]))
    elements.append(Spacer(1,65))

    elements.append(Paragraph(f"FACTURE&nbsp;&nbsp;&nbsp;&nbsp;{safe(client.nom)}", style_title))
    elements.append(Spacer(1,10))

    data=[['QUANTITE','DESCRIPTION','UNITE','PRIX UNITAIRE','MONTANT']]
    total=0
    
    for l in lignes:
        montant=l.quantite * l.prix_unitaire
        total +=montant
        unite = texte(l.produits.unite, "")
        description = texte(l.produits.description, l.produits.nom_produit)

        data.append([
                    f"{formater_nombre(l.quantite)} {unite}".strip(),
                    description,
                    unite,
                    f"{formater_montant(l.prix_unitaire)} GNF",
                    formater_montant(montant)
                    ])
    
    total_formate = formater_montant(total)
    data.append(['MONTANT TOTAL EN GNF','','','',f'{total_formate} GNF'])
    
    table=Table(data=data,colWidths=[85,150,65,115,105])
    
    table.setStyle(
        TableStyle([
        ('GRID',(0,0),(-1,-2),0.75,colors.black),
        ('BACKGROUND',(0,0),(-1,0),colors.HexColor("#2f435f")),
        ('TEXTCOLOR',(0,0),(-1,0),colors.white),
        ('FONTNAME',(0,0),(-1,0),'Helvetica-Bold'),
        ('FONTNAME',(0,1),(-1,-1),'Helvetica-Bold'),
        ('FONTSIZE',(0,0),(-1,-1),8),
        ('ALIGN',(0,0),(-1,-1),'CENTER'),
        ('ALIGN',(1,1),(1,-2),'LEFT'),
        ('SPAN',(0,-1),(3,-1)),
        ('BACKGROUND',(0,-1),(-1,-1),colors.HexColor("#ffc000")),
        ('TEXTCOLOR',(0,0),(-1,-1),colors.black),
        ('TEXTCOLOR',(0,0),(-1,0),colors.white),
        ('GRID',(0,-1),(-1,-1),0.75,colors.black),
        ('LEFTPADDING',(0,0),(-1,-1),4),
        ('RIGHTPADDING',(0,0),(-1,-1),4),
        ('TOPPADDING',(0,0),(-1,-1),4),
        ('BOTTOMPADDING',(0,0),(-1,-1),4),
    ]))
    
    elements.append(table)
    elements.append(Spacer(1,3))
    elements.append(Paragraph(
        f"Arretee la presente facture a la somme de : <b>{montant_en_lettres(total).capitalize()}</b>",
        style_normal
    ))
    if facture.note:
        elements.append(Spacer(1,12))
        elements.append(Paragraph(f"<b><u>N.B</u> :</b> {safe(facture.note)}", style_normal))

    elements.append(Spacer(1,18))
    elements.append(Table(
        [[Paragraph("<b><u>Mode de paiement</u></b>", style_normal)],
         [Paragraph(f"Par {safe(facture.get_mode_paiement_display() if facture.mode_paiement else 'virement')} (Ecobank, PJDD-SARLU : 7328009014) cheque, OM, especes.", style_normal)]],
        colWidths=[470],
        style=[
            ('LINEABOVE', (0, 0), (-1, 0), 0.5, colors.grey),
            ('LINEBELOW', (0, -1), (-1, -1), 0.5, colors.grey),
            ('TOPPADDING', (0, 0), (-1, -1), 2),
            ('BOTTOMPADDING', (0, 0), (-1, -1), 2),
        ]
    ))

    signature_path = image_path(entreprise.signature if entreprise else None, "")
    cachet_path = image_path(entreprise.cachet if entreprise else None, "")
    signature_elements = []
    if cachet_path and os.path.exists(cachet_path):
        signature_elements.append(Image(cachet_path, width=170, height=70))
    if signature_path and os.path.exists(signature_path):
        signature_elements.append(Image(signature_path, width=170, height=70))
    if signature_elements:
        elements.append(Spacer(1,40))
        elements.append(Table([[signature_elements]], colWidths=[520], style=[
            ('ALIGN', (0, 0), (-1, -1), 'RIGHT'),
        ]))

    doc.build(elements)
    pdf=buffer.getvalue()
    buffer.close()
    
    response=HttpResponse(pdf,content_type='application/pdf')
    response['Content-Disposition']=f'inline;filename="facture_{facture.numero_facture}.pdf"'
    return response
       
            
def add_lignefacture(request):
    context={}
    if request.method=='POST':
        form=LigneFactureForm(request.POST)
        if form.is_valid():
            m=form.save()
            details=LigneFacture.objects.filter(factures_id=m.factures_id)
            context['details']=details
            context['montant_total']=details.aggregate(Sum('montant'))['montant__sum'] or 0
            return render(request,'factures/partials/liste.html',context)
        else:
            context['form']=form
    else:
        context['form']=LigneFactureForm()
    return render(request,'factures/create.html',context)


def delete_lignefacture(request,pk):
    context={}
    obj=get_object_or_404(LigneFacture,id=pk)
    factures_id=obj.factures_id
    obj.delete()
    details=LigneFacture.objects.filter(factures_id=obj.factures_id)
    context['details']=details
    return render(request,'factures/partials/liste.html',context)

class Create(PermissionRequiredMixin,CreateView):
    model=Facture
    form_class=FactureForm
    template_name="factures/create.html"
    success_url=reverse_lazy('factures_index')
    permission_required="factures.add_facture"
    
    def form_valid(self,form):
        form.instance.author=self.request.user
        form.instance.created_at=timezone.now()
        m=form.save()
        GenereReference.objects.filter(annee=date.today().year)
        messages.success(self.request,"Ajout effectué avec succès !")
        return HttpResponseRedirect(f"/factures/create/?slug={m.slug}")
    
    
    def get_context_data(self,**kwargs):
        context=super().get_context_data(**kwargs)
        slug=self.request.GET.get('slug')
        context['slug']=slug
        fact=Facture.objects.filter(slug=slug).first()
        if fact:
            factform=LigneFactureForm(initial={'factures':fact.id})
            context['factform']=factform
            context['form']=FactureForm(initial={
                'numero_facture':fact.numero_facture,
                'clients':fact.clients,
                'date_facture':fact.date_facture,
                'mode_paiement':fact.mode_paiement,
                'note':fact.note
            })
        details=LigneFacture.objects.filter(factures__slug=slug)
        context['details']=details
        context['montant_total']=details.aggregate(Sum('montant'))['montant__sum'] or 0
        return context
  
    
    def get_initial(self):
        initial=super().get_initial()
        annee=date.today().year
        nb_ligne=GenereReference.objects.filter(annee=annee).count()
        numero_facture=reference_doc(annee,nb_ligne,accronyme='CMD')
        initial['numero_facture']=numero_facture
        return initial
    

class Index(PermissionRequiredMixin,ListView):
    model=Facture
    template_name="factures/index.html"
    context_object_name="factures"
    permission_required="factures.view_facture"

    def get_context_data(self, **kwargs):
        context=super().get_context_data(**kwargs)
        context["template_include"] = get_include_template("parametrage")
        return context
        

class Delete(PermissionRequiredMixin,DeleteView):
    model=Facture
    template_name="factures/delete.html"
    success_url=reverse_lazy('factures_index')
    permission_required="factures.delete_facture"

    def post(self,request,*args,**kwargs):
        messages.success(self.request,"Suppression éffectuée avec succès !")
        return self.delete(request,*args,**kwargs)
