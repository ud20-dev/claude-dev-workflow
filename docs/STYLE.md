# STYLE
> Design system complet du projet.
> Lire obligatoirement avant toute création ou modification d'interface.
> Appliquer exactement ces valeurs — aucune interprétation personnelle.
> Ne jamais utiliser une couleur, font ou valeur absente de ce fichier.
> Format d'ajout : "Mets à jour STYLE.md — [élément] [valeur]"

---

## Couleurs

| Nom | Valeur | Usage |
|-----|--------|-------|
| | | |

---

## Typography

| Élément | Valeur |
|---------|--------|
| | |

---

## Espacements

| Nom | Valeur | Usage |
|-----|--------|-------|
| xs | 4px | Espacement minimal |
| sm | 8px | Entre éléments proches |
| md | 16px | Espacement standard |
| lg | 24px | Entre composants |
| xl | 48px | Entre sections |

---

## Composants UI

| Élément | Valeur |
|---------|--------|
| Radius bouton standard | |
| Radius carte | |
| Radius input | |
| Height input | |
| Bordure input | |

---

## Boutons

| Type | Style |
|------|-------|
| Primaire | |
| Ghost | |
| Désactivé | `opacity-40 cursor-not-allowed` |

---

## Breakpoints

| Nom | Valeur |
|-----|--------|
| Mobile | 375px |
| Tablet | 768px |
| Desktop | 1024px |
| Large | 1280px |

---

## Layout pages plein écran (login, token, etc.)

- **Conteneur** : `h-dvh` ou `position: fixed; inset: 0` pour bloquer tout scroll
- **Centrage** : `flex flex-col items-center justify-center`
- **⚠️ Ne jamais utiliser `min-h-screen`** sur ces pages — `100vh` > viewport visible sur mobile → scroll indésirable

---

## Mode sombre

- Activé : non / oui

---

## Règle CSS — No Camouflage

> Ne jamais empiler du CSS pour masquer un conflit. Choisir : soit DaisyUI gère tout, soit Tailwind pur.

| ❌ Interdit | ✅ Correct |
|---|---|
| Classes DaisyUI + overrides Tailwind | Choisir l'un ou l'autre |
| `<div onClick={fn}>` | `<button type="button" onClick={fn}>` |
| `<span onClick={fn}>` | `<button type="button" onClick={fn}>` |
| Sélecteur CSS multi-ligne avec `:not()` | Sélecteur complet sur une seule ligne |

---

## Fix obligatoire — Inputs transparents sur mobile (Next.js + DaisyUI v5)

> **Cause** : DaisyUI v5 utilise `oklch()`. Certains navigateurs Android ne supportent pas oklch → fond transparent, texte invisible.

**Triple protection dans `globals.css` (ne jamais supprimer ni modifier) :**

```css
/* 1. Règle hors @layer — priorité absolue. SÉLECTEUR SUR UNE SEULE LIGNE. */
input:not([type="checkbox"]):not([type="radio"]):not([type="range"]):not([type="color"]):not([type="file"]):not([type="button"]):not([type="submit"]):not([type="reset"]),
select,
textarea {
  background-color: #ffffff !important;
  color: #111111 !important;
  -webkit-text-fill-color: #111111 !important;
}

/* 2. Fix autofill Android Chrome — box-shadow inset 1000px */
input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
input:-webkit-autofill:active {
  -webkit-box-shadow: 0 0 0 1000px #ffffff inset !important;
  box-shadow: 0 0 0 1000px #ffffff inset !important;
  -webkit-text-fill-color: #111111 !important;
  color: #111111 !important;
}

/* 3. Fallbacks hex après @plugin daisyui/theme */
:root {
  --color-base-100: #ffffff;
  --color-base-content: #111111;
}
```

> **⚠️ CRITIQUE** : ne jamais couper le sélecteur `:not()` avec un retour à la ligne — un newline dans un sélecteur CSS crée un combinateur descendant et la règle ne s'applique à rien.

> Tout `<input>`, `<select>`, `<textarea>` ajouté doit aussi avoir `bg-white` en className Tailwind.

---

## Règles mobile — Touch targets

| Élément | Taille minimale |
|---------|----------------|
| Input / Select | height ≈ 44px — `py-2.5 text-sm` |
| Bouton action (icône) | 36×36px (`w-9 h-9`) |
| Bouton primaire | `py-2.5` minimum |
| Bouton icône seule | `p-2` (zone tap ≈ 40px) |

---

## Convention par zone

| Route | Convention |
|-------|-----------|
| | |
