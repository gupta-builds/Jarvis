---
type: index
status: sprout
created: 2026-09-21
updated: 2026-10-09
tags:
  - moc
  - fall2026
  - courses
notes:
  - "[[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]"
  - "[[CSCI 4511W Workflow]]"
  - "[[Course Production Workflow]]"
  - "[[Weekly Workflow]]"
next: "Dispatch the Mechanical Fixes prompt first (small, unblocks nothing else but is a five-minute win), then CSCI 4061 Week 1/Week 2 since that course has the most real unused source material sitting in its source folder already"
---
# Course Production Board - Fall'26
> [!IMPORTANT] Roster correction, 2026-10-09
> ENGL 1004 has been dropped. The active roster is CSCI 4511W, CSCI 4061, CSCI 4521, CSCI 5304, and MGMT 3015. ENGL handoff prompts below are historical and must not be dispatched. Five weeks are complete; Week 6 starts Monday, 2026-10-12. Degree planning is fixed for May 2028 in [[APAS]] and [[Fall'26 Syllabus#Path to Graduation]].

==This is the single dispatch board for catching all five active Fall'26 courses up to real, source-grounded weekly/textbook/assignment notes — one task list and one ready-to-paste handoff prompt per unit of work, so any session (this one or a fresh one, any model) can pick up exactly one row and execute it correctly without re-deriving context.== This note does not execute anything itself. It is the coordination layer between the planning pass that produced it and the execution sessions that will consume it.

## Purpose

Five active Fall'26 courses need their weekly notes, textbook notes, and assignment notes caught up to real class time. [[CSCI 4511W Workflow|CSCI 4511W]] already has the deepest system (a per-class Workflow file, a Board, real weekly/textbook/homework notes) and is being executed live in a separate session today — its remaining gaps are tracked here for visibility only, not dispatched from here. The other four active courses (CSCI 4061, CSCI 4521, CSCI 5304, MGMT 3015) have excellent Board/Preparation/Textbook-Map notes already, but almost no weekly, textbook, or assignment content, and none of them has a per-class Workflow file yet. Concept notes are explicitly out of scope everywhere on this board.

## Non-negotiable rules for every session executing off this board

1. **Read the relevant Standard before writing anything** — [[Weekly Standard]], [[Textbook Standard]], [[Homework Standard]], [[Board Standard]], [[Preparation Standard]] live in `30_Order/Standards/Courses/`. Read [[Course Production Workflow]] once, first, regardless of which row you're executing.
2. **Never fabricate live lecture capture.** The `## Lecture` section of a weekly note is protected human source material. Where real slides/PDFs/code/notebooks exist in the course's source folder, use them as the lecture's substance (they are legitimate pre-lecture/lecture source per [[Weekly Standard]]). Where nothing exists yet beyond the schedule, build everything else and leave the Lecture section explicitly marked pending — do not invent what was said in class.
3. **Textbook notes are Gemini-paste-and-polish, not agent-authored from scratch.** The user runs the reusable NotebookLM/Gemini Notebook prompt (template + a filled CSCI 4511W Chapter 2 instance live in `Repetitive Things.md`, `20_Progress/Degree/`) externally and pastes the raw output into the chapter note. The executing session's job is to take that pasted draft and bring it to full [[Textbook Standard]] shape — exactly what was done for [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|CSCI 4511W's Chapter - 2]], the gold example to match. Do not attempt to write a chapter note before a Gemini draft has been pasted in; mark those rows **blocked on user paste** until then.
4. **No concept notes.** Every course's `Concepts/` folder (or lack of one) stays untouched by this board's work.
5. **Search before creating.** Every row below already names the exact file to create or edit — do not duplicate.
6. **Update this board** when a row is completed: check its box, update the course's Status Snapshot, and note the actual session/date that did the work.
7. Every stale path below reads `D:\Users\_Anant\...` and must become `D:\_Anant\...` — the old-laptop path is still live in every Board note's Source of Truth section except this pass's fixes.

---

## CSCI 4511W — tracked here, executed elsewhere (not dispatched from this board)

