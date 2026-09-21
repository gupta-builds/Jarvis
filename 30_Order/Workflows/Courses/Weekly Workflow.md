---
type: evergreen
status: sprout
created: 2026-09-08
updated: 2026-09-20
tags:
  - system
  - workflow
notes:
  - "[[Week Standard]]"
  - "[[Weekly Standard]]"
  - "[[00_Workflows Index]]"
---
# Weekly Workflow
Create and link a new week note as each course's lectures happen, so a course's `Weekly/` folder never gets more than one week behind real class time.
**Use when:** a course's lecture(s) for a given week have happened and the material is fresh enough to write up.
**Moves:** lecture + that week's textbook reading → `<Course>/Weekly/Week - N.md`, indexed from `<Course>/Weekly/Weekly Board.md`.
**Template:** [[Week Template]]
## Normative procedure
Create the week note before lecture from the verified schedule, landed textbook note, assigned slides/PDFs, notebooks/Python, prior concepts, and relevant assignments. Put pre-lecture slide/source notes in the weekly note's `## Lecture` area and label them clearly. During lecture, the user writes live capture in that same area. Preserve human capture; agents may structure, link, and reconcile it afterward but may not delete, overwrite, or replace it with an imagined transcript.
After lecture, reconcile actual capture with textbook, slides/PDFs, code, assignments, and concepts. Update the textbook delta, synthesis, concepts, Board, assignment notes, open questions, and cards only where evidence warrants it. Update the Weekly Board and Textbook Map after the week note's actual status is known. If the lecture differs from pre-lecture expectations, preserve the difference and label the source.
## Steps
1. Read [[Weekly Standard]] before writing — it governs the note this workflow creates.
2. Create `Week - N.md` in the course's `Weekly/` folder from [[Week Template]], filled in the same day as the lecture where possible.
3. Read the matching textbook section and write the `## Lecture-to-textbook synthesis` section — this is the step most likely to get skipped under time pressure; do not skip it.
4. Open the course's `Weekly Board.md` and add one Map sentence for the new week per [[Week Standard]] — same session, not batched for later.
5. Spawn any new concept notes the week produced, linked from `## Concepts created today`, following [[Concept Standard]].
6. Update the course's Board note's `next:` field if the new week changes what the immediate next step is.
## Frontmatter to set
```yaml
type: class
input_kind: lecture
status: seed
next: "[[Week - N+1]]"
```
## Done when
- The week note passes [[Weekly Standard]]'s Done Conditions, including the synthesis section.
- `Weekly Board.md` has a new Map sentence, not just a new frontmatter list entry.
- Any concept notes the week spawned actually exist, not just linked as stubs.
