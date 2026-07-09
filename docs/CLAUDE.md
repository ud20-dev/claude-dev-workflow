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
├── CLAUDE.md       — ce fichier, l'orchestrateur
├── CONTEXT.md      — partagés : vision et suivi du projet entier,
├── PROGRESS.md     —   jamais spécifiques à une seule couche
├── DECISIONS.md    —   (voir note ci-dessous)
├── CHANGELOG.md    — journal humain, pas lu automatiquement par Claude (voir "Les 3 axes")
├── STACK.md
├── SECURITY.md
├── frontend/
│   ├── STYLE.md          — design system, neutre vis-à-vis de la stack
│   ├── style-picker.html — outil local (double-clic) pour calibrer le style avant de remplir STYLE.md
│   ├── UI-QUALITY.md     — direction artistique, à vérifier avant de livrer une interface
│   ├── preset-actif.md   — LE preset installé pour ce projet, lu avec STYLE.md à chaque tâche
│   ├── presets/          — catalogue des presets disponibles (jamais lu directement, jamais modifié) : tailwind-daisyui, tailwind-only, css-pur…
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

**Projet à une seule couche** (API sans frontend, site statique sans backend) : ignorer le dossier qui ne s'applique pas — pas besoin de le supprimer, il reste simplement vide et n'est jamais lu.

---

## Les 4 axes de docs/
> Grille de lecture — sert à savoir où range une nouvelle information avant de créer un nouveau fichier. Pas une nouvelle arborescence, juste une classification de ce qui existe déjà.

| Axe | Rôle | Pour qui | Fichiers |
|---|---|---|---|
| **Mémoire** | Ce qui s'est passé / ce qui existe — sans ça, chaque session repart de zéro | Claude | CONTEXT.md, PROGRESS.md, DECISIONS.md, STACK.md, SECURITY.md, PAGES.md, COMPONENTS.md, DATABASE.md, ERRORS.md (frontend + backend) |
| **Skill** | Le savoir-faire injecté par défaut — design, technique — pour que le résultat soit bon dès le départ | Claude | STYLE.md, UI-QUALITY.md, style-picker.html, presets/, preset-actif.md |
| **Garde-fou** | Ce qui a déjà mal tourné (ici ou ailleurs) et ne doit jamais se reproduire | Claude | FEEDBACK.md (frontend + backend), certaines Règles absolues ci-dessous |
| **Onboarding** | L'histoire et l'état du projet, en langage clair — pas des pointeurs à suivre | Humain | CHANGELOG.md |

Une nouvelle information à ajouter : identifier d'abord son axe, puis chercher le fichier existant de cet axe avant d'en créer un nouveau. `CHANGELOG.md` est le seul fichier de `docs/` qui n'est pas lu automatiquement par Claude — uniquement à la demande, ou pour y ajouter une entrée.

---

## Session 1 — dans cet ordre
> Ne s'applique qu'une seule fois, au tout début du projet. Les sessions suivantes commencent directement par "Aiguillage" plus bas.

1. `CONTEXT.md` — vision du produit
2. `STACK.md` — technologies du projet

**Si tâche frontend prévue :**

3. Installer un preset (`frontend/presets/` → copier vers `frontend/preset-actif.md`, voir "Commandes utiles")
4. Ouvrir `frontend/style-picker.html` dans un navigateur (double-clic, fichier local, aucun serveur requis) pour calibrer visuellement palette/typo/forme/densité/alignement
5. `frontend/STYLE.md` — reporter les choix du style-picker dans Couleurs, Typography, Composants UI, Boutons
6. `frontend/UI-QUALITY.md` — remplir "À remplir par projet" (niveau de finition visé, références)

**Si tâche backend prévue :**

3. `backend/DATABASE.md` — plateforme, ORM, premières tables connues dès le départ
4. `STACK.md` > section Backend — runtime, framework, type d'API, auth
5. Convention de réponse d'API et de gestion d'erreur pas encore standardisée dans ce template — si le projet en a une, l'ajouter dans `backend/DATABASE.md` > "Règles métier" ou demander avant d'improviser une structure différente d'un endpoint à l'autre

