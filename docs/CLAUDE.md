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
├── STACK.md
├── SECURITY.md
├── frontend/
│   ├── STYLE.md          — design system, neutre vis-à-vis de la stack
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

## Session 1 — dans cet ordre
> Ne s'applique qu'une seule fois, au tout début du projet. Les sessions suivantes commencent directement par "Aiguillage" plus bas.

1. `CONTEXT.md` — vision du produit
2. `STACK.md` — technologies du projet
3. Tâche frontend prévue ? → installer un preset (`frontend/presets/` → copier vers `frontend/preset-actif.md`, voir "Commandes utiles")
4. `frontend/STYLE.md` — remplir Couleurs, Typography, Composants UI, Boutons avant la première interface
5. `frontend/UI-QUALITY.md` — remplir "À remplir par projet" (niveau de finition visé, références)

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
| Travailler sur une page | "Lis frontend/PAGES.md section [nom] et frontend/STYLE.md" |
| Créer un composant | "Lis frontend/COMPONENTS.md et frontend/STYLE.md" |
| Modifier la base de données | "Lis backend/DATABASE.md" |
| Bug frontend rencontré | "Lis frontend/ERRORS.md — j'ai ce bug : [description]" |
| Bug backend rencontré | "Lis backend/ERRORS.md — j'ai ce bug : [description]" |
| Fin de session | "Mets à jour PROGRESS.md session [numéro]" |
| Nouvelle décision | "Ajoute dans DECISIONS.md — [sujet]" |
| Réflexe IA à corriger (frontend) | "Ajoute dans frontend/FEEDBACK.md — [pattern]" |
| Réflexe IA à corriger (backend) | "Ajoute dans backend/FEEDBACK.md — [pattern]" |
| Installer un preset de style | "Installe le preset [nom] — copie frontend/presets/[nom].md vers frontend/preset-actif.md" |
| Changer de preset de style | "Remplace frontend/preset-actif.md par le preset [nom]" |
