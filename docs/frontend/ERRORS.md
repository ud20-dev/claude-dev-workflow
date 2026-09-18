# ERRORS — FRONTEND
> Historique de tous les bugs frontend rencontrés et résolus.
> Lire quand un bug apparaît côté interface — vérifier s'il a déjà été résolu.
> Ne jamais supprimer une entrée existante.
> La plus récente en haut — sous les entrées `Date : —` s'il y en a, voir note plus bas.
> Format d'ajout : "Ajoute dans frontend/ERRORS.md — [description du bug]"

---

## Comment utiliser ce fichier
1. Un bug apparaît → dire "Lis frontend/ERRORS.md — j'ai ce bug : [description]"
2. Claude vérifie si le bug existe déjà
3. Si oui → appliquer la solution existante
4. Si non → résoudre puis ajouter dans ce fichier

---

## Template
> Copier ce template pour chaque nouveau bug résolu.

```
### [Titre court du bug]
- Date : JJ/MM/AAAA
- Fichier concerné : [chemin/vers/fichier]
- Symptôme : [ce qui se passe — message d'erreur exact si possible]
- Cause : [pourquoi ça arrive]
- Solution : [ce qu'on a fait pour corriger]
```

---

## Bugs résolus
> Les entrées avec `Date : —` sont des connaissances génériques (vraies sur tout projet utilisant cette stack), pas des incidents d'un projet précis — elles restent groupées en bas. Une nouvelle entrée issue d'un vrai bug rencontré porte une date réelle et s'ajoute au-dessus d'elles, la plus récente en tête.

<!-- SENTINEL: nouveau bug daté ICI, juste en dessous de cette ligne — au-dessus des entrées `Date : —`, jamais en bas du fichier -->

### Frontend — loading infini si API inaccessible
- Date : —
- Fichier concerné : tout composant qui charge des données de façon asynchrone au montage (ex. `fetch()` dans un hook/lifecycle de chargement, quel que soit le framework)
- Symptôme : page bloquée sur "Chargement…" si le backend ne répond pas
- Cause : aucun `try/catch` dans les fonctions de chargement — si `fetch()` lève une exception, l'état "en chargement" n'est jamais remis à jour
- Solution : entourer tous les appels fetch d'un `try/catch`, afficher un message d'erreur avec bouton "Réessayer"

### Frontend — render crash si API retourne un objet non-tableau
- Date : —
- Fichier concerné : tout composant qui assigne directement `await res.json()` à son état local
- Symptôme : crash JS type "map is not a function" (ou équivalent selon le framework) quand l'API retourne une erreur 500
- Cause : la réponse est assignée à l'état sans vérifier `Array.isArray(data)`
- Solution : utiliser `Array.isArray(data) ? data : []` avant toute mise à jour d'état qui attend une liste

### Pages client — scroll indésirable sur mobile
- Date : —
- Fichier concerné : tout fichier page avec `min-h-screen` sur mobile
- Symptôme : page scrollable sur mobile alors que le contenu tient en un écran
- Cause : `min-h-screen` utilise `100vh` calculé avec la barre du navigateur rétractée (valeur trop grande). Quand la barre est visible, le container dépasse le viewport visible → scroll possible
- Solution : remplacer `min-h-screen` par `h-dvh` (`height: 100dvh` = dynamic viewport height, s'adapte en temps réel à la zone visible)

### CSS — sélecteur cassé par retour à la ligne (descendant combinator)
- Date : —
- Fichier concerné : tout fichier `.css` avec des sélecteurs `:not()` multi-lignes
- Symptôme : la règle CSS semble correcte mais ne s'applique jamais à aucun élément
- Cause : en CSS, un saut de ligne + espace dans un sélecteur crée un **combinateur descendant**. Le sélecteur `input:not(...)\n  :not(...)` est interprété comme "élément `:not(...)` enfant d'un `input`" — ce qui ne matche rien
- Solution : **toujours mettre le sélecteur complet sur une seule ligne**, ne jamais couper une chaîne de pseudo-classes `:not()` avec un retour à la ligne

### Validation HTML5 native bloque la logique JS custom
- Date : —
- Fichier concerné : tout `<form>` avec un `<input type="email">` (ou `required`/`pattern`) et une validation custom dans `onSubmit`
- Symptôme : l'état d'erreur custom ne s'affiche jamais, le formulaire semble ignorer une saisie invalide
- Cause : le navigateur bloque l'événement `submit` avant qu'il n'atteigne le gestionnaire JS applicatif tant que la contrainte HTML5 native n'est pas respectée — `onSubmit` n'est jamais appelé
- Solution : ajouter `noValidate` sur le `<form>` pour désactiver la validation native et garder le contrôle complet de la validation côté JS

### Placeholder indiscernable d'une vraie valeur, après un fix `!important` large sur `color`
- Date : —
- Fichier concerné : tout fichier CSS où une règle `!important` sur `color` cible un `<input>`/`<select>`/`<textarea>` sans distinguer le champ vide
- Symptôme : le texte du `placeholder` s'affiche dans la même couleur qu'une vraie valeur tapée par l'utilisateur — indiscernables visuellement
- Cause : un override `color: [couleur] !important` sur l'élément entier s'applique aussi au pseudo-élément `::placeholder` par héritage, sauf règle dédiée
- Solution : toujours ajouter une règle `::placeholder` séparée (même sélecteur) avec une couleur plus claire que le texte réel — voir `frontend/preset-actif.md` pour le détail exact selon la stack installée (ex. le fix "inputs transparents" du preset `tailwind-daisyui`)
