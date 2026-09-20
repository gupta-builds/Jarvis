---
type: evergreen
status: sprout
created: 2026-09-08
updated: 2026-09-08
tags:
  - system
  - standards
notes:
  - "[[Weekly Board Template]]"
  - "[[Weekly Workflow]]"
  - "[[Course Week Standard]]"
  - "[[MOC Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Week Standard
==A course's Weekly Board is a MOC scoped to one course — it explains how the weeks connect, it does not just list them.==
This is the content standard for each course's `Weekly/Weekly Board.md` — the index note that grows one entry at a time as `Week - N.md` notes get created through the semester. This Standard governs the index; [[Course Week Standard]] governs what goes inside each week note it points to. Do not write deep lecture content here — that belongs in the week note itself, linked from this one.
## Maps To
- Template: [[Weekly Board Template]]
## Used By Workflow
- [[Weekly Workflow]] — the Weekly Board gets one new line the same session a new week note is created, not batched up later.
## Per-Heading Standard
### Frontmatter
`type: index`, `status:` follows the evergreen maturity model (`seed | sprout | tree` — starts `seed`, moves to `sprout` once real weeks exist), `tags:` includes `moc`, `notes:` lists the course Board and every week note created so far, `next:` the next week expected.
> [!WARNING]
> `notes:` left as `[]` after weeks already exist — the whole point of this file is to make those weeks findable from one place.
### Purpose
One to two sentences: which course this indexes and where the course Board lives for everything that isn't week-by-week content.
*Density:* short — one line pointing back to the course Board is often enough.
> [!WARNING]
> Restating what a Weekly Board is instead of naming the specific course.
### Map
Prose, not a bare list — one sentence per week stating what it covered and how it connects to the week before it (a new topic, a continuation, a synthesis point). This is what turns the index into something worth reading instead of a folder listing Obsidian already provides.
*Density:* grows by one sentence per week, in order.
> [!WARNING]
> A bullet list of bare `[[Week - 1]]`, `[[Week - 2]]` links with no surrounding sentence — that's what the Dataview block below already does automatically; the Map has to add something Dataview can't.
### Status
Optional running note on pace — behind, on schedule, or ahead of the syllabus schedule in the course Board.
*Density:* one line, updated as needed, not a formal table for most courses.
### Dataview
A live query listing every week note in this course folder, sorted by number, at the bottom only.
*Density:* one block; do not hand-maintain a table Dataview already generates.
```dataview
TABLE status, next
FROM "<course folder path>/Weekly"
WHERE input_kind = "lecture"
SORT file.name ASC
```
> [!WARNING]
> Putting the Dataview block above the Map — see [[MOC Standard]] for why that's the exact failure this shape avoids.
## Done Conditions
- The Map is prose connecting week to week, not a bare link list.
- `notes:` lists every real week note that exists, verified.
- Updated the same session a new week note is added — not batched.
- Dataview block sits below the Map, never above it.
- No duplicate frontmatter keys; no `---` in the body; zero blank lines except after a callout.
## Gold Standard Example
None yet in the vault — the `Weekly/` folder pattern is new this semester. The first course to fill in real weeks under this shape becomes the reference; update this line once one exists.
