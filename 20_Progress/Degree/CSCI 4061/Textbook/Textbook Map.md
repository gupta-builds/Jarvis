---
type: class
input_kind: textbook
status: sprout
created: 2026-09-08
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
tags:
  - "#class"
  - "#Textbook"
next: "Build 2: source-check Chapters 3, 4, 8, and 10 against the textbook PDF the same way Chapters 1 and 7 were source-checked in Build 1"
---
# CSCI 4061 — Textbook Map
==Two required texts split cleanly by subject half: Stevens & Rago covers the systems-programming-in-C half, Kleppmann covers the distributed-systems half that starts around Week 11.== Cross-referenced against the Schedule table in [[CSCI 4061 Board]].
## Stevens & Rago — Advanced Programming in the UNIX Environment (3rd ed., 2013)
Covers Weeks 1-10, the systems-programming core of the course:
- **Ch 1, 7, 8** - Week 1: System calls, process management basics. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]] are landed and **source-checked against the textbook PDF** (2026-09-29). [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter 8]] is landed but not yet source-checked.
- **Ch 7, 3** - Week 2: Process management continued, low-level and advanced I/O. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter 3]] is landed but not yet source-checked.
- **Ch 10, 4** - Week 3: Signals, intro file systems. [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter 4]] are landed but not yet source-checked.
- **Ch 4, 15.1-15.2** - Week 4: File systems continued, IPC pipes. Chapter 4 is landed (not source-checked); no note exists yet for §15.1-15.2.
- **15.1, 15.2, 15.9** - Week 5: IPC pipes and shared memory. No chapter note yet.
- **15.9, 14.4** - Week 6: Finish IPC/multiplexed I/O, systems programming in Python and C/Python interop. No chapter note yet.
- **Ch 11** - Week 7: Threads, basic synchronization. No chapter note yet.
- **Ch 11, 12, 16** - Week 8: Advanced synchronization, start networking. No chapter note yet.
- **Ch 16** - Week 9: Sockets, UDP/TCP, HTTP. No chapter note yet.
Six chapter notes exist as of 2026-09-29 (Chapters 1, 3, 4, 7, 8, 10), covering Weeks 1-4's reading in full - only Chapters 1 and 7 have been checked against the actual textbook PDF so far (Build 1 of the current perfecting pass); Chapters 3, 4, 8, and 10 remain in their original, unverified state until Build 2. Chapters for Weeks 5+ are created as their weeks are actually covered, per [[Weekly Standard]].
## Kleppmann — Designing Data-Intensive Applications (1st ed., 2017)
Covers Weeks 11-13, the distributed-systems half:
- **Ch 8, 4** - Week 11: Data serialization, intro distributed systems, RPC.
- **Ch 4** - Week 12: Finish RPC (Thanksgiving-shortened week).
- **Ch 5, 6, 7, 9** - Week 13: Replication, partitioning, consistency, and consensus.
No chapter notes yet - same as above, created as covered.
## Status
Six chapter notes exist as of 2026-09-29, matching Weeks 1-4's full reading list. Two (Chapters 1 and 7) are source-checked against the actual textbook PDF, restructured to this vault's real Textbook Standard shape (`Full Reading Notes` heading restored, duplicate template stubs removed, frontmatter fixed, flashcards capped at 10 under `#cards/csci4061`), and enriched with worked examples the original NotebookLM pass had dropped - see each chapter's own Connections section for the lecture-coverage-gap detail. The remaining four (Chapters 3, 4, 8, 10) still carry the original pass's structural issues (missing `Full Reading Notes` heading, duplicate stub sections, blank frontmatter dates, `area:` pointing at `[[UMN Board]]` instead of this course's own Board) and are the explicit target of Build 2.
## Correction (2026-09-24, from reading Lec01-06 in full)
The clean one-chapter-per-week mapping above is real for lecture *topic order* but not for what actually gets tested. Lec04 (the "Ch3 week" I/O lecture) also teaches file permission bits (chmod, octal notation, S_IRUSR/etc.) — that's APUE **§4.5-4.9**, not Ch3 — and stdio buffering (fully/line/unbuffered, fflush, fsync) — that's APUE **Chapter 5**, not Ch3. Lec06 (the second "Ch10 week" lecture) already previews the start of Ch4 (storage devices, i-nodes, paths, directories) a full week before Ch4's own scheduled week. See [[20_Progress/Degree/Repetitive Things|Repetitive Things]] for the Gemini Notebook prompts built around this, and the real lecture-by-lecture grounding behind each one.
