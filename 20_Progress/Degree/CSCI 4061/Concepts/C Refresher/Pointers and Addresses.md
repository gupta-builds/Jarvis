---
type: concept
status: sprout
created: 2026-10-01
updated: 2026-10-06
course: "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/CSCI 2021 Board|CSCI 2021 Board]]"
track: C Refresher
mastery_level: "0"
prerequisites: []
used_in:
  - "[[CSCI 4061 Board]]"
evidence:
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 1|Week - 1]]"
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 2|Week - 2]]"
tags:
  - concept
related:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Arrays and Strings|Arrays and Strings]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory|Dynamic Memory]]"
---
# Pointers and Addresses
## One-Line Answer
==A pointer is just a variable whose value happens to be a memory address, and dereferencing it (`*p`) means "go to that address and read or write what's there" instead of using the value directly.==
## Start Here
Read these declarations as a ladder: `int x = 7; int *p = &x; int **pp = &p;`. `x` stores `7`; `p` stores the address of `x`, so `*p` reaches `x`; `pp` stores the address of pointer `p`, so `**pp` reaches `x` through two address lookups. Always ask whether an expression is a **value** or an **address**: `p` is an address, `*p` is the pointed-to value, and `&p` is the address of the pointer variable itself.

This is the same idea as `waitpid(child_pid, &status, flags)`: `status` is an `int` owned by the caller, and `&status` gives `waitpid` a valid place to write its result. C is still pass-by-value; the copied value happens to be an address.
## Mechanism
> Every running program's memory is one giant array of byte-addressable cells. 

