#!/usr/bin/env bash
# Tells a Claude agent working on an older install of this template what
# changed upstream and how to migrate. Read-only: prints information,
# never edits files. Ships inside .claude/scripts/, so it travels with
# .claude/ into any project that ran install.sh.
#
# Usage: .claude/scripts/changelog.sh

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCS_DIR="${CLAUDE_PROJECT_DIR:-$(cd "$SCRIPT_DIR/../.." && pwd)}/docs"
README_URL="https://raw.githubusercontent.com/ud20-dev/claude-dev-workflow/main/README.md"
CHANGELOG_URL="https://raw.githubusercontent.com/ud20-dev/claude-dev-workflow/main/CHANGELOG.md"

LOCAL_VERSION=$(grep -m1 -oE '[0-9]+\.[0-9]+\.[0-9]+' "$DOCS_DIR/CLAUDE.md" 2>/dev/null)
REMOTE_VERSION=$(curl -sf --max-time 3 "$README_URL" 2>/dev/null | grep -m1 -oE '[0-9]+\.[0-9]+\.[0-9]+')

echo "Installed template version : ${LOCAL_VERSION:-unknown}"
echo "Latest published version   : ${REMOTE_VERSION:-unknown (offline or fetch failed)}"
echo

if [ -z "$LOCAL_VERSION" ]; then
  echo "Could not read the installed version from docs/CLAUDE.md. Nothing to compare."
  exit 0
fi

if [ -n "$REMOTE_VERSION" ] && [ "$LOCAL_VERSION" = "$REMOTE_VERSION" ]; then
  echo "Already up to date. Nothing to migrate."
  exit 0
fi

echo "----------------------------------------------------------------------"
echo "WHAT CHANGED (upstream CHANGELOG.md)"
echo "----------------------------------------------------------------------"
REMOTE_CHANGELOG=$(curl -sf --max-time 3 "$CHANGELOG_URL" 2>/dev/null)
if [ -n "$REMOTE_CHANGELOG" ]; then
  echo "$REMOTE_CHANGELOG"
else
  echo "(offline: could not fetch the upstream CHANGELOG.md, showing known migration steps only)"
fi
echo

LOCAL_MAJOR="${LOCAL_VERSION%%.*}"
REMOTE_MAJOR="${REMOTE_VERSION%%.*}"

if [ -z "$REMOTE_MAJOR" ]; then
  echo "Could not determine whether migration is needed (no published version fetched). Try again with a network connection."
  exit 0
fi

if [ "$LOCAL_MAJOR" = "$REMOTE_MAJOR" ]; then
  echo "No structural migration needed. Same major version, see the changelog above for what's new."
  exit 0
fi

if [ "$LOCAL_MAJOR" -ge 2 ] 2>/dev/null; then
  echo "No known migration steps for this jump yet. Check the changelog above for what changed."
  exit 0
fi

EM_DASH=$(printf '\xe2\x80\x94')

cat <<EOF
----------------------------------------------------------------------
MIGRATION REQUIRED: 1.x (FIFO) to 2.x (LIFO). Breaking change.
----------------------------------------------------------------------
Starting in 2.0.0, these files switched from FIFO (append at the
bottom) to LIFO (newest entry on top), each with a "<!-- SENTINEL -->"
marker showing exactly where the next entry goes:

  docs/PROGRESS.md
  docs/DECISIONS.md
  docs/CHANGELOG.md
  docs/frontend/ERRORS.md
  docs/backend/ERRORS.md
  docs/frontend/FEEDBACK.md
  docs/backend/FEEDBACK.md

Session loading is also automatic now via a SessionStart hook
(.claude/hooks/session-start.sh) instead of the old manual
"Lis docs/CLAUDE.md..." prompt. Nothing to do there but stop typing it.

Migration steps for an agent to follow by hand. Never on a dirty
working tree: run \`git status\` first and stop if uncommitted changes
exist. This touches real project history, not disposable files.

1. For each file above that has real entries: read every "### " block
   under its main section, reverse their order (newest entry first),
   and add "<!-- SENTINEL: ... -->" right after the section heading,
   above the first entry. Never edit the content of an entry, only
   its position in the file.
2. In docs/frontend/ERRORS.md, docs/backend/ERRORS.md,
   docs/frontend/FEEDBACK.md, docs/backend/FEEDBACK.md specifically:
   entries with "Date : ${EM_DASH}" are generic seed knowledge, not
   project history. Leave their relative order alone and keep them as
   a block at the bottom. Only reverse-order the entries that carry a
   real date, and place that reversed block above the dateless ones.
3. Add "La plus recente en haut" (or equivalent) to each file's header
   comment block if it isn't already there.
4. Show the user a \`git diff\` before considering this done. This
   reorders real project history, they should see exactly what moved.
5. Once confirmed, update the version line at the top of
   docs/CLAUDE.md to match the new installed version.
EOF
