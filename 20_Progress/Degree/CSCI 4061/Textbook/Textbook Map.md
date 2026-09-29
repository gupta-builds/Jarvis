---
type: class
input_kind: textbook
status: seed
created: 2026-09-08
updated: 2026-09-08
area:
  - "[[CSCI 4061 Board]]"
tags:
  - "#class"
  - "#Textbook"
next: "Create the first Stevens chapter note once Week 1's Chs 1, 7, 8 are actually covered"
---
# CSCI 4061 — Textbook Map
==Two required texts split cleanly by subject half: Stevens & Rago covers the systems-programming-in-C half, Kleppmann covers the distributed-systems half that starts around Week 11.== Cross-referenced against the Schedule table in [[CSCI 4061 Board]].
## Stevens & Rago — Advanced Programming in the UNIX Environment (3rd ed., 2013)
Covers Weeks 1-10, the systems-programming core of the course:
- **Ch 1, 7, 8** - Week 1: System calls, process management basics.
- **Ch 7, 3** - Week 2: Process management continued, low-level and advanced I/O.
- **Ch 10, 4** - Week 3: Signals, intro file systems.
- **Ch 4, 15.1-15.2** - Week 4: File systems continued, IPC pipes.
- **15.1, 15.2, 15.9** - Week 5: IPC pipes and shared memory.
- **15.9, 14.4** - Week 6: Finish IPC/multiplexed I/O, systems programming in Python and C/Python interop.
- **Ch 11** - Week 7: Threads, basic synchronization.
- **Ch 11, 12, 16** - Week 8: Advanced synchronization, start networking.
- **Ch 16** - Week 9: Sockets, UDP/TCP, HTTP.
None of these have an individual chapter note yet - each gets created as its week is actually covered, per [[Weekly Standard]].
## Kleppmann — Designing Data-Intensive Applications (1st ed., 2017)
Covers Weeks 11-13, the distributed-systems half:
- **Ch 8, 4** - Week 11: Data serialization, intro distributed systems, RPC.
- **Ch 4** - Week 12: Finish RPC (Thanksgiving-shortened week).
- **Ch 5, 6, 7, 9** - Week 13: Replication, partitioning, consistency, and consensus.
No chapter notes yet - same as above, created as covered.
## Status
Zero chapter notes written as of 2026-09-08 - the course is in Week 1 (started 9/8). This map exists so the reading-to-week mapping is planned before individual chapter notes start getting created piecemeal.
## Correction (2026-09-24, from reading Lec01-06 in full)
The clean one-chapter-per-week mapping above is real for lecture *topic order* but not for what actually gets tested. Lec04 (the "Ch3 week" I/O lecture) also teaches file permission bits (chmod, octal notation, S_IRUSR/etc.) — that's APUE **§4.5-4.9**, not Ch3 — and stdio buffering (fully/line/unbuffered, fflush, fsync) — that's APUE **Chapter 5**, not Ch3. Lec06 (the second "Ch10 week" lecture) already previews the start of Ch4 (storage devices, i-nodes, paths, directories) a full week before Ch4's own scheduled week. See [[20_Progress/Degree/Repetitive Things|Repetitive Things]] for the Gemini Notebook prompts built around this, and the real lecture-by-lecture grounding behind each one.
