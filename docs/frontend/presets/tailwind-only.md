# Preset — Tailwind (sans DaisyUI)
> Installé quand le projet utilise Tailwind seul, sans librairie de composants — copier ce fichier tel quel vers `frontend/preset-actif.md`.
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

> Pas de conflit possible avec une librairie de composants (aucune installée) — le risque principal est l'accumulation d'overrides sur une même classe utilitaire au lieu de la corriger à la source.

| ❌ Interdit | ✅ Correct |
|---|---|
| `<div onClick={fn}>` | `<button type="button" onClick={fn}>` |
| `<span onClick={fn}>` | `<button type="button" onClick={fn}>` |
| Sélecteur CSS multi-ligne avec `:not()` | Sélecteur complet sur une seule ligne |

---

## Fix inputs transparents / placeholder

> Aucun bug connu spécifique à ce preset — Tailwind seul n'utilise pas `oklch()` par défaut (contrairement à DaisyUI v5, voir preset `tailwind-daisyui`).
> Règle générale qui reste valable : toujours définir `::placeholder` séparément de la couleur de l'input dans `globals.css`, sinon il hérite de `color` et devient indiscernable d'une vraie saisie.
