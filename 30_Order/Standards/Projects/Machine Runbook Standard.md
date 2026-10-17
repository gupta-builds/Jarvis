---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: machine-runbook
tier: 1
maps_to:
  - "[[Machine Runbook Template]]"
used_by: []
gold_standard: "[[40_Resources/CS/Concepts/New Laptop/Old Laptop Decommission Checklist|Old Laptop Decommission Checklist]]"
notes:
  - "[[Log Standard]]"
  - "[[System Component Standard]]"
---
# Machine Runbook Standard
==A runbook says why it exists, what must be true before starting, the steps, and the dated checkpoints that prove each step happened on the real machine.==
This is the standard for notes that rebuild, migrate, or configure a computer: the New Laptop set (Acer and Dell rebuild, WSL, VS Code, sync, decommission). They are `reference` notes of kind `runbook`, not course concepts. Tooling the vault runs is documented under [[System Component Standard]]; a machine's dotfile snapshots are not notes.
## Spec
```json
{
  "family": "machine-runbook",
  "tier": 1,
  "match": {"type": "reference", "kind": "runbook", "path": "^40_Resources/CS/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^40_Resources/CS/Concepts/New Laptop/"}],
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "reference_kind"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Why This Note Exists", "Steps", "Checkpoints"],
  "optional_headings": ["Gate", "Sources", "Open Questions", "Related Notes"]
}
```
## Headings
### Frontmatter
`type: reference`, `reference_kind: runbook`. `machine` (acer, dell, or both) and `next` are optional but used. `status`: `seed` while unverified, `sprout` while being run, `tree` once a full run confirmed it, `archived` when the machine is retired. Do not copy course keys (`course`, `track`, `prerequisites`, `mastery_level`).
> [!WARNING]
> Building a runbook on the Concept template. Fifty New Laptop notes carry `course: Life`, and seven end with a Flashcards section.
### Why This Note Exists
Two to four sentences: the situation, the machine, and what this note decides or does that no other note does. A superseding note is named here.
### Gate
Optional. What must be true before the steps start, as checks that can fail. Real runbooks put a gate before anything destructive.
### Steps
Numbered, in order, with the exact command or setting and the expected result. Mark a step that changes state, such as a delete, a registry edit, or a sync reset.
*Density:* every step runnable by someone who was not there.
> [!WARNING]
> A step that says "set up sync" with no command. Write the command and what a good result looks like.
### Checkpoints
Dated entries, newest last, recording what was actually observed on the machine: `**YYYY-MM-DD, machine:** what ran, what the output showed`. A correction is a new checkpoint; the earlier one stays.
### Sources
Optional. Official docs or notes the steps came from.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: note`, `concept`, `project`, `input`, or `evergreen` under New Laptop | `type: reference`, `reference_kind: runbook` | Mechanical |
| `course: Life`, `track: [laptop]`, `prerequisites`, `tags: [note]` | Remove; move useful links to `notes:` | Mechanical |
| `status: seedling` | `seed` | Mechanical |
| One-Line Answer, Mechanism, Evidence From This Vault, Flashcards | Why This Note Exists, Steps, Checkpoints; drop Flashcards | Judgment |
| Phase or Day sections, "Decommission steps" | Steps | Judgment |
| "Live checkpoint — 2026-10-12", "Acer checkpoint" sections | Checkpoints entries | Judgment |
| Dotfile snapshots (`.pre-acer`, `.bak-*`, plugin trees) in the same folders | Not notes; keep out of the vault tree | Out of scope here |
## Done Conditions
- The note has Why This Note Exists, Steps, and Checkpoints, with `reference_kind: runbook`.
- Each state-changing step is marked, and its checkpoint names the machine and the date.
- No course keys or Flashcards remain.
- The note passes [[Vault Lint]] for `machine-runbook`.
## Gold Standard Example
[[40_Resources/CS/Concepts/New Laptop/Old Laptop Decommission Checklist|Old Laptop Decommission Checklist]]: a stated reason, an execution gate, decided exclusions, numbered steps, and an open question. It is typed `note` with course keys, which Legacy Shapes rewrites.
