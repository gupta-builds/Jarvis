---
type: concept
status: sprout
created: 2026-10-01
updated: 2026-10-01
course: "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/CSCI 2021 Board|CSCI 2021 Board]]"
track: "C Refresher"
mastery_level: 0
prerequisites: []
used_in:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]]"
evidence:
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 6|Week - 6]]"
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 7|Week - 7]]"
tags:
  - concept
related:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Bitwise Operations and Integer Representation|Bitwise Operations and Integer Representation]]"
---
# x86-64 and Memory Layout
## One-Line Answer
==A running C program is just a block of memory split into fixed regions (text/globals/heap/stack) plus a small set of CPU registers, and the x86-64 calling convention is nothing more than an agreed contract for which registers hold a function's arguments and where its local variables live on the stack.==
## Mechanism
**The calling convention (System V AMD64 ABI), as this course's own Lab 06 drills it:** the first six integer/pointer arguments to a function go in `%rdi`, `%rsi`, `%rdx`, `%rcx`, `%r8`, `%r9` in that order (32-bit versions: `%edi`, `%esi`, etc.); the return value comes back in `%rax`/`%eax`. `order3`'s own assembly in this course's Lab 07 shows this directly: `order3(a, b, c)` receives its three pointer arguments in `%rdi`, `%rsi`, `%rdx` and reads/writes through them with `movl (%rdi), %eax`-style indirect addressing - the same dereference-through-a-register pattern C's `*a` compiles down to.
**The stack frame and 16-byte alignment rule.** Every `call` pushes an 8-byte return address, and the ABI requires `%rsp` to be a multiple of 16 *at the instant a `call` executes* - not an arbitrary convenience, a real contract the callee is allowed to assume. Lab 07's `order3_asm.s` makes this concrete: `main` needs 36 bytes of local-variable space (nine 4-byte `int`s: `r t v q e d i j k`), but the real code does `subq $56, %rsp`, not `subq $36, %rsp` - the extra bytes are alignment padding so every later `call order3`/`call printf@PLT` inside `main` still lands on a 16-byte-aligned `%rsp`. Locals are then addressed as offsets from `%rsp` (`movl $17, 0(%rsp)`, `leaq 4(%rsp), %rsi` to take `&t`) - `leaq` computes an address without dereferencing, which is exactly how C's `&variable` compiles.
**Process memory layout, the four regions a program actually occupies:** **text** (the compiled instructions, read-only, shared across processes running the same binary), **global/static data** (variables that exist for the program's whole lifetime), **heap** (`malloc`'d memory, grows upward as more is allocated), **stack** (local variables and call frames, grows downward with each nested call). This course's own HW11 (`memory_parts.c`) demonstrates all of it in one running process: it prints the address of `main` (text), a global array, a `malloc`'d heap pointer, and a stack-local array, then pauses so `pmap` can be run against the live process to see every one of these regions listed with real addresses - text consistently prints lowest, the stack-local array consistently prints highest, confirming the heap-grows-up/stack-grows-down picture directly rather than just asserting it.
**Direct bridge to CSCI 4061:** this is the exact same text/initialized-data/bss/heap/stack picture [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] §7.6 covers for this course's own material, right down to naming heap-meets-stack collision a **stack overflow** - CSCI 2021 taught this mechanism once already; 4061 doesn't re-derive it, just builds process-control (`fork`/`exec`/`wait`) on top of it.
**Complexity/limits:** register-to-register and register-to-stack moves are single-cycle operations; the real cost in this picture is a `call` itself (pushing a return address, jumping) and any memory access that misses cache - not covered by this note, but the reason data layout (covered in [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs, Typedef, and Memory Layout|structs]]/alignment concepts) matters for performance, not just correctness.
## Contrast / What It Is Not
A stack frame is not the same thing as the heap, even though both are "dynamic" in the loose sense of changing size as the program runs. Stack space is reclaimed automatically the instant a function returns (just moving `%rsp` back); heap space from `malloc` stays allocated until an explicit `free()` call, which is precisely why a pointer into a function's local stack array becomes invalid at the moment that function returns, while a pointer returned from `malloc` stays valid until freed.
## Failure Modes / Misconceptions
> [!WARNING]
> **Clobbering a register that still holds a live value.** This course's own HW06 contains a real, reproducible example: `dodiv`'s buggy assembly receives its `quot`/`rem` output pointers in `%rdx`/`%rcx` per the calling convention (stated directly in the code's own header comment), but then runs `cqto` to set up 64-bit division - `cqto` sign-extends `%eax` into `%rdx:%rax`, which necessarily **overwrites `%rdx`**. The buggy version never copies the `quot`/`rem` pointers out of `%rdx`/`%rcx` into safe registers first; it writes its results to `(%r8)`/`(%r9)` instead, registers that were never actually loaded with those pointers. The result is a write through whatever garbage value happened to be sitting in `%r8`/`%r9` - a segmentation fault that, read superficially, looks unrelated to the division code three lines above it. The general lesson: any instruction that implicitly writes a specific register (`cqto`/`cltd` always touches `%rdx`; `idiv` always touches both `%rax` and `%rdx`) can silently destroy a value your own calling convention put there moments earlier, unless you save it first.
> [!WARNING]
> **Overflowing a stack-local array corrupts whatever memory sits next to it - including the return address.** This course's own HW07 `smash1.c` demonstrates this directly: `demo()` declares `int arr[4]` on its stack frame, then calls `fill_seq(arr)`, which writes **8** ints into it (`#define END 8`), not 4. Because the stack frame's local variables and the saved return address live in nearby stack memory, writing past the end of `arr` keeps overwriting adjacent stack bytes - in the worst case, the return address `demo()` will jump to when it finishes. This is the actual mechanism behind "buffer overflow" as a security bug, not just a correctness bug: it's not that `arr[7]` "doesn't exist," it's that the write still lands on real memory that means something else. `smash2.c` moves the same 4-element buffer onto the **heap** via `malloc` instead - the overflow still corrupts adjacent heap memory, but no longer threatens the return address specifically, which is exactly why this course pairs the two files as a direct stack-vs-heap contrast.
## Evidence From This Vault
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 6|Week - 6]] - x86-64 registers, addressing modes, ATT syntax, calling convention basics.
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 7|Week - 7]] - stack frames, procedure calls, the calling convention in full.
- Lab 06 (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 2021\csci2021\lab06-code\funcs.s`) - argument registers and caller-saved registers.
- Lab 07 (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 2021\csci2021\lab07-code\order3.s`) - the real `subq $56, %rsp` 16-byte-alignment-padding example.
- HW06 (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 2021\csci2021\homework06-code\dodiv_segfault.s`) - the `cqto`-clobbers-`%rdx` segfault.
- HW07 (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 2021\csci2021\homework07-code\smash1.c`, `smash2.c`) - the stack-vs-heap buffer-overflow contrast.
- HW11 (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 2021\csci2021\homework11-code\memory_parts.c`) - all memory regions observed in one real process via `pmap`.
- [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]] - the same memory-layout picture, taught again (and built on, via `fork`/`exec`) in the current course.
## Flashcards
#cards/csci2021
Which six registers hold a function's first six integer/pointer arguments on x86-64 (System V ABI), in order?::`%rdi`, `%rsi`, `%rdx`, `%rcx`, `%r8`, `%r9` — the return value comes back in `%rax`.
Why does `main` in Lab 07's `order3_asm.s` reserve 56 bytes of stack space for only 36 bytes of actual local variables?::The System V ABI requires `%rsp` to be a multiple of 16 at the instant any `call` executes. 36 bytes of locals isn't itself 16-aligned relative to the stack's starting offset, so the extra bytes are deliberate padding to keep every later `call order3`/`call printf@PLT` inside `main` landing on a correctly aligned stack.
In HW06's buggy `dodiv`, why does calling `cqto` right before `idivl` cause a segfault later in the function?::`cqto` sign-extends `%eax` into `%rdx:%rax` to prepare for division, which overwrites `%rdx` — but `%rdx` was also where the ABI placed the `quot` output pointer argument. The code never saved that pointer elsewhere first, so a later write through the register meant to hold it lands on garbage memory.
Why does overflowing a stack-allocated array (`smash1.c`) threaten a return address, while overflowing the equivalent heap-allocated array (`smash2.c`) does not?::A stack frame's local variables and its saved return address occupy nearby stack memory, so writing past a local array's bounds can keep overwriting adjacent stack bytes up to and including that return address. A `malloc`'d array lives on the heap, physically separate from the stack, so the same out-of-bounds write corrupts adjacent heap memory instead — still a bug, but not one that can hijack control flow the same way.
What does HW11's `memory_parts.c` prove about a running C process, using only `printf("%p", ...)` and `pmap`?::That the classic text/heap/stack address ordering is a real, observable fact about one live process, not just a diagram: `main`'s address (text) prints lowest, a `malloc`'d pointer (heap) prints higher, and a stack-local array's address prints highest of all, matching the heap-grows-up / stack-grows-down picture directly.
