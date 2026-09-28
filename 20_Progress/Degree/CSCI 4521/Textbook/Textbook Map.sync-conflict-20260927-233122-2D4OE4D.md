---
type: class
input_kind: textbook
status: sprout
created: 2026-09-10
updated: 2026-09-15
area:
  - "[[CSCI 4521 Board]]"
tags:
  - "#class"
  - "#Textbook"
next: "Locate and save the ENLP reading, Linear Algebra Notes, and PyTorch intro series locally - named in the real schedule but not yet in the source folder"
---
# CSCI 4521 — Textbook Map
==Unlike every other Fall'26 course, this one has no single purchase-required textbook - three or more sources rotate week to week, per the real schedule in [[CSCI 4521 Board]].== The syllabus itself names only ISL and DLB as course materials; the real weekly schedule (professor's own spreadsheet, pasted 2026-09-15) also assigns readings from two sources the syllabus never mentions at all: **ENLP** and a **"Linear Algebra Notes"** handout, plus a **"PyTorch intro series"** tutorial. None of the three has a local copy yet.
## Primary — An Introduction to Statistical Learning, with Applications in Python (James, Witten, Hastie, Tibshirani, Taylor) — "ISL" in the schedule
Free online, the course's actual working text despite not being labeled "required." A local copy sits at `Textbook & Resources/Primary Textbook CSCI 4521.pdf` in the source folder (confirmed present, 2026-09-10, ~20MB - not opened in full here). Real, confirmed reading assignments now exist week by week in [[CSCI 4521 Board]]'s Schedule table - sections named include 2.1-2.3, 3.1-3.3/3.5, 4.3-4.4 (incl. 4.3.5), 6.1-6.4, 10.1-10.5, 11.7.1, and 12.2/12.4. This replaces the earlier "likely ISLP chapter" guesswork this note used to carry - those guesses are removed now that the real sections are known.
## Secondary — Deep Learning Book (Goodfellow, Bengio, Courville) — "DLB" in the schedule
> [!TIP] Resolved, 2026-09-27: real DLB PDF now local, opened and read directly
> The earlier finding (below) that `Secondary Textbook.pdf` was actually ENLP still stands — that was a real, verified mislabel. The user has since added the real Deep Learning Book PDF into `Textbook & Resources/`, renamed to `DLB Textbook CSCI 4521.pdf`. Its table of contents was opened directly with `pdftotext` and confirms the recalled section structure was exactly right: 2.1-2.12, 3.1-3.14, 5.1-5.11. §2.1-2.8, §3.1-3.3, and §5.1-5.2 (everything needed for Weeks 1-3) were read in full and are now the basis for the real, verified prompts in [[20_Progress/Degree/Repetitive Things|Repetitive Things]].
Free online (deeplearningbook.org), not required per the syllabus, but assigned specific sections nearly every week per the real schedule - not just a Unit-5 depth reference the way the syllabus alone implies. Real sections named across the semester: 2.1-2.8, 3.1-3.3, 5.1-5.11.1 (heavily used), 6.1-6.6, 7.1-7.8, 8.3, 9.2-9.3 (+9.7, 9.10-9.11 optional "for fun"), and chapters 10-12 in week 14.
## ENLP — confirmed: was the file mislabeled "Secondary Textbook.pdf," now correctly named
Named only as "ENLP" in the real schedule, assigned starting week 4 (sections 1.1-1.3, 7.1.1-7.1.2), then again weeks 5-6 (3.2, 6.4). Full title confirmed 2026-09-27 by opening the file directly: ***Embeddings in Natural Language Processing: Theory and Advances in Vector Representations of Meaning*** (Pilehvar & Camacho-Collados, 2020, Synthesis Lectures on Human Language Technologies). Now correctly saved as `Textbook & Resources/ENLP Textbook CSCI 4521.pdf`. Not needed yet for weeks 1-3's own prompts.
## Linear Algebra Notes — course handout, not a published textbook
Named once, in week 6's reading, alongside the PCA/unsupervised-learning lecture. No local copy exists; likely a Canvas-posted PDF handout rather than a book.
## PyTorch Intro Series — external tutorial, not a textbook
Named in week 8's reading ("intro to tensors, autograd, and building models") ahead of the regression-with-PyTorch lecture. Almost certainly the official PyTorch tutorials site given the section names, but not confirmed - no local copy or link saved yet.
## Not a Textbook, But Named as a Career Resource
*Machine Learning System Design Interview* (Aminian & Xu) - no local copy exists, not required, named purely as an interview-prep resource rather than course material. Doesn't belong in a chapter-mapping structure at all; noted here only so it isn't confused with an actual assigned reading later.
## Standard
Each chapter note, once a real reading assignment exists, follows [[Textbook Template]] - one highlight anchor, bolded key concepts, a worked example, a connection back to the matching week, and flashcards.
## Folder structure — two books, two folders, chapters not weeks
Since ISL and DLB are separate books with their own chapter numbering, notes live in `Textbook/ISL/Chapter - [N].md` and `Textbook/DLB/Chapter - [N].md` — not one folder, and not named by week, since a single chapter (e.g. ISL Ch2) gets assigned across multiple weeks in pieces and should accumulate into one note rather than fragment into several. Real reconciliation of Weeks 1-3's readings by chapter, done 2026-09-27:
- **ISL Chapter 2 ("Statistical Learning"):** 2.1 "What Is Statistical Learning?" (Week 1) + 2.3 "Lab: Introduction to Python" (Week 1) + 2.2 "Assessing Model Accuracy" (Week 2, continued Week 3 — Week 3 assigns no new section, same 2.2). One note, built across two prompts.
- **DLB Chapter 2 ("Linear Algebra"), sections 2.1-2.8:** Week 1 only, one note, one prompt — ready to run, grounded in the real file.
- **DLB Chapter 3 ("Probability and Information Theory"), sections 3.1-3.3:** Week 1 only — ready to run.
- **DLB Chapter 5 ("Machine Learning Basics"), sections 5.1-5.2 so far:** 5.1 "Learning Algorithms" (Week 1) + 5.2 "Capacity, Overfitting and Underfitting" (Week 2) — one note, built across two prompts, both ready to run. Week 4 adds 5.4-5.6 to this same chapter later.
Prompts for all of the above live in [[20_Progress/Degree/Repetitive Things|Repetitive Things]].
## Status
Updated 2026-09-27: prompts for all four chapter notes needed by Weeks 1-3 (ISL Ch2, DLB Ch2, DLB Ch3, DLB Ch5) are written and ready to run in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] — all five prompts are grounded in real PDF text read directly this session (ISL and DLB both), not recalled knowledge. Zero chapter notes actually written yet — running the prompts is the next real action.
