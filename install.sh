#!/usr/bin/env bash
# Installe claude-dev-workflow dans le projet courant.
# À lancer depuis l'intérieur du dossier claude-dev-workflow, une fois cloné
# DANS le projet cible (ex. mon-projet/claude-dev-workflow/).
# Déplace docs/ vers la racine du projet (dossier parent), puis supprime le
# reste du dossier claude-dev-workflow (devenu inutile une fois docs/ sorti).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"
SRC_DOCS="$SCRIPT_DIR/docs"
DEST_DOCS="$PARENT_DIR/docs"

if [ ! -d "$SRC_DOCS" ]; then
  echo "Erreur : $SRC_DOCS introuvable." >&2
  echo "Ce script doit être lancé depuis la racine de claude-dev-workflow, elle-même clonée dans le projet cible." >&2
  exit 1
fi

if [ -e "$DEST_DOCS" ]; then
  echo "Erreur : $DEST_DOCS existe déjà." >&2
  echo "Rien n'a été touché — fusionnez ou supprimez ce dossier manuellement avant de relancer." >&2
  exit 1
fi

echo "Ce script va :"
echo "  1. Déplacer $SRC_DOCS -> $DEST_DOCS"
echo "  2. Supprimer $SCRIPT_DIR (le reste de claude-dev-workflow, devenu inutile)"
echo
read -r -p "Continuer ? [y/N] " REPLY
case "$REPLY" in
  [yY][eE][sS]|[yY]) ;;
  *)
    echo "Annulé — rien n'a été modifié."
    exit 0
    ;;
esac

mv "$SRC_DOCS" "$DEST_DOCS"
echo "docs/ déplacé vers $DEST_DOCS"

cd "$PARENT_DIR"
rm -rf "$SCRIPT_DIR"

echo
echo "Installation terminée : $DEST_DOCS est maintenant le dossier docs/ principal du projet."
echo "Dis à Claude : \"Lis docs/CLAUDE.md puis docs/PROGRESS.md et dis-moi où on en est en 5 lignes maximum\""
