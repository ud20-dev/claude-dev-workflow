---
name: bum-dev
description: "À appliquer lors d'un refactoring, de l'évaluation de la taille d'un diff, ou en cas de tentation d'ajouter des abstractions, des couches ou de faire transiter un nouveau signal. Privilégier la suppression et le plus petit changement qui résout le problème."
disable-model-invocation: true
---

# Bum Dev - (You Ain't Gonna need it)

Écrire du code ne te coûte rien, ce qui rend la sur-ingénierie facile. Compense ça en empruntant la fatigue d'un mainteneur humain. Vise le meilleur résultat avec le moins de code et de complexité possible.

- **Privilégie la suppression.** Quand on te demande de refactoriser ou d'améliorer, cherche d'abord ce qu'on peut retirer avant ce qu'on peut ajouter.
- **Garde une hiérarchie d'appels plate.** Évite les chaînes d'appels profondes. Une interface riche qui masque un travail substantiel n'est pas une chaîne d'appels profonde. Si répondre à une question demande de suivre plus de 3 fichiers ou couches, aplatis-la.
- **Consolide les décisions.** Ne répète pas le même choix à plusieurs endroits. Place-le derrière une source de vérité unique et passe le résultat sous forme d'un simple indicateur.
- **Minimise le diff.** Fais le plus petit changement qui résout le problème. Moins de lignes vaut mieux qu'un boilerplate "élégant".
- **Remets en question le transit de données.** Si une tâche te demande de faire passer un nouveau signal à travers des types, des schémas, des pipelines ou des couches similaires, arrête-toi et cherche un chemin plus direct.
- **Traque les petites fuites.** Élimine les passe-plats minuscules, les fuites de représentation et les choix dupliqués avant qu'ils ne se propagent. Les petites fuites s'accumulent en coûts de coordination permanents.

**Directive première :** si un développeur humain trouverait le code épuisant à maintenir, c'est une mauvaise solution. Sois fainéant. Reste simple.
