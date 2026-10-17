---
type: system
status: sprout
created: 2026-08-08
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Action Standard]]"
trigger: A brief or dense note exists, its topics are understood, and each needs a concrete next step.
notes:
  - "[[Action Template]]"
  - "[[Brief Standard]]"
  - "[[00_Workflows Index]]"
---
# Brief to Action
Turn a brief or any interlinked note into a linked map of what still needs doing. The `/note-to-actions` skill and agent follow this.
## Use when
A brief or note has real content and the step for each thread is missing.
## Steps
1. Read the source note fully before asking anything.
2. Read [[Action Standard]] and copy [[Action Template]].
3. For each thread, ask what the concrete next step is. Do not infer one the source does not support.
4. For each person, concept, or project a step needs and the vault lacks, ask whether to link it as is, skip the link, or record a gap. Never create a stub note.
5. Write one `##` per thread in the source's order, with one linked declarative statement per step. No checkboxes, no prose paragraphs.
6. Put anything unresolved under `## Open Threads`.
7. Save in a sibling `Action/` or `Next Steps/` folder if one exists next to the source, otherwise beside the source.
8. Set `source_note`, link the source's Follow-Up Actions forward to the new note, and run [[Vault Lint]].
## Do not
Do not add checkboxes, write steps with no link, or drop a thread silently.
## Done when
- Every source thread is a section or a named open thread.
- Nearly every statement carries a wikilink.
- Lint reports the note fits the `action` family, and the session log records the pass.
