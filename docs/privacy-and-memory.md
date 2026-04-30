# Privacy and Memory

This public repo should contain only reusable setup material.

## Public repo content
- docs
- templates
- skills
- setup scripts
- examples without real personal details

## Private runtime content
Never commit:
- `.env`
- `auth.json`
- Telegram tokens or chat IDs
- OAuth data
- sessions
- logs
- cron outputs
- `USER.md` / `MEMORY.md` after real use
- structured memory databases
- profile exports or backups

## Memory hygiene commands
The user can say:
- “Forget this.”
- “Revise that memory.”
- “Mark that outdated.”
- “What evidence do you have?”
- “Is this still true or just old context?”

## Public audit command
Run before every public push:

```bash
./scripts/scrub-private-state.sh
```
