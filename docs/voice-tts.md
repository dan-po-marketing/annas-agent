# Voice / TTS

Voice replies are included from v0.

## Preferred path
Use Hermes TTS with the free Edge provider:

```bash
HERMES_PROFILE=annas-agent hermes config set tts.provider edge
```

Then in Telegram or CLI:

```text
/voice tts
```

Use `/voice off` to return to text.

## macOS Telegram voice-note fallback
For custom voice notes, macOS can use `say` plus `ffmpeg`:

```bash
say -o /tmp/reply.aiff "short reply text"
ffmpeg -y -i /tmp/reply.aiff -c:a libopus -b:a 32k -vbr on /tmp/reply.ogg
```

Then send the `.ogg` file as a Telegram voice note through Hermes media delivery.

## Quality rule
Keep voice replies listenable. A good voice reply is usually shorter than the same answer in text.
