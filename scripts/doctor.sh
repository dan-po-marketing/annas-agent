#!/usr/bin/env bash
set -euo pipefail
PROFILE="${HERMES_PROFILE:-annas-agent}"
fail=0

say_ok() { printf "✓ %s\n" "$1"; }
say_warn() { printf "! %s\n" "$1"; }
say_fail() { printf "✗ %s\n" "$1"; fail=1; }

if command -v hermes >/dev/null 2>&1; then
  say_ok "Hermes installed: $(hermes --version 2>/dev/null || echo available)"
else
  say_fail "Hermes is not installed. Install Hermes first."
fi

if command -v git >/dev/null 2>&1; then say_ok "git available"; else say_fail "git missing"; fi

if command -v ffmpeg >/dev/null 2>&1; then
  say_ok "ffmpeg available for Telegram OGG/Opus voice notes"
else
  say_warn "ffmpeg missing; Hermes Edge TTS may still work, but custom Telegram voice-note conversion needs ffmpeg"
fi

if command -v hermes >/dev/null 2>&1; then
  if HERMES_PROFILE="$PROFILE" hermes memory status 2>/tmp/annas-agent-memory-status.txt; then
    if grep -qi "Provider:.*holographic\|Provider:.*honcho\|Provider:.*hindsight\|Provider:.*mem0\|Provider:.*openviking\|Provider:.*retaindb" /tmp/annas-agent-memory-status.txt \
       && grep -qi "available.*✓\|available" /tmp/annas-agent-memory-status.txt; then
      say_ok "structured memory provider appears active for profile '$PROFILE'"
    else
      say_fail "structured memory provider is not active for profile '$PROFILE'. Run: HERMES_PROFILE=$PROFILE hermes memory setup"
      cat /tmp/annas-agent-memory-status.txt || true
    fi
  else
    say_fail "could not read memory status for profile '$PROFILE'"
  fi
fi

if command -v hermes >/dev/null 2>&1; then
  if HERMES_PROFILE="$PROFILE" hermes config >/tmp/annas-agent-config.txt 2>/dev/null; then
    if grep -qi "tts" /tmp/annas-agent-config.txt; then
      say_ok "Hermes config readable; check TTS provider if voice replies fail"
    else
      say_warn "TTS section not visible in config output; set: HERMES_PROFILE=$PROFILE hermes config set tts.provider edge"
    fi
  fi
fi

if [ "$fail" -eq 0 ]; then
  echo "Doctor passed."
else
  echo "Doctor found blockers. Fix them before treating setup as complete."
fi
exit "$fail"
