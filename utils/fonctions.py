from datetime import datetime,time
import http
from django.http import HttpResponse
import requests
import tablib
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib.utils import ImageReader
from reportlab.lib import colors
import ssl
import json
import http.client


def send_whatsapp_message(message, phone):
    context = ssl._create_unverified_context()
    conn = http.client.HTTPSConnection("api.nimbasms.com", context=context)
    
    token = "spYfRtNf656qlksxEUm2LmknLjBuKxrulAAf8MQ_jlyqGSp3elMr9iqIUD1d9C-lFTdUglYgArR9gPYOb3fM11jwiXkX1lZKES-gkqDTOMw"
    payload = {
        "to": phone,
        "message": message
    }

    headers = {
        "authorization": f"Basic {token}",
        "content-type": "application/json"
    }

    conn.request("POST", "/v1/whatsapp/messages", json.dumps(payload), headers)
    res = conn.getresponse()
    print(res.read().decode())


def format_montant_espace(valeur):
    return f"{valeur:,}".replace(",", " ")


def nombre_en_lettres(nombre):
    unites = [
        "zero", "un", "deux", "trois", "quatre", "cinq", "six", "sept",
        "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze",
        "quinze", "seize",
    ]
    dizaines = {
        20: "vingt",
        30: "trente",
        40: "quarante",
        50: "cinquante",
        60: "soixante",
    }

    nombre = int(nombre)

    if nombre < 17:
        return unites[nombre]
    if nombre < 20:
        return "dix-" + unites[nombre - 10]
    if nombre < 70:
        dizaine = nombre // 10 * 10
        reste = nombre % 10
        if reste == 0:
            return dizaines[dizaine]
        liaison = "-et-" if reste == 1 else "-"
        return dizaines[dizaine] + liaison + unites[reste]
    if nombre < 80:
        return "soixante-" + nombre_en_lettres(nombre - 60)
    if nombre < 100:
        reste = nombre - 80
        if reste == 0:
            return "quatre-vingts"
        return "quatre-vingt-" + nombre_en_lettres(reste)
    if nombre < 1000:
        centaine = nombre // 100
        reste = nombre % 100
        prefixe = "cent" if centaine == 1 else unites[centaine] + " cent"
        if reste == 0:
            return prefixe + ("s" if centaine > 1 else "")
        return prefixe + " " + nombre_en_lettres(reste)

    groupes = [
        (1_000_000_000_000, "billion"),
        (1_000_000_000, "milliard"),
        (1_000_000, "million"),
        (1_000, "mille"),
    ]
    for valeur, libelle in groupes:
        if nombre >= valeur:
            quotient = nombre // valeur
            reste = nombre % valeur
            if valeur == 1_000 and quotient == 1:
                prefixe = "mille"
            else:
                quotient_texte = nombre_en_lettres(quotient)
                if valeur == 1_000:
                    quotient_texte = quotient_texte.removesuffix("s")
                prefixe = quotient_texte + " " + libelle
                if quotient > 1 and libelle != "mille":
                    prefixe += "s"
            if reste == 0:
                return prefixe
            return prefixe + " " + nombre_en_lettres(reste)


def montant_en_lettres(montant):
    montant = round(montant, 2)
    partie_entiere = int(montant)
    centimes = int(round((montant - partie_entiere) * 100))

    texte = nombre_en_lettres(partie_entiere)
    if partie_entiere == 1:
        devise = "franc guineen"
    elif partie_entiere >= 1_000_000 and partie_entiere % 1_000_000 == 0:
        devise = "de francs guineens"
    else:
        devise = "francs guineens"

    if centimes:
        centime_texte = nombre_en_lettres(centimes)
        centime_libelle = "centime" if centimes == 1 else "centimes"
        return f"{texte} {devise} et {centime_texte} {centime_libelle}"

    return f"{texte} {devise}"


def draw_header(p, width, height):
    logo_gauche_path = "static/assets/logo/logo_senke.jpg"
    logo_droite_path = "static/assets/logo/logo_senke.jpg"
    img_width, img_height = 70, 70
    p.drawImage(logo_gauche_path, 50, height - 100, width=img_width, height=img_height, preserveAspectRatio=True)
    p.drawImage(logo_droite_path, width - 120, height - 100, width=img_width, height=img_height, preserveAspectRatio=True)
    p.setFont("Helvetica-Bold", 16)
    p.setFillColor(colors.black)
    p.drawCentredString(width / 2, height - 60, "REPUBLIQUE DE GUINEE")
    y_text = height - 80
    p.setFont("Helvetica", 12)
    p.setFillColor(colors.red)
    p.drawCentredString(width / 2 - 50, y_text, "Travail-")
    p.setFillColor(colors.yellow)
    p.drawCentredString(width / 2, y_text, "Justice-")
    p.setFillColor(colors.green)
    p.drawCentredString(width / 2 + 50, y_text, "Solidarité")
    p.setStrokeColor(colors.black)
    p.setLineWidth(1)
    p.line(50, height - 110, width - 50, height - 110)
    p.setFillColor(colors.black)


