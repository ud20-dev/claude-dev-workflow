# claude-dev-workflow

Un système de documentation structuré pour travailler efficacement avec Claude sur des projets web.

---

## Le problème

Chaque nouvelle session Claude repart de zéro.
Aucune mémoire. Aucun contexte. Aucun historique du projet.

Sans système, tu passes les 10 premières minutes à tout réexpliquer —
et tu gaspilles la majorité de tes tokens avant même de commencer à travailler.

---

## La solution

Un ensemble de fichiers markdown structurés qui donnent à Claude exactement
ce dont il a besoin, au moment où il en a besoin.

Un fichier par sujet. Pas de bruit. Pas de gaspillage.

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

Si tout était dans un seul fichier — Claude lirait 300 lignes
pour trouver 10 lignes utiles. Tokens gaspillés. Temps perdu.

---

## Comment ça fonctionne

Début de session →
"Lis docs/CLAUDE.md puis docs/PROGRESS.md"

Travailler sur une page →
"Lis docs/PAGES.md section Login et docs/STYLE.md"

Fin de session →
"Mets à jour docs/PROGRESS.md pour la session [numéro]"

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

[UD20-dev](https://github.com/ud20-dev) — We build digital products.
