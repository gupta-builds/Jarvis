---
type: system
status: sprout
created: 2026-08-08
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: action
tier: 1
maps_to:
  - "[[Action Template]]"
used_by:
  - "[[Brief to Action]]"
gold_standard: "[[10_Areas/AI/Setup/Gaps|Gaps]]"
notes:
  - "[[Brief Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Action Standard
==An action note is a linked map of what still needs doing: statements only, and every statement earns its place by carrying a link.==
This is the standard for a note derived from a brief or any dense note with interlinks. It is a map of next steps, not a second brief and not a checklist. It sits next to its source, in an `Action/` folder if one exists. Only two action notes exist in the vault today, so this Standard describes their shared shape and nothing more.
## Spec
```json
{
  "family": "action",
  "tier": 1,
  "match": {"type": "action", "kind": null, "path": "", "where": {}, "where_not": {}},
  "legacy_match": [{"type": "project", "path": "^20_Progress/Mentorship Program/Meetings/Action/"}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "source_note", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_note": "wikilink"},
  "headings": ["Open Threads"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
`type: action`, `status: active`. `source_note` is a quoted wikilink to the brief or note it came from. `related_progress` lists the projects it touches. `next` is the single next statement to close out.
> [!WARNING]
> `type: project` used for an action note. The 2026-07-14 Mentor Meeting actions note is typed `project`, so it does not appear as an action.
### Opening line
One line naming the source and the rule: statements only, every statement links to what it is about.
### Thread sections
One `##` per thread, matching the source's Key Threads in the same order. These headings vary by source, so the Spec does not list them. Under each, short declarative statements, each with at least one wikilink to the project, concept, person, or date it concerns.
*Density:* one sentence per statement. A step that needs a paragraph is explained in the source, not here.
> [!WARNING]
> "Follow up on the resume review" with no link. A statement with no link was not mapped back to anything.
### Open Threads
Last. Statements naming what could not be turned into a concrete step, so nothing from the source is silently dropped.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: project` on a note that is a map of next steps | `type: action` | Mechanical |
| Numbered thread headings, `A Note On What This File Is` | Plain thread headings in source order; move the note-on-this-file text to the opening line | Judgment |
| No `## Open Threads` | Add it, listing what is unresolved, or one statement saying nothing is | Judgment |
| Process rules and dated side sections inside the map (Gaps) | Keep as threads if they carry links; otherwise move to the source | Judgment |
| `source_note` as plain text | Quoted wikilink | Mechanical |
## Done Conditions
- Nearly every statement has a wikilink; no checkboxes, no prose paragraphs.
- Every thread in the source is a section or a named open thread.
- Missing link targets were raised as questions, not created as stub notes.
- The note passes [[Vault Lint]] for the `action` family.
## Gold Standard Example
[[10_Areas/AI/Setup/Gaps|Gaps]]: type `action`, statements grouped by thread, a source note, and an Open Threads section. It also carries two dated process rules, which Legacy Shapes treats as judgment.
