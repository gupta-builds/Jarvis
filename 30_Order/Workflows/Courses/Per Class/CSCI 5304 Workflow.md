---
type: evergreen
status: sprout
created: 2026-09-28
updated: 2026-09-28
tags:
  - system
  - workflow
  - CSCI5304
notes:
  - "[[Course Production Workflow]]"
  - "[[Weekly Workflow]]"
  - "[[Textbook Workflow]]"
  - "[[Textbook Map Workflow]]"
  - "[[Concept Workflow]]"
  - "[[Homework Workflow]]"
  - "[[CSCI 5304 Board]]"
---
# CSCI 5304 Workflow
This is the course-specific routing contract for Computational Aspects of Matrix Theory. It works with the course Board and the generic course standards/workflows. The Board remains the authority for dates, weights, policies, and unresolved facts (including the three real schedule anomalies and the Quiz #1-never-happened correction); this note explains how to turn those facts into notes, week after week, without re-deriving the process each time.

## Course shape - why this course's workflow differs from a slides-based course
No lecture slides exist for this course at all, ever - confirmed by directly listing the source folder. What actually exists, week to week, is some mix of: the textbook (Trefethen & Bau, fully mapped in [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|Textbook Map]]), paper/written homework (Gradescope-submitted, from real textbook problems), coding homework that will arrive as **.ipynb notebooks** once assigned, and whatever the professor writes on the board during class - captured only by the raw lecture transcript. This means the source-of-truth hierarchy for "what happened in this lecture" is inverted relative to a slides-heavy course: there is no deck to fall back on if the transcript is thin.
**The governing rule, stated directly by the user:** if a file exists for what was covered (a .ipynb notebook, a homework PDF, anything the professor actually handed out), use it directly - that's the easy, high-confidence path. If no file exists for a given lecture, the weekly note has to be built entirely from the real transcript plus the textbook - there is no third option to fall back on.

## Source hierarchy and trust
1. Live Canvas/schedule and instructor announcements control dates, quiz cadence, and policy - see [[CSCI 5304 Board]]'s live schedule-anomaly warnings before trusting any date, including the real 2026-09-17 fact that Quiz #1 didn't happen in class as printed.
2. **A provided file for the lecture (.ipynb notebook, homework PDF, board photo) outranks the transcript** whenever one exists - it's the professor's own artifact, not a transcription of what they said about it.
3. **The raw lecture transcript** (`Lecture/Transcripts/`) is the fallback and, for most of this course so far, the *only* lecture source - treat it as primary, not secondary, when no file exists for that day.
4. **The textbook**, fully mapped against the schedule in [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|Textbook Map]], supplies the standard treatment and terminology; the map's own Methodology note explains a real local tooling limitation (this course's PDF copy doesn't extract cleanly with local tools) - Gemini Notebook, not a local script, is the actual source of verified page/subsection citations.
5. Existing vault notes provide continuity and style, not authority, when they conflict with a primary source above.
If a live source and an existing note disagree, update the note with the dated correction and keep the source distinction visible (the Board already does this for the Quiz #1 and schedule-anomaly facts) - never silently smooth over a conflict.

## Weekly operating rhythm
### Before the lecture
1. Read the Board's schedule row for the week and the matching Lecture range in [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|Textbook Map]] - the map already tells you which Lecture number(s) are due and what the book's standard scope is, so there's no need to re-derive the reading-to-week mapping from scratch each time.
2. Check the source folder for that week's real files first (.ipynb notebooks, homework PDFs). If any exist, that's this week's primary lecture source - route it through the Notebook prompt directly (converted to PDF first if it's a .ipynb, per the Notebook/File-format rule below).
3. If no file exists, the transcript is the primary source once the lecture happens - nothing to prepare here beyond confirming the transcript file is where it's expected (`Lecture/Transcripts/`).
### After the lecture
1. Run the two-set prompt workflow recorded in [[CSCI 5304 Board]]'s "Weekly Note-Building Workflow" section: Notebook prompts land that lecture's `Lecture - N.md` textbook note first, then the single Codex prompt for the week builds `Weekly/Week - N.md` from the transcript plus those landed notes. The reusable master templates live in [[20_Progress/Degree/Repetitive Things|Repetitive Things]]; the course-specific filled prompts are staged per week-pair in files like [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2 & 3 (Prompts)|Week - 2 & 3 (Prompts)]].
2. Update [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|Textbook Map]]'s Status section and [[20_Progress/Degree/CSCI 5304/Weekly/Weekly Board|Weekly Board]]'s Map section once the week's notes actually land - not before.
3. Only after studying the landed week - see Concept-note discipline below - decide whether either lecture that week earns a concept note.

