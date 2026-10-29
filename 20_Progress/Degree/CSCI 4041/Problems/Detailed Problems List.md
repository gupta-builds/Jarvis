---
type: project
status: sprout
created: 2026-10-04
updated: 2026-10-13
tags:
  - project
  - technical-interview
notes:
  - "[[DSA|DSA]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]]"
  - "[[Weekly Set|Weekly Set]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/Problems Solver|Problems Solver]]"
next: Attempt only the current dated P1 rows after their listed source/prerequisite work; record results in Problems Solver
---
# Detailed Problems List - Checked problems and source drills
This is the problem-level catalog used to build the weekly sets. Each entry records its checked contract, platform difficulty, source, purpose, prerequisites and planned date, without embedding a solution.
## Catalog rules
P1 is required practice, P2 is optional extension after the week’s required work, R is a captured-equivalent/reference, and Hold means the statement is incomplete. Fit grades are planning judgments: 5/5 core pattern, 4/5 integrated transfer, 3/5 extension, 0/5 ungradable without the statement. These are separate from platform difficulty and student mastery.
91 P1 LeetCode selections (14 Hard), 8 HackerRank selections, 11 optional LeetCode extensions and 9 reference counterparts are mapped. All 49 previously captured Pareto entries are accounted for across these categories. Actual independent execution is still 0.
## Source codes and verification
| Code | Exact source and interpretation |
|---|---|
| P | The 49 questions captured in the previous Detailed Problems List. The live [Aman page](https://www.amanmanazir.com/leetcode) redirects to an email signup, so membership is retained from the existing vault list; original curator attribution is not independently reverified. |
| G75 | [Grind 75](https://www.techinterviewhandbook.org/grind75/) public 169-question pool, retrieved 2026-10-13. Contains hard questions. Match by slug; its internal id field is not always the public LeetCode number. |
| L-G | [liquidslr Google / 5. All.csv](https://github.com/liquidslr/leetcode-company-wise-problems/blob/main/Google/5.%20All.csv); row numbers include the header. Historical snapshot, not verified current company frequency. |
| L-A | [liquidslr Amazon / 5. All.csv](https://github.com/liquidslr/leetcode-company-wise-problems/blob/main/Amazon/5.%20All.csv); same snapshot caution. Company membership provides provenance, not a chosen target employer. |
| Official | The linked LeetCode/HackerRank statement was retrieved and checked on 2026-10-13. No editorial was used to produce a solution. |
## Week 1 required practice
### LC 217
[Contains Duplicate](https://leetcode.com/problems/contains-duplicate/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-13 | 30 min attempt cap.
Purpose/contract: Detect any duplicate; compare membership with frequency counting.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 80; L-A row 87. State: planned, not attempted.
### LC 242
[Valid Anagram](https://leetcode.com/problems/valid-anagram/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-13 | 30 min attempt cap.
Purpose/contract: Check character multiplicities; distinguish comparison from replacement count.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 45; L-A row 44. State: planned, not attempted.
### LC 125
[Valid Palindrome](https://leetcode.com/problems/valid-palindrome/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-14 | 30 min attempt cap.
Purpose/contract: Normalize punctuation and case before palindrome checks.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 79; L-A row 119. State: planned, not attempted.
### LC 704
[Binary Search](https://leetcode.com/problems/binary-search/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-14 | 30 min attempt cap.
Purpose/contract: Honor the logarithmic search contract and index boundaries.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 85; L-A row 221. State: planned, not attempted.
### LC 20
[Valid Parentheses](https://leetcode.com/problems/valid-parentheses/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-14 | 30 min attempt cap.
Purpose/contract: Validate mixed bracket types and nesting; differs from minimum-edit tasks.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues|B-S Stacks and queues]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 18; L-A row 18. State: planned, not attempted.
### LC 206
[Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-15 | 30 min attempt cap.
Purpose/contract: Reverse node links while preserving node identity.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP|B-L Linked lists and OOP]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 31; L-A row 84. State: planned, not attempted.
### LC 232
[Implement Queue using Stacks](https://leetcode.com/problems/implement-queue-using-stacks/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-15 | 30 min attempt cap.
Purpose/contract: Implement FIFO using stack operations; explain amortized work.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues|B-S Stacks and queues]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; G75; L-G row 284; L-A row 282. State: planned, not attempted.
### LC 104
[Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-16 | 30 min attempt cap.
Purpose/contract: Compute depth on empty and skewed trees; define nodes versus edges.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 220; L-A row 179. State: planned, not attempted.
### LC 733
[Flood Fill](https://leetcode.com/problems/flood-fill/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-16 | 30 min attempt cap.
Purpose/contract: Traverse a same-color region; avoid revisiting when the color is unchanged.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; G75; L-G row 384; L-A row 124. State: planned, not attempted.
## Week 2 required practice
### LC 49
[Group Anagrams](https://leetcode.com/problems/group-anagrams/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-19 | 45 min attempt cap.
Purpose/contract: Group by an anagram-equivalence key, including empty strings.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 57; L-A row 8. State: planned, not attempted.
### LC 155
[Min Stack](https://leetcode.com/problems/min-stack/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-19 | 45 min attempt cap.
Purpose/contract: Maintain a stack with constant-time minimum queries.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues|B-S Stacks and queues]]. Prerequisites: [[Detailed Problems List#LC 20|LC 20]].
Provenance: Official; P; G75; L-G row 98; L-A row 81. State: planned, not attempted.
### LC 141
[Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-20 | 30 min attempt cap.
Purpose/contract: Detect repeated node visits; pos is a test fixture, not an input.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP|B-L Linked lists and OOP]]. Prerequisites: [[Detailed Problems List#LC 206|LC 206]].
Provenance: Official; P; G75; L-G row 115; L-A row 136. State: planned, not attempted.
### LC 21
[Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-20 | 30 min attempt cap.
Purpose/contract: Splice sorted node chains; differs from alternating two lists.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP|B-L Linked lists and OOP]]. Prerequisites: [[Detailed Problems List#LC 206|LC 206]].
Provenance: Official; P; G75; L-G row 28; L-A row 39. State: planned, not attempted.
### LC 19
[Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-21 | 45 min attempt cap.
Purpose/contract: Remove by distance from the tail, including the head case.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP|B-L Linked lists and OOP]]. Prerequisites: [[Detailed Problems List#LC 206|LC 206]].
Provenance: Official; P; G75; L-G row 94; L-A row 125. State: planned, not attempted.
### LC 143
[Reorder List](https://leetcode.com/problems/reorder-list/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-21 | 45 min attempt cap.
Purpose/contract: Reorder existing nodes without replacing their values.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP|B-L Linked lists and OOP]]. Prerequisites: [[Detailed Problems List#LC 206|LC 206]], [[Detailed Problems List#LC 19|LC 19]].
Provenance: Official; P; G75; L-G row 226; L-A row 112. State: planned, not attempted.
### LC 226
[Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-22 | 30 min attempt cap.
Purpose/contract: Transform tree structure while retaining the original node objects.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 170; L-A row 241. State: planned, not attempted.
### LC 102
[Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-22 | 45 min attempt cap.
Purpose/contract: Group traversal output by level rather than global visitation order.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 104|LC 104]].
Provenance: Official; P; G75; L-G row 167; L-A row 110. State: planned, not attempted.
### LC 98
[Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-23 | 45 min attempt cap.
Purpose/contract: Validate global BST constraints, not just parent-child comparisons.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 104|LC 104]].
Provenance: Official; P; G75; L-G row 292; L-A row 130. State: planned, not attempted.
### LC 210
[Course Schedule II](https://leetcode.com/problems/course-schedule-ii/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-23 | 45 min attempt cap.
Purpose/contract: Produce an ordering or detect impossibility in a prerequisite graph.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 733|LC 733]].
Provenance: Official; P; G75; L-G row 270; L-A row 40. State: planned, not attempted.
### LC 133
[Clone Graph](https://leetcode.com/problems/clone-graph/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-24 | 45 min attempt cap.
Purpose/contract: Clone graph identity and cycles without sharing original nodes.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 217|LC 217]], [[Detailed Problems List#LC 733|LC 733]].
Provenance: Official; P; G75; L-G row 217; L-A row 269. State: planned, not attempted.
## Week 3 required practice
### LC 153
[Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-26 | 45 min attempt cap.
Purpose/contract: Find the minimum despite rotation under a logarithmic bound.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: [[Detailed Problems List#LC 704|LC 704]].
Provenance: Official; P; G75; L-G row 233; L-A row 174. State: planned, not attempted.
### LC 33
[Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-26 | 45 min attempt cap.
Purpose/contract: Search a rotated array and retain logarithmic complexity.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: [[Detailed Problems List#LC 704|LC 704]], [[Detailed Problems List#LC 153|LC 153]].
Provenance: Official; P; G75; L-G row 39; L-A row 25. State: planned, not attempted.
### LC 215
[Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-27 | 45 min attempt cap.
Purpose/contract: Rank includes duplicates; compare heap and selection contracts.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: [[Detailed Problems List#LC 704|LC 704]].
Provenance: Official; P; G75; L-G row 63; L-A row 55. State: planned, not attempted.
### LC 703
[Kth Largest Element in a Stream](https://leetcode.com/problems/kth-largest-element-in-a-stream/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-28 | 30 min attempt cap.
Purpose/contract: Maintain the kth-largest stream value after each insertion.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: [[Detailed Problems List#LC 215|LC 215]].
Provenance: Official; P; L-G row 326; L-A row 257. State: planned, not attempted.
### LC 1046
[Last Stone Weight](https://leetcode.com/problems/last-stone-weight/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-10-28 | 30 min attempt cap.
Purpose/contract: Repeatedly combine the two largest current values.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; L-G row 702; L-A row 514. State: planned, not attempted.
### LC 347
[Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-29 | 45 min attempt cap.
Purpose/contract: Combine frequency ranking with a sub-sort complexity target.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: [[Detailed Problems List#LC 217|LC 217]], [[Detailed Problems List#LC 49|LC 49]].
Provenance: Official; P; L-G row 42; L-A row 24. State: planned, not attempted.
### LC 148
[Sort List](https://leetcode.com/problems/sort-list/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-10-30 | 45 min attempt cap.
Purpose/contract: Sort a linked chain; discuss the follow-up memory restriction.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP|B-L Linked lists and OOP]]. Prerequisites: [[Detailed Problems List#LC 21|LC 21]], [[Detailed Problems List#LC 206|LC 206]].
Provenance: Official; G75; L-G row 186; L-A row 186. State: planned, not attempted.
### LC 23
[Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-10-30 | 75 min attempt cap.
Purpose/contract: Merge k sorted chains; connect to CodingHW4 task 3 without double counting.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: [[Detailed Problems List#LC 21|LC 21]], [[Detailed Problems List#LC 215|LC 215]].
Provenance: Official; G75; L-G row 100; L-A row 19. State: planned, not attempted.
### LC 295
[Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-10-31 | 75 min attempt cap.
Purpose/contract: Maintain exact medians after incremental inserts.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: [[Detailed Problems List#LC 703|LC 703]].
Provenance: Official; G75; L-G row 89; L-A row 50. State: planned, not attempted.
## Week 4 required practice
### LC 110
[Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-11-02 | 30 min attempt cap.
Purpose/contract: Detect local height imbalance throughout the tree.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 104|LC 104]].
Provenance: Official; P; G75; L-G row 322; L-A row 155. State: planned, not attempted.
### LC 543
[Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-11-02 | 30 min attempt cap.
Purpose/contract: Compute the longest tree path, measured in edges.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 104|LC 104]].
Provenance: Official; P; G75; L-G row 156; L-A row 132. State: planned, not attempted.
### LC 235
[Lowest Common Ancestor of a Binary Search Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-03 | 45 min attempt cap.
Purpose/contract: Use BST ordering for shared ancestry; verify current difficulty.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 98|LC 98]].
Provenance: Official; P; G75; L-G row 515; L-A row 200. State: planned, not attempted.
### LC 572
[Subtree of Another Tree](https://leetcode.com/problems/subtree-of-another-tree/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-11-03 | 30 min attempt cap.
Purpose/contract: Compare rooted subtree structure and values.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 104|LC 104]].
Provenance: Official; P; G75; L-G row 795; L-A row 505. State: planned, not attempted.
### LC 230
[Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-04 | 45 min attempt cap.
Purpose/contract: Select by inorder rank and consider repeated-query follow-ups.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 98|LC 98]].
Provenance: Official; P; G75; L-G row 197; L-A row 199. State: planned, not attempted.
### LC 1448
[Count Good Nodes in Binary Tree](https://leetcode.com/problems/count-good-nodes-in-binary-tree/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-05 | 45 min attempt cap.
Purpose/contract: Count nodes against the maximum along each root path.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 104|LC 104]].
Provenance: Official; P; L-G row 1573; L-A row 1124. State: planned, not attempted.
### LC 199
[Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-05 | 45 min attempt cap.
Purpose/contract: Return each level’s visible rightmost node; differs from a right-child vine.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 102|LC 102]].
Provenance: Official; P; G75; L-G row 317; L-A row 91. State: planned, not attempted.
### LC 105
[Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-06 | 45 min attempt cap.
Purpose/contract: Reconstruct shape from two traversal orders.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 104|LC 104]].
Provenance: Official; G75; L-G row 263; L-A row 197. State: planned, not attempted.
### LC 297
[Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-11-06 | 75 min attempt cap.
Purpose/contract: Preserve arbitrary tree structure through a serialization round trip.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 102|LC 102]], [[Detailed Problems List#LC 105|LC 105]].
Provenance: Official; G75; L-G row 245; L-A row 97. State: planned, not attempted.
### LC 124
[Binary Tree Maximum Path Sum](https://leetcode.com/problems/binary-tree-maximum-path-sum/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-11-07 | 75 min attempt cap.
Purpose/contract: Optimize a path that may turn inside the tree.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. Prerequisites: [[Detailed Problems List#LC 543|LC 543]].
Provenance: Official; G75; L-G row 111; L-A row 71. State: planned, not attempted.
## Week 5 required practice
### LC 36
[Valid Sudoku](https://leetcode.com/problems/valid-sudoku/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-09 | 45 min attempt cap.
Purpose/contract: Validate existing Sudoku entries; do not solve the puzzle.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 126; L-A row 83. State: planned, not attempted.
### LC 238
[Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-09 | 45 min attempt cap.
Purpose/contract: Produce per-index excluded products, including zero cases.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: [[Detailed Problems List#LC 217|LC 217]].
Provenance: Official; P; G75; L-G row 71; L-A row 35. State: planned, not attempted.
### LC 128
[Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-10 | 45 min attempt cap.
Purpose/contract: Find consecutive values without assuming sorted input.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: [[Detailed Problems List#LC 217|LC 217]].
Provenance: Official; P; G75; L-G row 12; L-A row 28. State: planned, not attempted.
### LC 3
[Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-10 | 45 min attempt cap.
Purpose/contract: Maintain a substring uniqueness contract.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. Prerequisites: [[Detailed Problems List#LC 125|LC 125]], [[Detailed Problems List#LC 217|LC 217]].
Provenance: Official; P; G75; L-G row 8; L-A row 6. State: planned, not attempted.
### LC 424
[Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-11 | 45 min attempt cap.
Purpose/contract: Respect a replacement budget across candidate substrings.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. Prerequisites: [[Detailed Problems List#LC 3|LC 3]].
Provenance: Official; P; G75; L-G row 69; L-A row 72. State: planned, not attempted.
### LC 438
[Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-11 | 45 min attempt cap.
Purpose/contract: Return every anagram start position, including overlaps.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. Prerequisites: [[Detailed Problems List#LC 242|LC 242]], [[Detailed Problems List#LC 3|LC 3]].
Provenance: Official; G75; L-G row 381; L-A row 188. State: planned, not attempted.
### LC 560
[Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-12 | 45 min attempt cap.
Purpose/contract: Count target-sum subarrays when values may be negative.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: [[Detailed Problems List#LC 238|LC 238]].
Provenance: Official; G75; L-G row 23; L-A row 22. State: planned, not attempted.
### LC 208
[Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-12 | 45 min attempt cap.
Purpose/contract: Separate full-word lookup from prefix lookup.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-X Tries and string patterns|B-X Tries and string patterns]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: [[Detailed Problems List#LC 49|LC 49]].
Provenance: Official; G75; L-G row 269; L-A row 295. State: planned, not attempted.
### LC 211
[Design Add and Search Words Data Structure](https://leetcode.com/problems/design-add-and-search-words-data-structure/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-13 | 45 min attempt cap.
Purpose/contract: Support wildcard searches in a mutable word dictionary.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-X Tries and string patterns|B-X Tries and string patterns]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: [[Detailed Problems List#LC 208|LC 208]].
Provenance: Official; G75; L-G row 651; L-A row 345. State: planned, not attempted.
### LC 76
[Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-11-13 | 75 min attempt cap.
Purpose/contract: Preserve multiplicities when covering the required characters.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. Prerequisites: [[Detailed Problems List#LC 3|LC 3]], [[Detailed Problems List#LC 438|LC 438]].
Provenance: Official; G75; L-G row 184; L-A row 56. State: planned, not attempted.
### LC 239
[Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-11-14 | 75 min attempt cap.
Purpose/contract: Report each window maximum under large-input constraints.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues|B-S Stacks and queues]]. Prerequisites: [[Detailed Problems List#LC 155|LC 155]].
Provenance: Official; G75; L-G row 64; L-A row 41. State: planned, not attempted.
## Week 6 required practice
### LC 70
[Climbing Stairs](https://leetcode.com/problems/climbing-stairs/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-11-16 | 30 min attempt cap.
Purpose/contract: Relate a counting recurrence to iterative and memoized forms.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; G75; L-G row 27; L-A row 37. State: planned, not attempted.
### LC 198
[House Robber](https://leetcode.com/problems/house-robber/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-16 | 45 min attempt cap.
Purpose/contract: Optimize nonadjacent selection rather than a contiguous subarray.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 70|LC 70]].
Provenance: Official; G75; L-G row 47; L-A row 36. State: planned, not attempted.
### LC 322
[Coin Change](https://leetcode.com/problems/coin-change/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-17 | 45 min attempt cap.
Purpose/contract: Minimize coin count and distinguish unreachable amounts.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 70|LC 70]].
Provenance: Official; G75; L-G row 109; L-A row 51. State: planned, not attempted.
### LC 139
[Word Break](https://leetcode.com/problems/word-break/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-17 | 45 min attempt cap.
Purpose/contract: Decide whether the complete string can be segmented.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 70|LC 70]], [[Detailed Problems List#LC 208|LC 208]].
Provenance: Official; G75; L-G row 151; L-A row 69. State: planned, not attempted.
### LC 416
[Partition Equal Subset Sum](https://leetcode.com/problems/partition-equal-subset-sum/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-18 | 45 min attempt cap.
Purpose/contract: Decide equal-sum partitioning; distinguish this from greedy allocation.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 198|LC 198]].
Provenance: Official; G75; L-G row 117; L-A row 133. State: planned, not attempted.
### LC 62
[Unique Paths](https://leetcode.com/problems/unique-paths/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-18 | 45 min attempt cap.
Purpose/contract: Count grid paths with a precise state and boundary conditions.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 70|LC 70]].
Provenance: Official; G75; L-G row 102; L-A row 59. State: planned, not attempted.
### LC 300
[Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-19 | 45 min attempt cap.
Purpose/contract: Enforce strictly increasing subsequences, including duplicate values.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 704|LC 704]], [[Detailed Problems List#LC 198|LC 198]].
Provenance: Official; G75; L-G row 77; L-A row 128. State: planned, not attempted.
### LC 39
[Combination Sum](https://leetcode.com/problems/combination-sum/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-19 | 45 min attempt cap.
Purpose/contract: Enumerate unlimited-use combinations without duplicate outputs.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 70|LC 70]].
Provenance: Official; G75; L-G row 113; L-A row 126. State: planned, not attempted.
### LC 78
[Subsets](https://leetcode.com/problems/subsets/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-20 | 45 min attempt cap.
Purpose/contract: Enumerate subsets and account for output size.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 39|LC 39]].
Provenance: Official; G75; L-G row 90; L-A row 45. State: planned, not attempted.
### LC 79
[Word Search](https://leetcode.com/problems/word-search/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-20 | 45 min attempt cap.
Purpose/contract: Search paths in a grid without reusing a cell in one word.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 733|LC 733]], [[Detailed Problems List#LC 78|LC 78]].
Provenance: Official; G75; L-G row 161; L-A row 43. State: planned, not attempted.
### LC 51
[N-Queens](https://leetcode.com/problems/n-queens/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-11-21 | 75 min attempt cap.
Purpose/contract: Enumerate legal queen placements with explicit state restoration.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 78|LC 78]], [[Detailed Problems List#LC 79|LC 79]].
Provenance: Official; G75; L-G row 44; L-A row 68. State: planned, not attempted.
## Week 7 required practice
### LC 121
[Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/) | Easy | P1 | Fit 5/5: core pattern | 2026-11-23 | 30 min attempt cap.
Purpose/contract: Constrain stock trading to one buy and one later sale.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-I Greedy and intervals|B-I Greedy and intervals]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 10; L-A row 7. State: planned, not attempted.
### LC 55
[Jump Game](https://leetcode.com/problems/jump-game/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-23 | 45 min attempt cap.
Purpose/contract: Decide reachability from jump ranges.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-I Greedy and intervals|B-I Greedy and intervals]]. Prerequisites: [[Detailed Problems List#LC 121|LC 121]].
Provenance: Official; G75; L-G row 49; L-A row 34. State: planned, not attempted.
### LC 134
[Gas Station](https://leetcode.com/problems/gas-station/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-24 | 45 min attempt cap.
Purpose/contract: Find a valid circular start or prove no start works.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-I Greedy and intervals|B-I Greedy and intervals]]. Prerequisites: [[Detailed Problems List#LC 55|LC 55]].
Provenance: Official; G75; L-G row 232; L-A row 115. State: planned, not attempted.
### LC 57
[Insert Interval](https://leetcode.com/problems/insert-interval/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-24 | 45 min attempt cap.
Purpose/contract: Insert into sorted, nonoverlapping intervals; official body is available despite a title-only capture.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-I Greedy and intervals|B-I Greedy and intervals]]. Prerequisites: [[Detailed Problems List#LC 704|LC 704]].
Provenance: Official; G75; L-G row 131; L-A row 311. State: planned, not attempted.
### LC 435
[Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-25 | 45 min attempt cap.
Purpose/contract: Minimize removed intervals; handle endpoint compatibility.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-I Greedy and intervals|B-I Greedy and intervals]]. Prerequisites: [[Detailed Problems List#LC 57|LC 57]].
Provenance: Official; G75; L-G row 360; L-A row 226. State: planned, not attempted.
### LC 621
[Task Scheduler](https://leetcode.com/problems/task-scheduler/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-26 | 45 min attempt cap.
Purpose/contract: Respect task cooldowns rather than just total job count.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-I Greedy and intervals|B-I Greedy and intervals]]. Prerequisites: [[Detailed Problems List#LC 347|LC 347]].
Provenance: Official; G75; L-G row 222; L-A row 52. State: planned, not attempted.
### LC 53
[Maximum Subarray](https://leetcode.com/problems/maximum-subarray/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-26 | 45 min attempt cap.
Purpose/contract: Optimize a contiguous sum; distinguish from nonadjacent selection.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; G75; L-G row 26; L-A row 23. State: planned, not attempted.
### LC 152
[Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-27 | 45 min attempt cap.
Purpose/contract: Handle sign changes in contiguous product optimization.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 53|LC 53]].
Provenance: Official; G75; L-G row 92; L-A row 116. State: planned, not attempted.
### LC 1235
[Maximum Profit in Job Scheduling](https://leetcode.com/problems/maximum-profit-in-job-scheduling/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-11-27 | 75 min attempt cap.
Purpose/contract: Optimize weighted compatible jobs; bridge intervals, search and DP.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-I Greedy and intervals|B-I Greedy and intervals]]. Prerequisites: [[Detailed Problems List#LC 704|LC 704]], [[Detailed Problems List#LC 435|LC 435]], [[Detailed Problems List#LC 198|LC 198]].
Provenance: Official; G75; L-G row 853; L-A row 140. State: planned, not attempted.
### LC 42
[Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-11-28 | 75 min attempt cap.
Purpose/contract: Model trapped volume across the entire array; differs from container area.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. Prerequisites: [[Detailed Problems List#LC 125|LC 125]], [[Detailed Problems List#LC 239|LC 239]].
Provenance: Official; G75; L-G row 5; L-A row 4. State: planned, not attempted.
## Week 8 required practice
### LC 200
[Number of Islands](https://leetcode.com/problems/number-of-islands/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-30 | 45 min attempt cap.
Purpose/contract: Count four-neighbor land components in a grid.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: the mapped data-structure basics.
Provenance: Official; P; G75; L-G row 25; L-A row 5. State: planned, not attempted.
### LC 695
[Max Area of Island](https://leetcode.com/problems/max-area-of-island/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-11-30 | 45 min attempt cap.
Purpose/contract: Measure the largest land component rather than component count.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 200|LC 200]].
Provenance: Official; P; L-G row 346; L-A row 266. State: planned, not attempted.
### LC 417
[Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-01 | 45 min attempt cap.
Purpose/contract: Relate two boundary-reachability conditions in a height grid.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 733|LC 733]].
Provenance: Official; P; G75; L-G row 200; L-A row 192. State: planned, not attempted.
### LC 130
[Surrounded Regions](https://leetcode.com/problems/surrounded-regions/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-02 | 45 min attempt cap.
Purpose/contract: Distinguish border-connected regions from enclosed regions.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 200|LC 200]].
Provenance: Official; P; L-G row 192; L-A row 180. State: planned, not attempted.
### LC 721
[Accounts Merge](https://leetcode.com/problems/accounts-merge/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-02 | 45 min attempt cap.
Purpose/contract: Merge identities through shared accounts; introduce disjoint sets.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-U Union-find and MST|B-U Union-find and MST]]. Prerequisites: [[Detailed Problems List#LC 217|LC 217]], [[Detailed Problems List#LC 133|LC 133]].
Provenance: Official; G75; L-G row 265; L-A row 238. State: planned, not attempted.
### LC 684
[Redundant Connection](https://leetcode.com/problems/redundant-connection/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-03 | 45 min attempt cap.
Purpose/contract: Locate the extra undirected edge while preserving the tree contract.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-U Union-find and MST|B-U Union-find and MST]]. Prerequisites: [[Detailed Problems List#LC 721|LC 721]].
Provenance: Official; L-G row 325; L-A row 508. State: planned, not attempted.
### LC 1584
[Min Cost to Connect All Points](https://leetcode.com/problems/min-cost-to-connect-all-points/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-04 | 45 min attempt cap.
Purpose/contract: Connect all points at minimum total Manhattan-edge cost.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-U Union-find and MST|B-U Union-find and MST]]. Prerequisites: [[Detailed Problems List#LC 684|LC 684]], [[Detailed Problems List#LC 215|LC 215]].
Provenance: Official; L-G row 814; L-A row 474. State: planned, not attempted.
### LC 310
[Minimum Height Trees](https://leetcode.com/problems/minimum-height-trees/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-04 | 45 min attempt cap.
Purpose/contract: Find roots minimizing tree height; distinguish from shortest paths.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 102|LC 102]], [[Detailed Problems List#LC 133|LC 133]].
Provenance: Official; G75; L-G row 419; L-A row 749. State: planned, not attempted.
### LC 127
[Word Ladder](https://leetcode.com/problems/word-ladder/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-12-05 | 75 min attempt cap.
Purpose/contract: Find a shortest sequence of legal word transitions.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 733|LC 733]], [[Detailed Problems List#LC 133|LC 133]].
Provenance: Official; G75; L-G row 185; L-A row 33. State: planned, not attempted.
## Week 9 required practice
### LC 743
[Network Delay Time](https://leetcode.com/problems/network-delay-time/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-07 | 45 min attempt cap.
Purpose/contract: Compute the time needed to reach every vertex from one source.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-P Weighted shortest paths|B-P Weighted shortest paths]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 215|LC 215]], [[Detailed Problems List#LC 133|LC 133]].
Provenance: Official; L-G row 252; L-A row 547. State: planned, not attempted.
### LC 787
[Cheapest Flights Within K Stops](https://leetcode.com/problems/cheapest-flights-within-k-stops/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-07 | 45 min attempt cap.
Purpose/contract: Respect the stop limit in addition to route cost.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-P Weighted shortest paths|B-P Weighted shortest paths]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 743|LC 743]], [[Detailed Problems List#LC 198|LC 198]].
Provenance: Official; G75; L-G row 253; L-A row 217. State: planned, not attempted.
### LC 994
[Rotting Oranges](https://leetcode.com/problems/rotting-oranges/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-08 | 45 min attempt cap.
Purpose/contract: Model simultaneous spread from multiple starting cells.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 733|LC 733]].
Provenance: Official; G75; L-G row 83; L-A row 20. State: planned, not attempted.
### LC 542
[01 Matrix](https://leetcode.com/problems/01-matrix/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-09 | 45 min attempt cap.
Purpose/contract: Measure distance to the nearest zero across the grid.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 994|LC 994]].
Provenance: Official; G75; L-G row 276; L-A row 264. State: planned, not attempted.
### LC 1631
[Path With Minimum Effort](https://leetcode.com/problems/path-with-minimum-effort/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-10 | 45 min attempt cap.
Purpose/contract: Optimize maximum edge effort, not a sum of edge costs.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-P Weighted shortest paths|B-P Weighted shortest paths]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 743|LC 743]].
Provenance: Official; L-G row 260; L-A row 637. State: planned, not attempted.
### LC 329
[Longest Increasing Path in a Matrix](https://leetcode.com/problems/longest-increasing-path-in-a-matrix/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-12-11 | 75 min attempt cap.
Purpose/contract: Combine strict increases and cached path lengths.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-P Weighted shortest paths|B-P Weighted shortest paths]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 200|LC 200]], [[Detailed Problems List#LC 198|LC 198]].
Provenance: Official; G75; L-G row 255; L-A row 602. State: planned, not attempted.
### LC 815
[Bus Routes](https://leetcode.com/problems/bus-routes/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-12-12 | 75 min attempt cap.
Purpose/contract: Minimize buses boarded rather than stops traversed.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-P Weighted shortest paths|B-P Weighted shortest paths]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. Prerequisites: [[Detailed Problems List#LC 733|LC 733]], [[Detailed Problems List#LC 133|LC 133]].
Provenance: Official; G75; L-G row 320; L-A row 329. State: planned, not attempted.
## Week 10 required practice
### LC 146
[LRU Cache](https://leetcode.com/problems/lru-cache/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-14 | 45 min attempt cap.
Purpose/contract: Maintain recency, eviction and average constant-time operations.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: [[Detailed Problems List#LC 206|LC 206]], [[Detailed Problems List#LC 49|LC 49]].
Provenance: Official; P; G75; L-G row 41; L-A row 3. State: planned, not attempted.
### LC 380
[Insert Delete GetRandom O(1)](https://leetcode.com/problems/insert-delete-getrandom-o1/description/) | Medium | P1 | Fit 5/5: core pattern | 2026-12-15 | 45 min attempt cap.
Purpose/contract: Support deletion and unbiased sampling with average constant-time operations.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: [[Detailed Problems List#LC 217|LC 217]].
Provenance: Official; G75; L-G row 119; L-A row 64. State: planned, not attempted.
### LC 224
[Basic Calculator](https://leetcode.com/problems/basic-calculator/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-12-17 | 75 min attempt cap.
Purpose/contract: Parse valid arithmetic with parentheses and unary minus; eval is forbidden.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues|B-S Stacks and queues]]. Prerequisites: [[Detailed Problems List#LC 20|LC 20]].
Provenance: Official; G75; L-G row 95; L-A row 134. State: planned, not attempted.
### LC 84
[Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/description/) | Hard | P1 | Fit 4/5: integrated transfer | 2026-12-18 | 75 min attempt cap.
Purpose/contract: Optimize histogram rectangle area rather than two-boundary container area.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues|B-S Stacks and queues]]. Prerequisites: [[Detailed Problems List#LC 155|LC 155]], [[Detailed Problems List#LC 239|LC 239]].
Provenance: Official; G75; L-G row 52; L-A row 65. State: planned, not attempted.
## Captured counterparts - reference only
### LC 1
[Two Sum](https://leetcode.com/problems/two-sum/description/) | Easy | R | Week 1.
Purpose: Captured two-sum equivalent; compare contracts without assigning a new solve. Capture: T2.1.V1.P5. Session solving is reported by the user; per-version completion is not independently verified.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. No new-solve date or fresh-problem count is assigned.
### LC 15
[3Sum](https://leetcode.com/problems/3sum/description/) | Medium | R | Week 1.
Purpose: Captured three-sum equivalent; review distinct-index and duplicate-output constraints. Capture: T1.2.V2.P5. Session solving is reported by the user; per-version completion is not independently verified.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. No new-solve date or fresh-problem count is assigned.
### LC 11
[Container With Most Water](https://leetcode.com/problems/container-with-most-water/description/) | Medium | R | Week 1.
Purpose: Captured container-area equivalent in two sessions; one reference entry. Capture: T1.2.V1.P5; T3.2.V1.P3. Session solving is reported by the user; per-version completion is not independently verified.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. No new-solve date or fresh-problem count is assigned.
### LC 100
[Same Tree](https://leetcode.com/problems/same-tree/description/) | Easy | R | Week 4.
Purpose: Captured Twinning Trees equivalent; retain the existing session record. Capture: T4.2.V1.P8. Session solving is reported by the user; per-version completion is not independently verified.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs|B-T Trees and BSTs]]. No new-solve date or fresh-problem count is assigned.
### LC 56
[Merge Intervals](https://leetcode.com/problems/merge-intervals/description/) | Medium | R | Week 7.
Purpose: Captured interval-merging equivalent; reference the existing solution reasoning. Capture: T1.2.V1.P6. Session solving is reported by the user; per-version completion is not independently verified.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-I Greedy and intervals|B-I Greedy and intervals]]. No new-solve date or fresh-problem count is assigned.
### LC 739
[Daily Temperatures](https://leetcode.com/problems/daily-temperatures/description/) | Medium | R | Week 2.
Purpose: Exact waiting-distance equivalent of T3.2.V1.P6; review only. Capture: T3.2.V1.P6. Session solving is reported by the user; per-version completion is not independently verified.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues|B-S Stacks and queues]]. No new-solve date or fresh-problem count is assigned.
### LC 207
[Course Schedule](https://leetcode.com/problems/course-schedule/description/) | Medium | R | Week 2.
Purpose: Pilot Training counterpart; Unit 5 completion is unconfirmed, so hold as a reference. Capture: T5.2.V1.P4. Unit 5 completion remains unconfirmed.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. No new-solve date or fresh-problem count is assigned.
### LC 797
[All Paths From Source to Target](https://leetcode.com/problems/all-paths-from-source-to-target/description/) | Medium | R | Week 2.
Purpose: DAG path-enumeration counterpart; inspect captured U5 content and output size. Capture: T5.2.V1.P6. Unit 5 completion remains unconfirmed.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. No new-solve date or fresh-problem count is assigned.
### LC 547
[Number of Provinces](https://leetcode.com/problems/number-of-provinces/description/) | Medium | R | Week 2.
Purpose: Airline-region counterpart; inspect matrix symmetry and component definitions. Capture: T5.1.V1.P8. Unit 5 completion remains unconfirmed.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal|B-G Graph traversal]]. No new-solve date or fresh-problem count is assigned.
## Optional extensions
### LC 4
[Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/description/) | Hard | P2 | Fit 3/5 | W3, 2026-10-31 | 75 min cap.
Purpose: Additional partition/search challenge after rotated-array contracts.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: [[Detailed Problems List#LC 704|LC 704]], [[Detailed Problems List#LC 33|LC 33]].
Provenance: Official; G75; L-G row 4; L-A row 13. Attempt only within the confirmed weekly budget.
### LC 25
[Reverse Nodes in k-Group](https://leetcode.com/problems/reverse-nodes-in-k-group/description/) | Hard | P2 | Fit 3/5 | W10, 2026-12-19 | 75 min cap.
Purpose: Additional grouped node mutation after ordinary reversal.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP|B-L Linked lists and OOP]]. Prerequisites: [[Detailed Problems List#LC 206|LC 206]], [[Detailed Problems List#LC 143|LC 143]].
Provenance: Official; G75; L-G row 125; L-A row 99. Attempt only within the confirmed weekly budget.
### LC 212
[Word Search II](https://leetcode.com/problems/word-search-ii/description/) | Hard | P2 | Fit 3/5 | W6, 2026-11-21 | 75 min cap.
Purpose: Combine trie lookup with many grid word searches.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-X Tries and string patterns|B-X Tries and string patterns]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing|B-H Hashing]]. Prerequisites: [[Detailed Problems List#LC 208|LC 208]], [[Detailed Problems List#LC 79|LC 79]].
Provenance: Official; G75; L-G row 307; L-A row 120. Attempt only within the confirmed weekly budget.
### LC 37
[Sudoku Solver](https://leetcode.com/problems/sudoku-solver/description/) | Hard | P2 | Fit 3/5 | W6, 2026-11-21 | 75 min cap.
Purpose: Solve an entire Sudoku after validation and backtracking prerequisites.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 36|LC 36]], [[Detailed Problems List#LC 79|LC 79]].
Provenance: Official; G75; L-G row 122; L-A row 164. Attempt only within the confirmed weekly budget.
### LC 32
[Longest Valid Parentheses](https://leetcode.com/problems/longest-valid-parentheses/description/) | Hard | P2 | Fit 3/5 | W10, 2026-12-19 | 75 min cap.
Purpose: Optimize the length of a valid bracket substring.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues|B-S Stacks and queues]]. Prerequisites: [[Detailed Problems List#LC 20|LC 20]].
Provenance: Official; G75; L-G row 203; L-A row 153. Attempt only within the confirmed weekly budget.
### LC 312
[Burst Balloons](https://leetcode.com/problems/burst-balloons/description/) | Hard | P2 | Fit 3/5 | W10, 2026-12-19 | 75 min cap.
Purpose: Add interval DP after ordinary state/recurrence practice.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 198|LC 198]].
Provenance: Official; L-G row 194; L-A row 334. Attempt only within the confirmed weekly budget.
### LC 1143
[Longest Common Subsequence](https://leetcode.com/problems/longest-common-subsequence/description/) | Medium | P2 | Fit 3/5 | W6, 2026-11-21 | 45 min cap.
Purpose: Transfer LCS table reasoning from CodingHW6 to strings.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 198|LC 198]].
Provenance: Official; L-G row 207; L-A row 316. Attempt only within the confirmed weekly budget.
### LC 46
[Permutations](https://leetcode.com/problems/permutations/description/) | Medium | P2 | Fit 3/5 | W6, 2026-11-21 | 45 min cap.
Purpose: Enumerate permutations and measure factorial output.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking|B-D DP and backtracking]]. Prerequisites: [[Detailed Problems List#LC 78|LC 78]].
Provenance: Official; G75; L-G row 99; L-A row 96. Attempt only within the confirmed weekly budget.
### LC 74
[Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/description/) | Medium | P2 | Fit 3/5 | W3, 2026-10-31 | 45 min cap.
Purpose: Exploit the matrix’s global row-order contract for logarithmic search.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps|B-Q Sorting search and heaps]]. Prerequisites: [[Detailed Problems List#LC 704|LC 704]].
Provenance: Official; G75; L-G row 178; L-A row 86. Attempt only within the confirmed weekly budget.
### LC 41
[First Missing Positive](https://leetcode.com/problems/first-missing-positive/description/) | Hard | P2 | Fit 3/5 | W5, 2026-11-14 | 75 min cap.
Purpose: Meet both linear-time and constant-extra-space constraints.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. Prerequisites: [[Detailed Problems List#LC 217|LC 217]].
Provenance: Official; G75; L-G row 103; L-A row 58. Attempt only within the confirmed weekly budget.
### LC 167
[Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/) | Medium | P2 | Fit 3/5 | W2, 2026-10-24 | 45 min cap.
Purpose: Use the official sorted two-sum contract; its captured counterpart lacks a body.
Study: [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings|B-A Arrays and strings]]. Prerequisites: [[Detailed Problems List#LC 704|LC 704]], [[Detailed Problems List#LC 125|LC 125]].
Provenance: Official; P; L-G row 105; L-A row 104. Attempt only within the confirmed weekly budget.
## HackerRank OA practice
| ID / checked statement | Difficulty | Week / date / cap | Purpose and source bundle |
|---|---|---|---|
| [HR1 Arrays: Left Rotation](https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem) | Easy | W2 / 2026-10-20 / 30 min | Preserve a circular left-rotation contract and platform I/O. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [HR2 Hash Tables: Ransom Note](https://www.hackerrank.com/challenges/ctci-ransom-note/problem) | Easy | W2 / 2026-10-22 / 30 min | Use case-sensitive whole-word multiplicities. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [HR3 Minimum Swaps 2](https://www.hackerrank.com/challenges/minimum-swaps-2/problem) | Medium | W3 / 2026-10-28 / 45 min | Find the minimum arbitrary swaps for a permutation of 1..n. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps\|B-Q Sorting search and heaps]] |
| [HR4 Frequency Queries](https://www.hackerrank.com/challenges/frequency-queries/problem) | Medium | W5 / 2026-11-13 / 45 min | Process insert/delete and exact-frequency queries online. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [HR5 Max Array Sum](https://www.hackerrank.com/challenges/max-array-sum/problem) | Medium | W6 / 2026-11-19 / 45 min | Optimize nonadjacent sums with negative values and the empty choice. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking\|B-D DP and backtracking]] |
| [HR6 Greedy Florist](https://www.hackerrank.com/challenges/greedy-florist/problem) | Medium | W7 / 2026-11-26 / 45 min | Minimize group purchasing cost under increasing customer multipliers. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-I Greedy and intervals\|B-I Greedy and intervals]] |
| [HR7 DFS: Connected Cell in a Grid](https://www.hackerrank.com/challenges/ctci-connected-cell-in-a-grid/problem) | Hard | W8 / 2026-12-03 / 60 min | Use eight-neighbor connectivity, unlike the four-neighbor LeetCode island tasks. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [HR8 BFS: Shortest Reach in a Graph](https://www.hackerrank.com/challenges/ctci-bfs-shortest-reach/problem) | Hard | W9 / 2026-12-08 / 60 min | Return ordered distances for an undirected equal-length-edge graph. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
These are public practice challenges, not the course’s private graded HackerRank assessments. Platform labels are retained; both graph challenges are labeled Hard by HackerRank.
## Captured session catalog
T identifiers mean captured unit.session.version.problem. Every visible heading is listed, including incomplete alternate versions. Grade R means review the existing capture; it does not assign a new solution. Unit 5 solving status is unconfirmed.

| ID / raw source | Captured title | Readable contract / purpose | Grade / study |
|---|---|---|---|
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.1.V1.P1]] | Hunny Hunt | Linear search and first-index return | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.1.V1.P2]] | Bouncy, Flouncy, Trouncy, Pouncy | Operation simulation | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.1.V1.P3]] | T-I-Double Guh-Er II | Case-insensitive substring filtering | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.1.V1.P4]] | Non-decreasing Array | At-most-one array modification | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.1.V1.P5]] | Missing Clues | Missing intervals inside a closed range | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.1.V1.P6]] | Vegetable Harvest | Matrix counting | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.1.V1.P7]] | Eeyore's House | Divisibility across two arrays | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.1.V1.P8]] | Local Maximums | Local 3x3 matrix maxima | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V1.P1]] | Transpose Matrix | Rectangular matrix transpose | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V1.P2]] | Two-Pointer Reverse List | In-place two-pointer reversal | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V1.P3]] | Remove Duplicates | In-place sorted-array deduplication | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V1.P4]] | Sort Array by Parity | Parity partition | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V1.P5]] | Container with Most Honey | Two-boundary container area | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V1.P6]] | Merge Intervals | Overlapping interval union | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V2.P1]] | Matrix Addition | Matrix addition | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V2.P2]] | Two-Pointer Palindrome | Two-pointer palindrome | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V2.P3]] | Squash Spaces | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V2.P4]] | Two-Pointer Two Sum | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V2.P5]] | Three Sum | Distinct zero-sum triplets | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 1 Problems Transcript\|T1.2.V2.P6]] | Insert Interval | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V1.P1]] | Counting Treasure | Dictionary-value aggregation | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V1.P2]] | Pirate Message Check | Alphabet coverage with set membership | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V1.P3]] | Find All Duplicate Treasure Chests in an Array | Duplicate reporting with bounded values | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V1.P4]] | Booby Trap | Exactly-one removal to equalize frequencies | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V1.P5]] | Overflowing With Gold | Distinct-index target sum | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V1.P6]] | Organize the Pirate Crew | Grouping by required sizes | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V1.P7]] | Minimum Number of Steps to Match Treasure Maps | Minimum replacements for anagram equality | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V1.P8]] | Counting Pirates' Action Minutes | Unique minutes per ID and frequency histogram | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V2.P1]] | The Library of Alexandria | Differences between dictionary inventories | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V2.P2]] | Grecian Artifacts | Intersection of artifact collections | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V2.P3]] | Souvenir Declutter | Frequency-threshold filtering | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V2.P4]] | Time Portals | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V2.P5]] | Detect Temporal Anomaly | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V2.P6]] | Time Portal Race Rankings | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V2.P7]] | Lingual Frequencies | Case/punctuation normalization and excluded-word frequency | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.1.V2.P8]] | Time Portal Usage | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.2.V1.P1]] | Balanced Art Collection | Longest subsequence with value range exactly one | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.2.V1.P2]] | Verifying Authenticity | Permutation multiplicities and range | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.2.V1.P3]] | Gallery Wall | Minimum-row distinct-item arrangement | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.2.V1.P4]] | Gallery Subdomain Traffic | Subdomain parsing and aggregation | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.2.V1.P5]] | Beautiful Collection | Frequency difference summed over all substrings | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 2 Problems Transcript\|T2.2.V1.P6]] | Counting Divisible Collections in the Gallery | Contiguous-sum divisibility and remainder counting | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V1.P1]] | Counting the Layers of a Sandwich | Nested-list recursion | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-R Recursion\|B-R Recursion]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V1.P2]] | Reversing Deli Orders | Recursive word-order reversal | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-R Recursion\|B-R Recursion]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V1.P3]] | Sharing the Coffee | Partition whole batches among equal-volume groups | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-R Recursion\|B-R Recursion]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V1.P4]] | Super Sandwich | Recursive linked-list interleaving | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V1.P5]] | Super Sandwich II | Compare supplied iterative and recursive interleaving | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V1.P6]] | Ternary Expression | Recursive nested-ternary parsing | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-R Recursion\|B-R Recursion]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V2.P1]] | Mapping Atlantis' Hidden Chambers | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V2.P2]] | Finding the Longest Sequence of Trident Gems | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V2.P3]] | Last Building Standing | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V2.P4]] | Merging Missions | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V2.P5]] | Merging Missions II | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.1.V2.P6]] | Decoding Ancient Atlantean Scrolls | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.2.V1.P1]] | Blueprint Approval Process | Queue simulation with lower-value-first approval | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues\|B-S Stacks and queues]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.2.V1.P2]] | Build the Tallest Skyscraper | Ordered local decreasing-stack run segmentation | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues\|B-S Stacks and queues]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.2.V1.P3]] | Dream Corridor Design | Two-boundary container area | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.2.V1.P4]] | Dream Building Layout | Minimum arbitrary swaps of balanced bracket counts | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues\|B-S Stacks and queues]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.2.V1.P5]] | Designing a Balanced Room | Minimum parenthesis removal with letters preserved | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues\|B-S Stacks and queues]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.2.V1.P6]] | Time to Complete Each Dream Design | Waiting distance to a larger future value | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues\|B-S Stacks and queues]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 3 Problems Transcript\|T3.2.V1.P7]] | Next Greater Element | Circular next-greater value | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues\|B-S Stacks and queues]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.1.V1.P1]] | Villager Class | Object construction and independent instance state | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.1.V1.P2]] | Add Furniture | Validated mutation of instance furniture | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.1.V1.P3]] | Group by Personality | Filter objects by personality | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.1.V1.P4]] | Telephone | Link an object-based telephone chain | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.1.V1.P5]] | Linked Up | Construct and link nodes | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.1.V1.P6]] | Got One! | Linked-node retrieval/traversal | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.1.V1.P7]] | Fishing Probability | Count matching linked-list fish / probability | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.1.V1.P8]] | Restocking the Lake | Append stock to a linked list | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.2.V1.P1]] | Ivy Cutting | Iterative right-child vine | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs\|B-T Trees and BSTs]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.2.V1.P2]] | Ivy Cutting II | Recursive right-child vine | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs\|B-T Trees and BSTs]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.2.V1.P3]] | Pruning Plans | Postorder traversal | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs\|B-T Trees and BSTs]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.2.V1.P4]] | Sum Inventory | Aggregate inventory over a tree | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs\|B-T Trees and BSTs]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.2.V1.P5]] | Calculating Yield II | Evaluate arithmetic expression tree | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs\|B-T Trees and BSTs]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.2.V1.P6]] | Plant Classifications | Collect leaves | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs\|B-T Trees and BSTs]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.2.V1.P7]] | Count Old Growth Trees | Count values beyond a threshold | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs\|B-T Trees and BSTs]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 4 Problems Transcript\|T4.2.V1.P8]] | Twinning Trees | Structure-and-value tree equivalence | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs\|B-T Trees and BSTs]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V1.P1]] | There and Back | Check reverse-edge presence | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V1.P2]] | Find Center of Airport | Center of an undirected star | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V1.P3]] | Finding All Reachable Destinations | Reachability ordered by layovers | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V1.P4]] | Finding All Reachable Destinations II | DFS visitation-order reachability | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V1.P5]] | Find Itinerary | Recover a unique acyclic itinerary | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V1.P6]] | Finding Itinerary II | Compare alternate itinerary approach | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V1.P7]] | Number of Flights | Minimum hop count in an adjacency matrix | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V1.P8]] | Number of Airline Regions | Count connected airline regions | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V2.P1]] | The Feeling is Mutual | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V2.P2]] | Network Lookup | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V2.P3]] | Secret Celebrity | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V2.P4]] | Casting Call Search | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V2.P5]] | Casting Call Search II | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V2.P6]] | Copying Seating Arrangements | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V2.P7]] | Gossip Chain | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.1.V2.P8]] | Network Strength | Title only; body and constraints missing | Hold; Fit 0/5; restore from portal |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.2.V1.P1]] | Get Flight Cost | Accumulate any reachable weighted path cost | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.2.V1.P2]] | Expanding Flight Offerings | Connect undirected components | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.2.V1.P3]] | Get Flight Itinerary | Reconstruct any source-to-destination path | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.2.V1.P4]] | Pilot Training | Prerequisite cycle feasibility | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.2.V1.P5]] | Reorient Flight Routes | Orient a tree’s edges toward a root | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
| [[20_Progress/Degree/_Courses/Technical Interview/_Transcripts/Unit - 5 Problems Transcript\|T5.2.V1.P6]] | Find All Flight Routes | Enumerate all DAG source-to-target paths | R; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]] |
## Capture integrity issues
- 99 headings include 78 substantive bodies and 21 title-only entries; this is not a unique-problem or solved-question count.
- U2 S1 Counting Treasure uses inconsistent `total_treasure` / `total_treasures` names. U3 S1 Super Sandwich has a missing colon in the captured stub. U4 S2 Count Old Growth Trees has a missing comma in an example constructor. Preserve these raw captures and record corrections in study notes when used.
- U3 S1 Sharing the Coffee partitions whole batches; divisibility of the total alone does not establish the requested grouping. U5 Get Flight Cost accepts any path’s cost; do not replace its contract with Dijkstra.
- The Unit 5 Pilot Training prose uses numbered courses while examples use string names. Preserve the discrepancy until checked against the portal.
## CSCI coding tasks - every current task
The stable task identifier is notebook task number, not an assumed TIP103 homework/assessment number. R prompts are studied and explained; P1 drills are attempted manually; P2 implementations are optional. Read the existing code without treating it as evidence of a new independent solve.

| ID | Exact notebook / task | Textbook label in source | Week / treatment |
|---|---|---|---|
| C2.1 | [Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb>); task 1: Implement a divide and conquer matrix multiply which works for non-power of 2 sizes of square matrices. | 4.1-1 | W3; P2 - optional implementation / required prompt review |
| C2.2 | [Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb>); task 2: Implement a divide and conquer style matrix addition function. | 4.1-4 | W3; P2 - optional implementation / required prompt review |
| C2.3 | [Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb>); task 3: Implement Strassen's Algorithm according to the textbook. | See stated section / notebook task | W3; P2 - optional implementation / required prompt review |
| C2.4 | [Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb>); task 4: Implement a "better" divide and conquer matrix multiply than 1. | See stated section / notebook task | W3; P2 - optional implementation / required prompt review |
| C2.5 | [Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb>); task 5: Implement a coarsened version of divide and conquer matrix multiply. | See stated section / notebook task | W3; P2 - optional implementation / required prompt review |
| C3.1 | [Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb>); task 1: Implement two stacks using only one array A[1 : n] in such a way that neither stack overflows unless the total number of elements in both stacks together is n. | 10.1-3 | W2; P1 - required drill; 2026-10-23; 45 min |
| C3.2 | [Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb>); task 2: Implement an array-based deque (double-ended queue, pronounced like “deck”) which allows insertion and deletion at both ends. | 10.1-6 | W2; P1 - required drill; 2026-10-23; 45 min |
| C3.3 | [Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb>); task 3: Implement a stack using a singly linked list. | 10.2-2 | W2; P2 - optional implementation / required prompt review |
| C3.4 | [Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb>); task 4: Implement a queue using a singly linked list. | 10.2-3 | W2; P2 - optional implementation / required prompt review |
| C3.5 | [Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb>); task 5: Imlement a Θ(n)-time nonrecursive procedure that reverses a singly linked list of n elements. | 10.2-5 | W2; R - integrated with LC 206 |
| C4.1 | [Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb>); task 1: Implement a min-priority queue with a min-heap. | 6.5-3 | W3; P1 - required drill; 2026-10-30; 45 min |
| C4.2 | [Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb>); task 2: Modify the max heap implementation to have the following two additional methods. | 6.5-4, 6.5-10 | W3; P2 - optional implementation / required prompt review |
| C4.3 | [Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb>); task 3: Implement a O(n log k)-time algorithm to merge k sorted lists into one sorted list, where n is the total number of elements in all the input lists. | 6.5-11 | W3; R - integrated with LC 23 |
| C4.4 | [Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb>); task 4: Implement the TREE-PREDECESSOR(x) procedure. | 12.2.3 | W4; P2 - optional implementation / required prompt review |
| C4.5 | [Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb>); task 5: Implement the TREE-SUCCESSOR(x) procedure. | 12.2.7 | W4; P2 - optional implementation / required prompt review |
| C5.1 | [Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb>); task 1: Implmement a dynamic set using bit vectors. | 11.1-2 | W5; P2 - optional implementation / required prompt review |
| C5.2 | [Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb>); task 2: Implement a method to uniformly select a key at random from a hash map which uses chaining. | 11.2-6 | W5; P2 - optional implementation / required prompt review |
| C5.3 | [Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb>); task 3: Modify the chain hash map implementation to use a multiplicative hash function. | See stated section / notebook task | W5; P2 - optional implementation / required prompt review |
| C5.4 | [Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb>); task 4: Modify the probe hash map implementation to use Double Hashing. | See stated section / notebook task | W5; P1 - required drill; 2026-11-13; 45 min |
| C5.5 | [Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb>); task 5: Modify the Probe Hash Map implementation to not use the ```"__DELETED__"``` flag. | See stated section / notebook task | W5; P2 - optional implementation / required prompt review |
| C6.1 | [Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb>); task 1: Modify the memoized cut-rod procedure to include a fixed cost of c per cut. | 14.1-3 | W6; P2 - optional implementation / required prompt review |
| C6.2 | [Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb>); task 2: Modify Memoized-Cut-Rod to return not only the value but the actual solution. | 14.1-5 | W6; P2 - optional implementation / required prompt review |
| C6.3 | [Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb>); task 3: Re-construct an LCS from the completed table c and the original sequences X and Y. | 14.4-2 | W6; P1 - required drill; 2026-11-20; 45 min |
| C6.4 | [Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb>); task 4: Give a memo-ized version of LCS-LENGTH that runs in O(mn) time. | See stated section / notebook task | W6; P2 - optional implementation / required prompt review |
| C6.5 | [Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb>); task 5: Implement an mathcal{O}(n^2) time algorithm to find the longest monotonically increasing subsequences of a sequence of n numbers. | 14.4-5 | W6; R - integrated with LC 300 |
| C7.1 | [Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb>); task 1: Re-construct the solution set for the Activity-Selection Problem Dynamic Program. | 15.1-1 | W7; P2 - optional implementation / required prompt review |
| C7.2 | [Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb>); task 2: Implement the Reverse Greedy Approach for the Activity-Selection Problem. | 15.1-2 | W7; P1 - required drill; 2026-11-27; 45 min |
| C7.3 | [Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb>); task 3: Implement a Greedy Algorithm to solve the Room Scheduling Problem. | 15.1-4 | W7; P2 - optional implementation / required prompt review |
| C7.4 | [Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb>); task 4: Implement a Dynamic Program to solve the Max Value for the modified Activity-Selection Problem | 15.1-5 | W7; R - integrated with LC 1235 |
| C7.5 | [Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb>); task 5: Implement a Greedy Algorithm to solve the simplified {0,1}-Knapsack Problem. | 15.2-3 | W7; P2 - optional implementation / required prompt review |
| C8.1 | [Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb>); task 1: Implement two methods which can compute the out-degree of any vertex of a graph represented by an adjacency-list and a second method which computes the in-degrees. | 20.1-1 | W8; P2 - optional implementation / required prompt review |
| C8.2 | [Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb>); task 2: Implement a method for computing the reverse graph (transpose) G^T from G, for a graph G given in the adjacency-list representation. | 20.1-3 | W8; P2 - optional implementation / required prompt review |
| C8.3 | [Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb>); task 3: Implement an O(V + E)-time algorithm to compute the adjacency-list representation of the “equivalent” undirected graph G′ = (V, E′), where E′ consists of the edges in E with all multiple edges between two vertices replaced by a single edge and with all self-loops removed. | 20.1-4 | W8; P2 - optional implementation / required prompt review |
| C8.4 | [Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb>); task 4: Modify the implementation for DFS to use a stack to eliminate the recursion. | 20.3-6 | W2; P1 - required drill; 2026-10-23; 45 min |
| C8.5 | [Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb>); task 5: Modify the implementation for depth-first search so that it prints out every edge in the directed graph G, together with its type. | 20.3-9 | W8; P2 - optional implementation / required prompt review |
| C9.1 | [Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb>); task 1: Another way to topologically sort a directed acyclic graph G = (V, E) is to repeatedly find a vertex of in-degree 0, output it, and remove it and all of its outgoing edges from the graph. Explain how to implement this idea so that it runs in time O(V + E). | 20.4-5 | W8; R - integrated with LC 210 |
| C9.2 | [Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb>); task 2: Give an O(V + E)-time algorithm to compute the component graph of a directed graph G = (V, E). Make sure that there is at most one edge between two vertices in the component graph your algorithm produces. | 20.5-5 | W8; P2 - optional implementation / required prompt review |
| C9.3 | [Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb>); task 3: Re-implement Joy's version of Kruskal's algorithm according to the notes in CLRS. | See stated section / notebook task | W8; P1 - required drill; 2026-12-04; 45 min |
| C9.4 | [Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb>); task 4: Implement the DAG-SHORTEST-PATHS(G,w,s) pseudocode from section 22.2. | 22.2-1 | W9; P1 - required drill; 2026-12-11; 45 min |
| C9.5 | [Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb>); task 5: Implement Johnson's Algorithm for the All-Pairs Shortest Paths Problem for Sparse Graphs. | 23.3.1 | W9; P2 - optional implementation / required prompt review |
## CSCI paper tasks - every current question
The original PDF page equals the question number for these five-page sheets. Graph-diagram questions must be viewed in the original PDF; text extraction does not establish their edge sets.

| ID | Exact PDF / question and page | Purpose | Week / treatment |
|---|---|---|---|
| P1.1 | [Homework/Paper/Paper HW - 1 (Ch - 2).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 1 (Ch - 2).pdf>); Q1 / p.1 | Insertion-sort trace | W3; R - read and explain; full written proof optional |
| P1.2 | [Homework/Paper/Paper HW - 1 (Ch - 2).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 1 (Ch - 2).pdf>); Q2 / p.2 | SUM-ARRAY loop invariant and proof | W1; P1 - required paper drill; 2026-10-16; 30 min |
| P1.3 | [Homework/Paper/Paper HW - 1 (Ch - 2).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 1 (Ch - 2).pdf>); Q3 / p.3 | Merge-sort trace | W3; R - read and explain; full written proof optional |
| P1.4 | [Homework/Paper/Paper HW - 1 (Ch - 2).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 1 (Ch - 2).pdf>); Q4 / p.4 | Insertion/merge hybrid cost | W3; R - read and explain; full written proof optional |
| P1.5 | [Homework/Paper/Paper HW - 1 (Ch - 2).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 1 (Ch - 2).pdf>); Q5 / p.5 | MERGE loop-invariant proof | W3; R - read and explain; full written proof optional |
| P2.1 | [Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf>); Q1 / p.1 | Selection-sort running-time analysis | W3; R - read and explain; full written proof optional |
| P2.2 | [Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf>); Q2 / p.2 | Theta equivalence with O and Omega | W3; R - read and explain; full written proof optional |
| P2.3 | [Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf>); Q3 / p.3 | Rectangular recursive matrix product costs | W3; R - read and explain; full written proof optional |
| P2.4 | [Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf>); Q4 / p.4 | Strassen calculation | W3; R - read and explain; full written proof optional |
| P2.5 | [Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf>); Q5 / p.5 | Recursion-tree bound and substitution proof | W3; R - read and explain; full written proof optional |
| P3.1 | [Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf>); Q1 / p.1 | PARTITION trace | W3; R - read and explain; full written proof optional |
| P3.2 | [Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf>); Q2 / p.2 | All-equal PARTITION behavior and modification | W3; R - read and explain; full written proof optional |
| P3.3 | [Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf>); Q3 / p.3 | Randomized quicksort lower bound | W3; R - read and explain; full written proof optional |
| P3.4 | [Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf>); Q4 / p.4 | Array stack and queue operation traces | W2; P1 - required paper drill; 2026-10-23; 30 min |
| P3.5 | [Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf>); Q5 / p.5 | Singly linked insertion/deletion cost | W2; R - read and explain; full written proof optional |
| P4.1 | [Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf>); Q1 / p.1 | Heap size/height and maximum-root property | W3; R - read and explain; full written proof optional |
| P4.2 | [Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf>); Q2 / p.2 | Heap minima and leaf-index positions | W3; R - read and explain; full written proof optional |
| P4.3 | [Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf>); Q3 / p.3 | Extract-max and insert heap traces | W3; P1 - required paper drill; 2026-10-30; 30 min |
| P4.4 | [Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf>); Q4 / p.4 | BST heights and legal search sequences | W4; P1 - required paper drill; 2026-11-06; 30 min |
| P4.5 | [Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf>); Q5 / p.5 | Successor/predecessor structural properties | W4; R - read and explain; full written proof optional |
| P5.1 | [Homework/Paper/Paper HW - 5 (Ch - 11).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 5 (Ch - 11).pdf>); Q1 / p.1 | Direct-address table with duplicate keys | W5; R - read and explain; full written proof optional |
| P5.2 | [Homework/Paper/Paper HW - 5 (Ch - 11).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 5 (Ch - 11).pdf>); Q2 / p.2 | Chaining insertion trace | W5; R - read and explain; full written proof optional |
| P5.3 | [Homework/Paper/Paper HW - 5 (Ch - 11).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 5 (Ch - 11).pdf>); Q3 / p.3 | Sorted-chain performance tradeoffs | W5; R - read and explain; full written proof optional |
| P5.4 | [Homework/Paper/Paper HW - 5 (Ch - 11).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 5 (Ch - 11).pdf>); Q4 / p.4 | Multiplication-hash bucket calculation | W5; R - read and explain; full written proof optional |
| P5.5 | [Homework/Paper/Paper HW - 5 (Ch - 11).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 5 (Ch - 11).pdf>); Q5 / p.5 | Linear-probing and double-hashing traces | W5; R - read and explain; full written proof optional |
| P6.1 | [Homework/Paper/Paper HW - 6 (Ch - 14).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 6 (Ch - 14).pdf>); Q1 / p.1 | Greedy rod-cutting counterexample | W6; P1 - required paper drill; 2026-11-20; 30 min |
| P6.2 | [Homework/Paper/Paper HW - 6 (Ch - 14).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 6 (Ch - 14).pdf>); Q2 / p.2 | Recurrence exponential lower-bound proof | W6; R - read and explain; full written proof optional |
| P6.3 | [Homework/Paper/Paper HW - 6 (Ch - 14).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 6 (Ch - 14).pdf>); Q3 / p.3 | Matrix-chain subproblem graph | W6; R - read and explain; full written proof optional |
| P6.4 | [Homework/Paper/Paper HW - 6 (Ch - 14).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 6 (Ch - 14).pdf>); Q4 / p.4 | Maximizing matrix-chain multiplication variant | W6; R - read and explain; full written proof optional |
| P6.5 | [Homework/Paper/Paper HW - 6 (Ch - 14).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 6 (Ch - 14).pdf>); Q5 / p.5 | LCS table and reconstruction | W6; R - read and explain; full written proof optional |
| P7.1 | [Homework/Paper/Paper HW - 7 (Ch - 15).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 7 (Ch - 15).pdf>); Q1 / p.1 | Activity-selection greedy counterexamples | W7; R - read and explain; full written proof optional |
| P7.2 | [Homework/Paper/Paper HW - 7 (Ch - 15).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 7 (Ch - 15).pdf>); Q2 / p.2 | Fractional versus 0-1 knapsack | W7; R - read and explain; full written proof optional |
| P7.3 | [Homework/Paper/Paper HW - 7 (Ch - 15).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 7 (Ch - 15).pdf>); Q3 / p.3 | Special ordered-knapsack greedy variant | W7; R - read and explain; full written proof optional |
| P7.4 | [Homework/Paper/Paper HW - 7 (Ch - 15).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 7 (Ch - 15).pdf>); Q4 / p.4 | Huffman tree and code construction | W7; P1 - required paper drill; 2026-11-27; 30 min |
| P7.5 | [Homework/Paper/Paper HW - 7 (Ch - 15).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 7 (Ch - 15).pdf>); Q5 / p.5 | Near-uniform alphabet Huffman comparison | W7; R - read and explain; full written proof optional |
| P8.1 | [Homework/Paper/Paper HW - 8 (Ch - 20).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 8 (Ch - 20).pdf>); Q1 / p.1 | In-degree/out-degree computation | W8; R - read and explain; full written proof optional |
| P8.2 | [Homework/Paper/Paper HW - 8 (Ch - 20).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 8 (Ch - 20).pdf>); Q2 / p.2 | Directed BFS distances/parents from vertex 3 | W2; R - read and explain; full written proof optional |
| P8.3 | [Homework/Paper/Paper HW - 8 (Ch - 20).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 8 (Ch - 20).pdf>); Q3 / p.3 | Undirected alphabetical BFS from u | W2; R - read and explain; full written proof optional |
| P8.4 | [Homework/Paper/Paper HW - 8 (Ch - 20).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 8 (Ch - 20).pdf>); Q4 / p.4 | BFS color-state reductions | W8; R - read and explain; full written proof optional |
| P8.5 | [Homework/Paper/Paper HW - 8 (Ch - 20).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 8 (Ch - 20).pdf>); Q5 / p.5 | DFS discovery/finish times and edge types | W8; R - read and explain; full written proof optional |
| P9.1 | [Homework/Paper/Paper HW - 9 (Ch - 21).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 9 (Ch - 21).pdf>); Q1 / p.1 | Kruskal trace on the printed graph | W8; R - read and explain; full written proof optional |
| P9.2 | [Homework/Paper/Paper HW - 9 (Ch - 21).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 9 (Ch - 21).pdf>); Q2 / p.2 | Minimum-weight edge belongs to some MST | W8; P1 - required paper drill; 2026-12-04; 30 min |
| P9.3 | [Homework/Paper/Paper HW - 9 (Ch - 21).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 9 (Ch - 21).pdf>); Q3 / p.3 | Connected induced MST subtree property | W8; R - read and explain; full written proof optional |
| P9.4 | [Homework/Paper/Paper HW - 9 (Ch - 21).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 9 (Ch - 21).pdf>); Q4 / p.4 | Prim trace from s | W8; R - read and explain; full written proof optional |
| P9.5 | [Homework/Paper/Paper HW - 9 (Ch - 21).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 9 (Ch - 21).pdf>); Q5 / p.5 | Tie-breaking orders for different MSTs | W8; R - read and explain; full written proof optional |
## Completion evidence
A planned row becomes an attempt only when the execution ledger records elapsed time, hints used, result, edge cases and reasoning. Independent completion requires a working manual implementation or justified paper result, explained time/space bounds, and a later unaided recall check. Use [[20_Progress/Degree/_Courses/Technical Interview/Problems Solver#Execution ledger|the execution ledger]] and [[How to Solve Problems|How to Solve Problems]].
