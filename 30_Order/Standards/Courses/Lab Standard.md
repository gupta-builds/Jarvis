---
type: evergreen
status: sprout
created: 2026-09-08
updated: 2026-09-08
tags:
  - system
  - standards
notes:
  - "[[Lab Template]]"
  - "[[Lab Workflow]]"
  - "[[HUMAN_WRITING]]"
---
# Lab Standard
==A lab note's real value is its error log — Problem, Fix, Why — because the same class of error costs an hour the first time and should cost a minute the second.==
This is the content standard for `class` / `input_kind: lab` notes. A lab is graded but usually low-stakes individually — the point of writing it up isn't proving the work happened, it's building a personal debugging reference that gets faster to consult every week it's used.
## Maps To
- Template: [[Lab Template]]
## Used By Workflow
- [[Lab Workflow]] — when the note gets created relative to the lab session, and how it connects to that week's lecture material.
## Per-Heading Standard
### Frontmatter
`type: class`, `input_kind: lab`, `status: seed` — labs rarely need to mature past `seed`, since the value is the errors-and-fixes log, not a polished writeup. `area:` links the course Board and the week the lab paired with.
### Goal
One line: what the lab was actually trying to accomplish, in your own words, not the assignment's title.
*Density:* one sentence.
> [!WARNING]
> Copying the assignment title verbatim as the goal — that's a label, not a statement of what you were trying to do.
### Procedure / Key Steps
The real sequence followed, compressed to the steps that actually mattered — not every click, but every decision point.
*Density:* enough steps that redoing the lab from this note alone would work.
> [!WARNING]
> A procedure so compressed it skips the actual decision points (which flag to pass, which config to change) that were the entire point of the lab.
### Results
What actually came out — a number, a passing test suite, a working build. State it plainly; this section exists to make later review fast, not to be impressive.
*Density:* short, factual.
### Errors + Fixes
==The centerpiece of this Standard.== One entry per real error hit: *Problem:* what broke and how it showed itself. *Fix:* what actually resolved it. *Why:* the underlying mechanism, so the next occurrence of the same class of error gets recognized faster, not just patched again.
*Density:* every real error hit, however small — this section's value compounds across the semester.
> [!WARNING]
> Recording the fix without the *why*. "Added a semicolon" without explaining what class of syntax error produced it doesn't help the next time a similar-looking error shows up in a different form.
### Flashcards
`#cards/[course]`, only for a genuinely reusable debugging pattern from this lab — not every lab needs cards; most of the reusable value already lives in Errors + Fixes.
> [!WARNING]
> Forcing flashcards out of a lab that had no real conceptual content, just mechanical setup steps.
## Done Conditions
- Procedure is detailed enough to redo the lab from the note alone.
- Every real error hit has a Problem/Fix/Why entry, not just a Fix.
- Goal is stated in your own words, not copied from the assignment.
- No duplicate frontmatter keys; no `---` in the body; zero blank lines except after a callout.
## Gold Standard Example
None yet in the vault — this Standard is new this session. Update this line once a real lab note exists with a substantive Errors + Fixes section.
