#!/usr/bin/env bash
# SessionStart hook: injects docs/CLAUDE.md + the latest sessions of docs/PROGRESS.md
# into context automatically, and checks the template version in silence.
set -uo pipefail

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-.}"
DOCS="$PROJECT_DIR/docs"
TEMPLATE_README_URL="https://raw.githubusercontent.com/ud20-dev/claude-dev-workflow/main/README.md"
SESSIONS_KEPT=3

# 1. Version check - silent unless there's an actual update. No network / no match → say nothing.
if [ -f "$DOCS/CLAUDE.md" ]; then
  LOCAL_VERSION=$(grep -m1 -oE '[0-9]+\.[0-9]+\.[0-9]+' "$DOCS/CLAUDE.md" 2>/dev/null)
  REMOTE_VERSION=$(curl -s --max-time 2 "$TEMPLATE_README_URL" 2>/dev/null | grep -m1 -oE '[0-9]+\.[0-9]+\.[0-9]+')

  if [ -n "$LOCAL_VERSION" ] && [ -n "$REMOTE_VERSION" ] && [ "$LOCAL_VERSION" != "$REMOTE_VERSION" ]; then
    echo "TEMPLATE UPDATE AVAILABLE: installed $LOCAL_VERSION, latest $REMOTE_VERSION. Mention it to the user once; only run the 'Mise à jour du template' procedure in docs/CLAUDE.md if they agree."
    echo "---"
  fi
fi

# 2. Orchestrator file - fixed reference content, loaded in full every time.
if [ -f "$DOCS/CLAUDE.md" ]; then
  cat "$DOCS/CLAUDE.md"
  echo "---"
fi

# 3. PROGRESS.md - everything up to "## Sessions" in full (current-state tables),
#    then only the latest N session entries (delimiter: "### Session").
if [ -f "$DOCS/PROGRESS.md" ]; then
  awk -v n="$SESSIONS_KEPT" '/^### Session/{c++} c>n{next} 1' "$DOCS/PROGRESS.md"
fi
