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
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Structs and Typedef|Structs and Typedef]]"
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Dynamic Memory|Dynamic Memory]]"
used_in:
  - "[[CSCI 4061 Board]]"
evidence:
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 3|Week - 3]]"
  - "[[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Concepts/Linked list|Linked list]]"
tags:
  - concept
related:
  - "[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Recursion|Recursion]]"
---
# Linked Data Structures
## One-Line Answer
==A linked data structure is a chain of heap-allocated nodes that each hold their own data plus a pointer to the next node(s) in the chain — the structure's shape lives entirely in those pointers, not in contiguous memory like an array.==
## Mechanism
A linked list node is a **self-referential struct**: a struct containing a pointer to its own type. CSCI 2021's own definition states it plainly: `struct node { int data; struct node *next; };` — nothing recursive about the *type* itself (the struct's size is fixed and known at compile time, since it only stores a pointer to the next node, not another whole node by value), only about how instances of it get chained together at runtime.
*Building the chain:* each node is `malloc`'d individually. A brand-new list is `head = NULL` (the empty-list invariant — always check for it before dereferencing). Inserting at the front is three steps in order: allocate the new node, point its `next` at the current head, then repoint `head` at the new node — reversing steps 2 and 3 loses the rest of the list. Lab02's `list.h`/`list_funcs.c` implements this as a sorted singly linked list: `typedef struct node { char data[128]; struct node *next; } node_t;` plus a wrapper `list_t { node_t *head; int size; }` that tracks length separately rather than walking the whole chain to count it.
*Two ways to walk a chain — and they compose differently:* Lab02's own `node_insert()` is genuinely recursive — it walks forward comparing `strcmp(new_data, cur->data)`, and on finding the insertion point, allocates a new node and returns it up the call stack so each enclosing call can "re-stitch" `cur->next` to point at what its recursive call returned. The lab's own header comment names this exactly: "uses recursion to unstitch the list then re-stitch it back together." `node_print_all()` in the same file is also recursive — print, then recurse on `cur->next`, base case `cur == NULL`. By contrast, `list_get()` and `list_contains()` in the same file are plain iterative `while` loops over `ptr = ptr->next`. Both styles produce identical results; recursion isn't required to walk a list, it's a stylistic/implementation choice with its own cost (see [[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/Recursion|Recursion]]'s stack-frame cost).
*A tree is the same idea with two pointers instead of one.* Project 1's gradebook is a **binary search tree**: `typedef struct node { char name[64]; int score; struct node *left; struct node *right; } node_t;`. `add_score()` and `find_score()` walk it *iteratively* (`cur = (cmp < 0) ? cur->left : cur->right;` in a loop) — average O(log n) on a balanced tree, degrading to O(n) on a degenerate (effectively-linear) one, since nothing in this BST rebalances itself. The same file's `print_inorder()`, `free_postorder()`, and `write_binary_preorder()` functions, in contrast, *are* recursive tree traversals — and the project also includes a **third**, fully iterative traversal using an explicit `node_t *stack[1024]` array and manual push/pop, to write the same tree out a different way. Having both the recursive and the explicit-stack version of essentially the same traversal in one file is the clearest real evidence in this course that recursion is just "let the call stack be your stack" — nothing more mystical than that.
*Invariants that matter:* a node's `next` (or `left`/`right`) is either a valid pointer to another node or `NULL` — never garbage. Freeing a list means walking it and `free()`-ing each node *before* losing the pointer to the next one (save `ptr->next` in a temp before calling `free(ptr)`), exactly how `list_clear()` does it. Losing a node's only incoming pointer without freeing it first is a memory leak, not a crash — the bug is silent.
## Contrast / What It Is Not
A linked list is not "a slower array" in the abstract — the real difference is **where the cost lives**. An array's elements are contiguous, so `a[i]` is O(1) and cache-friendly; a linked list's nodes are scattered wherever `malloc` happened to place them, so reaching element `i` means following `i` pointers one at a time, each one a potential cache miss. Lab08 makes this concrete: its `array_find()` is a straight O(n) scan over contiguous memory, while its naive `list_find()` calls `list_get(list, i)` — itself an O(n) walk — once per loop iteration, making the whole search **O(n²)**, not O(n). The fix (`list_find_student()`) walks the list once with a running pointer instead of re-walking it from the head for every index. A linked list trades O(1) random access for O(1) insertion/deletion at a known point without shifting every other element — that's the real tradeoff, not "lists are just worse."
## Failure Modes / Misconceptions
> [!WARNING]
> Calling an O(n) accessor function (like `list_get()`) inside a loop that runs n times silently turns an algorithm from O(n) into O(n²) — this is exactly Lab08's `list_find()` bug, and it's invisible from reading the loop alone; you have to know what the function you're calling inside the loop actually costs.
> [!WARNING]
> Freeing a node and then still dereferencing the pointer that used to point to it (a **use-after-free**) is a different bug from a **memory leak** (losing the last pointer to a node without freeing it) — one corrupts/crashes, the other just wastes memory. `list_clear()`'s pattern of saving `ptr->next` into a temp *before* calling `free(ptr)` exists specifically to avoid the first bug while walking and freeing a list in one pass.
> [!WARNING]
> An unbalanced BST's O(log n) search/insert is an *average case* claim, not a guarantee — inserting already-sorted data into Project 1's gradebook tree (as implemented, with no rebalancing) produces a tree that degenerates into a straight line, with O(n) search just like a linked list.
## Evidence From This Vault
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Week - 3|Week - 3]] — introduces the self-referential struct definition directly: "A struct can be defined with fields whose type is a pointer to the same `struct` type."
- [[40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/Concepts/Linked list|Linked list]] — a worked three-node list-building example (`head = malloc(...); head->next = NULL;` then prepending two more nodes), the existing vault source this note extends.
- Lab02 (`lab02-code/list.h`, `list_funcs.c`) — sorted singly linked list with both recursive (`node_insert`, `node_print_all`) and iterative (`list_get`, `list_contains`) traversal styles in the same file.
- Lab08 (`lab08-code/linked_list.h`, `list_funcs.c`) — the O(n²) `list_find()`-via-repeated-`list_get()` trap, contrasted against `array_find()`.
- Project 1 (`proj1-code/gradebook.c`, `gradebook.h`) — a binary search tree with iterative insert/search and three different traversal strategies (two recursive, one an explicit manual stack) in the same file.
## Flashcards
#cards/csci2021
Why is a linked list node called a "self-referential struct" even though its size is fixed and known at compile time?::Because it contains a *pointer* to its own type (`struct node *next`), not an actual nested instance of the struct by value — a pointer has a fixed, known size regardless of what it points to, so the struct's own size never depends on how long the chain eventually gets.
In Lab02's `node_insert()`, what does "unstitch then re-stitch" actually mean mechanically?::The recursive calls walk forward (unstitching nothing yet, just descending); once the insertion point is found and a new node is allocated and returned, each returning call re-links its own `cur->next` to the value just returned from the level below, re-stitching the chain back together one level at a time on the way back up.
Why does calling `list_get(list, i)` inside a `for (i = 0; i < list->size; i++)` loop make the whole function O(n²) instead of O(n)?::`list_get()` itself walks from the head to reach index `i`, which costs O(i) on average O(n); doing that once per iteration of an n-iteration loop multiplies to O(n²) total, even though neither piece looks expensive in isolation.
What's the real-world cost difference between an array and a linked list for random-access reads, and why?::An array's elements sit in one contiguous memory block, so `a[i]` is a single pointer-arithmetic computation (O(1), cache-friendly); a linked list's nodes are scattered wherever `malloc` placed them, so reaching node `i` requires following `i` separate pointers, each a potential cache miss — O(n) with worse constants than a simple array scan.
Why can inserting already-sorted data into an unbalanced BST make search degrade to O(n)?::With no rebalancing, each new larger (or smaller) key just extends one side of the tree, producing a structure that is effectively a straight linked list in disguise — the O(log n) average case assumes a roughly balanced tree, which sorted-order insertion does not produce.
