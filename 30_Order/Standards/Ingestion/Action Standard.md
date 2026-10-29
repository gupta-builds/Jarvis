---
type: system
status: sprout
created: 2026-08-08
updated: 2026-10-28
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
gold_standard: "[[10_Areas/AI/Setup/Gaps|Gaps]]"
notes:
  - "[[Brief Standard]]"
  - "[[Transcript Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Action Standard
==An action note is a linked map of what still needs doing: statements only, and every statement earns its place by carrying a link.==
This is the standard for a note derived from a brief or any dense note with interlinks. [[Meeting Workflow]] writes one when a brief's follow-ups each need a concrete step; a meeting that needs none gets no action note. It is a map of next steps, not a second brief and not a checklist, with one exception: a short To Do callout at the top names what to do first. It sits next to its source, in an `Action/` folder if one exists.
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
## Headings
### Frontmatter
`type: action`, `status: active`. `source_note` is a quoted wikilink to the brief or note it came from. `related_progress` lists the projects it touches. `next` is the single next statement to close out first, with its deadline if the user gave one. It is word for word the first To Do item.
> [!WARNING]
> `type: project` used for an action note. The 2026-07-14 Mentor Meeting actions note was typed `project`, so it did not appear as an action.
### Opening line
One line naming the source and the rule: statements only, every statement links to what it is about.
### To Do
A `> [!todo] To Do` callout directly under the opening line, before the first thread. It holds one to three `- [ ]` lines, most urgent first, the first repeating `next`. Each names the action, its deadline, and a link. It is the only place with checkboxes. The user, not the draft, decides what goes in it. [[Vault Lint]] checks the shape (callout directly under the opening line, one to three lines, first line equal to `next`, no checkbox outside it) through the Spec keys `todo_callout` and `open_threads_subheadings`; it cannot check that the user chose the contents.
> [!WARNING]
> A To Do that is empty, or that restates a whole thread. It is the single move to make first, not a summary.
### Thread sections
One `##` per thread, matching the source's Key Threads in the same order and with the same heading words. These headings vary by source, so the Spec does not list them. Under each, short declarative statements, each with at least one wikilink to the project, concept, person, or date it concerns.
*Density:* one sentence per statement. A step that needs a paragraph is explained in the source, not here.
*User comments:* the user's own answer or comment on a statement goes after it in italics, in their words. The draft never adds italic comments itself.
> [!WARNING]
> "Follow up on the resume review" with no link. A statement with no link was not mapped back to anything.
### Open Threads
Last, as `##`. Two `###` subsections hold what is not yet a step in a thread, so nothing from the source is silently dropped. If one has nothing, a single statement says so.
- `### Questions`: what is unanswered, whether for the other person, an office, or the user. Each is a statement naming the question and linking its subject.
- `### Research`: what the user must look up, verify, or learn, written as an action (look up, compare, verify). Garbled names and facts the brief marks unconfirmed land here as verify items.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: project` on a note that is a map of next steps | `type: action` | Mechanical |
| Numbered thread headings, `A Note On What This File Is` | Plain thread headings in source order; move the note-on-this-file text to the opening line | Judgment |
| No `## Open Threads` | Add it, listing what is unresolved, or one statement saying nothing is | Judgment |
| Process rules and dated side sections inside the map (Gaps) | Keep as threads if they carry links; otherwise move to the source | Judgment |
| `source_note` as plain text | Quoted wikilink | Mechanical |
| No To Do callout at the top | Add `> [!todo] To Do` under the opening line, first line equal to `next`; ask the user what goes in it | Judgment |
| `# Open Threads` as a level-one heading, or Open Threads with no subsections | `## Open Threads` with `### Questions` and `### Research` | Mechanical |
## Done Conditions
- Nearly every statement has a wikilink; no prose paragraphs; the To Do callout is the only place with checkboxes.
- The To Do callout sits at the top, its first line equals `next`, and the user chose its contents.
- Every thread in the source is a section or a named open thread.
- Open Threads has Questions and Research, and holds the user's own unanswered questions and research actions.
- Missing link targets were raised as questions, not created as stub notes.
- The brief's Follow-Up Actions links to this note.
- The note passes [[Vault Lint]] for the `action` family.
## Gold Standard Example
[[10_Areas/AI/Setup/Gaps|Gaps]]: type `action`, statements grouped by thread, a source note, and an Open Threads section. It also carries two dated process rules, which Legacy Shapes treats as judgment.
