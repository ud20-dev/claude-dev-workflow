---
name: minmax
description: "À appliquer lors du séquençage d'un ajout, d'un refactoring ou d'une réécriture. Retirer d'abord le poids mort, les validateurs redondants et les références orphelines, puis construire sur cette base simplifiée."
disable-model-invocation: true
---

# Soustraire avant d'ajouter

Quand tu fais évoluer un système, retire la complexité d'abord, puis construis. Supprimer d'abord te donne une base plus simple, ce qui rend le prochain ajout plus petit et moins fragile.

**Pourquoi :** ajouter à un système complexe accumule la complexité. Retirer d'abord réduit la surface, révèle la structure essentielle, et rend généralement la prochaine décision de conception évidente. Privilégie la soustraction par défaut.

Fais de la simplification un investissement continu. Laisse la conception légèrement plus simple et plus capable derrière toi, sur une surface identique ou plus petite que celle que tu as trouvée.

**Le principe :**
- Séquence la suppression avant la construction
- Coupe avant de polir (atteins le minimum avant d'investir dans la qualité)
- Conçois pour l'usage observé, pas pour des cas limites spéculatifs
- Pas de validateurs, parseurs ou garde-fous spéculatifs au-delà de ce que la spec exige
- Les fonctionnalités hors spec traînent des validateurs derrière elles. La persistance, la relance au démarrage et la migration de schéma ont chacune besoin de garde-fous pour défendre leurs entrées.
- Simplifie les prompts (retire les instructions redondantes, les templates excessifs)
- Quand une référence n'apporte aucun contenu nouveau, supprime-la plutôt que de la laisser comme référence orpheline
