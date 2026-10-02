---
type: concept
status: sprout
created: 2026-10-01
updated: 2026-10-01
course: "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/CSCI 2021 Board|CSCI 2021 Board]]"
track: C Refresher
mastery_level: "0"
prerequisites:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Pointers and Addresses|Pointers and Addresses]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs and Typedef|Structs and Typedef]]"
used_in:
  - "[[CSCI 4061 Board]]"
evidence:
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 2|Week - 2]]"
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Mallac and free functions|Mallac and free functions]]"
tags:
  - concept
related:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs and Typedef|Structs and Typedef]]"
---
# Dynamic Memory
## One-Line Answer
==`malloc`/`free` let a program claim and release heap memory at runtime instead of being stuck with fixed, compile-time storage — and the allocator granting that memory is itself just an ordinary C program tracking which bytes are free.==
## Mechanism
**The basic contract.** `void *malloc(size_t size);` asks the heap for `size` contiguous bytes and returns a `void *` pointing at the start of them (or `NULL` on failure) — the standard pattern is `arr = malloc(sizeof(int) * 20);`, using `sizeof` rather than a hand-counted byte literal so the request stays correct if the element type ever changes. `free(void *ptr)` returns that memory to the allocator once it's no longer needed; CSCI 2021's own [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 2|Week - 2]] note flags the good-practice habit of setting the pointer to `NULL` immediately after freeing it, specifically so a later accidental use of that pointer crashes loudly (dereferencing `NULL`) instead of silently corrupting memory that something else may have since reused.
**Why dynamic allocation exists at all.** A **stack**-allocated local array is fixed in size at compile time and vanishes the instant its function returns. The **heap** solves both problems: its size is chosen at runtime (from a value only known once the program is running — user input, a file's length), and a pointer to heap memory can be returned from the allocating function and used long after that function's own stack frame is gone, because heap memory isn't scoped to any function call.
**The two-pass sizing pattern.** A very common shape, drawn directly from CSCI 2021's own homework material: when the number of items to store isn't known until the input is scanned, read the input twice — once just to count (`while (fscanf(fin, "%lf", &tmp) != EOF) count++;`), `rewind()` the file, `malloc(count * sizeof(double))` using the now-known count, then read again into the freshly sized array. The allocation itself always happens *after* the size is known, never before.
**A real allocator, worked in full: `el_malloc` (CSCI 2021 Project 4).** This project builds `malloc`/`free` from scratch on top of one big `mmap()`'d block, and it is the single clearest answer to "what does malloc actually do?" available in this course's own material:
- Every block of heap memory is bracketed by a **header** (`el_blockhead_t{size_t size; char state; struct block *next, *prev;}`) immediately before the usable bytes, and a **footer** (`el_blockfoot_t{size_t size;}`) immediately after them. The footer exists purely so a neighboring block can find *this* block's header by walking backward from its own position — pure pointer arithmetic, no scanning.
- Two doubly-linked lists track every block: `avail` (free) and `used` (allocated), each with fixed dummy begin/end sentinel nodes so insertion/removal code never has to special-case an empty list.
- `el_malloc(nbytes)`: `el_find_first_avail(nbytes)` walks the `avail` list looking for the **first** block whose size is at least `nbytes + EL_BLOCK_OVERHEAD` (first-fit, not best-fit — a real, deliberate design tradeoff, not an oversight). `el_split_block()` then carves off exactly `nbytes` for the caller and turns the leftover space into a brand-new available block with its own header/footer, so a 4000-byte free block satisfying a 64-byte request doesn't waste the other 3936 bytes. The carved block moves from `avail` to `used`; the leftover (if any) joins `avail`.
- `el_free(ptr)`: moves the block back from `used` to `avail`, then calls `el_merge_block_with_above()` — found via pure address arithmetic (`PTR_PLUS_BYTES(block, block->size + EL_BLOCK_OVERHEAD)`), **not** by following any `next` pointer — to fuse it with a physically adjacent free block when one exists. This is **boundary-tag coalescing**: without it, repeated malloc/free cycles would fragment the heap into many small, unusably scattered free blocks even when the *total* free space is plenty.
**Complexity and limits.** `el_find_first_avail` is O(n) in the number of currently-free blocks — a real cost of first-fit's simplicity. The heap here is a single fixed-size `mmap()` region requested once in `el_init()`; when `el_find_first_avail` returns `NULL` (nothing big enough left), `el_malloc` just fails and returns `NULL` — a production allocator would instead request more pages from the OS (via `sbrk`/`mmap`) and keep going, which this teaching version deliberately does not do.
## Contrast / What It Is Not
**Stack** allocation (an ordinary local variable) is automatic: the compiler reserves and reclaims the space with no function call involved, strictly scoped to the enclosing block, freed the instant that block returns — fast, but inflexible in size and lifetime. **Heap** allocation (`malloc`) is manual: the programmer explicitly requests and releases it, the size can depend on a runtime value, and the memory survives until `free` is called regardless of which function is currently executing — flexible, but entirely the programmer's responsibility to release correctly.
## Failure Modes / Misconceptions
> [!WARNING]
> **Double free.** Calling `free()` twice on the same pointer corrupts the allocator's own bookkeeping — concretely, in `el_malloc`'s terms, the block would already be sitting in the `avail` list after the first `free()`; a second `free()` on the same (now-stale) pointer tries to unlink and re-insert a block that's already linked somewhere else, scrambling the doubly-linked list's `next`/`prev` pointers for *every* block, not just this one. The fix habit (setting the pointer to `NULL` right after freeing it, per [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 2|Week - 2]]) turns an accidental second free into a `NULL`-pointer crash instead of silent heap corruption.
> [!WARNING]
> **Use-after-free.** Once a block is freed, nothing stops a later, unrelated `malloc()` call from handing that exact same memory back out to a different part of the program. Code that kept the old (now-dangling) pointer and writes through it corrupts whatever the new owner just put there — a bug whose symptom shows up far away from, and long after, the actual mistake.
> [!WARNING]
> **Forgetting the nested malloc.** A struct with a pointer field (`char *name`) needs two separate allocations: one for the struct, one for whatever the pointer field should point at. See [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs and Typedef|Structs and Typedef]]'s matching failure mode — this is the same mistake viewed from the memory-management side rather than the struct-layout side.
## Evidence From This Vault
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 2|Week - 2]] — `malloc`/`free` prototypes, the heap-memory rationale, dynamically allocated arrays, and the NULL-after-free good-practice habit.
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Mallac and free functions|Mallac and free functions]] — a focused `malloc(sizeof(int))` walkthrough tracing the `void *` → `int *` implicit conversion step by step.
- CSCI 2021 Project 4 (`proj4-code/el_malloc.c`, `el_malloc.h`) — the full first-fit, boundary-tag-coalescing explicit free-list allocator this note's Mechanism section is built from; no vault note exists for it yet, the code itself is the source.
## Flashcards
#cards/csci2021
Why does `el_malloc`'s `el_find_first_avail` search stop at the *first* sufficiently large block instead of the smallest one that fits?::It implements first-fit, not best-fit — a deliberate simplicity-over-optimality tradeoff. First-fit is O(n) in the number of free blocks and simple to implement correctly; best-fit would need to scan the entire list every time to guarantee the tightest fit.
What does `el_split_block` do when an available block is bigger than the requested size, and why does that matter?::It carves off exactly the requested bytes (plus header/footer) for the caller and turns the leftover space into a new, independent available block. Without splitting, a single large free block could only ever satisfy one request at a time, however small, wasting the rest.
How does `el_merge_block_with_above` find the neighboring block to coalesce with, and why is that mechanism notable?::By pure pointer arithmetic from the current block's address and size (`PTR_PLUS_BYTES(block, block->size + EL_BLOCK_OVERHEAD)`) — not by following the free list's `next` pointer. The block physically adjacent in memory is not necessarily adjacent in the free list, so finding it requires address math, not list traversal.
Why does setting a pointer to `NULL` immediately after `free(ptr)` help prevent a worse bug?::It turns an accidental later use of that pointer into an immediate, loud `NULL`-dereference crash, instead of a silent use-after-free that corrupts whatever other allocation has since reused that same memory.
What's the real difference between a double-free bug and a use-after-free bug?::Double-free calls `free()` twice on the same still-dangling pointer, corrupting the allocator's own internal free-list bookkeeping. Use-after-free reads or writes through a pointer *after* its memory was freed (and possibly already reallocated to something else), corrupting that other owner's data instead of the allocator's structures.
