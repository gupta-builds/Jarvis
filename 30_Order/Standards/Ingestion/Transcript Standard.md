---
type: system
status: sprout
created: 2026-10-28
updated: 2026-11-07
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
This is the Standard for the raw record of a meeting, call, or other conversation between people. One conversation is one note. It is not a course video transcript or a career fair capture, which keep their own folders and Standards, and it is not a video transcript in `60_Claude/05_Clippings/` ([[Clipping Standard]]).
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

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/` or `10_Areas/`, in a `Transcripts/` folder next to the project's other meeting notes. Not `20_Progress/Degree/` and not `Internship/Career Fair`. |
| File name | The meeting and its date (`Jesse Meeting - 28th Oct`). Unique in the vault, because wikilinks resolve by name. |
| Kind | `type: input` with `input_kind: transcript`. The brief made from it has `input_kind: brief`. |
| Status | `seed` at capture. `sprout` once a brief links back to it. |
## Headings
### Frontmatter
- **Write:** `type: input`, `input_kind: transcript`, `status: seed`, real `created` and `updated` dates, `related_progress` listing the projects the conversation touched, and `next` naming the brief once it exists, or saying why none is planned.
- **Length:** one line per key.
- **Never:** a blank `created`. Every transcript copied from the old starter had one, so none could be sorted by date.
- **Right:** `next: "[[Jesse Meeting - 28th Oct Brief]]"`
- **Wrong:** `created:`
### Title block
- **Write:** three bold lines under the title: `**Date:**` (the meeting date and time), `**Participants:**` (names and roles), `**Captured with:**` (the tool, the platform, and any cut).
- **Length:** one line each.
- **Never:** a summary. It is metadata only.
- **Right:** `**Participants:** Anant Gupta, Jesse (mentor, CSE Mentorship Program)`
- **Wrong:** `**Captured:** 2026-10-23`
### Raw Transcript
- **Write:** the capture inside a single fence, with the speaker labels the tool wrote and no blank lines between turns. The one allowed cut is audio from a different conversation that the same recording caught; the Captured with line names the cut.
- **Length:** whatever the tool captured.
- **Never:** clean, correct, reorder, or summarize it. A fixed garbled word turns a guess into a fact in the brief.
- **Right:** `Them: Hey, can you hear me now?`
- **Wrong:** `## From Cluely`
### Name and place
- **Write:** a file name that carries the meeting and its date, in a `Transcripts/` folder next to the project's other meeting notes.
- **Length:** one title line equal to the file name.
- **Never:** a name that does not say which meeting it is, since the file is found by name.
- **Right:** `# Jesse Meeting - 28th Oct`
- **Wrong:** `# October Meeting Transcript`
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `created` and `updated` are real dates | An undated transcript cannot be sorted or matched to its meeting | Lint, check 1 |
| `next` is filled | An unrouted transcript is a dead end | Lint, check 1 |
| The folder is `20_Progress/` or `10_Areas/`, never a course folder | Course transcripts belong to the course | Lint, check 4 |
| The raw text is never edited, except one named cut | A brief can be verified only against an unchanged source | Reader |
| The Captured with line names any cut | A silent cut looks like a lost passage | Reader |
| No instruction text from the starter is left in the body | A leftover "Paste the untouched transcript" line is not capture | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `created:` blank | The capture date | Mechanical |
| `**Captured:**` and `**Source:**` lines (ISSS October Meeting Transcript) | `**Date:**`, `**Participants:**`, `**Captured with:**` | Mechanical |
| The "Paste the untouched transcript" instruction left in the body | Delete it | Mechanical |
| `## From Cluely` or no `## Raw Transcript` heading (Mentor Meeting Transcript) | `## Raw Transcript` | Mechanical |
| Transcript text outside a fence, or blank lines between turns | Wrap in one fence, drop the blank lines | Mechanical |
| Status `seed` on a transcript whose brief already exists (Mentor Meeting Transcript) | `sprout` | Mechanical |
| Two conversations in one recording | Cut the second, or split it into its own note | Judgment, needs a yes |
| A transcript in a course folder (8 in `Technical Interview/_Transcripts`) | Not this family; leave it with the course | Judgment |
## Done Conditions
- The raw text matches what the tool captured, apart from a named cut.
- Date, participants, and capture tool are filled in.
- `next` names the brief, or says none is planned.
- The note passes [[Vault Lint]] for the `transcript` family.
## Gold Standard Example
[[20_Progress/Mentorship Program/Meetings/Transcripts/Jesse Meeting - 28th Oct|Jesse Meeting - 28th Oct]] passes lint: a call that dropped from Zoom to Google Meet, fenced and unedited, with the club meeting that followed cut and named on the Captured with line.
Measured 2026-11-07 with `--family transcript`: 12 notes, 2 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Jesse Meeting - 28th Oct (gold) | `20_Progress/Mentorship Program/Meetings/Transcripts/` | All of the above | Nothing found |
| Mentor Meeting Transcript | `20_Progress/Mentorship Program/Meetings/Transcripts/` | Passes lint | `## From Cluely` instead of `## Raw Transcript`; `seed` though its brief exists |
| October Meeting Transcript | `10_Areas/Career/VISAs & Work Auth/ISSS/` | Raw text fenced | No `updated`; `**Captured:**` lines; the starter instruction is still in the body |
| Writing - 1 Video Transcript | `20_Progress/Degree/CSCI 4511W/Assignments/Written/` | A course capture | Not this family; blank `created`; wrong folder |
