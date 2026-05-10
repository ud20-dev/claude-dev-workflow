# STYLE
> Design system complet du projet.
> Lire obligatoirement avant toute création ou modification d'interface.
> Appliquer exactement ces valeurs — aucune interprétation personnelle.
> Ne jamais utiliser une couleur, font ou valeur absente de ce fichier.
> Format d'ajout : "Mets à jour STYLE.md — [élément] [valeur]"

---

## Couleurs
> Remplir avec les valeurs hex du projet.

| Nom | Valeur | Usage |
|-----|--------|-------|
| Primary | [ex: #1a1a2e] | Boutons principaux, liens, accents |
| Secondary | [ex: #7EEFB2] | Accents secondaires, badges |
| Background | [ex: #ffffff] | Fond général des pages |
| Surface | [ex: #f5f5f5] | Fond des cartes et panneaux |
| Text principal | [ex: #111111] | Titres et textes importants |
| Text secondaire | [ex: #666666] | Sous-titres, descriptions |
| Bordure | [ex: #e0e0e0] | Bordures des inputs, cartes |
| Erreur | [ex: #ef4444] | Messages d'erreur, champs invalides |
| Succès | [ex: #22c55e] | Confirmations, validations |

---

## Typography
> Une seule font titre et une seule font corps — pas plus.

| Élément | Valeur |
|---------|--------|
| Font titre | [ex: Syne] |
| Font corps | [ex: Inter] |
| H1 | [ex: 32px / 700] |
| H2 | [ex: 24px / 600] |
| H3 | [ex: 18px / 500] |
| Corps | [ex: 14px / 400] |
| Small | [ex: 12px / 400] |
| Line height | [ex: 1.6] |

---

## Espacements
> Système fixe — ne pas improviser des valeurs différentes.

| Nom | Valeur | Usage |
|-----|--------|-------|
| xs | 4px | Espacement minimal |
| sm | 8px | Entre éléments proches |
| md | 16px | Espacement standard |
| lg | 24px | Entre composants |
| xl | 48px | Entre sections |
| Padding page | [ex: 24px] | Marge intérieure des pages |

---

## Composants UI

| Élément | Valeur |
|---------|--------|
| Radius bouton | [ex: 8px] |
| Radius carte | [ex: 12px] |
| Radius input | [ex: 6px] |
| Height input | [ex: 44px] |
| Border | [ex: 1px solid #e0e0e0] |
| Shadow carte | [ex: 0 1px 3px rgba(0,0,0,0.1)] |

---

## Boutons
> Appliquer exactement ces styles — pas de variantes non définies ici.

| Type | Style |
|------|-------|
| Primaire | bg-primary, texte blanc, radius bouton |
| Secondaire | bg-transparent, bordure primary, texte primary |
| Danger | bg-erreur, texte blanc |
| Désactivé | opacity 0.5, cursor not-allowed |

---

## Breakpoints

| Nom | Valeur |
|-----|--------|
| Mobile | 375px |
| Tablet | 768px |
| Desktop | 1280px |
| Large | 1536px |

---

## Mode sombre
> Supprimer cette section si pas de mode sombre prévu.

- Activé : [oui / non]
- Background dark : [ex: #0f0f0f]
- Surface dark : [ex: #1a1a1a]
- Text dark : [ex: #f5f5f5]
