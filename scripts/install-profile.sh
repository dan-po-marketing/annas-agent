#!/usr/bin/env bash
set -euo pipefail
PROFILE="${HERMES_PROFILE:-annas-agent}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE_HOME="${HOME}/.hermes/profiles/${PROFILE}"

if ! command -v hermes >/dev/null 2>&1; then
  echo "Hermes is not installed. Install Hermes first."
  exit 1
fi

if ! hermes profile show "$PROFILE" >/dev/null 2>&1; then
  hermes profile create "$PROFILE"
fi

mkdir -p "$PROFILE_HOME/docs" "$PROFILE_HOME/skills" "$PROFILE_HOME/templates"
cp -R "$ROOT/docs/." "$PROFILE_HOME/docs/"
cp -R "$ROOT/skills/." "$PROFILE_HOME/skills/"
cp -R "$ROOT/templates/." "$PROFILE_HOME/templates/"

if [ ! -f "$PROFILE_HOME/USER.md" ]; then
  cp "$ROOT/templates/initial-user-profile.md" "$PROFILE_HOME/USER.md"
fi
if [ ! -f "$PROFILE_HOME/MEMORY.md" ]; then
  cp "$ROOT/templates/initial-memory.md" "$PROFILE_HOME/MEMORY.md"
fi

HERMES_PROFILE="$PROFILE" hermes config set tts.provider edge || true

echo "Installed public Reflect assets into profile: $PROFILE"
echo "Next required check: HERMES_PROFILE=$PROFILE hermes memory status"
