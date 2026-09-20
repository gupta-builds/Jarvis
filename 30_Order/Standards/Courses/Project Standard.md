---
type: evergreen
status: sprout
created: 2026-09-08
updated: 2026-09-08
tags:
  - system
  - standards
notes:
  - "[[Project Template]]"
  - "[[Projects Workflow]]"
  - "[[Vault Rules — Complete AI Ruleset]]"
  - "[[HUMAN_WRITING]]"
---
# Project Standard
==A course project note records the real decision — which option got chosen and why — not just the finished write-up; the options you didn't pick are what make the choice legible later.==
This is the content standard for `class` / `input_kind: project` notes: midterm projects, final projects, and any multi-week course project. It is distinct from the general [[Project Standard|20_Progress Project Standard]] one level up — that one tracks an ongoing personal/software project's live state; this one documents a bounded, graded academic deliverable that gets submitted once and then stays as reference. Do not confuse the two just because they share a name.
## Maps To
- Template: [[Project Template]]
## Used By Workflow
- [[Projects Workflow]] — when to create the note (project assigned), when to update it (option chosen, submission made), and how it links back to the course Board.
## Per-Heading Standard
### Frontmatter
`type: class`, `input_kind: project`, `status: seed` while in progress → `sprout` once the chosen approach and concept links are filled in. `area:` links the course Board and any specific concept notes the project leans on. `related:` lists the specific week notes and chapter notes the project draws from — path-qualify these, since project-adjacent week numbers collide across courses the same way lecture weeks do.
> [!WARNING]
> A `related:` list of bare `[[Week - 11]]` style links with no path — verify which course's Week 11 before linking.
### Overview
One to three sentences: what the project requires in general terms, and what shared scaffold or codebase every option builds from.
*Density:* short — this orients, it doesn't explain any one option yet.
> [!WARNING]
> Restating the assignment title instead of saying what the deliverable actually requires.
### Project Options
If the assignment offers a choice, one `###` per option, each with: what it does in one line, the core algorithms/techniques it exercises, the source files/notebooks it starts from, and any real reference material (papers, named methods) behind it. Mark the chosen one `(chosen)` in its heading.
*Density:* one option gets picked eventually, but document all of them — the rejected options are what make the choice legible on review. CSCI 4041's Final Project documents all three graph-algorithm options (Maze, Heuristic Pathfinding, Network Flow) even though only Maze was built.
> [!WARNING]
> Only documenting the chosen option. A project note with one option documented can't explain *why* that one, which is the point of this section.
### Chosen Project
A real explanation of the picked option: what it models, the key algorithms doing the work, and — this is the section's actual job — the **mechanism that makes it work**, stated precisely enough that re-reading this note six months later would let you rebuild the approach without opening the code. Link the specific week notes and textbook chapters the approach draws from.
*Density:* this is the bulk of the note. CSCI 4041's Midterm Project names the exact stress-test parameters used (`random.seed(4041)`, 600 operations, 60/40 insert/delete split) — that level of specificity, not a general description.
> [!WARNING]
> A summary that could describe any implementation of the algorithm, with nothing specific to what was actually built. Name the actual parameters, the actual invariants checked, the actual test data.
### Concept Links
Verified wikilinks to the concept notes, week notes, and textbook chapters this project actually draws from — the retrieval path back to the theory behind the code.
*Density:* four to eight links, matching what Chosen Project already discussed.
> [!WARNING]
> Linking concepts that were never actually used in this specific project, just because they're topically nearby.
### Post-Submit Reflection
What failed first while building it, and what pattern in that failure would repeat on the next similar project. Written after submission, not before.
*Density:* two to four honest bullets — the value is in naming a real recurring pattern, not documenting every bug.
> [!WARNING]
> Skipping this section because the project already got submitted. This is the section that makes the next project faster.
## Done Conditions
- Every option the assignment offered is documented, not just the chosen one.
- Chosen Project states the actual mechanism with real specifics (parameters, invariants, test setup) — not a generic description.
- Concept Links are verified to exist and were genuinely used.
- Post-Submit Reflection is filled in after submission — not left as a template placeholder.
- No duplicate frontmatter keys; no `---` in the body; zero blank lines except after a callout.
## Gold Standard Example
- [[20_Progress/Degree/CSCI 4041/Final Project|Final Project]] — three fully-documented options with source files and reference papers, a chosen-project section naming the exact mechanism (BFS on an unweighted grid computes shortest path in cell-count, which is exactly what "shortest maze path" means), and real concept links across four different weeks.
- [[20_Progress/Degree/CSCI 4041/Midterm Project|Midterm Project]] — same shape with named stress-test parameters and a four-invariant validation suite spelled out precisely enough to reimplement from the note alone.
