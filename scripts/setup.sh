#!/usr/bin/env bash
set -euo pipefail
PROFILE="${HERMES_PROFILE:-annas-agent}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT"
./scripts/install-profile.sh
if ! ./scripts/doctor.sh; then
  cat <<BLOCKED

Setup is not complete yet. Fix the blocker above, then rerun:
  ./scripts/setup.sh

Common required fixes:
- Structured memory: HERMES_PROFILE=$PROFILE hermes memory setup
- Model/provider:     HERMES_PROFILE=$PROFILE hermes setup model
- Telegram:           HERMES_PROFILE=$PROFILE hermes gateway setup
- Voice/TTS:          HERMES_PROFILE=$PROFILE hermes config set tts.provider edge

BLOCKED
  exit 1
fi

cat <<NEXT

Next steps if doctor passed:
1. Configure provider/model if needed:
   HERMES_PROFILE=$PROFILE hermes setup model
2. Configure Telegram:
   HERMES_PROFILE=$PROFILE hermes gateway setup
   HERMES_PROFILE=$PROFILE hermes gateway install
   HERMES_PROFILE=$PROFILE hermes gateway start
3. In Telegram, send: Start Reflect onboarding.

If doctor failed on structured memory, run:
   HERMES_PROFILE=$PROFILE hermes memory setup
and choose a local structured provider, preferably holographic if available.
NEXT
