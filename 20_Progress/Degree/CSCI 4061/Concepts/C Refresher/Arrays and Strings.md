---
type: concept
status: sprout
created: 2026-10-01
updated: 2026-10-06
course: "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/CSCI 2021 Board|CSCI 2021 Board]]"
track: C Refresher
mastery_level: "0"
prerequisites:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Pointers and Addresses|Pointers and Addresses]]"
used_in:
  - "[[CSCI 4061 Board]]"
evidence:
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 2|Week - 2]]"
tags:
  - concept
related:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Pointers and Addresses|Pointers and Addresses]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory|Dynamic Memory]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs and Typedef|Structs and Typedef]]"
---
# Arrays and Strings
## One-Line Answer
==A C array is a block of same-type elements laid out contiguously in memory with no bounds information attached, so indexing (`arr[i]`) is really just pointer arithmetic from the array's base address, and a "string" is nothing more than a `char` array that uses a `'\0'` byte as an end-of-data marker instead of carrying its own length.==
## Start Here
With `int a[3] = {10, 20, 30};`, `a` names the first element's address in most expressions, `a + 1` is the second `int`'s address, and `a[1]` is exactly `*(a + 1)`, therefore `20`. Only indices 0, 1, and 2 are valid; C does not check that boundary.

A string adds one rule: it ends at the first zero byte. `char s[4] = {'c', 'a', 't', '\0'};` is a valid three-character string. The terminator uses real space, so `char s[3] = "cat";` is not room for a valid C string.
## Mechanism
A statically declared array (`int arr[10];`) reserves one contiguous block of `10 * sizeof(int)` bytes at a fixed location (stack or global, chosen at compile time), and the array's name evaluates to the address of its first element. Indexing `arr[i]` is defined to mean `*(arr + i)` - the compiler adds `i` scaled by `sizeof(int)` to the base address and dereferences the result. This is why, per CSCI 2021's own Week 2 note, "arrays and pointers are closely related" but not identical: an array's storage location is fixed by the compiler for its whole lifetime, while a pointer variable can be reassigned to point anywhere.
**Array decay in function calls:** all C arguments are pass-by-value, but for arrays "the value being passed is just the address of the first element" (verified directly from Week 2). `void print_array(int arr[], int size)` receives a pointer, not a copy of the whole array - which is exactly why modifying `arr[i]` inside the function changes the caller's original array, while reassigning the local parameter `arr` itself (or `size`) only affects the function's own copy of that one variable.
**Strings have no built-in type** in C - they're `char` arrays by convention, terminated by a `'\0'` (null) byte. `strcpy(str2, "hello")` copies five visible characters plus the trailing `'\0'`; `strlen(str2)` scans forward counting bytes until it hits that terminator, so it never includes the terminator itself in its count. `printf("%s", str)` does the identical scan-until-`'\0'` to know where to stop printing. Every one of these functions trusts that a `'\0'` genuinely exists somewhere within the buffer - there is no separate length field anywhere to fall back on.
**Two-dimensional layout, three real ways to build one** (all three verified against Week 2's own worked examples):
1. **Static declaration** (`int matrix[50][100];`): one contiguous block in **row-major order** - all of row 0's 100 elements, then all of row 1's, and so on. `matrix[3][7]` is really `*(matrix + 3*100 + 7)` under the hood, which is why a 2D array parameter must specify its column count (`#define COLS 100`) - the compiler needs that number to compute each row's offset.
2. **Single `malloc`, manual indexing**: `two_d_array = malloc(sizeof(int) * N * M);` allocates one contiguous heap block of the same row-major shape as method 1, but since there's no `[][]` type information left, the programmer computes the offset by hand: `two_d_array[i*M + j]`.
3. **Array of row-arrays (`int **`)**: `N+1` separate `malloc` calls - one for an array of `N` row pointers, then one more per row for that row's own `M`-element array. This is the only one of the three that supports real `arr[i][j]` double-indexing after a dynamic allocation, because each `arr[i]` genuinely is a pointer to its own row's memory - but it also means the `N` rows are **not** contiguous with each other in memory, unlike methods 1 and 2.
**Complexity:** indexing is O(1) in all three layouts - the cost difference is in cache behavior, not asymptotic time. Row-major traversal (outer loop over rows, inner over columns) walks memory sequentially in methods 1 and 2, which is why CSCI 2021's own Lab 08 demonstrates array-based search beating a linked list's scattered-node search on raw speed, despite both being technically linear scans - contiguous memory is cache-friendly in a way a chain of separately-allocated nodes is not.
## Contrast / What It Is Not
Method 1/2's single contiguous block and method 3's array-of-pointers (`int **`) look similar in source code (`arr[i][j]` in both cases, loosely) but have completely different memory shapes: one is a single slab with manually computed offsets, the other is `N+1` independently allocated chunks linked by a row-pointer array. They are **not interchangeable as function parameters** - a function written to take `int **` cannot be handed a pointer from method 1 or 2, and vice versa, because the compiler generates different addressing code for each.
An array is also not a pointer in every respect, even though `arr` decays to one in most expressions. `sizeof(arr)` on an actual array variable gives the array's total byte size; `sizeof(ptr)` on a pointer (including a decayed array parameter inside the function it was passed to) gives only the pointer's own size (8 bytes on x86-64) - a classic trap when `sizeof` is used inside a function expecting it to still "know" the array's length.
## Failure Modes / Misconceptions
> [!WARNING]
> Assuming a `char` buffer is automatically a valid string just because it holds character data. `char str1[10];` with no explicit initialization or `strcpy` holds garbage bytes, and if none of them happen to be `'\0'` within the buffer's bounds, `strlen`/`printf("%s", ...)` will read straight past the end of the array looking for a terminator that isn't there - an out-of-bounds read, not a clean error. A string is only as valid as its null terminator, never its declared size alone.
## Evidence From This Vault
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 2|Week - 2]] - static array declaration/indexing, array-decay-to-pointer in function parameters, `strcpy`/`strlen`/`%s` string handling, and all three dynamic-2D-array construction methods with real code for each.
## Flashcards
#cards/csci2021
Why does modifying `arr[i]` inside `void print_array(int arr[], int size)` change the caller's original array, while reassigning `size` inside the function does not?::All C arguments are pass-by-value, but for an array the value passed is the address of its first element - `arr` inside the function is a pointer to the same memory the caller's array occupies, so writes through it are visible to the caller. `size` is an ordinary `int` copy; reassigning it only changes the function's local variable.
What does `arr[i]` actually compile down to, for a statically declared `int arr[10]`?::`*(arr + i)` - the array name decays to the address of its first element, `i` gets scaled by `sizeof(int)`, and the result is dereferenced. Indexing is pointer arithmetic with friendlier syntax, not a distinct language feature.
Why must a 2D array function parameter declare its column count (e.g. via `#define COLS 100`), even though the row count can be left unspecified?::Statically declared 2D arrays are stored row-major - all of row 0, then all of row 1, and so on. Computing the address of `matrix[i][j]` requires knowing how many elements are in each row (the column count) to skip forward `i` full rows; the row count alone never enters that offset calculation.
Why can't a function written to take an `int **` parameter be passed the result of `malloc(sizeof(int) * N * M)` (the single-malloc 2D method)?::A single `malloc` call produces one contiguous block with no per-row pointers inside it - indexing it requires manual offset math (`arr[i*M+j]`). An `int **` function expects an array of *row pointers*, each pointing to its own separately allocated row - a structurally different layout the compiler addresses differently, not just a different syntax for the same memory.
`strlen()` is called on a `char` buffer that was declared but never initialized or null-terminated. What actually happens?::`strlen` scans forward from the start of the buffer looking for a `'\0'` byte, with no awareness of the buffer's declared capacity. If no `'\0'` happens to appear within the array's bounds, it reads past the end of the buffer - undefined behavior, not a bounds-checked error.