## Concept-note discipline (this course runs leaner than most)
Most of this course's material is either genuinely trivial once the weekly note and textbook note exist, or is fully covered by the textbook note's own depth - creating a concept note for every named term would just duplicate what [[Lecture - N]] notes already hold. The rule for this course, stated directly by the user: **at most two concept notes per week - one per lecture, reserved for the single deepest, most load-bearing concept that lecture introduced**, created only during actual studying (not automatically alongside the weekly/textbook build), and only when that concept genuinely needs its own reusable, cross-referenced treatment beyond what the Lecture note already gives it. Candidates so far, not yet created (per [[Concept Workflow]], created only once actually studying that material): **Singular Value Decomposition** (Lectures 4-5's real center of gravity) and **Norms and Induced Matrix Norms** (Lecture 3-4's real center of gravity) are the two strongest candidates for Weeks 2-3 - everything else so far (orthogonality, the matrix inverse, rank) is judged trivial enough that the Lecture notes' own Key Concepts sections already cover it adequately.

## Notebook and file-format rule (real, load-bearing for this course)
Gemini Notebook accepts PDFs and Word documents, not .ipynb notebooks directly (confirmed across every course that's used this workflow so far). This course will eventually be assigned **coding homework as .ipynb files** - when that happens, export each notebook to PDF first (Colab: File → Print → Save as PDF, or File → Download → PDF; VS Code/Jupyter locally: use `jupyter nbconvert --to pdf`) before uploading it as a Notebook source, exactly as the CSCI 4521 precedent in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] already established. Do not wait for this to become a live problem before knowing the fix.

## Reading-ahead and prompt-execution cadence
The course's filled prompts (not templates - real, dated, source-cited prompts ready to run) live per week-pair inside `20_Progress/Degree/CSCI 5304/Weekly/`, e.g. [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2 & 3 (Prompts)|Week - 2 & 3 (Prompts)]] - each such file opens with a real source manifest (which transcript covers which Lecture, and which weeks/lectures don't have a transcript yet) before the filled prompts themselves. Run the Notebook prompts for a week's Lecture(s) before running that week's single Codex prompt - the Codex prompt cites the landed Lecture notes by path and has nothing real to reference otherwise. When a new week-pair's prompts are needed, extend this same per-week-pair staging pattern rather than inventing a new file shape.

## Status and handoff
Use `seed` for a newly created scaffold, `sprout` for a source-grounded working note. Every active note should leave a concrete `next`: which prompt to run, which lecture to reconcile, or which link to verify.

## Stop-and-ask conditions
Ask the user or verify the live source when: a Canvas date conflicts with the Board's schedule table (three known anomalies already logged - don't assume a fourth is also an artifact without checking); a week's source folder has no transcript AND no provided file (nothing to build from - don't invent lecture content from the schedule/textbook alone, as flagged explicitly in the Week 3 Codex prompt's own warning); a .ipynb homework file won't convert cleanly to PDF; or a proof/derivation in a landed Lecture note conflicts between what the transcript shows and what this book's standard treatment says (state both, source-attributed, rather than picking one silently).

## Done conditions for this course workflow
- The Board is the authority for schedule, grading, and policy, including its logged real anomalies.
- A provided file (notebook, homework PDF) always outranks the transcript for that lecture's content; the transcript is the fallback, not a permanent secondary source, once a file exists.
- Textbook Lecture notes are Notebook-prompt-derived (or transcript-and-standard-knowledge-derived with the page-citation caveat logged, per [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|Textbook Map]]) and arranged/checked in Obsidian, never invented from scratch.
- At most two concept notes exist per week, each earned by genuine depth, not created reflexively.
- Every week's prompts are staged with a real source manifest before being run.
- Unknowns (missing transcripts, unconverted .ipynb files, schedule conflicts) remain visible instead of being guessed past.
