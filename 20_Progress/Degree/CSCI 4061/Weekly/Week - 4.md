---
type: class
input_kind: lecture
status: seed
created: 2026-09-29
updated: 2026-09-29
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]]"
tags:
  - "#class"
  - "#Lecture"
next: "Live-capture the Tue 9/29 and Thu 10/1 lectures here once they happen, then fill Textbook integration and the synthesis section"
---
# Week - 4
> [!WARNING]
> This week has not happened yet as of 2026-09-29 (today is the Tuesday of Week 4; lectures run 9/29 and 10/1). No `Lec07`/`Lec08` PDF exists yet in the source folder (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\Lecture\`), and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] has not been through this session's source-checking pass (Build 1 only perfected Chapters 1 and 7). This note is a **pre-lecture scaffold** built from the verified schedule and from what Lec06 already previewed - not a post-lecture synthesis. Fill in the real `## Lecture` capture live, per [[Weekly Standard]]'s lifecycle rule: preserve whatever gets written here first, add to it, never silently replace it with an imagined transcript.
## What you must be able to do
- Per the [[CSCI 4061 Board]] schedule, this week finishes file systems (Stevens Ch 4) and starts IPC with pipes (Stevens §15.1-15.2) - confirm these exact objectives once the real lecture slides land, but expect: name the standard UNIX file types (regular, directory, character special, block special, FIFO, socket, symbolic link) and what distinguishes each.
- Explain hard links versus symbolic links, and why a hard link can't cross file systems while a symbolic link can.
- Read and set permission and special-mode bits (`chmod`, `umask`, set-user-ID/set-group-ID/sticky bit) beyond the basic `rwx` triple Week 2 already covered.
- Explain what a `pipe()` creates (two connected file descriptors) and how a parent/child pair uses it plus `dup2()` to build a one-directional communication channel - directly extending Week 2's `dup2()`/redirection mechanism to interprocess use.
## Key ideas (short)
- Deferred - no real lecture content exists yet to compress into short claims. Fill this in after Tuesday/Thursday's lecture per [[Weekly Standard]].
## Concepts created today
None yet - no lecture has happened. Revisit once this week's real content lands.
## Examples worth keeping
None yet - no lecture has happened. Revisit once this week's real content lands.
## Lecture
### Pre-lecture source notes
Per the [[CSCI 4061 Board]] schedule and the [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]], this week's reading is Stevens Ch 4 (Files and Directories, continued) and §15.1-15.2 (Pipes) of Chapter 15 (Interprocess Communication). Lec06 (9/24, captured in [[Week - 3|Week 3]]) already previewed a meaningful slice of Chapter 4 a full week early - storage devices as fixed-size block arrays, device drivers, the file-system abstraction over them, absolute/relative paths, working/home directories, and the i-node/directory-lookup chain behind `open()`. What Week 4's own lectures most likely add on top of that preview, based on the reading assignment alone (not yet confirmed against slides): the full UNIX file-type taxonomy, hard vs. symbolic links, `umask`, and the special permission bits (setuid/setgid/sticky) - then a pivot into `pipe()` and the two-descriptor mechanism that turns Week 2's `dup2()`-based redirection trick into genuine interprocess communication.
> [!WARNING]
> Everything in this `## Lecture` section is inferred from the syllabus reading assignment and last week's preview, not from an actual lecture. Do not treat it as lecture-verified content, and do not let it get cited elsewhere in the vault as if it were.
## Textbook integration
> [!IMPORTANT]
> Main chapters: [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] (Files and Directories) - not yet source-checked against the actual textbook PDF this session; Stevens §15.1-15.2 (Pipes) has no landed chapter note in this course's `Textbook/` folder at all yet.
Deferred until Chapter 4 gets its own perfecting pass (Build 2) and the real Week 4 lecture happens. Once both exist, this section should state the actual delta - what the book covers beyond lecture, and vice versa - the way Weeks 1-3 do above, not just repeat the reading list.
## Takeaways (questions to resolve)
- [ ] Once Tuesday's lecture (9/29) happens, confirm whether it continues directly from Lec06's i-node preview or restarts the file-systems topic from scratch.
- [ ] Does this course's Chapter 4 note (once perfected in Build 2) cover §15.1-15.2 pipes at all, or does that need its own separate reading/note since it's technically Chapter 15 content?
- [ ] Project 1 is due 10/2, right after this week's Thursday lecture - confirm whether Project 1's spec actually depends on this week's pipe material, or is scoped entirely to Weeks 1-3's fork/exec/I/O/redirection content.
## Lecture-to-textbook synthesis
Deferred - the [[Weekly Standard]]'s six-part synthesis (highlight, mechanism, lecture example, textbook connection, concept links, warning/summary) requires real lecture content to fuse with the textbook, and no lecture has happened yet this week. Fill this in once Thursday's lecture (10/1) lands, following the exact shape used in [[Week - 1]], [[Week - 2]], and [[Week - 3]] above.
## Flashcards
#cards/csci4061
Deferred - flashcards belong after real lecture and textbook content exist to test, not before. Revisit once this week's material actually lands.
