# STYLE
> Design system complet du projet.
> Lire obligatoirement avant toute création ou modification d'interface.
> Appliquer exactement ces valeurs — aucune interprétation personnelle.
> Ne jamais utiliser une couleur, font ou valeur absente de ce fichier.
> Format d'ajout : "Mets à jour frontend/STYLE.md — [élément] [valeur]"

---

## Preset de stack
> Ce fichier est neutre — aucune valeur ici ne suppose Tailwind, DaisyUI, React, etc. Toujours lu avec `frontend/preset-actif.md` (le preset installé pour ce projet — installation détaillée dans `CLAUDE.md`, catalogue dans `frontend/presets/`).
> `preset-actif.md` absent ? Demander quel preset installer avant de coder une valeur stack-spécifique — ne jamais improviser.

---

## Couleurs

| Nom | Valeur | Usage |
|-----|--------|-------|
| | | |

---

## Mode sombre

- Activé : [ ] Oui  [ ] Non

---

## Typography

| Élément | Valeur |
|---------|--------|
| | |

---

## Espacements

| Nom | Valeur | Usage |
|-----|--------|-------|
| xs | 4px | Espacement minimal |
| sm | 8px | Entre éléments proches |
| md | 16px | Espacement standard |
| lg | 24px | Entre composants |
| xl | 48px | Entre sections |

---

## Composants UI
> Source unique — ne pas improviser (voir CLAUDE.md > Règles absolues). Cas nouveau → l'ajouter ici d'abord, coder ensuite.

| Élément | Valeur |
|---------|--------|
| Radius bouton standard | |
| Radius carte | |
| Radius input | |
| Bordure input | |

> Height input : définie une seule fois dans "Règles mobile — Touch targets" plus bas — ne pas la redéfinir ici.

---

## Boutons
> Ces types couvrent tous les boutons du projet — même règle que Composants UI.

| Type | Style |
|------|-------|
| Primaire | |
| Ghost | |
| Désactivé | *(voir frontend/preset-actif.md)* |

---

## États UI
> Comportement standard des états qui reviennent sur toutes les pages avec des données async — pour éviter de réinventer (et de re-casser) le loading/l'erreur/le vide à chaque nouvelle page. Contexte des bugs que ça évite : voir frontend/ERRORS.md ("loading infini", "render crash si API retourne un objet non-tableau") et frontend/FEEDBACK.md.

| État | Comportement standard | Règle |
|------|------------------------|-------|
| Chargement | | Toujours dans un `try/catch` — `setLoading(false)` doit s'exécuter même si `fetch()` lève une exception |
| Erreur | | Message d'erreur + bouton "Réessayer" — jamais un écran blanc ou un loading bloqué indéfiniment |
| Vide (liste sans résultat) | | Distinct visuellement de l'état erreur — l'absence de données n'est pas un échec |
| Succès / donnée chargée | | `Array.isArray(data) ? data : []` avant tout `.map()` sur une réponse API — ne jamais assumer que l'API renvoie toujours un tableau |
| Formulaire invalide | | `noValidate` sur le `<form>` — la validation custom gère tous les messages d'erreur, jamais le navigateur natif |

> Colonne "Comportement standard" à remplir en session 1 avec les valeurs concrètes du projet (ex. skeleton vs spinner, toast vs bannière inline) — la colonne "Règle" est générique et ne se modifie pas.

---

## Breakpoints

| Nom | Valeur |
|-----|--------|
| Mobile | 375px |
| Tablet | 768px |
| Desktop | 1024px |
| Large | 1280px |

---

## Mise en page — Conteneur & grille
> Source unique pour l'agencement — même règle que Composants UI.

| Élément | Valeur |
|---------|--------|
| Largeur max page de contenu | |
| Largeur max carte / formulaire | |
| Colonnes grille desktop | |
| Padding latéral mobile | |

---

## Mise en page — Formulaires
> Convention unique pour tous les formulaires du projet.

| Règle | Valeur |
|-------|--------|
| Position du label | au-dessus du champ |
| Espacement entre champs | `md` (16px, voir Espacements) |
| Largeur des champs | 100% du conteneur parent |
| Alignement du contenu | gauche par défaut — centré uniquement sur les pages plein écran (voir section suivante) |

---

## Règle de cohérence — Positionnement entre pages
> Réflexe IA identifié — contexte complet dans FEEDBACK.md (même dossier).
> Avant de positionner un nouveau bloc ou une nouvelle section : vérifier dans `frontend/PAGES.md` si une page similaire existe déjà, et reproduire la même structure (ordre des blocs, espacement entre sections, alignement) plutôt que d'improviser un agencement différent.

---

## Layout pages plein écran (login, token, etc.)

- **Conteneur** : hauteur `100dvh` (dynamic viewport height) ou `position: fixed; inset: 0` pour bloquer tout scroll
- **Centrage** : flex, colonne, centré horizontalement et verticalement
- **⚠️ Ne jamais utiliser `100vh`** sur ces pages — dépasse le viewport visible sur mobile (barre du navigateur) → scroll indésirable

---

## Règle CSS — No Camouflage

> Réflexe IA identifié — contexte complet et pourquoi dans FEEDBACK.md (même dossier).
> Ne jamais empiler des styles conflictuels pour masquer un bug visuel — choisir un seul système de style cohérent et le respecter partout. Toujours utiliser l'élément HTML sémantique réel, jamais un `<div>`/`<span>` avec un handler de clic à la place d'un `<button>`.

Tableau détaillé et exemples spécifiques à la stack → `frontend/preset-actif.md`.

---

## Fix inputs transparents / placeholder — spécifique à la stack
> Certaines stacks ont des bugs connus sur les inputs (ex. Tailwind + DaisyUI v5 et `oklch()` sur mobile). Voir `frontend/preset-actif.md` avant de considérer un champ de formulaire terminé.

---

## Règles mobile — Touch targets

| Élément | Taille minimale |
|---------|----------------|
| Input / Select | height ≈ 44px |
| Bouton action (icône) | 36×36px |
| Bouton primaire | ≥ 44px |
| Bouton icône seule | zone tap ≈ 40px |

> Classes/CSS pour atteindre ces tailles selon la stack → `frontend/preset-actif.md`.

---

## Convention par zone
> Ex. : un préfixe de route qui a sa propre convention (layout admin, pas de nav mobile, etc.)

| Route | Convention |
|-------|-----------|
| | |
