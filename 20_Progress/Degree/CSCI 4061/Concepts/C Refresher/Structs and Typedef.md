---
type: concept
status: sprout
created: 2026-10-01
updated: 2026-10-01
course: "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/CSCI 2021 Board|CSCI 2021 Board]]"
track: "C Refresher"
mastery_level: 0
prerequisites:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Pointers and Addresses|Pointers and Addresses]]"
used_in:
  - "[[CSCI 4061 Board]]"
evidence:
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 3|Week - 3]]"
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 4|Week - 4]]"
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Structs|Structs]]"
tags:
  - concept
related:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory|Dynamic Memory]]"
---
# Structs and Typedef
## One-Line Answer
==A struct bundles differently-typed fields under one name at fixed byte offsets, and `typedef` just gives that type a shorter alias — neither changes how the fields are stored or accessed.==
## Mechanism
**Definition and declaration.** A struct type is defined outside any function, usually near the top of a `.c` file: `struct studentT { char name[64]; int age; float gpa; };` creates the type `struct studentT` — note the `struct` keyword has to prefix every use of that type name unless a `typedef` removes the need: `typedef struct studentT { ... } student_t;` gives the same layout a plain alias `student_t`, so `student_t s;` works without writing `struct`. These are purely naming conveniences; the actual memory layout is identical either way.
**Access: `.` vs `->`.** A struct *value* (not a pointer) uses dot notation: `student1.age = 18 + 2;`. A pointer to a struct must be dereferenced first before a field can be reached — `(*sptr).age = 19;` — and C provides `->` as sugar for exactly that: `sptr->age = 19;` is identical to `(*sptr).age = 19;`. CSCI 2021's own [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Structs|Structs]] note and the Lab 03 `treasuremap_t` walkthrough in [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 3|Week - 3]] both drill this exact substitution rule; the chained form `&tmap->locations[i].row` reads left to right as **(pointer deref) → (array index) → (field select) → (address-of)** — four distinct operations collapsed into one expression.
**Assignment copies the whole struct.** Struct variables are lvalues: `student2 = student1;` copies every field value from `student1` into `student2`'s own memory — this is real, independent storage, not a reference or alias. This is the opposite of array "assignment" (arrays have no `=` operator at all; passing one to a function passes its base address, not a copy — see [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Arrays and Strings|Arrays and Strings]]).
**Self-referential structs build linked structures.** A struct field may be a pointer to the struct's own type: `struct node { int data; struct node *next; };`. This single pattern is the entire mechanism behind linked lists, trees, and the doubly-linked free-block lists in [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory|Dynamic Memory]]'s `el_blockhead_t{size_t size; char state; struct block *next, *prev;}` — a struct can never contain a full instance of itself (infinite size), but a *pointer* to itself is just a fixed-size address, so it works.
**Padding and alignment change the real size.** Hardware reads aligned memory faster, so the compiler inserts padding bytes between fields so each one starts at an address that is a multiple of its own size, and the whole struct's size is padded to a multiple of its largest field's size. CSCI 2021's own worked example: `student_b_t` holding a `char` then a `double` is not `1 + 8 = 9` bytes — it is 16, because 7 padding bytes get inserted after the `char` so the `double` starts 8-byte-aligned. `sizeof(struct)` is therefore never safely assumed to equal the sum of its members' sizes; always call `sizeof` directly rather than adding field sizes by hand.
**Struct layout has real performance consequences, not just organizational ones.** CSCI 2021's Lab 09 contrasts two ways of storing the same paired data: `int_field_t` (an array of structs, each holding both fields together — "ABABAB" in memory) versus `arr_field_t` (two separate parallel arrays, one per field — "AAAABBBB" in memory, i.e. struct-of-arrays). A loop that only touches field A strides past interleaved, unused field-B bytes in the array-of-structs layout, hurting cache locality; the struct-of-arrays layout keeps every touched byte contiguous. Loop fusion (combining two loops that scan the same range into one) is the lab's fix once the layout is struct-of-arrays. The lesson: choosing *how* to group data into structs is a real performance decision, not just a readability one.
## Contrast / What It Is Not
A struct is not a class — it has no methods, no access control, and no inheritance; it is purely a fixed-layout grouping of fields, and all of C's usual pass-by-value rules apply to it directly (passing a struct by value copies the whole thing, which is why large structs are usually passed by pointer instead). `.` access requires an actual struct value in scope; `->` access requires a pointer to one — picking the wrong operator for what's actually in hand is a compile error, not a silent bug, but mentally confusing `sptr.age` (invalid, `sptr` is a pointer) with `sptr->age` is the most common slip.
## Failure Modes / Misconceptions
> [!WARNING]
> Assuming `sizeof(struct)` equals the sum of its field sizes. Padding/alignment can make it larger (CSCI 2021's `char`+`double` example: 9 bytes of real data, 16 bytes of actual `sizeof`). This matters concretely when reading/writing structs to a binary file with `fwrite`/`fread` — see [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/File IO in C|File IO in C]] — since the padding bytes get written too, and a struct's padding layout isn't guaranteed identical across compilers or architectures.
> [!WARNING]
> Mallocing a struct does not malloc its pointer fields. `struct personT { char *name; int age; };` — `p2 = malloc(sizeof(struct personT));` only allocates space for the `personT` struct itself (one `char*` plus one `int`, whatever that totals with padding); `p2->name` is still an uninitialized pointer until it is separately assigned its own `malloc(sizeof(char) * (len+1))`. Forgetting the second malloc and calling `strcpy(p2->name, ...)` writes through a garbage pointer.
## Evidence From This Vault
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 3|Week - 3]] — struct definition, `.`/`->` access, array-of-structs, self-referential `struct node`, and the full nested-struct `&tmap->locations[i].row` worked example from Lab 03's `treasuremap_t`.
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 4|Week - 4]] — `typedef struct` anonymous-struct-plus-alias pattern, and the padding/alignment rules with the `char`+`double` = 16-byte worked example.
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Structs|Structs]] — the dedicated struct-pointer-fields example (`personT{char *name; int age;}`) that the first Failure Mode above is built on.
## Flashcards
#cards/csci2021
What does `sptr->age = 19;` actually expand to, and why is the expansion necessary?::`(*sptr).age = 19;` — `sptr` must be dereferenced before a field can be accessed, since `sptr` itself is just an address; `->` is syntactic sugar that does the dereference and the field access in one step.
Why is `student_b_t` (one `char` then one `double`) 16 bytes, not 9?::The compiler inserts 7 padding bytes after the `char` so the `double` field starts at an address that's a multiple of 8 (its own size) — hardware reads aligned memory faster, and the whole struct's size also pads up to a multiple of its largest field's size.
After `p2 = malloc(sizeof(struct personT));` where `personT` has a `char *name` field, is `p2->name` ready to `strcpy` into?::No. The malloc only allocated space for the struct's own fields (the pointer itself), not whatever `name` should point to — `p2->name` needs its own separate `malloc(sizeof(char) * (len+1))` before it's safe to write through.
Why can a struct contain a pointer to its own type (`struct node *next;`) but never a full instance of its own type?::A pointer is a fixed-size address regardless of what it points to, so the struct's size stays well-defined. A full embedded instance of the same struct would require the struct to contain itself, which has no finite size.
What's the real mechanism difference between `int_field_t` (array of structs) and `arr_field_t` (struct of arrays) that makes one cache-friendlier for single-field loops?::Array-of-structs interleaves both fields in memory ("ABABAB"), so a loop touching only one field still strides past the other field's bytes it never uses. Struct-of-arrays keeps each field in its own contiguous array ("AAAABBBB"), so a single-field loop touches only the bytes it actually needs.
