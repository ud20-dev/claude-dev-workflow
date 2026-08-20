# CLAUDE
> Version du template : 1.1.0
> LIRE EN PREMIER. Toujours. Sans exception.
> Ce fichier est le cerveau du projet — il n'explique rien lui-même, il oriente vers `docs/frontend/`, `docs/backend/` ou les fichiers partagés à la racine de `docs/`.
> Ne jamais supposer le contexte — lire PROGRESS.md juste après.
> Ne pas résumer ce fichier. L'appliquer.

---

## Démarrage de session
> Ce fichier et `docs/PROGRESS.md` (sessions récentes uniquement) sont injectés automatiquement en début de session par un hook `SessionStart` (voir `.claude/hooks/session-start.sh`) — inutile de les redemander. Le même hook vérifie aussi en silence si une mise à jour du template est disponible et ne dit rien s'il n'y en a pas (voir "Mise à jour du template" plus bas).

Pour un résumé malgré tout : "Dis-moi où on en est en 5 lignes maximum".

---

## Structure du dossier docs/

```
docs/
├── CLAUDE.md       — ce fichier, l'orchestrateur
├── CONTEXT.md      — partagés : vision et suivi du projet entier,
├── PROGRESS.md     —   jamais spécifiques à une seule couche
├── DECISIONS.md    —   (voir note ci-dessous)
├── CHANGELOG.md    — journal humain, pas lu automatiquement par Claude (voir "Les 4 axes")
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
    ├── TODO.md       — ce que le backend doit encore construire, déduit du frontend déjà fait en mock
    ├── ERRORS.md     — bugs backend résolus
    └── FEEDBACK.md   — réflexes IA à corriger côté backend
```

