# CLAUDE
> LIRE EN PREMIER. Toujours. Sans exception.
> Ce fichier est le cerveau du projet — il n'explique rien lui-même, il oriente vers `docs/frontend/`, `docs/backend/` ou les fichiers partagés à la racine de `docs/`.
> Ne jamais supposer le contexte — lire PROGRESS.md juste après.
> Ne pas résumer ce fichier. L'appliquer.

---

## Commande de démarrage
```
"Lis docs/CLAUDE.md puis docs/PROGRESS.md
et dis-moi où on en est en 5 lignes maximum"
```

---

## Structure du dossier docs/

```
docs/
├── CLAUDE.md       ← ce fichier, l'orchestrateur
├── CONTEXT.md      ← partagés : vision et suivi du projet entier,
├── PROGRESS.md     ←   jamais spécifiques à une seule couche
├── DECISIONS.md    ←
├── STACK.md        ←
├── SECURITY.md     ←
├── frontend/
│   ├── STYLE.md      — design system
│   ├── PAGES.md      — spec des pages
│   ├── COMPONENTS.md — composants réutilisables
│   ├── ERRORS.md     — bugs frontend résolus
│   └── FEEDBACK.md   — réflexes IA à corriger côté frontend
└── backend/
    ├── DATABASE.md   — schéma de la base de données
    ├── ERRORS.md     — bugs backend résolus
    └── FEEDBACK.md   — réflexes IA à corriger côté backend
```

Règle de fond : tout ce qui définit le projet dans son ensemble (vision, décisions, progression, stack, sécurité) reste à la racine de `docs/`, lu par les deux couches. Tout ce qui est spécifique à une couche et qui grossit au fil des sessions (bugs, réflexes IA, specs d'implémentation) vit dans son propre dossier.

---

## Règles absolues
- Lire uniquement le fichier ciblé — jamais tout le dossier `docs/` en une fois, jamais tout un sous-dossier `frontend/`/`backend/` en bloc
- Ne jamais toucher la branche main directement
- Toujours appliquer `frontend/STYLE.md` sans interprétation personnelle
- Chaque bug résolu → ajouter dans `frontend/ERRORS.md` ou `backend/ERRORS.md` immédiatement, selon la couche concernée
- Chaque décision technique → ajouter dans `DECISIONS.md` immédiatement (fichier partagé, jamais dupliqué par couche)
- Chaque réflexe IA problématique observé → ajouter dans `frontend/FEEDBACK.md` ou `backend/FEEDBACK.md` immédiatement, selon la couche concernée
- Après tout fix CSS avec `!important` ou sélecteur large → revérifier visuellement les états voisins (`::placeholder`, `:disabled`, `::selection`, `:focus-visible`, `:hover`) avant de le considérer terminé
- Fin de session → mettre à jour `PROGRESS.md` obligatoirement
- Ne jamais recréer un composant qui existe déjà dans `frontend/COMPONENTS.md`
- Ne jamais créer une table qui existe déjà dans `backend/DATABASE.md`
- Si une information manque dans un fichier → demander avant d'inventer

---

## Aiguillage — quelle couche avant tout
> Première question à se poser sur toute tâche, avant d'ouvrir un fichier. Détermine quel dossier lire.

| La tâche touche… | Couche | Dossier / fichiers à lire |
|---|---|---|
| Interface, page, composant, CSS, formulaire | **Frontend** | `docs/frontend/` — STYLE.md, PAGES.md, COMPONENTS.md, ERRORS.md, FEEDBACK.md |
| API, base de données, auth, logique serveur | **Backend** | `docs/backend/` — DATABASE.md, ERRORS.md, FEEDBACK.md |
| Les deux (ex. feature bout-en-bout) | **Frontend + Backend** | Lire les fichiers concernés dans les deux dossiers, jamais tout en bloc |
| Ni l'un ni l'autre (setup, déploiement, décision) | — | `docs/STACK.md`, `docs/DECISIONS.md`, `docs/SECURITY.md` selon le cas |

Si le doute persiste après cette table → demander à l'utilisateur plutôt que de tout lire par précaution.

---

## Index — quand lire quoi

| Fichier | Lire quand |
|---------|------------|
| CONTEXT.md | Première session ou doute sur la direction du produit |
| PROGRESS.md | Début de chaque session |
| DECISIONS.md | Avant de proposer une solution ou technologie |
| STACK.md | Installation, configuration, commandes terminal |
| frontend/STYLE.md | Création ou modification d'une interface |
| backend/DATABASE.md | Création ou modification de la base de données |
| frontend/PAGES.md | Création ou modification d'une page — lire uniquement la section concernée |
| frontend/COMPONENTS.md | Création ou modification d'un composant |
| frontend/ERRORS.md | Bug frontend (UI, CSS, React) — vérifier si déjà résolu |
| backend/ERRORS.md | Bug backend (API, base de données, auth) — vérifier si déjà résolu |
| frontend/FEEDBACK.md | Avant une tâche frontend où un réflexe IA connu pourrait se reproduire |
| backend/FEEDBACK.md | Avant une tâche backend où un réflexe IA connu pourrait se reproduire |
| SECURITY.md | Avant/après tout travail de sécurité — liste des failles à corriger |

---

## Commandes utiles

| Action | Commande à dire |
|--------|----------------|
| Démarrer une session | "Lis CLAUDE.md puis PROGRESS.md" |
| Travailler sur une page | "Lis frontend/PAGES.md section [nom] et frontend/STYLE.md" |
| Créer un composant | "Lis frontend/COMPONENTS.md et frontend/STYLE.md" |
| Modifier la base de données | "Lis backend/DATABASE.md" |
| Bug frontend rencontré | "Lis frontend/ERRORS.md — j'ai ce bug : [description]" |
| Bug backend rencontré | "Lis backend/ERRORS.md — j'ai ce bug : [description]" |
| Fin de session | "Mets à jour PROGRESS.md session [numéro]" |
| Nouvelle décision | "Ajoute dans DECISIONS.md — [sujet]" |
| Réflexe IA à corriger (frontend) | "Ajoute dans frontend/FEEDBACK.md — [pattern]" |
| Réflexe IA à corriger (backend) | "Ajoute dans backend/FEEDBACK.md — [pattern]" |
