# claude-dev-workflow
> Version 1.0.1

Un système de documentation structuré pour travailler efficacement avec Claude sur des projets web.

---

## Le problème

Chaque nouvelle session Claude repart de zéro.
Aucune mémoire. Aucun contexte. Aucun historique du projet.

La plupart des devs créent un seul fichier CLAUDE.md qui regroupe tout —
le design, les pages, la base de données, les composants, tout.

Le problème : à chaque session Claude lit tout le fichier
pour trouver l'information dont il a besoin.

Plus le fichier est grand, plus les tokens partent
avant même que le vrai travail commence.

---

## La solution

Un ensemble de fichiers markdown structurés qui donnent à Claude exactement
ce dont il a besoin, au moment où il en a besoin.

Un fichier par sujet. Pas de bruit. Pas de gaspillage.
Et une séparation nette entre ce qui appartient au projet entier et ce qui appartient à une seule couche.

---

## Commande de démarrage

Copier cette ligne et la coller à Claude au début de chaque session :

```
Lis docs/CLAUDE.md puis docs/PROGRESS.md et dis-moi où on en est en 5 lignes maximum
```

---

## Structure

```
docs/
├── CLAUDE.md      — orchestrateur, lu en premier toujours
├── CONTEXT.md     — partagés : vision et suivi du projet
├── PROGRESS.md    —   entier, jamais dupliqués par couche
├── DECISIONS.md
├── STACK.md
├── SECURITY.md
├── frontend/
│   ├── STYLE.md          — design system, neutre vis-à-vis de la stack
│   ├── UI-QUALITY.md     — direction artistique, vérifiée avant de livrer une interface
│   ├── preset-actif.md   — LE preset installé pour ce projet (copié depuis presets/)
│   ├── presets/          — catalogue : tailwind-daisyui, tailwind-only, css-pur…
│   ├── PAGES.md, COMPONENTS.md
│   ├── ERRORS.md    — bugs frontend résolus
│   └── FEEDBACK.md  — réflexes IA à corriger côté frontend
└── backend/
    ├── DATABASE.md
    ├── ERRORS.md    — bugs backend résolus
    └── FEEDBACK.md  — réflexes IA à corriger côté backend
```

`CLAUDE.md` est le cerveau : c'est lui qui détermine, pour chaque tâche, s'il faut lire dans `frontend/`, `backend/`, ou les fichiers partagés à la racine — jamais tout `docs/` en bloc.

---

## Pourquoi tout est séparé

Chaque fichier a un rôle unique et précis.
Claude ne lit que ce qui est utile pour la tâche en cours...

| Fichier | Rôle | Pourquoi séparé |
|---------|------|-----------------|
| CLAUDE.md | Point d'entrée, orchestrateur | Lu une seule fois au démarrage |
| CONTEXT.md | Vision du produit | Lu uniquement en première session |
| PROGRESS.md | Suivi des sessions | Lu à chaque début de session |
| DECISIONS.md | Choix techniques | Lu avant toute nouvelle solution |
| STACK.md | Technologies | Lu avant toute installation |
| frontend/STYLE.md | Design system, neutre vis-à-vis de la stack | Lu avant toute interface, avec preset-actif.md |
| frontend/UI-QUALITY.md | Direction artistique — pourquoi une interface "correcte" peut quand même sentir l'IA | Vérifié avant de livrer une interface, pas avant de la commencer |
| frontend/preset-actif.md | Le preset installé pour ce projet | Lu à chaque tâche frontend, en même temps que STYLE.md |
| frontend/presets/ | Catalogue des presets disponibles | Consulté une seule fois, pour installer ou changer de preset |
| backend/DATABASE.md | Base de données | Lu avant toute modification de table |
| frontend/PAGES.md | Pages du projet | Lu section par section selon la page |
| frontend/COMPONENTS.md | Composants | Lu avant tout nouveau composant |
| frontend/ERRORS.md | Bugs résolus côté interface | Lu quand un bug frontend apparaît |
| backend/ERRORS.md | Bugs résolus côté serveur/API | Lu quand un bug backend apparaît |
| frontend/FEEDBACK.md | Réflexes IA à corriger côté interface | Lu avant une tâche frontend à risque de pattern connu |
| backend/FEEDBACK.md | Réflexes IA à corriger côté serveur | Lu avant une tâche backend à risque de pattern connu |
| SECURITY.md | Failles de sécurité | Lu avant/après tout travail de sécurité |

Si tout était dans un seul fichier — Claude lirait tout
pour trouver une seule information. Tokens gaspillés. Temps perdu.
Et un réflexe CSS n'a rien à faire dans le contexte d'une tâche sur l'API.

---

## Comment ça fonctionne

| Action | Commande |
|--------|----------|
| Début de session | "Lis docs/CLAUDE.md puis docs/PROGRESS.md" |
| Travailler sur une page | "Lis docs/frontend/PAGES.md section [nom] et docs/frontend/STYLE.md" |
| Créer un composant | "Lis docs/frontend/COMPONENTS.md et docs/frontend/STYLE.md" |
| Bug frontend rencontré | "Lis docs/frontend/ERRORS.md — j'ai ce bug : [description]" |
| Bug backend rencontré | "Lis docs/backend/ERRORS.md — j'ai ce bug : [description]" |
| Nouvelle décision | "Ajoute dans docs/DECISIONS.md — [sujet]" |
| Réflexe IA à corriger (frontend) | "Ajoute dans docs/frontend/FEEDBACK.md — [pattern]" |
| Réflexe IA à corriger (backend) | "Ajoute dans docs/backend/FEEDBACK.md — [pattern]" |
| Installer un preset de style | "Installe le preset [nom]" — copie docs/frontend/presets/[nom].md vers docs/frontend/preset-actif.md |
| Fin de session | "Mets à jour docs/PROGRESS.md session [numéro]" |

---

## Pourquoi ça marche

| Sans ce système | Avec ce système |
|-----------------|-----------------|
| 10 min à réexpliquer le contexte | 30 secondes pour reprendre |
| Tokens gaspillés sur le contexte | Tokens utilisés sur le vrai travail |
| Design incohérent entre les pages | Un seul STYLE.md appliqué partout |
| Progression perdue entre sessions | Sessions numérotées dans PROGRESS.md |
| Projet abandonné quand on se perd | Prochaine étape claire à chaque session |

---

## Installation

Cloner le repo :

```bash
git clone https://github.com/ud20-dev/claude-dev-workflow
```

Copier le dossier docs/ à la racine de ton projet :

```bash
cp -r claude-dev-workflow/docs/ ton-projet/docs/
```

---

## Contribuer

Tu as trouvé une façon d'améliorer le système ?
Ouvre une issue ou soumets une pull request.
Toutes les contributions sont les bienvenues.

---

## Créé par

[UD20-dev](https://github.com/ud20-dev) — Nous créons des produits numériques.