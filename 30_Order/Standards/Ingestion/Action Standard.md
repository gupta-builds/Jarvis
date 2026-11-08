---
type: system
status: sprout
created: 2026-08-08
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: action
tier: 1
maps_to:
  - "[[Action Template]]"
used_by:
  - "[[Meeting Workflow]]"
gold_standard: "[[20_Progress/Mentorship Program/Meetings/Action/Jesse Meeting - 28th Oct Actions|Jesse Meeting - 28th Oct Actions]]"
notes:
  - "[[Brief Standard]]"
  - "[[Transcript Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Action Standard
==An action note is a linked map of what still needs doing: statements only, and every statement earns its place by carrying a link.==
This is the Standard for a note derived from a brief or any dense note with interlinks. It is a map of next steps, not a second brief and not a checklist, with one exception: a short To Do callout at the top names what to do first. It sits next to its source, in an `Action/` folder if one exists.
## Spec
```json
{
  "family": "action",
  "tier": 1,
  "match": {"type": "action", "kind": null, "path": "", "where": {}, "where_not": {}},
  "legacy_match": [{"type": "project", "path": "^(20_Progress|10_Areas)/.*/Action/"}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "source_note", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_note": "wikilink"},
  "headings": ["Open Threads"],
  "optional_headings": [],
  "todo_callout": {"max_lines": 3},
  "open_threads_subheadings": ["Questions", "Research"]
}
```

