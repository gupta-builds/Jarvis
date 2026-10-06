---
type: index
status: active
created: 2026-09-10
updated: 2026-10-05
tags:
  - moc
  - "#class"
  - "#Textbook"
notes:
  - "[[CSCI 4521 Board]]"
next: "Open the local ISL and DLB PDFs in a text-accessible reader to confirm edition and section-level claims for the four Week 1–2 notes."
---
# CSCI 4521 — Textbook Map
## Purpose
Navigation and coverage ledger for the course’s assigned readings. The authoritative local sources are `Textbook & Resources/ISL Textbook CSCI 4521.pdf`—*An Introduction to Statistical Learning with Applications in Python* (James, Witten, Hastie, Tibshirani, Taylor)—and `Textbook & Resources/DLB Textbook CSCI 4521.pdf`—*Deep Learning* (Goodfellow, Bengio, Courville). Entries follow the dated schedule in [[CSCI 4521 Board]] and point to one canonical chapter note per book/chapter, even when a chapter spans weeks.
## Map
| Assigned source section | Canonical note | Week and verified schedule date | Status |
|---|---|---|---|
| ISL Ch. 2 §§2.1, 2.3 | [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] | Week 1 — Sep 8/10 | needs review — source-file identity verified; direct PDF text check pending |
| DLB Ch. 2 §§2.1–2.8 | [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 2|DLB Chapter 2]] | Week 1 — Sep 8/10 | needs review — source-file identity verified; direct PDF text check pending |
| DLB Ch. 3 §§3.1–3.3 | [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 3|DLB Chapter 3]] | Week 1 — Sep 8/10 | needs review — source-file identity verified; direct PDF text check pending |
| DLB Ch. 5 §5.1 | [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] | Week 1 — Sep 8/10 | needs review — source-file identity verified; direct PDF text check pending |
| ISL Ch. 2 §§2.1–2.2 | [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 2|ISL Chapter 2]] | Week 2 — Sep 15/17 | needs review — consolidated into the same canonical note; §2.2 appears there once |
| DLB Ch. 5 §§5.1–5.2 | [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]] | Week 2 — Sep 15/17 | needs review — consolidated into the same canonical note |
| Later scheduled material | [[CSCI 4521 Board]] | Weeks 3–16 | not started — ISL 2.2 continues in Week 3; later DLB, ISL, ENLP, Linear Algebra Notes, and PyTorch readings remain outside this bounded build |
## Status
Four canonical Week 1–2 chapter notes are now navigable and linked to both weekly notes. Their claims were repaired from the existing source-based coverage and bounded to the published sections; source files are present, but this environment lacks a PDF text extractor, so all four remain `needs review` until a reader verifies the edition and page-level details. ENLP is local but begins in Week 4; the Linear Algebra Notes and PyTorch intro series named on the Board are still missing locally and remain source gaps.
## Dataview
```dataview
TABLE status, next
FROM "20_Progress/Degree/CSCI 4521/Textbook"
WHERE input_kind = "book"
SORT file.name ASC
```
