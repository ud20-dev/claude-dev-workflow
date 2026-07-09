# UI-QUALITY
> Direction artistique — pourquoi une interface techniquement correcte peut quand même "sentir l'IA".
> Lire avant de considérer une interface terminée, pas avant de la commencer.
> Différent de STYLE.md : STYLE.md fixe des valeurs exactes (radius, couleurs) ; ce fichier fixe un niveau d'exigence. Respecter STYLE.md ne suffit pas si le résultat "sent l'IA" — les deux sont nécessaires.

---

## ❌ Style IA générique → ✅ Niveau produit

| ❌ Symptôme | ✅ À la place |
|---|---|
| Dégradé violet→bleu sur les éléments "premium" | Une seule couleur d'accent, utilisée avec parcimonie |
| Même radius partout (tout en `rounded-2xl`) | Radius qui varie selon la hiérarchie (voir STYLE.md > Composants UI) |
| Une seule taille/poids de police pour tout | Vraie hiérarchie typo : titre / sous-titre / corps / légende, tailles ET poids différents |
| Ombres lourdes (`shadow-xl`) partout | Profondeur par bordures fines (1px, faible opacité) |
| Emoji utilisés comme icônes dans un produit sérieux | Set d'icônes cohérent |
| États hover/focus/active instantanés, sans transition | Transition systématique (150–200ms, easing doux) sur tout élément interactif |
| Espacement uniforme, sans rythme | Espacement qui varie selon l'importance — blocs liés proches, sections distinctes séparées |
| Noir/blanc purs (`#000000`/`#ffffff`) | Neutres légèrement teintés (`#0a0a0a`, etc.) |
| Copy générique ("Get Started", "Welcome") | Contenu pensé pour le produit, pas du remplissage |

---

## Règle
> Avant de livrer une interface : "est-ce que ça pourrait passer pour conçu par une équipe design, ou ça se reconnaît comme généré ?" En cas de doute, repasser le tableau ci-dessus ligne par ligne.
> Réflexe IA identifié — voir `frontend/FEEDBACK.md` ("Interface qui respecte STYLE.md mais 'sent l'IA'").

---

## À remplir par projet

- Niveau de finition visé : [ex. SaaS B2B premium / outil interne / grand public]
- Références visuelles (niveau d'exigence, pas à copier) : [ex. Vercel, Linear, Neon]
- Interdits explicites du projet : [ex. dégradés, emoji-icônes, illustrations stock]
