# Anna's Agent Workspace

## Purpose
This repo is a Reflect-only Hermes Agent starter for one person. It should stay small, public-safe, and practical.

## Source of truth
- `docs/reflect-brief.md` — product shape and operating rules.
- `docs/reflect-architecture.md` — memory and reasoning architecture.
- `docs/reflect-memory-schema.md` — structured memory layers and update policy.
- `docs/reflect-chat-runtime.md` — visible chat behavior.
- `docs/reflect-system-prompt.md` — prompt material to copy into the Hermes profile context.
- `docs/onboarding-codex.md` — how Codex should guide setup.
- `docs/onboarding-telegram.md` — first-run Telegram onboarding.

## Operating rules for Codex/Hermes
- Keep this repo free of private runtime state.
- Do not add broad assistant lanes; this is Reflect-only.
- Do not publish user memories, chat transcripts, tokens, auth files, or Telegram IDs.
- Treat structured memory as required, not optional.
- Treat TTS/voice replies as included in v0, not a later upgrade.
- Use free/local paths first where possible.
- Ask only when a missing decision blocks setup.
- If a credential, provider login, Telegram token, or structured memory plugin is missing, say exactly what is blocked and stop rather than inventing a fallback.

## `/init` behavior
When the user opens this repo in Codex and runs `/init`:
1. Read this file and `README.md`.
2. Run `./scripts/doctor.sh`.
3. If Hermes is missing, help install Hermes.
4. Run `./scripts/install-profile.sh`.
5. Verify structured memory with `HERMES_PROFILE=annas-agent hermes memory status`.
6. Verify TTS/voice with `HERMES_PROFILE=annas-agent hermes config` and local dependency checks.
7. Guide Telegram gateway setup.
8. Hand off to Telegram onboarding.

## Response style
Be concise, warm, and concrete. Keep setup explanations practical: what, why it matters, and the next command.
