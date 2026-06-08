# DATABASE
> Structure complète de la base de données.
> Lire avant toute création ou modification de table ou colonne.
> Ne jamais créer une table absente de ce fichier sans le mettre à jour d'abord.
> Format d'ajout : "Mets à jour DATABASE.md — table [nom]"

---

## Plateforme
- Plateforme :
- ORM :
- URL de connexion : dans .env → `DATABASE_URL`
- Migrations :

---

## Tables

### [nom_table]
> Description courte de la table.

| Colonne | Type | Obligatoire | Description |
|---------|------|-------------|-------------|
| id | uuid | oui | Clé primaire |
| created_at | timestamp | oui | Date de création |

---

## Relations

---

## Règles métier