---

## Règles absolues
> Chaque ligne est un déclencheur + un pointeur — le détail et le "pourquoi" vivent dans le fichier référencé, jamais ici.

- Lire uniquement le fichier ciblé — jamais tout `docs/` ni tout un sous-dossier `frontend/`/`backend/` en bloc
- Ne jamais toucher la branche main directement
- Frontend : `STYLE.md` + `preset-actif.md` toujours ensemble ; `presets/` n'est jamais lu pour une tâche ; si `preset-actif.md` n'existe pas → demander avant de coder une valeur stack-spécifique
- Avant de styliser un bouton/carte/input → vérifier STYLE.md + COMPONENTS.md, jamais de valeur "proche" — voir FEEDBACK.md ("Dérive de style entre pages")
- Avant de positionner un bloc → vérifier STYLE.md (Mise en page) + PAGES.md — voir FEEDBACK.md ("Positionnement improvisé...")
- Avant de livrer une interface → vérifier UI-QUALITY.md — voir FEEDBACK.md ("Interface qui... sent l'IA")
- Après un fix CSS `!important`/sélecteur large → revérifier les états voisins — voir FEEDBACK.md ("Fix CSS large...")
- Chaque bug résolu → `ERRORS.md` (frontend ou backend) immédiatement
- Chaque décision technique → `DECISIONS.md` immédiatement (partagé, jamais dupliqué par couche)
- Chaque réflexe IA observé → `FEEDBACK.md` (frontend ou backend) immédiatement
- Fin de session → `PROGRESS.md` obligatoirement
- Changement significatif (nouvelle fonctionnalité, décision qui change la direction, gros refactor) → ajouter une entrée dans `CHANGELOG.md`, en langage humain, pas en pointeurs — pas pour chaque petit commit
- Ne jamais recréer un composant déjà dans `COMPONENTS.md` ni une table déjà dans `DATABASE.md`
- Si une information manque → demander avant d'inventer

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
| CHANGELOG.md | Jamais automatiquement — sur demande de l'utilisateur, ou pour y ajouter une entrée après un changement significatif |
| STACK.md | Installation, configuration, commandes terminal |
| frontend/STYLE.md | Création ou modification d'une interface — toujours avec preset-actif.md |
| frontend/UI-QUALITY.md | Avant de livrer une interface — après STYLE.md, pas à la place |
| frontend/preset-actif.md | En même temps que STYLE.md, à chaque tâche frontend |
| frontend/presets/ | Seulement au moment d'installer ou changer de preset (session 1 ou changement de stack) |
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
| Choix fait dans style-picker.html | "J'ai choisi [coller le résultat de 'Copier la sélection'] → remplis frontend/STYLE.md" |
| Travailler sur une page | "Lis frontend/PAGES.md section [nom] et frontend/STYLE.md" |
| Créer un composant | "Lis frontend/COMPONENTS.md et frontend/STYLE.md" |
| Modifier la base de données | "Lis backend/DATABASE.md" |
| Bug frontend rencontré | "Lis frontend/ERRORS.md — j'ai ce bug : [description]" |
| Bug backend rencontré | "Lis backend/ERRORS.md — j'ai ce bug : [description]" |
| Fin de session | "Mets à jour PROGRESS.md session [numéro]" |
| Nouvelle décision | "Ajoute dans DECISIONS.md — [sujet]" |
| Nouveau dev qui rejoint | "Lis CHANGELOG.md et résume-moi le projet" |
| Changement significatif à documenter | "Ajoute dans CHANGELOG.md — [ce qui a changé]" |
| Réflexe IA à corriger (frontend) | "Ajoute dans frontend/FEEDBACK.md — [pattern]" |
| Réflexe IA à corriger (backend) | "Ajoute dans backend/FEEDBACK.md — [pattern]" |
| Installer un preset de style | "Installe le preset [nom] — copie frontend/presets/[nom].md vers frontend/preset-actif.md" |
| Changer de preset de style | "Remplace frontend/preset-actif.md par le preset [nom]" |
