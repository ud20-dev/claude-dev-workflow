# claude-dev-workflow

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

---

## Commande de démarrage

Copier cette ligne et la coller à Claude au début de chaque session :

"Lis docs/CLAUDE.md puis docs/PROGRESS.md et dis-moi où on en est en 5 lignes maximum"

---

## Pourquoi tout est séparé

Chaque fichier a un rôle unique et précis.
Claude ne lit que ce qui est utile pour la tâche en cours.

| Fichier | Rôle | Pourquoi séparé |
|---------|------|-----------------|
| CLAUDE.md | Point d'entrée | Lu une seule fois au démarrage |
| CONTEXT.md | Vision du produit | Lu uniquement en première session |
| PROGRESS.md | Suivi des sessions | Lu à chaque début de session |
| DECISIONS.md | Choix techniques | Lu avant toute nouvelle solution |
| STACK.md | Technologies | Lu avant toute installation |
| STYLE.md | Design system | Lu avant toute interface |
| DATABASE.md | Base de données | Lu avant toute modification de table |
| PAGES.md | Pages du projet | Lu section par section selon la page |
| COMPONENTS.md | Composants | Lu avant tout nouveau composant |
| ERRORS.md | Bugs résolus | Lu quand un bug apparaît |

Si tout était dans un seul fichier — Claude lirait tout
pour trouver une seule information. Tokens gaspillés. Temps perdu.

---

## Comment ça fonctionne

| Action | Commande |
|--------|----------|
| Début de session | "Lis docs/CLAUDE.md puis docs/PROGRESS.md" |
| Travailler sur une page | "Lis docs/PAGES.md section [nom] et docs/STYLE.md" |
| Créer un composant | "Lis docs/COMPONENTS.md et docs/STYLE.md" |
| Bug rencontré | "Lis docs/ERRORS.md — j'ai ce bug : [description]" |
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

git clone https://github.com/ud20-dev/claude-dev-workflow

Copier le dossier docs/ à la racine de ton projet :

cp -r claude-dev-workflow/docs/ ton-projet/docs/

---

## Contribuer

Tu as trouvé une façon d'améliorer le système ?
Ouvre une issue ou soumets une pull request.
Toutes les contributions sont les bienvenues.

---

## Créé par

[UD20-dev](https://github.com/ud20-dev) — Nous créons des produits numériques.