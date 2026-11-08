---
type: system
status: sprout
created: 2026-08-08
updated: 2026-11-07
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
gold_standard: "[[20_Progress/Mentorship Program/Meetings/Briefs/Jesse Meeting - 28th Oct Brief|Jesse Meeting - 28th Oct Brief]]"
notes:
  - "[[Transcript Standard]]"
  - "[[Action Standard]]"
  - "[[Spec and Plan Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Brief Standard
==A brief compresses one transcript into what was decided and what actually mattered. It is not a second transcript and it is not a task list.==
This is the standard for the note [[Meeting Workflow]] makes from one [[Transcript Standard]] note. It is not the step-by-step action note ([[Action Standard]]), not a project plan or spec even when one sits in `40_Project_Briefs/` ([[Spec and Plan Standard]]), and not a summary of an AI conversation ([[Conversations]]). A reader should be able to act on the brief without opening the transcript.
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
The Spec is what the linter reads. This table is the same identity in words, plus what the linter cannot see.

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/`, `10_Areas/`, or `60_Claude/40_Project_Briefs/`. A brief in any other folder fails placement. |
| File name | The transcript's name plus `Brief` (`Jesse Meeting - 28th Oct Brief`). Unique in the vault, because wikilinks resolve by name. The title line equals the file name. |
| Kind | `type: input` with `input_kind: brief`. The raw transcript keeps `input_kind: transcript`, so a query for transcripts never returns a brief. |
| Status | `sprout` from the first save. The drafter never sets `tree`; the owner does, after checking the brief against the transcript. `seed` is for a rough capture and is not used here. |
## Headings
### Frontmatter
- **Write:** `source_note` as a quoted wikilink to the transcript, file name only. `related_progress` lists the projects the meeting touched, `[]` if none. `next` holds the action note as a wikilink once one exists; before that, the `/note-to-actions` pass, or `None` with the reason. `tags` includes `brief`.
- **Length:** one line per key; no value folded across lines.
- **Never:** a blank `next` or `source_note`, or a `source_note` that names a folder path. Every later claim is checked against the transcript through this one link.
- **Right:** `source_note: "[[Jesse Meeting - 28th Oct]]"`
- **Wrong:** None seen in a live note. The plain-text form is the second row of Legacy Shapes.
### Source lines
- **Write:** three bold lines directly under the title: `**Source:**` (who, what, where, in a clause), `**Transcript:**` (a wikilink), `**Date of conversation:**`. When the file name carries a different date from the meeting, the date line says so.
- **Length:** one line each.
- **Never:** a summary or a verdict. That is What This Was.
- **Right:** `**Date of conversation:** 2026-07-14 (meeting slipped one day from the planned 2026-07-13 slot; this note's filename kept the original date)`
- **Wrong:** None seen.
### What This Was
- **Write:** the kind of conversation, who was in it, and any known limit of the capture, such as unreliable speaker labels, a dropped connection, or garbled passages. It may sit in a `> [!SUMMARY]` callout, with the text on the line below the marker.
- **Length:** one to three sentences.
- **Never:** a decision or a finding. The reader needs the limits before trusting anything below.
- **Right:** `The *first call* between Anant and Jesse. Jesse joined from his phone, so the call moved from Zoom to Google Meet after his audio broke up`
- **Wrong:** `I had planned for a career professional, but she is an ISSS advisor and sends the career questions to Career Services.` This is the fourth sentence of the ISSS brief's What This Was, a detail for Key Threads.
### What Was Decided
- **Write:** one bullet per real decision, bold label first, then the outcome. If nothing was decided, say so in a bullet. A thread the transcript left open stays open.
- **Length:** one bullet per decision, one to three sentences each.
- **Never:** a resolution the transcript did not reach. Later notes act on this section as settled.
- **Right:** `- **Mock interviews:** Jesse is open to running them "at any time". No date was set.`
- **Wrong:** None seen.
### Key Threads
- **Write:** one `###` per substantive topic, most important first, named for its subject. Bold key names on first mention and link every vault note the thread touches. When a speaker's claim differs from a vault fact, write what was said, then what the vault says with its link, and correct neither silently. A garbled name keeps the transcript's spelling in quotes, followed by the owner's best reading marked as a guess. If the owner later says the transcript misheard, write "likely a transcription error", give their reading in their words, and leave the transcript alone.
- **Length:** the bulk of the note. A thread runs 40 to 250 words (the median in the three real briefs is under 100); past about 350 it is two threads. Skip a tangent of about ten seconds.
- **Never:** a thread for every topic touched. That is a second transcript.
- **Right:** `transcribed "As One Technologies" (rough guess: ASML)`, a quoted spelling and a marked guess.
- **Wrong:** None seen.
### Open Questions
- **Write:** `- [ ]` tasks for unresolved threads, passages too garbled to write up, and context the transcript assumed that the vault lacks. Name the passage and why it cannot be settled. An answered question is ticked `- [x]`, keeps its text, and gains the answer and its date. Nothing is deleted.
- **Length:** one to three sentences each; as many as the transcript leaves open.
- **Never:** a guess that closes a garbled passage. A guess becomes a fact in the action note.
- **Right:** `- [ ] The manufacturing conference is transcribed "MDM" or "MD and M" with no date (rough guess: MMM), unconfirmed.`
- **Wrong:** None seen.
### Follow-Up Actions
- **Write:** `- [ ]` high-level next steps. The last line links the [[Action Standard]] note that breaks them down, or says no breakdown is needed.
- **Length:** one line per step.
- **Never:** step-by-step detail. That is the action note.
- **Right:** `- [ ] The step-by-step breakdown is [[Jesse Meeting - 28th Oct Actions]].`
- **Wrong:** None seen.
### Related Notes
- **Write:** verified wikilinks, each with a clause saying why it is related. Include the transcript, and the action note when one exists.
- **Length:** three to ten bullets.
- **Never:** a link to a note that does not exist.
- **Right:** `- [[Jesse Meeting - 28th Oct]]: the raw transcript this brief compresses`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The six headings appear in order and none is empty | A skill or query finds a section by its name | Lint, check 2 |
| `source_note` and `next` are filled, and `source_note` is a wikilink | An unrouted brief cannot be checked or followed | Lint, check 1 (`empty-key`, `bad-wikilink`) |
| `source_note` is a file name, not a folder path | A path breaks when the transcript moves | Reader |
| Every body link resolves, or the line is labeled `(to create)` | A dead link looks like a note that exists | Lint, check 3 |
| The raw transcript is never edited | A brief built on a changed source cannot be verified | Reader |
| A garbled passage is named in Open Questions, never guessed | A guess becomes a fact the action note builds on | Reader |
| One bullet per decision, bold label first | The Decided section is scanned, not read | Reader |
| The owner is written as "Anant", never "I" | A brief is quoted in other notes, and a first-person line loses its speaker | Reader |
| Prose follows [[HUMAN_WRITING]] | A brief full of filler hides the decision | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: transcript` on the brief | `input_kind: brief`; the raw transcript keeps `transcript` | Mechanical |
| `source_note: Mentor Meeting Transcript.md` as plain text | `source_note: "[[Mentor Meeting Transcript]]"` | Mechanical |
| A project plan, code doc, or prompt in `40_Project_Briefs/` | Not a brief: retype by [[Spec and Plan Standard]], [[Code Mirror Doc Standard]], or [[Agent Prompt Standard]] | Judgment |
| Brief with no Open Questions or Follow-Up Actions section | Add them, empty only if truly none, and say so | Judgment |
| Follow-Up Actions that neither links an action note nor says none is needed (ISSS October Meeting Brief) | Add the closing line | Judgment |
| Title line that differs from the file name (Project Briefings - 2026-07-13 opens `2026-07-14 Mentor Meeting`) | Make the title the file name, with a link-aware rename if the file name is the wrong one | Judgment |
| What This Was longer than three sentences (ISSS October Meeting Brief has four) | Keep the kind, people, and limits; move the rest into Key Threads | Judgment |
| First person ("me", "I") throughout (ISSS October Meeting Brief) | Third person, the owner named "Anant" | Judgment |
## Done Conditions
- The raw transcript is untouched and `source_note` resolves to it.
- Reopening the transcript would not reveal a decision or thread this brief missed.
- Every garbled or ambiguous passage is named in Open Questions, not guessed.
- Follow-Up Actions links the action note, or says none is needed.
- The note passes [[Vault Lint]] for the `brief` family.
## Gold Standard Example
[[20_Progress/Mentorship Program/Meetings/Briefs/Jesse Meeting - 28th Oct Brief|Jesse Meeting - 28th Oct Brief]] passes lint and shows every contract above: a summary callout with the capture's limits, bold-labeled decisions, a conflict with the vault, marked guesses, a ticked and dated answer, and a closing link to the action note.
Measured 2026-11-07 with `--family brief`: 3 briefs, all pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Jesse Meeting - 28th Oct Brief (gold) | `20_Progress/Mentorship Program/Meetings/Briefs/` | All of the above | Nothing found against this Standard |
| Project Briefings - 2026-07-13 | same | Framing line, honest open questions | A ticked answer; its title differs from its file name |
| ISSS October Meeting Brief | `10_Areas/Career/VISAs & Work Auth/ISSS/` | Seven decisions with bold labels | Closing line in Follow-Up Actions; What This Was is four sentences; first person |
