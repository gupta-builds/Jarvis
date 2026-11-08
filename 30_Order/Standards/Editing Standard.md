---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Conformance on Touch]]"
  - "[[Enrichment]]"
gold_standard: none
notes:
  - "[[Conformance Standard]]"
  - "[[Frontmatter Standard]]"
  - "[[Jarvis Writing and Formatting]]"
---
# Editing Standard
==Edit the smallest piece that fixes the problem, keep everything that is the owner's, and leave the note closer to its Standard than you found it.==
This is the Standard for changing a note that already exists. It joins the rules scattered across CLAUDE.md, AGENTS.md, and [[Jarvis Writing and Formatting]] with the one rule new to this vault: an edit also brings the note toward its Standard ([[Conformance on Touch]]). It is not the Standard for creating a note, which is the family's Standard and Template.
## Rules
| # | Rule | Why | Enforced by |
|---|---|---|---|
| 1 | Search first and extend the canonical note | Most new notes should have been edits, and duplicates split the backlinks | Reader |
| 2 | Patch by heading. Change the section that is wrong; do not rewrite the file to change a paragraph | A rewrite loses the owner's wording and makes the diff unreviewable | Reader |
| 3 | Keep the owner's voice. Add depth under `## Addendum` or `## Jarvis Enrichment` when the content is theirs; correct in place only when it is plainly wrong. Never replace a human note with generic prose ([[Enrichment]]) | The owner must be able to tell their words from the assistant's | Reader |
| 4 | Preserve frontmatter keys and wikilinks. Rename or remove a key only when a Legacy Shapes table or the user says so. Move a link target with a link-aware move, not a text replace | A removed key breaks a query; a text replace breaks other notes | Reader |
| 5 | Move `updated` only for a meaningful change: a new or changed claim, section, link target, or `next:`. Whitespace, a typo, or a reformat does not count | `updated` is how a review tells live notes from stale ones | Reader |
| 6 | A `status: tree` note gets a proposal first: state the change and why, then wait | Stable notes are the ones other notes lean on | Reader |
| 7 | Delete or move a note only on an explicit instruction. Before any command that could discard uncommitted work, run `git status` and stash or commit what is there | A deleted note cannot be recovered from sync | Reader |
| 8 | A correction to a Standard replaces the rule; it is not a dated addendum ([[Note Kit Standard]]) | A Standard with layers cannot be followed | Reader |
| 9 | Touching a note means fitting it: fix its frontmatter, headings, and links to its Standard, or say which part you left and why | Notes reach the fit target only by being touched | Lint, checks 1 to 6, for the result |
## Example
- **Right:** `## Jarvis Enrichment`
- **Wrong:** None seen.
## Done Conditions
- The diff is limited to the intended section plus any mechanical conformance fixes.
- Frontmatter keys and wikilinks that existed still exist, unless a rule above allowed the change.
- `updated` moved if and only if the change was meaningful.
- Nothing was deleted or moved without an instruction.
## Gold Standard Example
None. A policy has no instance. `## Jarvis Enrichment` exists in `40_Resources/Obsidian/Jarvis Enrichment Engine` and in the Cross-Laptop Sync Findings notes; whether those follow rule 3 has not been reviewed.
