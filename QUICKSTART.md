# Quickstart

## 1. Clone and enter the repo

```bash
git clone https://github.com/<owner>/annas-agent.git
cd annas-agent
```

## 2. Run setup

```bash
./scripts/setup.sh
```

The script checks Hermes, creates/uses a profile named `annas-agent`, copies Reflect docs and skills, and then verifies the two non-negotiables:

- structured memory provider is active;
- voice/TTS path is available or explicitly configured.

## 3. If structured memory is missing

Run:

```bash
HERMES_PROFILE=annas-agent hermes memory setup
```

Select a local structured provider, preferably `holographic` if available. Then verify:

```bash
HERMES_PROFILE=annas-agent hermes memory status
```

Setup is not complete until the provider is shown as installed and available.

## 4. Configure Telegram

```bash
HERMES_PROFILE=annas-agent hermes gateway setup
HERMES_PROFILE=annas-agent hermes gateway install
HERMES_PROFILE=annas-agent hermes gateway start
```

Use BotFather to create a Telegram bot token if you do not already have one.

## 5. Enable voice replies

Preferred free/default path:

```bash
HERMES_PROFILE=annas-agent hermes config set tts.provider edge
```

In chat, use `/voice tts` when you want voice replies by default, or `/voice on` for voice-to-voice mode.

## 6. Start onboarding

After Telegram is connected, send the bot:

```text
Start Reflect onboarding.
```

It should use `docs/onboarding-telegram.md` and ask one compact calibration prompt.
