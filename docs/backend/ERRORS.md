# ERRORS — BACKEND
> Historique de tous les bugs backend rencontrés et résolus.
> Lire quand un bug apparaît côté serveur/API/base de données — vérifier s'il a déjà été résolu.
> Ne jamais supprimer une entrée existante.
> Format d'ajout : "Ajoute dans backend/ERRORS.md — [description du bug]"

---

## Comment utiliser ce fichier
1. Un bug apparaît → dire "Lis backend/ERRORS.md — j'ai ce bug : [description]"
2. Claude vérifie si le bug existe déjà
3. Si oui → appliquer la solution existante
4. Si non → résoudre puis ajouter dans ce fichier

---

## Template
> Copier ce template pour chaque nouveau bug résolu.

```
### [Titre court du bug]
- Date : JJ/MM/AAAA
- Fichier concerné : [chemin/vers/fichier.py]
- Symptôme : [ce qui se passe — message d'erreur exact si possible]
- Cause : [pourquoi ça arrive]
- Solution : [ce qu'on a fait pour corriger]
```

---

## Bugs résolus
> Les entrées avec `Date : —` sont des connaissances génériques (vraies sur tout projet utilisant cette stack), pas des incidents d'un projet précis. Une nouvelle entrée issue d'un vrai bug rencontré doit, elle, porter une date réelle.

### SQLAlchemy async — lazy loading relation non chargée
- Date : —
- Fichier concerné : tout fichier `api/*.py` avec des relations
- Symptôme : endpoint lève `MissingGreenlet` ou crash silencieux à l'accès d'une relation
- Cause : accès à `obj.relation` sans eager loading dans un contexte async SQLAlchemy — le lazy loading n'est pas supporté en async
- Solution : ajouter `.options(selectinload(Model.relation))` à toutes les requêtes qui accèdent à des relations