def draw_footer(p, width, bottom_margin):
    p.setStrokeColor(colors.black)
    p.setLineWidth(1)
    p.line(50, bottom_margin + 20, width - 50, bottom_margin + 20)
    p.setFont("Helvetica-Oblique", 10)
    p.setFillColor(colors.black)
    p.drawString(50, bottom_margin, "Email: contact@example.com")
    p.drawString(250, bottom_margin, "RCCM: RCCM123456")
    p.drawString(450, bottom_margin, f"Date: {datetime.now().strftime('%d/%m/%Y')}")


def check_invalid_fields(form):
    invalid_fields=[field for field in form if form.errors]
    invalid_fields_name=[field.name for field in invalid_fields]
    print('champs invalid :',invalid_fields_name)
    
    
def reference_doc(annee,nb_ligne,accronyme=''):
    reference=f"{accronyme}-{annee}-{str(nb_ligne+1).zfill(3)}"
    return reference

def get_include_template(page):
    template_include=f"include_gestion/{page}.html"
    return template_include


def send_message(message,phonenumber):
    pass
    context = ssl.create_default_context()
    context.check_hostname = False
    context.verify_mode = ssl.CERT_NONE
    conn = http.client.HTTPSConnection("api.nimbasms.com",context=context)
    token="spYfRtNf656qlksxEUm2LmknLjBuKxrulAAf8MQ_jlyqGSp3elMr9iqIUD1d9C-lFTdUglYgArR9gPYOb3fM11jwiXkX1lZKES-gkqDTOMw"
    sender="YASSAR"
    headers = {
        "authorization": f"Basic {token}",
        "content-type": "application/json"
    }
    payload = {
        "to": [phonenumber],
        "sender_name": sender,
        "message": message
    }
    conn.request("POST", "/v1/messages", body=json.dumps(payload), headers=headers)
    res = conn.getresponse()
    data = res.read()
    # print("Status:", res.status)
    # print("Reason:", res.reason)
    # print(f"Data decode est {data.decode("utf-8")}")


def remove_timezone(value):
    """Supprime le fuseau horaire des objets datetime/time pour compatibilité Excel."""
    if isinstance(value, (datetime, time)) and value.tzinfo is not None:
        return value.replace(tzinfo=None)
    return value


def export_to_excel(data, fields=None, filename="export.xlsx"):
    if not data:
        return HttpResponse("Aucune donnée à exporter", content_type="text/plain")
    
    if isinstance(data, list) or isinstance(data, dict):
        if isinstance(data, dict):
            data = list(data.values()) 

        if fields is None:  
            fields = list(data[0].keys()) if data else [] 

        dataset = tablib.Dataset(headers=fields)
        for item in data:
            row = [remove_timezone(item.get(field, "")) for field in fields]
            dataset.append(row)

    elif hasattr(data, "model"):
        if not data.exists():
            return HttpResponse("Aucune donnée à exporter", content_type="text/plain")

        if fields is None:
            fields = [field.name for field in data.model._meta.fields]
        dataset = tablib.Dataset(headers=fields)
        for obj in data:
            row = [remove_timezone(getattr(obj, field, "")) for field in fields]
            dataset.append(row)
    else:
        return HttpResponse("Format de données non supporté", content_type="text/plain")
    response = HttpResponse(
        dataset.export("xlsx"),
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    )
    response["Content-Disposition"] = f"attachment; filename={filename}"
    return response


def export_to_excel_multi(datasets_dict, filename="export.xlsx"):
    """
    datasets_dict = {
        "NomFeuille1": {"data": list_de_dict1, "fields": fields1},
        "NomFeuille2": {"data": list_de_dict2, "fields": fields2},
    }
    """
    wb = tablib.Databook()

    for sheet_name, content in datasets_dict.items():
        data = content.get("data", [])
        fields = content.get("fields", [])

        dataset = tablib.Dataset(headers=fields)
        for item in data:
            row = [remove_timezone(item.get(f, "")) for f in fields]
            dataset.append(row)

        dataset.title = sheet_name
        wb.add_sheet(dataset)

    response = HttpResponse(
        wb.export("xlsx"),
        content_type="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    )
    response["Content-Disposition"] = f'attachment; filename="{filename}"'
    return response
