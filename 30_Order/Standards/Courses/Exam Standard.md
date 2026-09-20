---
type: evergreen
status: sprout
created: 2026-09-08
updated: 2026-09-08
tags:
  - system
  - standards
notes:
  - "[[Exam Sheet Template]]"
  - "[[Exam Workflow]]"
  - "[[HUMAN_WRITING]]"
---
# Exam Standard
==An exam note is worth less for the cramming it holds than for the reflection it holds after — the post-exam section is what actually improves the next exam.==
This is the content standard for `class` / `input_kind: exam` notes: midterm and final exam prep sheets. The note has two real jobs, done at two different times: capture the exam's actual scope and format before sitting it, then record precisely what was missed and why immediately after grades come back. Skipping either half turns the note into either an ungrounded study guide or a forgotten artifact.
## Maps To
- Template: [[Exam Sheet Template]]
## Used By Workflow
- [[Exam Workflow]] — when the sheet gets created relative to the exam date, and what triggers filling in the post-exam half.
## Per-Heading Standard
### Frontmatter
`type: class`, `input_kind: exam`, `status: seed` while studying → `sprout` once the post-exam reflection is filled in. `area:` links the course Board and the specific week/chapter notes the exam covers.
> [!WARNING]
> Creating the note the night before with no `area:` links back to what was actually covered — the sheet becomes disconnected from the weeks it's supposed to be reviewing.
### Topics Covered
The exam's actual scope, pulled from the syllabus or the professor's own review announcement — not guessed. Link each topic to its week/chapter note.
*Density:* every topic named in the syllabus or review session, each with a real link, not a vague theme.
> [!WARNING]
> Listing "everything so far" instead of the specific topics actually named as in-scope. A midterm rarely covers literally everything covered to date.
### Format & Resources Allowed
What kind of exam it is (proctored, take-home, open-note, closed-book), the time limit, and exactly what's allowed in the room — this genuinely changes how you should prepare.
*Density:* short, factual, pulled directly from the course Board's grading/policy section.
> [!WARNING]
> Skipping this because "it's obvious" — CSCI 5304's zero-AI-tools policy and a take-home exam in a different course require completely different prep, and this section is where that distinction gets recorded per-exam.
### Study Plan
A real plan with a timeline, not a topic list — what gets reviewed which day, and in what order, working backward from the exam date.
*Density:* enough days to cover every linked topic at least once, with the hardest topics first, not last.
> [!WARNING]
> "Review everything the night before" is not a study plan.
### Post-Exam Reflection
Filled in only after the exam, ideally the same day, before the memory of what was hard fades. What was missed, the actual reason it was missed (misread the question, didn't know the material, ran out of time), and what that implies for the next exam's study plan.
*Density:* one entry per point lost, where that's knowable — otherwise the general pattern that emerges.
> [!WARNING]
> Leaving this section as a template placeholder because the exam is already over and done with. This section is the entire reason the note earns `status: sprout`.
## Done Conditions
- Topics Covered links real week/chapter notes, not vague themes.
- Format & Resources Allowed is filled in before the exam, not guessed after.
- Study Plan has an actual day-by-day shape.
- Post-Exam Reflection is filled in within a day or two of getting results back.
- No duplicate frontmatter keys; no `---` in the body; zero blank lines except after a callout.
## Gold Standard Example
None yet in the vault — this Standard is new this session, written before any exam under it has actually happened. Update this line once a real exam sheet exists with both halves filled in.
