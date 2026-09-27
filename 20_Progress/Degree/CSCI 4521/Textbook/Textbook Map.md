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
> [!DANGER] Correction, 2026-09-27: the file this note used to call the local DLB copy is NOT the Deep Learning Book
> `Textbook & Resources/Secondary Textbook.pdf` was opened and searched directly with `pdftotext` this session. Zero matches for "Capacity, Overfitting" or "Goodfellow" (both would be unmissable in the real DLB — 5.2 is literally titled "Capacity, Overfitting and Underfitting"). 125 matches for "word embedding" and 38 for "Pilehvar." The file is actually **ENLP** (see below) — its own front matter reads "Embeddings in Natural Language Processing: Theory and Advances in Vector Representations of Meaning," Pilehvar & Camacho-Collados, Synthesis Lectures on Human Language Technologies. **DLB itself has no local copy anywhere in this course's source folder right now.** This is a real, verified gap, not a naming quibble — every DLB-sourced prompt below is blocked until the real file (freely downloadable at deeplearningbook.org, or a Canvas-posted copy) is saved locally. Do not upload `Secondary Textbook.pdf` to a DLB prompt expecting DLB content back.
Free online, not required per the syllabus, but assigned specific sections nearly every week per the real schedule - not just a Unit-5 depth reference the way the syllabus alone implies. Real sections named across the semester: 2.1-2.8, 3.1-3.3, 5.1-5.11.1 (heavily used), 6.1-6.6, 7.1-7.8, 8.3, 9.2-9.3 (+9.7, 9.10-9.11 optional "for fun"), and chapters 10-12 in week 14. Chapter/section titles for the weeks needed so far (2, 3, 5.1-5.2) are recalled from the book's own well-known, permanently fixed public structure (deeplearningbook.org has not republished with different numbering since 2016) — **not verified against a local copy this session**, since none exists. Treat those titles as a starting pointer for Gemini to confirm against the real uploaded file, not as an already-checked fact.
## ENLP — now confirmed: it's the file mislabeled "Secondary Textbook.pdf"
Named only as "ENLP" in the real schedule, assigned starting week 4 (sections 1.1-1.3, 7.1.1-7.1.2), then again weeks 5-6 (3.2, 6.4). Full title confirmed 2026-09-27 by opening the file directly: ***Embeddings in Natural Language Processing: Theory and Advances in Vector Representations of Meaning*** (Pilehvar & Camacho-Collados, 2020, Synthesis Lectures on Human Language Technologies). It is already sitting locally at `Textbook & Resources/Secondary Textbook.pdf` — that filename is just wrong, not the content. Rename the file (or note the mismatch prominently) before week 4 arrives (2026-09-29) so it isn't mistaken for DLB again. Not needed yet for weeks 1-3's own prompts.
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
- **DLB Chapter 2 ("Linear Algebra"), sections 2.1-2.8:** Week 1 only, one note, one prompt — **blocked on sourcing the real file**, see the correction above.
- **DLB Chapter 3 ("Probability and Information Theory"), sections 3.1-3.3:** Week 1 only — **blocked**.
- **DLB Chapter 5 ("Machine Learning Basics"), sections 5.1-5.2 so far:** 5.1 "Learning Algorithms" (Week 1) + 5.2 "Capacity, Overfitting and Underfitting" (Week 2) — one note, built across two prompts. Week 4 adds 5.4-5.6 to this same chapter later — **blocked**.
Prompts for all of the above live in [[20_Progress/Degree/Repetitive Things|Repetitive Things]].
## Status
Updated 2026-09-27: prompts for all four chapter notes needed by Weeks 1-3 (ISL Ch2, DLB Ch2, DLB Ch3, DLB Ch5) are written and ready in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] — the ISL ones are grounded in the real local PDF (read directly this session); the three DLB ones are blocked until the real DLB file is sourced, since the local "Secondary Textbook.pdf" turned out to be ENLP. Zero chapter notes actually written yet — running the prompts is the next real action, after solving the DLB file gap.
