# Local Always-On Setup

Best when the user has a Mac, Linux machine, or mini-PC that can stay on.

Pros:
- data stays on the user's machine;
- simple mental model;
- no server rental.

Cons:
- depends on home power and internet;
- laptop sleep can stop the bot;
- remote maintenance can be annoying.

Baseline:

```bash
./scripts/setup.sh
HERMES_PROFILE=annas-agent hermes gateway install
HERMES_PROFILE=annas-agent hermes gateway start
```

On macOS, ensure the machine does not sleep if 24/7 Telegram replies matter.