**Status as of 2026-09-21 (per user report, live session in progress):** Problem Set 1's written portion is done; weekly notes ([[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week - 1]], `Week - 2`) are not yet in full [[Weekly Standard]] shape (confirmed directly: Week 1 has only the user's raw 9/9 definitions, no synthesis section; Week 2 doesn't exist as a file yet despite Ch 2.1-2.4 and Ch 3.1-3.2 lectures having happened). [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter - 2]] exists; **Chapter - 3 is still pending**. Do not duplicate this work from another session while it's live — check this board's Status line before starting anything on 4511W.

---

## Mechanical Fixes (one small handoff, covers all 5 in-scope courses)

- [ ] Fix stale `D:\Users\_Anant\...` → `D:\_Anant\...` path in the Source of Truth section of: `CSCI 4061 Board.md`, `CSCI 4521 Board.md`, `CSCI 5304 Board.md`, `MGMT 3015 Board.md`, `ENGL 1004 Board.md`.
- [ ] Fix `20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md` — page title is literally `# Untitled` (line 14 of the raw [[Week Template]] that was never renamed); change to `# Week - 1`.
- [ ] Fix `20_Progress/Degree/CSCI 5304/Weekly/Week - 1.md` — file exists but is completely empty; populate with the real [[Week Template]] scaffold (not left blank).
- [ ] Delete `20_Progress/Degree/Repetitive Things.sync-conflict-20260921-001822-2D4OE4D.md` — confirmed byte-identical to `Repetitive Things.md` via `diff`; a harmless Syncthing duplicate, not a real conflict.

```text
HANDOFF PROMPT — Mechanical Fixes
Read D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md and AGENTS.md first.
In the Jarvis vault, fix five small, verified bugs — no content production, just these fixes:
1. In each of these five files, find the "Source of Truth" section and replace every occurrence of
   the path "D:\Users\_Anant\" with "D:\_Anant\" (the old laptop had an extra "Users" folder that
   no longer exists on the current machine — the real folders now live directly under D:\_Anant\):
   - 20_Progress/Degree/CSCI 4061/CSCI 4061 Board.md
   - 20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md
   - 20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md
   - 20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md
   - 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md
   Do not touch CSCI 4511W Board.md — that course is being worked on live elsewhere.
2. In 20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md, the page reads "# Untitled" on line 14 —
   change it to "# Week - 1" (a leftover from the raw Week Template that was never renamed).
3. 20_Progress/Degree/CSCI 5304/Weekly/Week - 1.md exists but is completely empty. Copy the real
   scaffold from 30_Order/Templates/Classes/Week Template.md into it (frontmatter: type: class,
   input_kind: lecture, status: seed, area: [[UMN Board]] and [[CSCI 5304 Board]], tags: #class
   #Lecture). Do not add invented lecture content — this is the scaffold-fix only.
4. Delete 20_Progress/Degree/Repetitive Things.sync-conflict-20260921-001822-2D4OE4D.md — already
   confirmed byte-identical to Repetitive Things.md via diff, a harmless sync duplicate.
Report back which of the 4 items completed and any surprises (e.g. a path that didn't match as
expected — don't force a replace that doesn't fit, flag it instead).
```

---

## System work: per-class Workflow files

`30_Order/Workflows/Courses/Per Class/` currently holds only `CSCI 4511W Workflow.md`. This is the piece the user specifically flagged as needing to spread to the other five courses — the course-specific routing contract (source hierarchy, weekly rhythm, per-assessment-type routing, stop-and-ask conditions) layered on top of the generic Standards.

- [ ] `30_Order/Workflows/Courses/Per Class/CSCI 4061 Workflow.md`
- [ ] `30_Order/Workflows/Courses/Per Class/CSCI 4521 Workflow.md`
- [ ] `30_Order/Workflows/Courses/Per Class/CSCI 5304 Workflow.md`
- [ ] `30_Order/Workflows/Courses/Per Class/MGMT 3015 Workflow.md`
- [-] `30_Order/Workflows/Courses/Per Class/ENGL 1004 Workflow.md` - course dropped; do not create.

