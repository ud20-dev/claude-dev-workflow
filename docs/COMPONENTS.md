# COMPONENTS
> Liste de tous les composants réutilisables du projet.
> Lire avant de créer un nouveau composant.
> Vérifier qu'un composant similaire n'existe pas déjà avant d'en créer un.
> Un composant créé ici = utilisable sur toutes les pages.
> Format d'ajout : "Mets à jour COMPONENTS.md — composant [nom]"

---

## Template
> Copier ce template pour chaque nouveau composant.

```
### [NomComposant]
- Props : [nom: type, nom: type]
- Fichier : src/components/[NomComposant].tsx
- Utilisé dans : [page1, page2]
- Notes : [comportement particulier à connaître]
```

---

## Composants de base

### Button
- Props : label: string, type: primary | secondary | danger, onClick: function, disabled?: boolean, loading?: boolean
- Fichier : src/components/Button.tsx
- Utilisé dans : toutes les pages
- Notes : afficher un spinner si loading=true, désactiver le clic si disabled=true

### Input
- Props : label: string, type: text | email | password, placeholder?: string, value: string, onChange: function, error?: string
- Fichier : src/components/Input.tsx
- Utilisé dans : Login, Register, Profil
- Notes : afficher le message d'erreur en rouge sous le champ si error est défini

### Card
- Props : title?: string, children: ReactNode, padding?: sm | md | lg
- Fichier : src/components/Card.tsx
- Utilisé dans : Dashboard, Profil
- Notes : padding md par défaut

---

## Composants de layout

### Header
- Props : user: object, onLogout: function
- Fichier : src/components/layout/Header.tsx
- Utilisé dans : toutes les pages connectées
- Notes : afficher le nom et avatar de l'utilisateur connecté

### Sidebar
- Props : liens: array, actif: string
- Fichier : src/components/layout/Sidebar.tsx
- Utilisé dans : toutes les pages connectées
- Notes : mettre en surbrillance le lien actif

---

## Composants de feedback

### Toast
- Props : message: string, type: success | error | info, duration?: number
- Fichier : src/components/Toast.tsx
- Utilisé dans : toutes les pages
- Notes : disparaît automatiquement après duration ms (défaut: 3000)

### Loader
- Props : size?: sm | md | lg, fullscreen?: boolean
- Fichier : src/components/Loader.tsx
- Utilisé dans : toutes les pages
- Notes : si fullscreen=true, centrer sur toute la page