Règle de fond : tout ce qui définit le projet dans son ensemble (vision, décisions, progression, stack, sécurité) reste à la racine de `docs/`, lu par les deux couches. Tout ce qui est spécifique à une couche et qui grossit au fil des sessions (bugs, réflexes IA, specs d'implémentation) vit dans son propre dossier.

**Projet à une seule couche** (API sans frontend, site statique sans backend) : ignorer le dossier qui ne s'applique pas — pas besoin de le supprimer, il reste simplement vide et n'est jamais lu.

En dehors de `docs/`, `.claude/settings.json` et `.claude/hooks/session-start.sh` chargent automatiquement ce fichier et les sessions récentes en début de session, et `.claude/scripts/changelog.sh` affiche ce qui a changé en amont et comment migrer (voir "Mise à jour du template").

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
- Page/fonctionnalité frontend construite en mock faute d'endpoint → `backend/TODO.md` immédiatement (endpoint attendu, rôle requis, forme de données déjà utilisée côté frontend) — une fois l'endpoint construit et branché, retirer l'entrée ou la réduire à une ligne dans `PROGRESS.md`
- Chaque décision technique → `DECISIONS.md` immédiatement (partagé, jamais dupliqué par couche)
- Chaque réflexe IA observé → `FEEDBACK.md` (frontend ou backend) immédiatement
- Fin de session → `PROGRESS.md` obligatoirement
- Toute entrée ajoutée à `PROGRESS.md`, `DECISIONS.md`, `ERRORS.md`, `FEEDBACK.md` ou `CHANGELOG.md` se place tout en haut de sa section, juste sous le repère `<!-- SENTINEL -->` — jamais en bas du fichier, la plus récente en premier. Dans `ERRORS.md`/`FEEDBACK.md`, les entrées `Date : —` (connaissances génériques) restent groupées après les entrées datées
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
| backend/TODO.md | Début d'une tâche backend (savoir quoi construire en priorité) ; côté frontend, dès qu'une page est faite en mock faute d'endpoint |
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
| Savoir quoi construire côté backend | "Lis backend/TODO.md" |
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
| Vérifier une mise à jour maintenant | "Vérifie si le template a une mise à jour" |

---

## Mise à jour du template
> Les étapes 1 à 3 tournent déjà en silence à chaque session dans le hook `SessionStart` (`.claude/hooks/session-start.sh`), sans coûter le moindre appel d'outil à Claude — rien n'apparaît dans le contexte tant que la version locale et la version publiée sont identiques. Seule l'étape 4 (mise à jour disponible) produit une ligne visible. Vérification manuelle possible à tout moment ("Vérifie si le template a une mise à jour") : dans ce cas seulement, exécuter les étapes 1 à 4 soi-même.

1. Lire la version installée — première ligne de ce fichier (`> Version du template : X.Y.Z`)
2. Récupérer la version publiée : `curl -s https://raw.githubusercontent.com/ud20-dev/claude-dev-workflow/main/README.md | grep -m1 "Version"` (ou lire le fichier via WebFetch si `curl` n'est pas disponible)
3. Versions identiques, ou pas de connexion réseau → ne rien dire, continuer normalement (ne jamais bloquer une session pour ça)
4. Version publiée plus récente → informer l'utilisateur ("Le template a une mise à jour, X.Y.Z → A.B.C") et **s'arrêter là sans rien appliquer, sauf accord explicite**

Si l'utilisateur accepte la mise à jour :
0. Lancer `.claude/scripts/changelog.sh` — affiche le changelog amont et, pour un changement de version majeure connu (ex. 1.x → 2.x), les étapes de migration structurelle spécifiques (réordonnancement FIFO → LIFO). Le suivre en plus des étapes ci-dessous, pas à leur place — `changelog.sh` couvre la restructuration d'un fichier existant, les étapes 1-9 couvrent l'ajout de fichiers/lignes manquants
1. Vérifier `git status` sur le projet — si des changements non commités existent, le dire et demander de commiter ou stasher d'abord ; ne rien appliquer sur un état de travail sale. Filet de sécurité : même en cas d'erreur dans les étapes suivantes, tout reste annulable d'un simple `git diff`/`git restore`
2. Cloner `https://github.com/ud20-dev/claude-dev-workflow` dans un dossier temporaire
3. Comparer `docs/CLAUDE.md` du clone avec celui du projet — repérer les nouveautés : nouveaux fichiers dans la structure, nouvelles lignes dans "Règles absolues"/"Index"/"Commandes utiles" absentes du projet. Le sens de la comparaison ne va que dans un sens : chercher ce que le **template** a en plus, jamais ce que le **projet** a en plus
4. **Règle stricte, jamais d'exception** : uniquement AJOUTER ce qui manque — un fichier absent (ex. un futur `backend/[NOM].md`) se copie tel quel (vide) ; une ligne absente d'une table s'ajoute telle quelle. **Ne jamais modifier ni supprimer une ligne déjà présente**, même si sa formulation diffère du clone — une différence de formulation est presque toujours une adaptation volontaire faite pendant le projet, pas un oubli
5. Toute règle, ligne ou fichier ajouté par le dev qui n'existe **pas** dans le template (règle métier propre au projet, convention personnalisée, fichier hors structure standard) reste intouché — il n'a par définition aucun équivalent dans le clone à comparer, donc rien ne le désigne jamais comme candidat à modifier
6. Ne jamais toucher aux fichiers dont c'est le rôle de contenir la mémoire ou le contenu spécifique au projet (`STYLE.md`, `PAGES.md`, `COMPONENTS.md`, `PROGRESS.md`, `DECISIONS.md`, `CHANGELOG.md`, `SECURITY.md`, `CONTEXT.md`, `STACK.md`, `ERRORS.md`/`FEEDBACK.md` des deux couches, `preset-actif.md`, `DATABASE.md`, `TODO.md`) au-delà d'y créer le fichier s'il n'existait pas encore — jamais réécrire une ligne qui existe déjà
7. Présenter la liste des ajouts trouvés avant de les appliquer, pas après
8. Une fois appliqué → mettre à jour la ligne de version en haut de ce fichier, et ajouter une entrée dans `CHANGELOG.md` ("Mise à jour du template vers X.Y.Z — [ce qui a été ajouté]")
9. Rappeler à l'utilisateur qu'il peut tout annuler avec `git restore`/`git checkout` tant qu'il n'a pas commité cette mise à jour lui-même