| Item | Rule |
|---|---|
| Allowed folders | Anywhere. Next to the source note, in an `Action/` folder if one exists. |
| File name | The source's name plus `Actions` (`Jesse Meeting - 28th Oct Actions`). Unique in the vault. |
| Kind | `type: action`, no kind key. |
| Status | `active` while any statement is open, `complete` when none is, `paused` or `archived` as in [[Frontmatter Standard]]. |
## Headings
### Frontmatter
- **Write:** `type: action`, `status: active`, `source_note` as a quoted wikilink to the brief or note it came from, `related_progress` listing the projects it touches, and `next`, the single next statement with its deadline if the user gave one. `next` is word for word the first To Do item.
- **Length:** one line per key; `next` is one sentence.
- **Never:** `type: project` on an action note. The July 2026 Mentor Meeting actions note was typed `project`, so it did not appear as an action.
- **Right:** `source_note: "[[Jesse Meeting - 28th Oct Brief]]"`
- **Wrong:** None seen.
### Opening line
- **Write:** one line naming the source and the rule: statements only, every statement links to what it is about.
- **Length:** one or two sentences.
- **Never:** a summary of the meeting. That is the brief.
- **Right:** `From [[Jesse Meeting - 28th Oct Brief]]. Statements only, and every statement links to what it is about.`
- **Wrong:** None seen.
### To Do
- **Write:** a `> [!todo] To Do` callout directly under the opening line, before the first thread. Each line names the action, its deadline, and a link. The first repeats `next`. It is the only place with checkboxes, and the user chooses its contents.
- **Length:** one to three `- [ ]` lines, most urgent first.
- **Never:** an empty To Do, or one that restates a whole thread. It is the single move to make first, not a summary.
- **Right:** `> [!todo] To Do`
- **Wrong:** None seen.
### Thread sections
- **Write:** one `##` per thread, matching the source's Key Threads in the same order and with the same heading words. Under each, short declarative statements, each with at least one wikilink to the project, concept, person, or date it concerns.
- **Length:** one sentence per statement. A step that needs a paragraph is explained in the source, not here.
- **Never:** a statement with no link. It was not mapped back to anything.
- **Right:** `- Offer **Teams** for remote sessions, since Jesse's clients use it ([[Mentor Meeting Playbook - Jesse]]).`
- **Wrong:** `Both pending folder-move commits from the original pass are long since resolved by the vault's own auto-commit bot`
### User comments
- **Write:** the user's own answer or comment on a statement, after it in italics, in their words.
- **Length:** as the user wrote it.
- **Never:** an italic comment the draft added itself.
- **Right:** `*Just research more on Jesse's current activities and the comapnies he is worked in and working in*`
- **Wrong:** None seen.
### Open Threads
- **Write:** last, as `##`, with two `###` subsections holding what is not yet a step in a thread, so nothing from the source is silently dropped. `Questions`: what is unanswered, for the other person, an office, or the user. `Research`: what the user must look up, verify, or learn, written as an action. Garbled names and facts the brief marks unconfirmed land here as verify items. If a subsection has nothing, a statement says so.
- **Length:** one sentence per statement, each with a link.
- **Never:** a Research item written as a bare question.
- **Right:** `- Research startup judgment (equity, shareholders, capital, selling) so it can be discussed with Jesse ([[Smart Goals]]).`
- **Wrong:** `- What exactly are you working towards for the next yeaR? ([[Plan - Jesse]])`
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Open Threads exists with `Questions` and `Research` | A source thread that fits no section would be dropped | Lint, checks 2 and 7 |
| A `> [!todo]` callout sits directly under the opening line, holds one to three lines, and the first equals `next` | The dashboard and the next session read `next` | Lint, check 7 |
| No checkbox outside the To Do callout | A second task list drifts from the first | Lint, check 7 |
| `source_note` is a quoted wikilink | The action note must be checkable against its source | Lint, check 1 |
| Nearly every statement carries a wikilink | A statement with no link maps to nothing | Reader |
| A missing link target is raised as a question, not created as a stub note | Stubs clutter the vault with empty notes | Reader |
| The user chooses the To Do contents | The draft cannot know what is urgent | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: project` on a note that is a map of next steps | `type: action` | Mechanical |
| Numbered thread headings, `A Note On What This File Is` | Plain thread headings in source order; move the note-on-this-file text to the opening line | Judgment |
| No `## Open Threads` | Add it, listing what is unresolved, or one statement saying nothing is | Judgment |
| Process rules, dated side sections, and prose paragraphs inside the map (Gaps) | Keep as threads if they carry links; otherwise move to the source | Judgment |
| `source_note` as plain text | Quoted wikilink | Mechanical |
| No To Do callout at the top | Add `> [!todo] To Do` under the opening line, first line equal to `next`; ask the user what goes in it | Judgment |
| `# Open Threads` as a level-one heading, or Open Threads with no subsections | `## Open Threads` with `### Questions` and `### Research` | Mechanical |
## Done Conditions
- Nearly every statement has a wikilink; no prose paragraphs; the To Do callout is the only place with checkboxes.
- The To Do callout sits at the top, its first line equals `next`, and the user chose its contents.
- Every thread in the source is a section or a named open thread.
- Open Threads has Questions and Research, and holds the user's own unanswered questions and research actions.
- The brief's Follow-Up Actions links to this note.
- The note passes [[Vault Lint]] for the `action` family.
## Gold Standard Example
[[20_Progress/Mentorship Program/Meetings/Action/Jesse Meeting - 28th Oct Actions|Jesse Meeting - 28th Oct Actions]] passes lint: a To Do callout whose first line equals `next`, linked statements grouped by the brief's threads, the user's italic comments, and Open Threads with Questions and Research.
Measured 2026-11-07 with `--family action`: 5 notes, 4 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Jesse Meeting - 28th Oct Actions (gold) | `20_Progress/Mentorship Program/Meetings/Action/` | All of the above | Three Research lines are the user's raw questions, not actions |
| Gaps | `10_Areas/AI/Setup/` | Passes lint; statements grouped by thread | Prose paragraphs and statements with no link |
| W44 Calendar Rebuild - Actions (2026-10-25) | `60_Claude/20_Distilled_Notes/` | Right type | One dead body link; not next to its source |
| Summaries-to-Create | `60_Claude/07_AI_Information/AI Conversation - Summaries/` | Passes lint | Not read in full |
