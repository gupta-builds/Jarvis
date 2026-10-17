---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Conformance Standard]]"
trigger: Any session opens an existing note to change it, or to rely on it.
notes:
  - "[[Editing Standard]]"
  - "[[Frontmatter Standard]]"
  - "[[Vault Lint]]"
---
# Conformance on Touch
Bring a note to its Standard in the same edit that touched it, so the vault reaches 90% fit by being used instead of by a rewrite.
## Use when
Whenever a session reads a note to build on it or edits it. It does not apply to notes the session only searches past.
## Steps
1. Find the family: run [[Vault Lint]] on the path, or match the note's `type`, kind, and folder in [[Note Type Registry]]. If it is `unmapped`, the family has no Standard. Say so, record it in the session log, and do not guess.
2. Read the family Standard: `Spec`, `Headings`, and `Legacy Shapes`.
3. Make the change you were asked for first, following [[Editing Standard]].
4. Apply the mechanical fixes from `Legacy Shapes` in the same save: strip a byte-order mark, resolve date placeholders, map legacy `type`, `status`, and `*_kind` values, remove `#` from tags, unquote numbers.
5. Fix structure where it is unambiguous. Rename a heading the Legacy Shapes table maps, add a section you can fill from the note's own content or its sources. Never delete content to make a heading fit.
6. Leave what needs judgment or a source you do not have. Name it in `next:` so the next touch finds it. A `status: tree` note gets the proposal, not the edit.
7. Run [[Vault Lint]] on the path again. The failing checks must be fewer than before.
8. Move `updated` only if the edit was meaningful.
9. Add one line to the session log: the note, its family, the checks fixed, the checks left.
## Do not
Do not fix other notes in the same pass. Do not change what a note claims to satisfy a heading. Do not invent a family for an unmapped note.
## Done when
- The requested change is made and the note fails fewer checks than before.
- Anything left is named in `next:`.
- The session log has the line.
