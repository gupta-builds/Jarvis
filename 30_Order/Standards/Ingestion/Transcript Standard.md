---
type: system
status: sprout
created: 2026-10-28
updated: 2026-10-28
tags:
  - system
  - standards
system_kind: standard
family: transcript
tier: 2
maps_to:
  - "[[Transcript Template]]"
used_by:
  - "[[Meeting Workflow]]"
gold_standard: "[[20_Progress/Mentorship Program/Meetings/Transcripts/Jesse Meeting - 28th Oct|Jesse Meeting - 28th Oct]]"
notes:
  - "[[Brief Standard]]"
  - "[[Action Standard]]"
  - "[[Clipping Standard]]"
---
# Transcript Standard
==A transcript is the conversation exactly as the tool heard it. Nothing in it is corrected, so every brief and action built from it can be checked against it.==
This is the standard for the raw record of a meeting, call, or other conversation between people, kept in `20_Progress/` or `10_Areas/`. One conversation is one note. [[Meeting Workflow]] makes the brief and the action note from it. Course video transcripts and career fair captures keep their own folders and Standards, and video transcripts in `60_Claude/05_Clippings/` follow the [[Clipping Standard]].
## Spec
```json
{
  "family": "transcript",
  "tier": 2,
  "match": {"type": "input", "kind": "transcript", "path": "^(20_Progress/(?!Degree/|Internship/Career Fair)|10_Areas/)", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "input_kind", "related_progress", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "related_progress": "list", "next": "text?"},
  "headings": ["Raw Transcript"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
`type: input`, `input_kind: transcript`, `status: seed`. `related_progress` lists the projects the conversation touched. `next` names the brief once it exists, or says why none is planned. Status becomes `sprout` when the brief links back.
> [!WARNING]
> A blank `created`. Every transcript copied from the old starter had one, so none could be sorted by date.
### Title block
Three bold lines under the title: `**Date:**` (the meeting date and time), `**Participants:**` (names and roles), `**Captured with:**` (the tool, the platform, and any cut). Metadata only, no summary.
*Density:* one line each.
### Raw Transcript
The capture inside a single fence, with the speaker labels the tool wrote, no blank lines between turns. Never clean, correct, reorder, or summarize it. The one allowed cut is audio from a different conversation that the same recording caught; the Captured with line names the cut.
> [!WARNING]
> Fixing a garbled word. A guess becomes a fact in the brief. The brief names the passage in Open Questions instead.
### Name and place
The file name carries the meeting and its date and is unique in the vault, because wikilinks resolve by name. It sits in a `Transcripts/` folder next to the project's other meeting notes.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `created:` blank | The capture date | Mechanical |
| `**Captured:**` and `**Source:**` lines | `**Date:**`, `**Participants:**`, `**Captured with:**` | Mechanical |
| The "Paste the untouched transcript" instruction left in the body | Delete it | Mechanical |
| Transcript text outside a fence, or blank lines between turns | Wrap in one fence, drop the blank lines | Mechanical |
| Two conversations in one recording | Cut the second, or split it into its own note | Judgment, needs a yes |
| A transcript in a course folder | Not this family; leave it with the course | Judgment |
## Done Conditions
- The raw text matches what the tool captured, apart from a named cut.
- Date, participants, and capture tool are filled in.
- `next` names the brief, or says none is planned.
- The note passes [[Vault Lint]] for the `transcript` family.
## Gold Standard Example
[[20_Progress/Mentorship Program/Meetings/Transcripts/Jesse Meeting - 28th Oct|Jesse Meeting - 28th Oct]]: a call that dropped from Zoom to Google Meet, fenced and unedited, with the club meeting that followed cut and named on the Captured with line.
