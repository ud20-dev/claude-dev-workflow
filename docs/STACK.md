# STACK
> Configuration technique du projet.
> Lire avant toute installation, commande terminal ou suggestion de technologie.
> Ne jamais suggérer une technologie absente de ce fichier sans demander permission.
> Si une version change → mettre à jour ce fichier immédiatement.
> Format d'ajout : "Mets à jour STACK.md — [technologie] [version]"

---

## Instructions de remplissage
> Conserver uniquement les technologies utilisées.
> Supprimer les lignes non utilisées.
> Ne pas laisser de champs vides — soit rempli, soit supprimé.

---

## Frontend
> Supprimer ce bloc si pas de frontend.

- Framework : [ex: React / Next.js / Vue / Nuxt / Svelte]
- Langage : [ex: TypeScript / JavaScript]
- Style : [ex: Tailwind CSS / CSS Modules / Styled Components]
- Version Node : [ex: 20.x]

---

## Backend
> Supprimer ce bloc si pas de backend séparé.

- Runtime : [ex: Node.js / Deno / Bun]
- Framework : [ex: Express / Fastify / Hono]
- Type API : [ex: REST / GraphQL / tRPC]

---

## Base de données
> Supprimer ce bloc si pas de base de données.

- Plateforme : [ex: Supabase / PlanetScale / MongoDB Atlas / Firebase]
- ORM : [ex: Prisma / Drizzle / aucun]

---

## Authentification
> Supprimer ce bloc si pas d'authentification.

- Solution : [ex: Supabase Auth / NextAuth / Clerk / Auth0 / custom]

---

## Hébergement
- Frontend : [ex: Vercel / Netlify / Cloudflare Pages]
- Backend : [ex: Railway / Render / Fly.io / même que frontend]
- Domaine : [ex: monprojet.com / sous-domaine Vercel pour l'instant]

---

## Variables d'environnement
> Ne jamais écrire les valeurs ici — uniquement les noms des variables.
> Les valeurs vont dans le fichier .env à la racine du projet.

```
[NOM_VARIABLE_1]=
[NOM_VARIABLE_2]=
[NOM_VARIABLE_3]=
```

---

## Commandes
> Mettre à jour si les commandes changent.

| Action | Commande |
|--------|----------|
| Installer | [ex: npm install] |
| Démarrer | [ex: npm run dev] |
| Build | [ex: npm run build] |
| Déployer | [ex: git push origin main] |
| Autre | [ex: npm run lint] |
