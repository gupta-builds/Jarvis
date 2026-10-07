---
type: index
status: sprout
created: 2026-10-01
updated: 2026-10-06
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
This is the advanced refresher hub for CSCI 4061's C prerequisite - the C-fundamentals half of CSCI 2021, rebuilt as ten detailed concept notes instead of the short pointer-level note at [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/C Language|C Language]]. CSCI 4061's own Board is explicit that "solid C is essential, not optional" before Week 1, and this course does not re-teach it - this hub exists so that gap gets closed from real CSCI 2021 evidence (lab/homework/project source, the course's own textbooks, and its existing week notes) rather than from memory.
## Start Here - Read C Without Guessing
A C program is a collection of definitions: variables reserve storage, functions name reusable instructions, `struct`s name record layouts, and headers publish declarations so another `.c` file can call a function safely. Read unfamiliar code by locating four things: its **type**, its **name**, the **value or address** it uses, and its **lifetime/owner**.

For example, `job->status = BACKGROUND;` says: `job` has type `job_t *`, so it stores an address; `->status` means "follow that address, then select the `status` field"; and = writes the enum value `BACKGROUND` into that field. It is the same operation as `(*job).status = BACKGROUND`.

| Form | Read it as | Concrete consequence |
|---|---|---|
| `T x;` | `x` is one object of type `T` | Storage exists for one `T`. |
| `T *p;` | `p` stores an address of a `T` | `*p` reaches the pointed-to object only while that address is valid. |
| `T a[N];` | `a` is N contiguous `T` values | Valid indices are 0 through `N - 1`; C does not check them. |
| `f(x)` | call `f` with copied argument values | Use `&x` when `f` needs the address of caller-owned storage. |
| `int f(...)` | `f` returns an integer value/status | Read its contract; `0`/`-1` is a systems convention, not a C keyword. |
| `const T *p` | code will not write through `p` | The original object is not necessarily globally immutable. |

For 4061 code, read [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Pointers and Addresses|pointers]], [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Arrays and Strings|arrays and strings]], and [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs and Typedef|structs]] first. They explain the declarations in `swish`. Next learn [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory|ownership]], [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/File IO in C|I/O]], and [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Compilation and Linking|the build pipeline]]. Leave assembly, recursion, linked structures, and bit-level representation until the basic traces are comfortable.
## Core C Reading Vocabulary
### Source files, headers, and the preprocessor
`#include <stdio.h>` is not a runtime instruction. Before compilation, the preprocessor makes declarations from that header visible in the source file: for example, `printf`, `fgets`, `FILE`, and `perror`. `#include "job_list.h"` does the same for a project header. `#define CMD_LEN 512` names a text-substitution macro; the compiler sees `512` where it later sees `CMD_LEN`. A header normally declares types and function contracts, while exactly one `.c` file provides each function definition.

### Declarations versus expressions
A declaration introduces a name and type: `int status;`, `char cmd[512];`, and `job_t *current;` are declarations. An expression computes a value: `tokens.length - 1`, `getpid()`, and `current->next`. A statement performs a complete action, usually ending in `;`: `status = 0;`, `current = current->next;`, or `return -1;`.

| Type/form | Stores | Typical use in this course |
|---|---|---|
| `int` | signed whole number | return/status code, index, flags |
| `unsigned` | nonnegative whole number | vector length/capacity |
| `char` | one byte/character | raw text buffer element |
| `char *` | address of character data | C string / filename / token |
| `void *` | generic address | `malloc` result before use as a typed pointer |
| `pid_t` | OS-defined process-ID value | `fork`, `waitpid`, job record |
| `FILE *` | address of a stdio stream object | `fopen`-style file I/O |
| `struct T` | named group of fields | signal action, job, vector |

### Functions and return contracts
A function definition has return type, name, parameter declarations, and body:

```c
int add_one(int value) {
    return value + 1;
}
```

Calling `add_one(x)` copies the value of `x` into local parameter `value`. Calling `f(&x)` instead copies an address; `f` can then reach the caller's `x` by dereferencing that address. Read every function's return contract before trusting its result: `NULL` often means pointer failure, `-1` often means system-call failure, and `0` often means success, but these are API conventions rather than universal C syntax.

### Conditions, truth, and short circuiting
In C, zero is false and every nonzero integer is true. `if (ptr != NULL)` checks whether an address is valid before use. `&&` means logical AND; `||` means logical OR. Both short-circuit: in `dir == NULL || chdir(dir) == -1`, C does not call `chdir` when `dir` is `NULL`. This protects the program from an invalid argument. Do not confuse these logical operators with bitwise `&` and `|`.

### Scope, lifetime, and ownership
Scope asks where a name can be used; lifetime asks when its storage exists; ownership asks who must release it. A local variable declared inside `main` is visible only inside `main` and exists until `main` returns. A function's local buffer vanishes when that function returns. Heap storage acquired by `malloc` outlives the allocating function, but only until its owner calls `free`. These distinctions explain most pointer bugs more directly than memorizing syntax.

### A compact debugging routine
When a C line confuses you, write: (1) each variable's exact type; (2) whether it stores data or an address; (3) which object owns the pointed-to storage; (4) the function's success/failure return values; and (5) the next line that consumes the result. This turns a dense systems line such as `waitpid(child_pid, &status, WUNTRACED)` into three familiar pieces: a PID value, an output-address, and an option constant.
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
