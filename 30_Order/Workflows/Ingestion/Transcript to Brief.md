---
type: system
status: sprout
created: 2026-08-08
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Brief Standard]]"
trigger: A transcript of people talking is in the vault and worth turning into decisions and threads.
notes:
  - "[[Brief Template]]"
  - "[[For Transcript]]"
  - "[[00_Workflows Index]]"
---
# Transcript to Brief
Turn a meeting, call, video, or written exchange into a brief that carries the decisions and threads, not the noise. The `/transcript-to-brief` skill follows this.
## Use when
A transcript has been pasted into the vault, whether or not you took part in the conversation.
## Steps
1. Confirm the raw transcript is its own note with `input_kind: transcript`, using [[For Transcript]] if it is not. Never edit it; treat it like a clipping.
2. Read [[Brief Standard]], then read the whole transcript once before asking anything.
3. Ask only what the transcript requires: garbled or unattributed passages that change meaning, which threads mattered, and any context it assumes that the vault lacks.
4. Copy [[Brief Template]] and write the six sections.
5. Save in a sibling `Briefs/` or `Debriefs/` folder if one exists next to the transcript, otherwise beside it.
6. Set `source_note` to a quoted wikilink to the transcript, filename only, and verify every other link before adding it.
7. Set `next` to the `/note-to-actions` pass, then run [[Vault Lint]] on the brief.
## Do not
Do not edit the transcript, guess at a garbled passage, or invent a decision for a thread left open.
## Done when
- The raw transcript is untouched and the brief links to it.
- Every ambiguous passage is resolved by asking or named in Open Questions.
- Lint reports the brief fits the `brief` family, and the session log records the import.
