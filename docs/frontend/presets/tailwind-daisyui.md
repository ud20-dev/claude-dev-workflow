# Preset — Tailwind + DaisyUI v5
> Installé quand le projet utilise Tailwind + DaisyUI (typiquement avec Next.js) — copier ce fichier tel quel vers `frontend/preset-actif.md`.
> Même structure que les autres presets du catalogue (`frontend/presets/`) — seul le contenu change selon la stack.

---

## Boutons > Désactivé
```
opacity-40 cursor-not-allowed
```

---

## Règles mobile — Touch targets

> Classes Tailwind.

| Élément | Taille minimale | Classes |
|---------|----------------|---------|
| Input / Select | height ≈ 44px | `py-2.5 text-sm` |
| Bouton action (icône) | 36×36px | `w-9 h-9` |
| Bouton primaire | ≥ 44px | `py-2.5` minimum |
| Bouton icône seule | zone tap ≈ 40px | `p-2` |

---

## Règle CSS — No Camouflage

> Spécifique DaisyUI : ne jamais empiler du CSS pour masquer un conflit. Choisir : soit DaisyUI gère tout, soit Tailwind pur — jamais les deux en conflit sur le même élément.

| ❌ Interdit | ✅ Correct |
|---|---|
| Classes DaisyUI + overrides Tailwind en conflit | Choisir l'un ou l'autre |
| `input input-bordered rounded-xl focus:outline-none` | `border border-gray-200 rounded-lg px-3 py-2 focus:outline-none` |
| `btn btn-neutral` qui se comporte mal | `bg-neutral text-neutral-content py-2 rounded-md` |
| `<div onClick={fn}>` | `<button type="button" onClick={fn}>` |
| Sélecteur CSS multi-ligne avec `:not()` | Sélecteur complet sur une seule ligne |

---

## Fix inputs transparents / placeholder

> **Obligatoire pour cette stack.** Cause : DaisyUI v5 utilise `oklch()`. Certains navigateurs Android ne supportent pas oklch → fond transparent, texte invisible.
> Bug documenté dans `frontend/ERRORS.md` ("Inputs / Selects transparents sur mobile (DaisyUI v5)", "Placeholder indiscernable d'une vraie valeur").

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

/* 1bis. Le placeholder hérite du color ci-dessus sans cette règle — il devient indiscernable d'une vraie valeur tapée. SÉLECTEUR SUR UNE SEULE LIGNE. */
input:not([type="checkbox"]):not([type="radio"]):not([type="range"]):not([type="color"]):not([type="file"]):not([type="button"]):not([type="submit"]):not([type="reset"])::placeholder,
select::placeholder,
textarea::placeholder {
  color: #9ca3af !important;
  -webkit-text-fill-color: #9ca3af !important;
  opacity: 1 !important;
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
