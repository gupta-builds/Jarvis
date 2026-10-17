---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
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
This is the standard for changing a note that already exists. It joins the rules scattered across CLAUDE.md, AGENTS.md, and [[Jarvis Writing and Formatting]] with the one rule new to this vault: an edit also brings the note toward its Standard ([[Conformance on Touch]]). Creating a note is a different job, covered by the family's Standard and Template.
## Rules
1. **Search first.** Extend the canonical note. Most new notes should have been edits.
2. **Patch by heading.** Change the section that is wrong. Do not rewrite the file to change a paragraph.
3. **Keep the owner's voice.** Add depth under an `## Addendum` or `## Jarvis Enrichment` heading when the content is theirs; correct in place only when it is plainly wrong. Never replace a human note with generic prose ([[Enrichment]]).
4. **Preserve frontmatter and wikilinks.** Never rename or remove a key unless a Legacy Shapes table or the user says so. If a link target moves, use a link-aware move ([[Obsidian CLI]] or the vault move tool), not a text replace.
5. **Move `updated` only for a meaningful change:** a new section, a changed claim, a new purpose. A typo does not.
6. **`status: tree` means propose first.** State the change and why, then wait.
7. **Do not delete or move a note without an explicit instruction.** Before any command that could discard uncommitted work, run `git status` and stash or commit what is there.
8. **Corrections to a Standard replace the rule.** Do not append a dated addendum ([[Note Kit Standard]]).
9. **Touch means fit.** While in the note, fix its frontmatter, headings, and links to its Standard, or say which part you left and why.
## What counts as meaningful
Meaningful: a new or changed claim, section, link target, or `next:`. Not meaningful: whitespace, typo, or reformatting that changes no content.
## Done Conditions
- The diff is limited to the intended section plus any mechanical conformance fixes.
- Frontmatter keys and wikilinks that existed still exist, unless a rule above allowed the change.
- `updated` moved if and only if the change was meaningful.
- Nothing was deleted or moved without an instruction.
## Gold Standard Example
None. A policy has no instance.
