---
name: feedback_no_css_camouflage
description: Ne jamais camoufler des éléments cassés avec du CSS supplémentaire — utiliser les vrais éléments HTML sémantiques
metadata:
  type: feedback
---

Ne jamais empiler du CSS pour masquer un conflit de styles. Si un élément DaisyUI produit un double border, un floating label ou un ring inattendu au focus, la bonne réponse est de retirer la classe DaisyUI problématique et d'utiliser du Tailwind pur — pas d'ajouter `rounded-xl`, `focus:outline-none` ou d'autres overrides par-dessus.

**Why:** L'utilisateur appelle ça du "camouflage" — des éléments qui ressemblent à quelque chose mais ne se comportent pas comme de vrais éléments. C'est le problème classique de l'IA qui génère du faux HTML sémantique.

## Règle : DaisyUI OU Tailwind pur — jamais les deux en conflit

| ❌ Camouflage | ✅ Correct |
|---|---|
| `input input-bordered rounded-xl focus:outline-none` | `border border-gray-200 rounded-lg px-3 py-2 focus:outline-none` |
| `<div onClick={toggle}>` | `<label>` qui enveloppe la checkbox |
| `<span onClick={decrement}>` | `<button type="button" onClick={decrement}>` |
| `btn btn-neutral` qui se comporte mal | `bg-neutral text-neutral-content py-2 rounded-md` |
| DaisyUI class + `rounded-xl` override | Choisir l'un ou l'autre |

**How to apply:**
- **Inputs** : si DaisyUI `input` cause des conflits → retirer la classe, utiliser `border border-gray-200 rounded-lg px-3 py-2 focus:outline-none`
- **Boutons** : si `btn` cause des conflits → classes Tailwind directes
- **Interactivité** : utiliser les vrais éléments HTML (`<button>`, `<label>`, `<a>`) — jamais `<div>` ou `<span>` avec `onClick`
- **Checkbox** avec stopPropagation sur le parent → utiliser `<label>` qui enveloppe la checkbox
- **Ne jamais surcharger** les propriétés que DaisyUI gère déjà (`border-radius`, `border-color`, `outline`, `box-shadow`)
- Choisir : soit DaisyUI gère tout, soit Tailwind pur — jamais les deux en conflit
