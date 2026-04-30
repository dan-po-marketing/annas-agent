# Codex Onboarding

When the user opens this repo in Codex and runs `/init`, guide setup in this order.

## Step 1: Discover
Run:

```bash
./scripts/doctor.sh
```

Check:
- Hermes installed;
- profile exists or can be created;
- structured memory provider active;
- TTS/voice path available;
- Telegram gateway status.

## Step 2: Install profile assets
Run:

```bash
./scripts/install-profile.sh
```

This copies public docs/templates/skills into the isolated Hermes profile. It must not copy tokens, memory DBs, logs, sessions, or backups.

## Step 3: Resolve blockers
Only ask for what is blocked:
- provider/model login;
- Telegram bot token;
- structured memory setup;
- TTS provider choice;
- local vs VPS service installation.

## Step 4: Hand off to Telegram
Once gateway is working, tell the user to send:

```text
Start Reflect onboarding.
```

The Telegram agent should use `docs/onboarding-telegram.md`.
