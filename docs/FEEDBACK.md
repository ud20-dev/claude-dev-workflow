# FEEDBACK
> Réflexes IA à corriger — patterns de comportement observés et corrigés.
> Différent de ERRORS.md : pas un bug ponctuel dans le code, un réflexe à éviter chez l'IA elle-même.
> Lire avant toute tâche où un réflexe connu risque de se reproduire.
> Ne jamais supprimer une entrée existante.
> Format d'ajout : "Ajoute dans FEEDBACK.md — [pattern]"

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
