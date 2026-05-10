# PAGES
> Description de chaque page du projet.
> Lire uniquement la section de la page concernée — pas tout le fichier.
> Appliquer STYLE.md sur chaque page sans exception.
> Ne jamais créer des éléments absents de la section concernée.
> Format d'ajout : "Mets à jour PAGES.md — page [nom]"

---

## Template
> Copier ce template pour chaque nouvelle page.

```
### [Nom de la page]
- Route : /[route]
- Accès : [public / connecté uniquement / admin uniquement]
- Layout : [avec sidebar / sans sidebar / pleine page]
- Composants : [liste des composants utilisés]
- Données affichées : [quelles données viennent de la base]
- Actions utilisateur : [ce que l'utilisateur peut faire]
- Redirect après action : [où ça redirige après]
- Statut : [ ] À faire
```

---

## Pages d'authentification

### Login
- Route : /login
- Accès : public uniquement (redirect si déjà connecté)
- Layout : pleine page centrée
- Composants : Input(email), Input(password), Button(primaire), Lien(register), Lien(forgot-password)
- Données affichées : aucune
- Actions utilisateur : soumettre formulaire
- Redirect après action : /dashboard
- Statut : [ ] À faire

### Register
- Route : /register
- Accès : public uniquement (redirect si déjà connecté)
- Layout : pleine page centrée
- Composants : Input(nom), Input(email), Input(password), Button(primaire), Lien(login)
- Données affichées : aucune
- Actions utilisateur : créer un compte
- Redirect après action : /login ou /dashboard selon config
- Statut : [ ] À faire

---

## Pages principales

### Dashboard
- Route : /dashboard
- Accès : connecté uniquement
- Layout : avec sidebar
- Composants : Header, Sidebar, [à compléter]
- Données affichées : [à compléter]
- Actions utilisateur : [à compléter]
- Redirect après action : [à compléter]
- Statut : [ ] À faire

---

## Pages secondaires

### Profil
- Route : /profil
- Accès : connecté uniquement
- Layout : avec sidebar
- Composants : [à compléter]
- Données affichées : données de l'utilisateur connecté
- Actions utilisateur : modifier ses informations
- Redirect après action : rester sur la page avec message de succès
- Statut : [ ] À faire

### Paramètres
- Route : /parametres
- Accès : connecté uniquement
- Layout : avec sidebar
- Composants : [à compléter]
- Données affichées : préférences utilisateur
- Actions utilisateur : modifier les préférences
- Redirect après action : rester sur la page
- Statut : [ ] À faire
