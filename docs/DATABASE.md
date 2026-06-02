# DATABASE
> Structure complète de la base de données.
> Lire avant toute création ou modification de table ou colonne.
> Ne jamais créer une table absente de ce fichier sans le mettre à jour d'abord.
> Ne jamais écrire les clés API ici — elles vont dans .env.
> Format d'ajout : "Mets à jour DATABASE.md — table [nom]"

---

## Plateforme
- Plateforme : [ex: PostgreSQL / Supabase / MongoDB]
- ORM : [ex: Prisma / SQLAlchemy / Drizzle / aucun]
- URL de connexion : dans .env → [NOM_VARIABLE]

---

## Tables

> Template à copier pour chaque nouvelle table :
```
### [nom_table]
| Colonne | Type | Obligatoire | Description |
|---------|------|-------------|-------------|
| id | uuid | oui | Clé primaire |
| created_at | timestamp | oui | Date de création |
| [colonne] | [type] | [oui/non] | [description] |
```

---

### [nom_table]
| Colonne | Type | Obligatoire | Description |
|---------|------|-------------|-------------|
| id | uuid | oui | Clé primaire |
| created_at | timestamp | oui | Date de création |

---

## Relations
- [ex: posts.user_id → users.id (many-to-one)]

---

## Types disponibles

| Type | Usage |
|------|-------|
| uuid | Identifiants uniques |
| text | Textes |
| integer | Nombres entiers |
| decimal | Prix, pourcentages |
| boolean | Vrai / faux |
| timestamp | Dates et heures |
| jsonb | Données structurées flexibles |
