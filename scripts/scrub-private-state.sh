#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# Keep this repo public-safe. Add person-specific forbidden terms in a local,
# uncommitted file named .private-audit-patterns if needed.
base_patterns=(
  'TELEGRAM_BOT_TOKEN=[^[:space:]]+'
  'BOT_TOKEN=[^[:space:]]+'
  'OPENAI_API_KEY=[^[:space:]]+'
  'ANTHROPIC_API_KEY=[^[:space:]]+'
  'OPENROUTER_API_KEY=[^[:space:]]+'
  'gmail\.com'
  '-[0-9]{8,}'
)
patterns="$(IFS='|'; echo "${base_patterns[*]}")"

if [ -f .private-audit-patterns ]; then
  extra_patterns="$(grep -vE '^\s*(#|$)' .private-audit-patterns | paste -sd '|' -)"
  if [ -n "$extra_patterns" ]; then
    patterns="${patterns}|${extra_patterns}"
  fi
fi

if command -v rg >/dev/null 2>&1; then
  if rg -n "$patterns" . --glob '!scripts/scrub-private-state.sh'; then
    echo "Private/specific terms found. Review before pushing."
    exit 1
  fi
elif command -v grep >/dev/null 2>&1; then
  if grep -RInE "$patterns" . --exclude='scrub-private-state.sh' --exclude-dir='.git'; then
    echo "Private/specific terms found. Review before pushing."
    exit 1
  fi
else
  echo "No text search tool found; install ripgrep or grep and rerun."
  exit 1
fi

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git status --short --untracked-files=all
else
  echo "Not a git repository yet; skipping git status."
fi
echo "Privacy text scan passed."
