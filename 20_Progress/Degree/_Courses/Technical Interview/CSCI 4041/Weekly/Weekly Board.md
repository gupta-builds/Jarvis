---
type: index
status: tree
created: 2026-09-29
updated: 2026-09-29
tags:
  - moc
  - technical-interview
notes:
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/CSCI 4041 Board|CSCI 4041 Board]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]]"
next: "Nothing to capture forward here - this course is finished. Use CSCI 4041 Relation for the active TIP103 revision mapping instead."
---
# CSCI 4041 — Weekly Board
This indexes the 13 weekly notes for the completed Spring'26 [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/CSCI 4041 Board|CSCI 4041 Board]] course. Grading, schedule, and policy live on that Board; the TIP103 topic-by-topic revision mapping built from these weeks lives in [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]] — this note stays a plain chronological index, not a second copy of either.
## Map
[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 1 & 2|Week - 1 & 2]] opens the course with insertion sort, cost models, and merge sort (CLRS Ch. 1-2). [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 3|Week - 3]] moves to asymptotic notation and divide-and-conquer recurrences (Ch. 3-4), the direct source of TIP103's Big O and recursion topics. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 4|Week - 4]] covers quicksort, partitioning, and elementary data structures - stacks, queues, linked lists, rooted trees (Ch. 7, 10). [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 5|Week - 5]] pairs heaps/priority queues with BST operations (Ch. 6, 12). [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 6|Week - 6]] introduces red-black trees and B-trees (Ch. 13, 18), with AVL notes anchored to the same rotation machinery. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 7|Week - 7]] continues red-black trees into the AVL midterm project's validation work. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 8|Week - 8]] covers hash tables, collision handling, and the chaining/open-addressing homework variants (Ch. 11). [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 9|Week - 9]] is dynamic programming - Fibonacci and knapsack (Ch. 14), the direct source for TIP103's DP topic. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 10|Week - 10]] covers greedy algorithms and Huffman coding (Ch. 15). [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 11|Week - 11]] opens graphs - representations, BFS, DFS (Ch. 20). [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 12|Week - 12]] continues with topological sort, strongly connected components, and minimum spanning trees (Ch. 20-21). [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 13|Week - 13]] covers single-source and all-pairs shortest paths, including Dijkstra's (Ch. 22-23) - TIP103's graph-algorithms topic sources directly from Weeks 11-13. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 14|Week - 14]] closes the course with maximum flow (Ch. 24). No `Week - 15.md` file exists - [[DSA|DSA]]'s own weekly plan marks Week 15 as study/finals review, not new material, and a real spring break fell between Weeks 7 and 8 with no numbered week assigned to it.
## Status
Every week is `reconciled` - the course finished Spring'26 and none of these will get new lecture capture. Nothing here is "current" in the live sense [[Weekly Board Standard|Weekly Board Standard]] describes; treat this board as a finished, stable index. The one live layer on top of it is [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]], which tracks TIP103 revision progress against these same weeks.
## Dataview
```dataview
TABLE status, next
FROM "20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly"
WHERE input_kind = "lecture"
SORT file.name ASC
```