A normal variable (`int x = 16;`) reserves a cell and gives it a name the compiler resolves to an address at compile time. A **pointer variable** (`int *p;`) *reserves* a cell too, but the value stored in that cell is itself an address - specifically, the address of some other cell. Three operators do all the real work:
- **`&`** (==address-of==): `&x` evaluates to the address where `x` lives. This is the only way to get a pointer value to a non-heap variable.
- **`*`** in a declaration (`int *p;`): says "`p` ==is a pointer to an== `int`" - the *type* matters, because it tells the compiler how many bytes to read/write and how far to move for pointer arithmetic (see [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Arrays and Strings|Arrays and Strings]]).
<<<<<<< Updated upstream
<<<<<<< Updated upstream
- **`*`** in an expression (`*p`): the dereference operator, "follow the pointer." `*p = 8;` does not touch `p`'s own value (the address) - it writes `8` into the cell `p` points at.
=======
- **`*`** in an expression (`*p`): the **dereference operator**, "==follow the pointer.==" `*p = 8;` does not touch `p`'s own value (the address) - it writes `8` into the cell `p` points at.
>>>>>>> Stashed changes
=======
- **`*`** in an expression (`*p`): the **dereference operator**, "==follow the pointer.==" `*p = 8;` does not touch `p`'s own value (the address) - it writes `8` into the cell `p` points at.
>>>>>>> Stashed changes
**Causal sequence for pass-by-pointer** (CSCI 2021 Week 1's canonical `swap` example, verified against the actual week note): C is strictly pass-by-value - a function parameter always gets a *copy* of whatever was passed. `void swap(int a, int b)` therefore cannot modify the caller's variables: `a` and `b` are copies, and swapping copies changes nothing the caller sees. The fix passes addresses instead of values: `void swap(int *a, int *b) { int tmp = *a; *a = *b; *b = tmp; }`, called as `swap(&x, &y);`. Now `a` and `b` are still copies - but copies of *addresses*, so dereferencing them (`*a`, `*b`) reaches the exact same memory cells `x` and `y` live in. Pass-by-value never stops being true; pointers just make "the value being copied" an address instead of data.
**Pointers as the gateway to raw memory**, a pattern that shows up constantly once code moves past simple variables: CSCI 2021's `lab10-code/email_lookup.c` reads a binary file with `mmap()` into a raw `char *file_bytes`, then reinterprets those bytes as a real struct with a single cast: `file_header_t *header = (file_header_t *) file_bytes;`. No data is copied or parsed byte-by-byte - the cast just tells the compiler "treat this address as the start of a `file_header_t`," and every field access (`header->num_contacts`) becomes pointer arithmetic under the hood. The same file then walks a packed array of records with `contact_t *contacts = (contact_t *) (file_bytes + depts_arr[i].offset);` - plain pointer-plus-integer arithmetic, scaled automatically by `sizeof(char)` since `file_bytes` is a `char *`.
**Complexity/cost:** a dereference is one memory access (fast, but a cache miss if the target isn't nearby - see x86-64/memory layout notes); pointer arithmetic is a handful of integer operations, not a loop. The real cost of pointers isn't CPU time, it's correctness risk - see Failure Modes.
**Failure boundary:** a pointer only means something if it holds the address of memory that is still valid. A pointer that's uninitialized (garbage value), has been `free`'d (see [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory|Dynamic Memory]]), or points at a stack frame that already returned, is not a smaller or weaker pointer - dereferencing it is undefined behavior, and the program may crash, silently corrupt unrelated memory, or appear to work by pure luck.
## Contrast / What It Is Not
A pointer's **own address** (`&p`) is not the same thing as **the address it holds** (`p`'s value, i.e. what `p` points at). `&p` is a `int **` (pointer to a pointer); `p` is an `int *`. Confusing these is one of the most common early C bugs - `scanf("%d", p)` versus the correct `scanf("%d", &num1)` only makes sense once it's clear whether the variable in hand is already a pointer or needs one taken.
Pointer arithmetic is also not raw byte arithmetic, even though it looks like plain `+`/`-`. `p + 1` on an `int *` moves forward `sizeof(int)` bytes (4, typically), not 1 byte - the compiler scales the offset by the pointee's type automatically. This is exactly why `email_lookup.c` above casts to `char *` first (`file_bytes + depts_arr[i].offset`): `char` is 1 byte, so that arithmetic is genuinely byte-precise, where the same expression on an `int *` would land in the wrong place entirely.
## Failure Modes / Misconceptions
> [!WARNING]
> Believing `NULL` is "no pointer" rather than a specific, checkable value (`0`). A pointer that was never initialized is not `NULL` by default in C - it holds whatever garbage bits were already in that memory. Only an explicit `= NULL` (or a function like `malloc` that returns `NULL` on failure) makes a pointer safely testable with `if (p == NULL)`. Treating an uninitialized pointer as "probably fine" and dereferencing it is undefined behavior, not a predictable crash.
## Evidence From This Vault
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 1|Week - 1]] - the full `swap(int *a, int *b)` pass-by-pointer worked example, with both the broken pass-by-value version and the fixed pointer version shown side by side.
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 2|Week - 2]] - pointer declaration/initialization/dereference rules, the type-mismatch error case (`cptr = &x;` fails because `cptr` is `char *`), and the pass-by-pointer pattern generalized beyond `swap`.
## Flashcards
#cards/csci2021
Why does `void swap(int a, int b)` fail to swap the caller's variables, while `void swap(int *a, int *b)` called as `swap(&x, &y)` succeeds?::C is strictly pass-by-value - `a`/`b` in the first version are copies of `x`/`y`'s *values*, so swapping them changes nothing the caller sees. In the second version, `a`/`b` are copies of `x`/`y`'s *addresses*; dereferencing those copies (`*a`, `*b`) still reaches the original memory cells.
What's the actual difference between `p` and `&p` when `p` is declared `int *p`?::`p`'s value is the address of whatever `p` points at (type `int *`). `&p` is the address of the pointer variable `p` itself, in memory (type `int **`) - one level of indirection further out.
Why does `file_bytes + depts_arr[i].offset` in `email_lookup.c` give a byte-precise address, when the same arithmetic on an `int *` would not?::Pointer arithmetic is scaled by the pointee's type size. `file_bytes` is `char *` (1-byte elements), so adding an integer offset moves exactly that many bytes. The same `+ offset` on an `int *` would move `offset * sizeof(int)` bytes instead.
Is an uninitialized pointer in C guaranteed to be `NULL`?::No. An uninitialized pointer holds whatever garbage value was already in that memory - it is not automatically `NULL`. Only an explicit assignment (`= NULL`, or a function like `malloc` returning `NULL` on failure) makes a pointer safely testable before use.
What does the cast `file_header_t *header = (file_header_t *) file_bytes;` actually do to the underlying bytes?::Nothing - no copying or parsing happens. The cast only changes how the compiler interprets accesses through `header`; `header->num_contacts` becomes pointer arithmetic (an offset into `file_bytes`) computed from `file_header_t`'s struct layout.
