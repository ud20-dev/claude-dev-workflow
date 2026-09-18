#!/usr/bin/env bash
# PreToolUse hook (Write/Edit): prints a short, targeted reminder based on
# the file path being touched. Turns a "Règles absolues" line that relied
# entirely on self-discipline into something visible at the moment of the
# write, not just a rule stated once and hoped for later.
#
# Never blocks anything: always exits 0. Prints nothing if the path doesn't
# match a known pattern, or if the input can't be read for any reason —
# a missed reminder is fine, a broken Write/Edit call is not.
set -uo pipefail

INPUT="$(cat 2>/dev/null || true)"
FILE_PATH=$(printf '%s' "$INPUT" | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' 2>/dev/null | head -1 | sed -E 's/.*:[[:space:]]*"(.*)"/\1/')

[ -z "${FILE_PATH:-}" ] && exit 0

# Editing docs/ itself IS the "check the doc" action — no reminder needed.
case "$FILE_PATH" in
  */docs/*|docs/*) exit 0 ;;
esac

REMINDERS=()

case "$FILE_PATH" in
  */components/*|*[Cc]omponent*)
    REMINDERS+=("COMPONENTS.md vérifié avant de créer ce composant ?")
    ;;
esac

case "$FILE_PATH" in
  */migrations/*|*[Ss]chema*|*[Dd]atabase*)
    REMINDERS+=("backend/DATABASE.md à jour avec ce changement de schéma ?")
    ;;
esac

case "$FILE_PATH" in
  *.tsx|*.jsx|*.ts|*.js|*.mjs|*.py|*.go|*.rb|*.php|*.java|*.kt|*.swift|*.rs)
    REMINDERS+=("Ce changement mérite-t-il une entrée ERRORS.md (bug corrigé) ou CHANGELOG.md (changement significatif) ?")
    ;;
esac

[ "${#REMINDERS[@]}" -eq 0 ] && exit 0

echo "Rappel ciblé ($FILE_PATH) :"
printf '  - %s\n' "${REMINDERS[@]}"
exit 0
