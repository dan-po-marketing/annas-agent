# Cheap VPS Setup

Best when the user wants 24/7 access without keeping a local machine on.

Suggested baseline:
- Ubuntu LTS;
- 1–2 vCPU;
- 1–2 GB RAM minimum;
- SSH key login;
- firewall enabled;
- encrypted backups if memory matters.

Important boundary: private memory lives on the VPS disk, not in this repo.

Setup flow:

```bash
git clone https://github.com/<owner>/annas-agent.git
cd annas-agent
./scripts/setup.sh
HERMES_PROFILE=annas-agent hermes gateway install
HERMES_PROFILE=annas-agent hermes gateway start
```

If the VPS is too small for local voice or local model work, use free/lightweight TTS and a remote model provider the user already has access to.
