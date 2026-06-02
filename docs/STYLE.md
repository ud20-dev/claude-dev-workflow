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
| Primary | [ex: #0078d4] | Boutons principaux, liens, accents |
| Background | [ex: #fafafa] | Fond général des pages |
| Surface | [ex: #ffffff] | Fond des cartes et panneaux |
| Text principal | [ex: #111111] | Titres et textes importants |
| Text secondaire | [ex: #666666] | Sous-titres, descriptions |
| Bordure | [ex: #e4e4e4] | Bordures des inputs, cartes |
| Erreur | [ex: #ef4444] | Messages d'erreur |
| Succès | [ex: #22c55e] | Confirmations |

---

## Typography

| Élément | Valeur |
|---------|--------|
| Font titre | [ex: Syne / Inter / sans-serif] |
| Font corps | [ex: Inter / system-ui] |
| H1 | [ex: 32px / 700] |
| H2 | [ex: 24px / 600] |
| H3 | [ex: 18px / 500] |
| Corps | [ex: 14px / 400] |
| Small | [ex: 12px / 400] |

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
| Radius bouton | [ex: 8px] |
| Radius carte | [ex: 12px] |
| Radius input | [ex: 8px] |
| Bordure input | [ex: 1px solid #e4e4e4] |

---

## Boutons

| Type | Style |
|------|-------|
| Primaire | [ex: bg-gray-900 text-white rounded-lg] |
| Secondaire | [ex: border border-gray-200 text-gray-600 rounded-lg] |
| Danger | [ex: bg-red-500 text-white rounded-lg] |
| Désactivé | opacity 0.4, cursor not-allowed |

---

## Breakpoints

| Nom | Valeur |
|-----|--------|
| Mobile | 375px |
| Tablet | 768px |
| Desktop | 1280px |

---

## Mode sombre
- Activé : [oui / non]

---

## Règle CSS — No Camouflage
> Ne jamais empiler du CSS pour masquer un conflit. Choisir : soit DaisyUI gère tout, soit Tailwind pur — jamais les deux en conflit.
> Règle complète dans : feedback_no_css_camouflage.md

| ❌ Interdit | ✅ Correct |
|---|---|
| `input input-bordered rounded-xl focus:outline-none` | `border border-gray-200 rounded-lg px-3 py-2 focus:outline-none` |
| `btn btn-neutral` + overrides manuels | classes Tailwind directes |
| `<div onClick={fn}>` | `<button type="button" onClick={fn}>` |
| `<span onClick={fn}>` | `<button type="button" onClick={fn}>` |
| `<div onClick={toggle}>` | `<label>` qui enveloppe la checkbox |

- Toujours utiliser les vrais éléments HTML sémantiques (`<button>`, `<label>`, `<a>`)
- Ne jamais surcharger les propriétés que DaisyUI gère déjà

---

## Convention par zone

| Zone | Convention |
|------|-----------|
| Pages publiques | [ex: Tailwind pur] |
| Pages admin | [ex: DaisyUI / Tailwind pur] |
| Composants partagés | [ex: Tailwind pur] |
