---
type: index
status: sprout
created: 2026-10-01
updated: 2026-10-01
tags:
  - moc
notes:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Pointers and Addresses|Pointers and Addresses]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Arrays and Strings|Arrays and Strings]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs and Typedef|Structs and Typedef]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory|Dynamic Memory]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Linked Data Structures|Linked Data Structures]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Recursion|Recursion]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/File IO in C|File IO in C]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Compilation and Linking|Compilation and Linking]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Bitwise Operations and Integer Representation|Bitwise Operations and Integer Representation]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/x86-64 and Memory Layout|x86-64 and Memory Layout]]"
next: "Drill the #cards/csci2021 deck across all 10 notes before Project 1's oral exam, then deepen whichever concept the oral exam actually probes"
---
# C Language
## Purpose
This is the advanced refresher hub for CSCI 4061's C prerequisite — the C-fundamentals half of CSCI 2021, rebuilt as ten detailed concept notes instead of the short pointer-level note at [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/C Language|C Language]]. CSCI 4061's own Board is explicit that "solid C is essential, not optional" before Week 1, and this course does not re-teach it — this hub exists so that gap gets closed from real CSCI 2021 evidence (lab/homework/project source, the course's own textbooks, and its existing week notes) rather than from memory.
## Map
Four notes cover the *shapes* C programs build out of memory: [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Pointers and Addresses|Pointers and Addresses]] is the root of everything else here — a pointer is just a variable holding an address, and dereferencing means "go read or write what's at that address." [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Arrays and Strings|Arrays and Strings]] builds directly on that: an array is contiguous memory with no bounds attached, so indexing is pointer arithmetic in disguise, and a C string is just a `char` array that uses `'\0'` as an end marker instead of carrying its own length. [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs and Typedef|Structs and Typedef]] shows how differently-typed fields get bundled at fixed byte offsets, and why `typedef` only renames a type without changing its storage. [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory|Dynamic Memory]] covers the fourth shape-defining tool — `malloc`/`free` claiming and releasing heap memory at runtime, grounded in Project 4's own from-scratch allocator (first-fit search, block splitting, boundary-tag coalescing), which is the clearest possible demonstration that `malloc` is not magic, just an ordinary C program tracking free bytes.
Two notes cover what gets *built* out of those shapes: [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Linked Data Structures|Linked Data Structures]] chains heap-allocated nodes together via pointers instead of laying data out contiguously like an array — the structure's whole shape lives in the `next`/`left`/`right` pointers, evidenced by CSCI 2021's own linked list and binary search tree assignments. [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Recursion|Recursion]] is the matching control-flow tool: a function calling itself on a smaller version of its own problem, safe only because a base case eventually stops it, mechanically just one more stack frame per call — the same call stack an ordinary function call already uses.
Two notes cover how C actually *talks to the outside world*: [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/File IO in C|File IO in C]] contrasts text-mode I/O (format-string conversion between on-disk characters and in-memory values) against binary-mode I/O (raw bytes copied straight into a struct's layout, no conversion at all) — the exact choice CSCI 2021's own treasure-map lab makes between its text and binary load paths. [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Compilation and Linking|Compilation and Linking]] explains the four-stage pipeline (preprocessor → compiler → assembler → linker) that turns a `.c` file into a program at all, and why nearly every confusing build error is really one specific stage complaining, not a vague "it didn't compile."
The last two notes drop down to the machine actually running all of this: [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Bitwise Operations and Integer Representation|Bitwise Operations and Integer Representation]] treats an integer as a fixed-width bit pattern (two's complement when signed) that `& | ^ ~ << >>` can read or rewrite directly, independent of its arithmetic meaning. [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/x86-64 and Memory Layout|x86-64 and Memory Layout]] closes the loop by showing a running C program as a block of memory split into text/globals/heap/stack regions plus a handful of CPU registers, with the x86-64 calling convention just an agreed contract for which registers hold a function's arguments and where its locals live — this is the one note that bridges straight into CSCI 4061's own material, since [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter 7]]'s process memory layout (text/initialized-data/bss/heap/stack, stack-overflow-from-collision) is the same picture from the OS side rather than the compiler side.
## Status
All ten notes are `status: sprout` as of 2026-10-01 — real, source-grounded, and usable, but not yet exam-deepened. Each cites verified evidence from CSCI 2021's own lab/homework/project source (not paraphrased secondhand) and carries a `#cards/csci2021` flashcard deck. The basic version this hub is built from, [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/C Language|C Language]], stays intentionally short — a quick-reference pointer note, not a duplicate of this hub.
## Dataview
```dataview
TABLE mastery_level, status, updated
FROM "20_Progress/Degree/CSCI 4061/Concepts/C Refresher"
WHERE type = "concept"
SORT file.name ASC
```
## Links
[[20_Progress/Degree/CSCI 4061/Concepts/Concepts Board|Concepts Board]] is the parent index this hub sits under. [[CSCI 4061 Board]]'s own C Programming Resources section (Dive Into Systems, Beej's Guide, the GNU C Tutorial) are external supplements if any of these ten notes still leave a gap after review.
