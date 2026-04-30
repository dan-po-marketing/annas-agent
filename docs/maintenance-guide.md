# Maintenance Guide

Keep maintenance boring and small.

## Monthly memory hygiene
Ask:
- Which memories are outdated?
- Which hypotheses became too confident?
- Which preferences changed?
- Are check-ins useful or annoying?
- Is voice mode useful by default or only on request?

## Instruction hygiene
Check that these files agree:
- `docs/reflect-brief.md`
- `docs/reflect-architecture.md`
- `docs/reflect-memory-schema.md`
- `docs/reflect-chat-runtime.md`
- `docs/reflect-system-prompt.md`

## Runtime hygiene
Run:

```bash
HERMES_PROFILE=annas-agent hermes doctor
HERMES_PROFILE=annas-agent hermes memory status
HERMES_PROFILE=annas-agent hermes gateway status
```

If structured memory is unavailable, setup is degraded and should be fixed before relying on long-term reflection.
