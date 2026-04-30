# Anna's Agent

A Reflect-only Hermes Agent starter: one Telegram-first assistant for evidence-first reflection, structured memory, voice replies, and lightweight check-ins.

The repo is public-safe by design. It contains docs, prompts, templates, skills, and setup scripts — not private memories, tokens, sessions, Telegram IDs, or credentials.

## What it does

- Helps the user unpack states, patterns, conflicts, and changes over time.
- Keeps layers separate: raw observations, events, stable beliefs, temporary states, contradictions, and hypotheses.
- Uses built-in Hermes memory plus a required structured/holographic memory provider.
- Supports Telegram as the main interface.
- Includes TTS/voice replies from v0.
- Offers optional daily body/mood check-ins and weekly grounded insight prompts.

## Quick start

```bash
git clone https://github.com/<owner>/annas-agent.git
cd annas-agent
./scripts/setup.sh
```

If setup blocks on credentials or a Telegram bot token, open the folder in Codex, run `/init`, and let Codex guide only those manual steps.

## Hard requirements

1. Hermes Agent installed.
2. An isolated Hermes profile for this agent.
3. Structured memory provider active — recommended: `holographic` local provider.
4. Telegram gateway configured if Telegram is the main interface.
5. TTS/voice path configured — recommended free path: Edge TTS; macOS can fall back to `say` + `ffmpeg` for Telegram voice notes.

Run:

```bash
./scripts/doctor.sh
```

## Repository boundaries

Commit these:
- docs
- prompt templates
- skills
- setup/check scripts

Never commit these:
- `.env`
- `auth.json`
- Telegram tokens or chat IDs
- memory databases
- session transcripts
- logs
- profile backups

See `docs/privacy-and-memory.md`.
