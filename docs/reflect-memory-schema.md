# Reflect Memory Schema

Use this schema as the conceptual contract for the structured memory provider.

## Record types

### Observation
- `id`
- `timestamp`
- `source`: telegram, cli, voice transcript, imported note
- `text`
- `language`
- `entities`
- `topics`

### Event
- `id`
- `timestamp_start`
- `timestamp_end`
- `summary`
- `evidence_ids`
- `confidence`

### State
- `id`
- `timestamp`
- `mood`
- `energy`
- `body_load`
- `sleep_recovery`
- `overload_stress`
- `main_factor`
- `evidence_ids`

### Durable belief / preference
- `id`
- `claim`
- `scope`
- `first_seen`
- `last_confirmed`
- `confidence`
- `evidence_ids`
- `status`: active, tentative, superseded, rejected

### Contradiction
- `id`
- `claim_a`
- `claim_b`
- `resolution`: unresolved, temporal, contextual, superseded
- `evidence_ids`

### Hypothesis
- `id`
- `claim`
- `why_it_might_be_true`
- `counterevidence`
- `confidence`
- `created_at`
- `last_reviewed`
- `status`: active, tentative, stale, rejected

## Update policy
- Store raw evidence before interpretation.
- Promote to durable memory only after repeated evidence or explicit user confirmation.
- Supersede old claims instead of overwriting them.
- Record contradictions explicitly.
- Lower confidence when evidence comes from high stress, poor sleep, illness, pain, inflammation, or overload.
- Never store daily check-in scores as personality facts.

## User commands to support
- “Remember this.”
- “Forget that.”
- “Mark this outdated.”
- “Lower confidence on that.”
- “What evidence do you have for that?”
- “Is this a pattern or just today’s state?”