```text
HANDOFF PROMPT — Per-Class Workflow files (do all 5 in one session; they're short and mechanical
once the pattern is clear)
Read D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md and AGENTS.md first, then read
30_Order/Workflows/Courses/Per Class/CSCI 4511W Workflow.md in full — that is the exact shape and
depth to match for each of the five files below. Also read 30_Order/Workflows/Courses/Course
Production Workflow.md (the generic version this course-specific file sits on top of).
For each of these five courses, write 30_Order/Workflows/Courses/Per Class/<Course> Workflow.md,
built entirely from that course's own real Board note (read it in full first — it has the source
folder path, grading breakdown, schedule, and every policy needed):
- CSCI 4061 (source: 20_Progress/Degree/CSCI 4061/CSCI 4061 Board.md)
- CSCI 4521 (source: 20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md)
- CSCI 5304 (source: 20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md)
- MGMT 3015 (source: 20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md)
- ENGL 1004 (source: 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md)
Each file needs: frontmatter matching the 4511W Workflow's shape (type: evergreen, tags include
the course code); a "Course shape" paragraph; an assessment-routing table (which template/workflow
each graded item uses — Weekly, Textbook, Homework, Discussion, Project, Exam Sheet as fits this
course's actual assessments, not a copy of 4511W's); a "Source hierarchy and trust" section citing
this course's real source folder; a "Weekly operating rhythm" (before/during/after lecture) section;
an assignment-workflow section per this course's actual assignment types; a "Status and handoff"
section; and "Stop-and-ask conditions" specific to this course's real unresolved questions (pull
these directly from the Board note's own flagged warnings/anomalies — CSCI 5304 has three real date
anomalies, CSCI 4521 has an unconfirmed Fall-2025-dated syllabus, MGMT 3015 has two date anomalies,
etc. — do not invent generic ones).
For ENGL 1004 specifically: this course has no Weekly/ or Textbook/ folder by design (no textbook,
whole novels assigned by date, confirmed intentional in its Preparation note) and runs on discussion
sessions, not lecture-synthesis weeks. Flag explicitly in that Workflow file whether session notes
should use the Weekly Standard shape (like MGMT 3015's Lecture/ convention) or something lighter —
this is a real open design call, not something to silently decide; state your recommendation and
mark it for user confirmation rather than just picking one silently.
Cross-link each new Workflow file from its Standard's "## Used By Workflow" list is NOT required
(the generic Standards stay course-agnostic) — but do link each new Workflow to its course Board.
Report back: which 5 files were created, and for ENGL 1004, what recommendation you left for the
user to confirm.
```

---

## CSCI 4061 — Introduction to Operating Systems

**Status snapshot (2026-09-21):** Board/Preparation/Textbook Map are excellent and current. `Weekly/Week - 1.md` is an untouched template (title bug: `# Untitled`). No Week 2 or Week 3 file exists yet. Today is the start of Week 3 on this course's own schedule (Week 1–2 fully past). Real, unused source material: `Lecture/Lec01.pdf`–`Lec04.pdf`, `Labs/Lab 01.pdf`, lecture code (`Lecture/lecture01-code/`, `Lecture/lecture03-code/` — real `.c` files), and a cloned lab repo `csci4061-fa26/lab01-code/` (real `.c` files, Makefile, test cases) all sitting in `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\`. Kleppmann (2nd required textbook) is **not** in the source folder — flag to user, don't invent a fix. Textbook: Stevens & Rago PDF present.

