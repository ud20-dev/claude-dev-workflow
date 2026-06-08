# CLAUDE
> LIRE EN PREMIER. Toujours. Sans exception.
> Ne jamais supposer le contexte — lire PROGRESS.md juste après.
> Ne pas résumer ce fichier. L'appliquer.

---

## Commande de démarrage
```
"Lis docs/CLAUDE.md puis docs/PROGRESS.md
et dis-moi où on en est en 5 lignes maximum"
```

---

## Règles absolues
- Lire uniquement le fichier ciblé — jamais tout le dossier docs/ en une fois
- Ne jamais toucher la branche main directement
- Toujours appliquer STYLE.md sans interprétation personnelle
- Chaque bug résolu → ajouter dans ERRORS.md immédiatement
- Chaque décision technique → ajouter dans DECISIONS.md immédiatement
- Fin de session → mettre à jour PROGRESS.md obligatoirement
- Ne jamais recréer un composant qui existe déjà dans COMPONENTS.md
- Ne jamais créer une table qui existe déjà dans DATABASE.md
- Si une information manque dans un fichier → demander avant d'inventer

---

## Index — quand lire quoi

| Fichier | Lire quand |
|---------|------------|
| CONTEXT.md | Première session ou doute sur la direction du produit |
| PROGRESS.md | Début de chaque session |
| DECISIONS.md | Avant de proposer une solution ou technologie |
| STACK.md | Installation, configuration, commandes terminal |
| STYLE.md | Création ou modification d'une interface |
| DATABASE.md | Création ou modification de la base de données |
| PAGES.md | Création ou modification d'une page — lire uniquement la section concernée |
| COMPONENTS.md | Création ou modification d'un composant |
| ERRORS.md | Quand un bug apparaît — vérifier si déjà résolu |
| SECURITY.md | Avant/après tout travail de sécurité — liste des failles à corriger |

---

## Commandes utiles

| Action | Commande à dire |
|--------|----------------|
| Démarrer une session | "Lis CLAUDE.md puis PROGRESS.md" |
| Travailler sur une page | "Lis PAGES.md section [nom] et STYLE.md" |
| Créer un composant | "Lis COMPONENTS.md et STYLE.md" |
| Modifier la base de données | "Lis DATABASE.md" |
| Bug rencontré | "Lis ERRORS.md — j'ai ce bug : [description]" |
| Fin de session | "Mets à jour PROGRESS.md session [numéro]" |
| Nouvelle décision | "Ajoute dans DECISIONS.md — [sujet]" |
