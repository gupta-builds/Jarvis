---
type: system
status: sprout
created: 2026-08-08
updated: 2026-10-28
tags:
  - system
  - standards
system_kind: standard
family: brief
tier: 1
maps_to:
  - "[[Brief Template]]"
used_by:
  - "[[Meeting Workflow]]"
gold_standard: "[[20_Progress/Mentorship Program/Meetings/Briefs/Project Briefings - 2026-07-13|Project Briefings - 2026-07-13]]"
notes:
  - "[[Transcript Standard]]"
  - "[[Action Standard]]"
  - "[[Spec and Plan Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Brief Standard
==A brief compresses one transcript into what was decided and what actually mattered. It is not a second transcript and it is not a task list.==
This is the standard for the note [[Meeting Workflow]] makes from a [[Transcript Standard]] note. A meeting gets a brief when it carried a decision or a thread worth keeping; otherwise its transcript stands alone. A project plan or spec is not a brief even when it sits in `40_Project_Briefs/`; those are [[Spec and Plan Standard]] notes. A summary of an AI conversation is a [[Conversations]] note.
## Spec
```json
{
  "family": "brief",
  "tier": 1,
  "match": {"type": "input", "kind": "brief", "path": "^(20_Progress|10_Areas|60_Claude/40_Project_Briefs)/", "where": {}, "where_not": {}},
  "legacy_match": [{"type": "input", "path": "^(20_Progress|10_Areas)/.*/Briefs/", "where": {"input_kind": "transcript"}}],
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "input_kind", "source_note", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_note": "wikilink"},
  "headings": ["What This Was", "What Was Decided", "Key Threads", "Open Questions", "Follow-Up Actions", "Related Notes"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
`type: input`, `input_kind: brief`, `status: sprout`. `source_note` is a quoted wikilink to the transcript, filename only, no folder path. `related_progress` lists the projects it touches. `next` is the action note as a wikilink once one exists; before that it is the `/note-to-actions` pass, or `None` with the reason.
> [!WARNING]
> `source_note` pointing at a transcript that does not exist, or at a folder path.
### Source lines
`**Source:**` (the meeting in a few words: who, what, where), `**Transcript:**` (a wikilink), `**Date of conversation:**`, directly under the title. Metadata only. If the filename date differs from the meeting date, say so on the date line.
### What This Was
One to three sentences: what kind of conversation, who was in it, and any known limit such as unreliable speaker labels.
### What Was Decided
One bullet per real decision, with a bold label. If nothing was decided, write that; do not invent a resolution for a thread the transcript left open.
### Key Threads
One `###` per substantive topic, ordered by what mattered most. Bold key names on first mention and link the vault notes each thread touches.
*Density:* the bulk of the note. Skip ten-second tangents.
> [!WARNING]
> A thread for every topic touched. That is a second transcript.
### Open Questions
`- [ ]` tasks: unresolved threads, passages too garbled to write up, and context the transcript assumed that the vault lacks.
### Follow-Up Actions
`- [ ]` high-level next steps only. Link the [[Action Standard]] note that breaks them down; when none is needed, one line says so.
### Related Notes
Verified wikilinks only, including the transcript and the action note when one exists.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: transcript` on the brief | `input_kind: brief`; the raw transcript keeps `transcript` | Mechanical |
| `source_note: Mentor Meeting Transcript.md` as plain text | `source_note: "[[Mentor Meeting Transcript]]"` | Mechanical |
| A project plan, code doc, or prompt in `40_Project_Briefs/` | Not a brief: retype by [[Spec and Plan Standard]], [[Code Mirror Doc Standard]], or [[Agent Prompt Standard]] | Judgment |
| Brief with no Open Questions or Follow-Up Actions section | Add them, empty only if truly none, and say so | Judgment |
## Done Conditions
- The raw transcript is untouched and `source_note` resolves to it.
- Reopening the transcript would not reveal a decision or thread this brief missed.
- Every garbled or ambiguous passage is named in Open Questions, not guessed.
- Follow-Up Actions links the action note, or says none is needed.
- The note passes [[Vault Lint]] for the `brief` family.
## Gold Standard Example
[[20_Progress/Mentorship Program/Meetings/Briefs/Project Briefings - 2026-07-13|Project Briefings - 2026-07-13]]: a framing line about unreliable speaker labels, decisions with bold labels, ordered threads, and honest open questions. It is the only brief in the vault.
