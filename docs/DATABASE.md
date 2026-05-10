# DATABASE
> Structure complète de la base de données.
> Lire avant toute création ou modification de table ou colonne.
> Ne jamais créer une table ou colonne absente de ce fichier sans mettre à jour ce fichier d'abord.
> Ne jamais écrire les clés API ici — elles vont dans .env.
> Format d'ajout : "Mets à jour DATABASE.md — table [nom]"

---

## Plateforme
> Supprimer les options non utilisées.

- Plateforme : [ex: Supabase / PlanetScale / MongoDB Atlas / Firebase]
- ORM : [ex: Prisma / Drizzle / aucun]
- URL de connexion : dans .env → [NOM_VARIABLE]

---

## Tables

> Template à copier pour chaque nouvelle table :
```
### [nom_table]
| Colonne | Type | Obligatoire | Description |
|---------|------|-------------|-------------|
| id | uuid | oui | Clé primaire — généré automatiquement |
| created_at | timestamp | oui | Date de création — généré automatiquement |
| updated_at | timestamp | non | Date de modification |
| [colonne] | [type] | [oui/non] | [description] |
```

---

### users
| Colonne | Type | Obligatoire | Description |
|---------|------|-------------|-------------|
| id | uuid | oui | Clé primaire |
| email | text | oui | Email unique |
| full_name | text | non | Nom complet |
| avatar_url | text | non | URL de l'avatar |
| created_at | timestamp | oui | Date de création |

---

## Relations
> Format : table_a.colonne → table_b.colonne (type de relation)

- [ex: posts.user_id → users.id (many-to-one)]

---

## Règles de sécurité (RLS)
> Supabase uniquement. Supprimer si autre plateforme.

| Table | Règle |
|-------|-------|
| users | Lecture et écriture uniquement par le propriétaire |
| [table] | [règle] |

---

## Types de données disponibles
> Référence rapide pour remplir les tables.

| Type | Usage |
|------|-------|
| uuid | Identifiants uniques |
| text | Textes courts et longs |
| integer | Nombres entiers |
| decimal | Prix, pourcentages |
| boolean | Vrai / faux |
| timestamp | Dates et heures |
| jsonb | Données structurées flexibles |
| text[] | Tableau de textes |
