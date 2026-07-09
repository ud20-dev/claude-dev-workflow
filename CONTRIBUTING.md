# Décisions d'architecture du template

> Ce fichier documente pourquoi `docs/` est construit comme il est — pas les décisions d'un projet qui utilise le template (ça, c'est `docs/DECISIONS.md`, qui reste vide et se copie tel quel).
> Format identique à `docs/DECISIONS.md` pour rester cohérent.

---

### Séparation frontend/backend en sous-dossiers
- Décision : `docs/frontend/` et `docs/backend/` séparés, avec un socle partagé à la racine de `docs/` (CONTEXT, PROGRESS, DECISIONS, STACK, SECURITY)
- Pourquoi : un fichier `ERRORS.md`/`FEEDBACK.md` unique mélangeait des bugs/réflexes 100% frontend (CSS, DaisyUI) avec des bugs 100% backend (SQLAlchemy async) — une tâche backend chargeait du contexte frontend inutile, et inversement
- Alternative refusée : sous-sections `## Frontend` / `## Backend` à l'intérieur des mêmes fichiers
- Pourquoi refusée : n'évite pas de charger le contenu inutile en mémoire de lecture, juste visuellement séparé — l'objectif était de ne littéralement pas lire l'autre couche

### Preset installé via copie (`preset-actif.md`), pas un champ texte dans STACK.md
- Décision : `frontend/presets/` = catalogue en lecture seule, un preset choisi est copié vers `frontend/preset-actif.md`, seul fichier réellement lu avec STYLE.md
- Pourquoi : une première version utilisait un champ `STACK.md > Preset de style` avec le nom du preset, obligeant à recharger le mapping nom→fichier à chaque tâche. La copie directe élimine cette indirection — un seul fichier à lire, toujours au même endroit
- Alternative refusée : garder le nom dans STACK.md et charger `presets/[nom].md` dynamiquement
- Pourquoi refusée : fonctionne, mais une étape de résolution en plus à chaque tâche pour un gain nul — le principe "un seul fichier fait foi" est plus simple à appliquer sans exception

### Tous les presets du catalogue doivent avoir les mêmes titres de section
- Décision : `Boutons > Désactivé`, `Règles mobile — Touch targets`, `Règle CSS — No Camouflage`, `Fix inputs transparents / placeholder` — identiques mot pour mot dans chaque preset
- Pourquoi : sans cette contrainte, changer de preset changerait aussi la structure que STYLE.md pointe vers — un lien du type "voir preset-actif.md, section X" casserait selon le preset installé
- Alternative refusée : laisser chaque preset libre dans sa structure
- Pourquoi refusée : rendrait le système fragile au changement de stack en cours de projet, alors que c'est justement le cas d'usage que le mécanisme de preset est censé bien gérer

### `UI-QUALITY.md` séparé de `STYLE.md`
- Décision : fichier dédié à la direction artistique (checklist "ça sent l'IA ou pas"), distinct des valeurs exactes de STYLE.md
- Pourquoi : respecter STYLE.md mécaniquement (bons radius, bonnes couleurs) ne garantit pas un résultat qui a l'air conçu plutôt que généré — deux problèmes différents (valeurs correctes vs. jugement esthétique) qui ont besoin de deux fichiers différents, lus à deux moments différents (avant de commencer vs. avant de livrer)
- Alternative refusée : une section de plus dans STYLE.md
- Pourquoi refusée : STYLE.md est lu à chaque tâche, UI-QUALITY.md seulement avant de livrer — les fusionner aurait fait relire la checklist qualité à chaque petite modification, pas seulement en fin de tâche

### `style-picker.html` en fichier local plutôt qu'en artifact généré à la demande
- Décision : fichier statique livré dans `frontend/`, ouvert par double-clic, jamais régénéré
- Pourquoi : un artifact généré à chaque demande n'est pas réutilisable d'une session à l'autre ni partageable avec un autre développeur du même projet (ex. le dev backend qui voudrait voir ce qui a été choisi)
- Alternative refusée : artifact à la demande
- Pourquoi refusée : recrée l'outil à chaque fois au lieu de le posséder — contraire au principe même du template (mémoire persistante, pas régénération)

### CHANGELOG.md séparé de PROGRESS.md
- Décision : fichier dédié en langage humain, jamais lu automatiquement par Claude, pour qu'un nouveau développeur comprenne l'histoire du projet en le lisant
- Pourquoi : PROGRESS.md est optimisé pour que Claude le lise vite (pointeurs, champs terses) — un humain qui découvre le projet a besoin d'une narration, pas d'un format conçu pour une IA. Les deux publics ont des besoins de lecture incompatibles avec un seul fichier
- Alternative refusée : enrichir PROGRESS.md pour qu'il serve aux deux publics
- Pourquoi refusée : un format qui sert bien Claude (terse, structuré) sert mal un humain (illisible en narration), et inversement — mieux vaut deux fichiers avec un rôle clair qu'un compromis qui ne sert bien personne

### 4 axes (Mémoire / Skill / Garde-fou / Onboarding) comme grille de lecture, pas comme arborescence
- Décision : classification ajoutée dans CLAUDE.md, sans créer de dossiers `memoire/`, `skills/`, `garde-fous/`, `onboarding/`
- Pourquoi : le découpage frontend/backend organise déjà l'espace physique et fonctionne (validé par test) ; les 4 axes répondent à une question différente ("quel type d'information, pour qui ?"), pas "où est-ce rangé physiquement ?" — les deux grilles se croisent sans se remplacer
- Alternative refusée : réorganiser `docs/` en dossiers par axe
- Pourquoi refusée : casserait le découpage frontend/backend déjà éprouvé pour un gain seulement cosmétique
