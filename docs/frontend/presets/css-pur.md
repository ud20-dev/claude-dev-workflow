# Preset — CSS pur (sans framework)
> Installé quand le projet n'utilise ni Tailwind ni DaisyUI (HTML/CSS statique) — copier ce fichier tel quel vers `frontend/preset-actif.md`.
> Même structure que les autres presets du catalogue (`frontend/presets/`) — seul le contenu change selon la stack.
> Validé sur un projet de test réel (page de connexion) — voir historique du repo pour l'exemple.

---

## Boutons > Désactivé
```css
opacity: 0.4;
cursor: not-allowed;
```

---

## Règles mobile — Touch targets

> CSS pur.

| Élément | Taille minimale | CSS |
|---------|----------------|-----|
| Input / Select | height ≈ 44px | `height: 44px;` |
| Bouton action (icône) | 36×36px | `width: 36px; height: 36px;` |
| Bouton primaire | ≥ 44px | `height: 44px;` |
| Bouton icône seule | zone tap ≈ 40px | `padding: 8px;` |

---

## Règle CSS — No Camouflage

> Ne jamais empiler des règles CSS conflictuelles pour masquer un bug visuel. Toujours utiliser l'élément HTML sémantique réel.

| ❌ Interdit | ✅ Correct |
|---|---|
| `<div onClick={fn}>` | `<button type="button" onClick={fn}>` |
| `<span onClick={fn}>` | `<button type="button" onClick={fn}>` |
| Sélecteur CSS multi-ligne avec `:not()` | Sélecteur complet sur une seule ligne |

---

## Fix inputs transparents / placeholder

> Pas de bug oklch à corriger sans DaisyUI (voir preset tailwind-daisyui.md pour ce cas précis).
> Reste valable partout : définir `::placeholder` séparément de la couleur de l'input, sinon le placeholder hérite de `color` et devient indiscernable d'une vraie saisie.

```css
input::placeholder {
  color: var(--placeholder, #9ca3af);
  opacity: 1;
}
```
