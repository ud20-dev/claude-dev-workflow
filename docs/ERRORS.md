# ERRORS
> Historique de tous les bugs rencontrés et résolus.
> Lire quand un bug apparaît — vérifier s'il a déjà été résolu.
> Ne jamais supprimer une entrée existante.
> Format d'ajout : "Ajoute dans ERRORS.md — [description du bug]"

---

## Comment utiliser ce fichier
1. Un bug apparaît → dire "Lis ERRORS.md — j'ai ce bug : [description]"
2. Claude vérifie si le bug existe déjà
3. Si oui → appliquer la solution existante
4. Si non → résoudre puis ajouter dans ce fichier

---

## Template
> Copier ce template pour chaque nouveau bug résolu.

```
### [Titre court du bug]
- Date : JJ/MM/AAAA
- Fichier concerné : [chemin/vers/fichier.tsx]
- Symptôme : [ce qui se passe — message d'erreur exact si possible]
- Cause : [pourquoi ça arrive]
- Solution : [ce qu'on a fait pour corriger]
```

---

## Bugs résolus
> Les entrées avec `Date : —` sont des connaissances génériques (vraies sur tout projet utilisant cette stack), pas des incidents d'un projet précis. Une nouvelle entrée issue d'un vrai bug rencontré doit, elle, porter une date réelle.

### SQLAlchemy async — lazy loading relation non chargée
- Date : —
- Fichier concerné : tout fichier `api/*.py` avec des relations
- Symptôme : endpoint lève `MissingGreenlet` ou crash silencieux à l'accès d'une relation
- Cause : accès à `obj.relation` sans eager loading dans un contexte async SQLAlchemy — le lazy loading n'est pas supporté en async
- Solution : ajouter `.options(selectinload(Model.relation))` à toutes les requêtes qui accèdent à des relations

### Frontend — loading infini si API inaccessible
- Date : —
- Fichier concerné : tout composant avec un `fetch()` dans un `useEffect`
- Symptôme : page bloquée sur "Chargement…" si le backend ne répond pas
- Cause : aucun `try/catch` dans les fonctions de chargement — si `fetch()` lève une exception, `setLoading(false)` n'est jamais appelé
- Solution : entourer tous les appels fetch d'un `try/catch`, afficher un message d'erreur avec bouton "Réessayer"

### Frontend — render crash si API retourne un objet non-tableau
- Date : —
- Fichier concerné : tout composant qui fait `setState(await res.json())`
- Symptôme : crash React "map is not a function" quand l'API retourne une erreur 500
- Cause : `setState(data)` sans vérifier `Array.isArray(data)`
- Solution : utiliser `Array.isArray(data) ? data : []` à chaque setState sur une liste

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

### Inputs / Selects transparents sur mobile (DaisyUI v5)
- Date : —
- Fichier concerné : `globals.css` + tout fichier avec `<input>`, `<select>`, `<textarea>`
- Symptôme : champs de texte transparents sur Android (WebView, Samsung Browser, Chrome Mobile)
- Cause : DaisyUI v5 utilise `oklch()` pour les couleurs CSS. Certains navigateurs mobiles ne supportent pas oklch → `background-color` tombe à `transparent`
- Solution : voir la section "Fix obligatoire — Inputs transparents" dans STYLE.md
