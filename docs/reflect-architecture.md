# Reflect Architecture

## Design principle
Reflect works by separating evidence from interpretation.

The assistant should never collapse “the user said this today” into “the user is this forever.” It should preserve time, confidence, source, and contradictions.

## Memory layers
1. **Raw observations** — what the user said, with timestamp/source.
2. **Events** — concrete things that happened.
3. **Temporary states** — moods, body load, stress, energy, uncertainty.
4. **Stable beliefs/preferences** — durable patterns confirmed across time.
5. **Contradictions** — records showing tension between old and new evidence.
6. **Hypotheses** — tentative interpretations with confidence and evidence.
7. **Framework projections** — optional lenses, never stored as facts.

## Runtime packet
Before answering, retrieve a compact packet:
- relevant raw observations;
- active states;
- stable preferences;
- contradictions;
- hypotheses related to the topic;
- body/mood context when relevant.

The response should be grounded in that packet and the current message.

## Required memory substrate
This starter assumes two memory layers:

- Hermes built-in memory: short durable notes in `USER.md` / `MEMORY.md`.
- Structured/holographic provider: searchable, revisable records with entities, confidence, time, and relationships.

Setup is incomplete until `hermes memory status` shows an installed and available structured provider.

## Voice layer
Voice replies are part of v0. Preferred order:
1. Hermes TTS with free Edge provider.
2. Local system TTS when available.
3. Telegram-compatible OGG/Opus voice note generation for manual/custom replies.

Paid voice APIs are not required for the baseline.