- [ ] Week - 1 (real content: Ch. Intro 9/8, System Calls/Process Management 9/10 — Stevens Ch 1, 7, 8): rebuild from `Lec01.pdf`, `Lec02.pdf`, and `Lecture/lecture01-code/` as the lecture's real material.
- [ ] Week - 2 (Process Management cont'd, Low-Level I/O, Advanced I/O/Redirection — Stevens Ch 7, 3; due: Quiz 1 + Entrance Survey, Lab 1, Project 1 released + quiz): rebuild from `Lec03.pdf`/`Lec04.pdf` (verify which lecture PDF maps to which date first) and `Lecture/lecture03-code/`.
- [ ] Homework note for **Lab 1** (`20_Progress/Degree/CSCI 4061/Assignments/Lab - 1.md` or similar, per [[Homework Template]]) — built from `Labs/Lab 01.pdf` and the real `csci4061-fa26/lab01-code/` repo contents (`fork_exec.c`, `fork_wait.c`, `QUESTIONS.txt`, test cases). This is real, gradeable work already sitting on disk.
- [ ] Homework note for **Project 1** — spec not found locally as of this pass; flag as **needs the Canvas project spec**, don't guess its requirements.
- [ ] Textbook notes for Stevens Ch 1, 7, 8, 3 — **blocked on user pasting Gemini Notebook output** per chapter (see Repetitive Things.md's reusable prompt).
- [ ] Update `Weekly Board.md` Map/Status, `Textbook Map.md` Status, and Board `next:` once the above land.

```text
HANDOFF PROMPT — CSCI 4061 Week 1 + Week 2 + Lab 1 note
Read D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md, AGENTS.md, 30_Order/Standards/Courses/Weekly
Standard.md, and 30_Order/Standards/Courses/Homework Standard.md first. Then read 20_Progress/Degree/
CSCI 4061/CSCI 4061 Board.md in full (schedule, grading, source folder path).
The real source folder is D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\ — read
Lecture/Lec01.pdf, Lec02.pdf, Lec03.pdf, Lec04.pdf, Labs/Lab 01.pdf, and the code files in
Lecture/lecture01-code/ and Lecture/lecture03-code/ directly (they're real PDFs and C source files,
read them, don't guess their contents).
1. Fix 20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md: it currently has the literal placeholder
   title "# Untitled" — this is real, unfixed content, not done. Build it out to full Weekly
   Standard shape using Lec01.pdf (9/8 intro) and Lec02.pdf (9/10 system calls/process management)
   as the lecture's actual content, and the lecture01-code files (array_threads_v1.c/v2.c,
   hello_asm.s, hello_print.c, hello_write.c) as the concrete code examples for "Examples worth
   keeping" and the Lecture section. Link Stevens & Rago Ch 1, 7, 8 in Textbook integration (the
   chapter note itself doesn't exist yet — link it anyway per the Standard, mark it "not yet
   written").
2. Create 20_Progress/Degree/CSCI 4061/Weekly/Week - 2.md the same way, from Lec03.pdf/Lec04.pdf
   (verify which PDF corresponds to which of the two Week 2 lecture topics — Process Management
   continued + Low-Level I/O on one date, Advanced I/O + Redirection on the other — don't assume,
   check the PDF's own title slide) and Lecture/lecture03-code/ (mini_shell.c, strtok_demo.c,
   write_points_stdio.c, write_points_unix.c). Link Stevens Ch 7, 3.
3. Create a Homework note (use 30_Order/Templates/Classes/Homework Template.md) for Lab 1 at
   20_Progress/Degree/CSCI 4061/Assignments/Lab - 1.md (create the Assignments/ folder if it
   doesn't exist), built from Labs/Lab 01.pdf's actual prompt and the real code already in
   D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\lab01-code\ (fork_exec.c,
   fork_wait.c, Makefile, QUESTIONS.txt, test_cases/). Do not claim the lab is submitted/complete
   unless there's real evidence of that (a submission record, a grade) — if the code exists but
   there's no evidence of submission, say so plainly in the note's status.
For both weekly notes: leave nothing about actual classroom discussion invented — if the PDFs are
slide decks, treat their content as "Pre-lecture source notes" per the Standard's exact phrasing,
not as a claim that this is what was verbally said in class.
After finishing, update 20_Progress/Degree/CSCI 4061/Weekly/Weekly Board.md's Map and Status
sections to reflect the real new state, and update CSCI 4061 Board.md's next: field.
Report back what you found in each PDF/code file (one line each) and which specific lecture PDF you
matched to which Week 2 date.
```

---

## CSCI 4521 — Applied Machine Learning

**Status snapshot (2026-09-21):** Board/Preparation/Textbook Map excellent, but flags its own real risk (source syllabus dated "Fall 2025", unconfirmed for this semester). `Weekly/Week - 1.md` has one real sentence ("AI is allowed anyway... Solve it however way you want"), rest template. Today is between Week 2 (finished 9/17) and Week 3 (starts 9/22) on this course's schedule. Real, unused source material: `Lectures/Week - 2/1.3 kNN Iris Classification.ipynb` + `download.png` — a real, run Jupyter notebook — sitting in `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\`. `Lectures/Week - 1/` is empty on disk (the instructor teaches live in Colab; nothing gets saved automatically). Both textbook PDFs (ISL primary, DLB secondary) are present; ENLP, the Linear Algebra Notes handout, and the PyTorch intro series are still not located.

- [ ] Week - 1 (LEC 0.1 syllabus/intro 9/8, LEC 1.1 classification/kNN/normalization 9/10): build what's real (the existing AI-policy line, the real schedule/reading) and explicitly flag that no Colab notebook was saved for Week 1 — ask the user to export/save it from Colab if it still exists, rather than inventing lecture content.
- [ ] Week - 2 (LEC 1.2 kNN/accuracy/overfitting 9/15, LEC 1.3 Bayes classification/kNN 9/17): build directly from the real `1.3 kNN Iris Classification.ipynb` — reproduce its actual code cells, outputs, and structure as the lecture's real record, per [[Weekly Standard]]'s "code shape/types and test implications" requirement for programming concepts.
- [ ] No homework note needed yet for Weeks 1–2 — HW1 releases Week 3 (9/22), due Week 5.
- [ ] Textbook notes for ISL 2.1–2.3 and DLB 2.1–2.8/3.1–3.3/5.1 — **blocked on user pasting Gemini Notebook output.**
- [ ] Update `Weekly Board.md` Map/Status, `Textbook Map.md` Status, and Board `next:`.

```text
HANDOFF PROMPT — CSCI 4521 Week 1 + Week 2 (from the real kNN notebook)
Read D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md, AGENTS.md, and 30_Order/Standards/Courses/
Weekly Standard.md first. Then read 20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md in full.
Read D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Lectures\Week - 2\1.3 kNN Iris Classification.ipynb
directly — it's a real, already-run Jupyter notebook. Extract its actual code cells, any printed
output/accuracy numbers, and the sequence of what it builds (loading the Iris dataset, kNN
classification, whatever else is actually in the cells — don't guess, read it).
1. Build out 20_Progress/Degree/CSCI 4521/Weekly/Week - 1.md to full Weekly Standard shape using
   the real schedule from the Board (LEC 0.1 syllabus/intro 9/8, LEC 1.1 classification/kNN/
   normalization 9/10) and the one existing real line already in the note. Do not invent what was
   coded live in Colab that session — D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Lectures\
   Week - 1\ is empty on disk, so explicitly add a note in the file (e.g. under Takeaways or a
   visible comment) that no Week 1 Colab notebook was saved locally, and the user should export it
   from Colab's own history if they want it preserved.
2. Build 20_Progress/Degree/CSCI 4521/Weekly/Week - 2.md from the real notebook — treat its code
   cells as the actual lecture content per the Standard ("Programming concepts additionally need
   code shape/types and test implications"). Reproduce the real code (not paraphrased pseudocode)
   in the Lecture section, note what dataset/technique it demonstrates, and link ISL/DLB per the
   Board's reading column for that week.
Do not create any homework note for this pass — HW1 isn't released until Week 3.
Update 20_Progress/Degree/CSCI 4521/Weekly/Weekly Board.md's Map/Status and CSCI 4521 Board.md's
next: field afterward.
Report back exactly what the notebook actually contained (dataset, method, any real output values)
so the user can sanity-check nothing was paraphrased incorrectly.
```

---

## CSCI 5304 — Computational Aspects of Matrix Theory

**Status snapshot (2026-09-21):** Board/Preparation/Textbook Map excellent, and the Board already caught three real date anomalies in the printed syllabus (Week 5/6 date collision, midterm date conflict, "Holiday Break" placement). `Weekly/Week - 1.md` **exists but is completely empty** — worse than a scaffold, this is a bug (see Mechanical Fixes above; fix that first). No real lecture/homework source files exist yet in the course's source folder (`Lecture/`, `Homework/`, `Midterm/` all empty on disk as of this pass) — this course's professor hasn't posted materials yet, or they land somewhere not yet checked. This is the one course where the textbook genuinely *is* the lecture: Trefethen & Bau's own chapters are called "Lectures" and the course reuses that numbering directly, so Lecture 1–4 in the schedule are Lectures 1–4 of the book. Today sits between Week 2 (finished 9/17) and Week 3 (starts 9/22).

- [ ] Fix the empty `Week - 1.md` (tracked under Mechanical Fixes) before anything else in this course.
- [ ] Week - 1 (Day #1 Ethical Computing 9/8, Lecture 1 "Matrix Action" 9/10): build the scaffold; the Lecture section's real content is Trefethen & Bau Lecture 1, so this genuinely waits on the textbook note (see below) rather than a separate slide source — flag this explicitly rather than treating it as a normal gap.
- [ ] Week - 2 (Lectures 2, 3: Orthogonality/Norms 9/15; Quiz #1 + Lecture 4 SVD 9/17): same pattern — waits on the Lecture 2–4 textbook notes.
- [ ] HW #1 is due Wed 9/23 (two days from today) — check whether the assignment prompt exists anywhere locally or only on Canvas; if found, create a Homework note now since the deadline is imminent; if not found, flag urgently rather than silently skipping it.
- [ ] Textbook notes for Trefethen & Bau Lectures 1–4 — **blocked on user pasting Gemini Notebook output**, but flagged as higher priority than other courses' textbook notes since this course's weekly notes can't really be built without them.
- [ ] Update `Weekly Board.md` Map/Status, `Textbook Map.md` Status, and Board `next:`.

```text
HANDOFF PROMPT — CSCI 5304 Week 1 + Week 2 scaffolds, and HW#1 check
Read D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md, AGENTS.md, and 30_Order/Standards/Courses/
Weekly Standard.md first. Then read 20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md in full,
including its schedule-anomaly warnings (don't silently resolve the midterm-date or Thanksgiving-
week conflicts — the Board already flags them correctly, just don't lose that).
First confirm 20_Progress/Degree/CSCI 5304/Weekly/Week - 1.md has already been fixed by the
Mechanical Fixes pass (it was an empty file) — if not, do that first from
30_Order/Templates/Classes/Week Template.md.
Check the real source folder D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\ — specifically the
Lecture/, Homework/, and Midterm/ subfolders — for any files that may have landed since this board
was written (2026-09-21). If they're still empty, this course genuinely has no separate lecture
slide/PDF source yet — build Week - 1.md and Week - 2.md as pre-lecture scaffolds only (What you
must be able to do, Key ideas placeholders tied to the schedule, links to Trefethen & Bau Lecture
1–4 by number) and explicitly state in each note that the Lecture section and full synthesis wait
on (a) the textbook notes for those same Lecture numbers landing first, since this course's
"chapters" and "lectures" are the same numbering, and (b) the user's own in-class notes, since
nothing else currently exists to build the live-capture section from.
Also check D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Homework\ specifically for an HW#1 prompt
— it's due Wed 9/23, two days out. If a spec file exists, create a Homework note for it at
20_Progress/Degree/CSCI 5304/Assignments/Homework - 1.md per the Homework Template. If nothing is
there, report that clearly as a gap needing the user to check Canvas — do not guess the assignment's
content.
Update 20_Progress/Degree/CSCI 5304/Weekly/Weekly Board.md's Map/Status and CSCI 5304 Board.md's
next: field afterward, including a note that the weekly layer is blocked on textbook notes landing
first for this specific course.
Report back exactly what you found (or didn't find) in Lecture/, Homework/, and Midterm/.
```

---

## MGMT 3015 — Introduction to Entrepreneurship

**Status snapshot (2026-09-21):** Board/Preparation/Textbook Map excellent, and the Board already caught two real date anomalies (Session 6 dated a Friday, Session 16 dated a Saturday — neither is a valid Mon/Wed class day). This course files session notes under `Lecture/` instead of `Weekly/` by deliberate convention (documented in its own Weekly Board). `Lecture - 1.md` has two real sentences of content; Sessions 2 and 3 (9/14, 9/16) already happened with nothing written. **Today (9/21) is Session 4 itself** — the "Profile of a Successful Entrepreneur" (5%) is due today. `Concepts/Entrepreneurship Concepts Board.md` exists but is completely empty — flagged, not built (concepts are out of scope). Source folder holds only the textbook PDF; `Lecture/` subfolder is empty — no slides saved locally.

- [ ] Session 1 (`Lecture - 1.md`): expand the existing two real sentences to full Weekly Standard shape.
- [ ] Session 2 (`Lecture - 2.md`, 9/14, Ch 1 & 2 "What Does It Take to Be an Entrepreneur"): create from the Board's schedule + Textbook Map; flag that no slide source exists locally yet.
- [ ] Session 3 (`Lecture - 3.md`, 9/16, Ch 2 cont'd "Entrepreneurial Personality"): same pattern.
- [ ] Homework note for **Profile of a Successful Entrepreneur** (due today, 9/21, 5%) — urgent, check whether the actual prompt/rubric is saved anywhere locally or only on Canvas.
- [ ] Homework note for **New Business Idea** (due 9/25 — noting the Board's own flagged date anomaly for Session 6) — can wait a few days but should exist before the deadline.
- [ ] Textbook notes for Ch 1 & 2 — **blocked on user pasting Gemini Notebook output.**
- [ ] Update `Lecture/Weekly Board.md` Map/Status, `Textbook Map.md` Status, and Board `next:`.

```text
HANDOFF PROMPT — MGMT 3015 Sessions 1-3 + Profile/New Business Idea homework notes
Read D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md, AGENTS.md, and 30_Order/Standards/Courses/
Weekly Standard.md and Homework Standard.md first. Then read 20_Progress/Degree/MGMT 3015/
MGMT 3015 Board.md in full, and 20_Progress/Degree/MGMT 3015/Lecture/Weekly Board.md (note: this
course uses Lecture - N.md filenames, session-numbered, not Week - N.md — follow that existing
convention, don't rename anything to "Week").
1. Expand 20_Progress/Degree/MGMT 3015/Lecture/Lecture - 1.md (Session 1, 9/9, pure intro) to full
   Weekly Standard shape from its existing two real sentences plus the Board's own description of
   what Session 1 covered.
2. Create Lecture - 2.md (Session 2, Mon 9/14, Ch 1 & 2 "What Does It Take to Be an Entrepreneur")
   and Lecture - 3.md (Session 3, Wed 9/16, Ch 2 cont'd "Entrepreneurial Personality") the same way.
   Check D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\ first for any slides that may have
   landed since this board was written — if still empty, build the pre-lecture scaffold and
   textbook-linked sections only, and explicitly mark the Lecture section as pending the user's own
   session notes rather than inventing what was discussed.
3. Create a Homework note (use 30_Order/Templates/Classes/Homework Template.md) for "Profile of a
   Successful Entrepreneur" (individual, 2 pages, 5%, due 9/21 — today) at 20_Progress/Degree/
   MGMT 3015/Assignments/Profile of a Successful Entrepreneur.md (create Assignments/ if needed).
   Check whether a prompt/rubric file exists locally; if not, note that the detailed rubric lives
   in Canvas per the Board's own statement and isn't duplicated here — still record the known
   requirements (individual, 2 pages) from the Board.
4. Create a Homework note for "New Business Idea" (individual, 1 page, 5%, due Session 6 —
   Fri 9/25 per the Canvas date, flagged by the Board as landing on a day that breaks the course's
   own Mon/Wed pattern — preserve that flag, don't silently correct the date) the same way.
Update 20_Progress/Degree/MGMT 3015/Lecture/Weekly Board.md's Map/Status and MGMT 3015 Board.md's
next: field afterward. Do not touch Concepts/Entrepreneurship Concepts Board.md.
Report back what you found (or didn't) in the Lecture/ source folder, and whether either
assignment's rubric was locatable locally.
```

---

## ENGL 1004 - Dropped; historical handoff

**Status snapshot (2026-09-21):** Board/Preparation excellent. No `Weekly/` or `Textbook/` folder exists — **confirmed intentional**, stated directly in the course's own Preparation note (no textbook, whole novels assigned by date). This is the course that most deviates from the standard shape, and it genuinely needs a design decision before content gets produced (see the Per-Class Workflow handoff above, which is dispatched first and should resolve this). Source folder holds the syllabus PDF plus empty `Journal Entries/` and `Lecture/` folders — nothing saved locally yet for either. As of today (9/21, a Monday, this TTh course has no class), Sessions on 9/8, 9/10, 9/15, 9/17 have already happened with zero notes written.

- [-] **Blocked on the ENGL 1004 Workflow file's design recommendation** (see System Work section above) — do not create session/journal notes until that call is made (Weekly-Standard-shaped session notes vs. something lighter).
- [-] Once unblocked: session notes for 9/8 (Introduction), 9/10 (case law/state laws), 9/15 (state laws; Huckleberry Finn ch. 1-6; Journal 1 due), 9/17 (*The Camp of the Saints*).
- [-] Journal Entry tracking — needs its own design decision too (one Homework-standard note per entry vs. one consolidated tracker); flag for user alongside the Workflow file's recommendation rather than deciding silently.
- [-] No textbook notes for this course — it has none, confirmed by design.
- [-] Update Board `next:` once session notes exist.

```text
HANDOFF PROMPT — ENGL 1004 (run only after the Per-Class Workflow handoff has resolved the session-
note-shape question for this course)
Read D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md and AGENTS.md first. Read 30_Order/Workflows/
Courses/Per Class/ENGL 1004 Workflow.md — it should already state a recommendation for how session
notes and Journal Entry tracking should be shaped for this course (it has no textbook and no
Weekly/ folder by design). If that file doesn't yet exist or doesn't contain a clear
recommendation, stop and ask the user before creating anything — do not invent a note-type
convention for this course silently.
Once the shape is confirmed: read 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md in full, and
create session notes for the four sessions that have already happened (9/8 Introduction, 9/10 case
law/state laws intro, 9/15 state laws + Huckleberry Finn ch. 1-6 + Journal 1, 9/17 The Camp of the
Saints ch. 1-3/6/11) using whichever shape was confirmed. Check
D:\_Anant\10_Areas\UMN\Classes\Lib Eds & More\ENGL 1004\Lecture\ and \Journal Entries\ for any real
saved material first — as of this board's writing both are empty, so most likely these will be
pre-session scaffolds (reading assignment, discussion questions from the syllabus) with the
in-class discussion content explicitly marked pending the user's own notes.
Update ENGL 1004 Board.md's next: field afterward.
Report back what shape was used and why.
```

---

## Execution order (recommended, not mandatory)

1. Mechanical Fixes (5 min, unblocks nothing but clears real bugs).
2. Per-Class Workflow files for the four active courses other than CSCI 4511W; exclude ENGL 1004 from historical prompts above.
3. CSCI 4061 Week 1/2 + Lab 1 — richest real source material already on disk, highest-value single session.
4. CSCI 4521 Week 1/2 — the real Jupyter notebook makes this fast and low-risk.
5. MGMT 3015 Sessions 1-3 + the two urgent homework notes (Profile is due *today*).
6. CSCI 5304 Week 1/2 — genuinely blocked on textbook notes landing first; lower priority until the user pastes Gemini output for Lectures 1-4.
7. ENGL 1004 work is cancelled because the course was dropped.
8. Textbook notes for every course, as the user pastes Gemini Notebook output per chapter — ongoing, not a one-time pass.

## Links
- [[CSCI 4511W Workflow]] — the depth/shape model every Per-Class Workflow file below should match.
- [[Course Production Workflow]], [[Weekly Workflow]] — the generic process every row above follows.
- `20_Progress/Degree/Repetitive Things.md` — the reusable Gemini Notebook chapter-production prompt (currently written for CSCI 4511W; generalizable to any course by swapping the bracketed textbook/chapter/lecture names).
- [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]] — cross-course grading/schedule summary.
- `20_Progress/Degree/Every Week.md` — the master cross-class due-date calendar (already current through the full semester; no update needed from this pass).
