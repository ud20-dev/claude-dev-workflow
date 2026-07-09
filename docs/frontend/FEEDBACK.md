# FEEDBACK — FRONTEND
> Réflexes IA à corriger côté interface — patterns de comportement observés et corrigés.
> Différent de ERRORS.md (même dossier) : pas un bug ponctuel dans le code, un réflexe à éviter chez l'IA elle-même.
> Lire avant toute tâche frontend où un réflexe connu risque de se reproduire.
> Ne jamais supprimer une entrée existante.
> Format d'ajout : "Ajoute dans frontend/FEEDBACK.md — [pattern]"

---

## Template
> Copier ce template pour chaque nouveau réflexe identifié.

```
### [Nom court du pattern]
- Date : JJ/MM/AAAA
- Contexte : [ce qui a été demandé]
- Réflexe observé : [ce que l'IA a fait au lieu de la bonne approche]
- Pourquoi c'est un problème : [conséquence concrète]
- Correction attendue : [ce qu'il faut faire à la place]
```

---

## Patterns identifiés

### Camouflage CSS au lieu de corriger la cause
- Date : —
- Contexte : correction d'un élément d'interface cassé visuellement (ex. bordure double, cercle, bouton qui ne se comporte pas comme prévu)
- Réflexe observé : au lieu de retirer la classe DaisyUI ou l'élément non-sémantique responsable, l'IA empile du CSS par-dessus pour masquer le symptôme (`rounded-xl`, `focus:outline-none`, overrides en cascade sur une classe qui gère déjà cette propriété)
- Pourquoi c'est un problème : le conflit sous-jacent reste présent et ressurgit à la prochaine modification ; le code accumule des overrides inutiles ; l'élément a l'air correct mais ne se comporte pas comme un vrai élément HTML (ex. `<div onClick>` au lieu de `<button>`)
- Correction attendue : voir la règle "No Camouflage" dans STYLE.md — choisir DaisyUI ou Tailwind pur, jamais les deux en conflit ; toujours utiliser l'élément HTML sémantique réel (`<button>`, `<label>`, `<a>`)

### Fix CSS large validé sans revérifier les états voisins
- Date : 08/07/2026
- Contexte : application d'un correctif CSS avec `!important` sur un sélecteur large pour régler un bug visuel précis (ex. fond transparent sur mobile causé par oklch — voir ERRORS.md)
- Réflexe observé : le correctif est considéré terminé dès que le bug ciblé disparaît, sans revérifier visuellement les états et pseudo-éléments voisins qui héritent de la même propriété (`::placeholder`, `:disabled`, `::selection`, `:focus-visible`, `:hover`) — le nouveau bug introduit reste invisible parce que personne ne regarde le rendu après coup
- Pourquoi c'est un problème : un override `!important` a toujours un rayon d'effet plus large que le bug visé. Sans vérification visuelle après le fix, un nouveau défaut remplace l'ancien sans être détecté — observé concrètement quand le fix oklch de STYLE.md a rendu le `::placeholder` indiscernable d'une vraie saisie. C'est le pattern qui revient le plus souvent, tous projets confondus
- Correction attendue : après tout override CSS `!important` ou tout sélecteur large, lister les pseudo-classes/pseudo-éléments qui héritent de la propriété modifiée et les vérifier un par un dans le navigateur (ou capture d'écran) avant de considérer le fix terminé — ne jamais valider un correctif CSS seulement parce que le symptôme initial a disparu
