---
type: index
status: sprout
created: 2026-09-29
updated: 2026-10-13
tags:
  - class
  - moc
  - index
  - technical-interview
notes:
  - "[[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/CSCI 4041 Board|CSCI 4041 Board]]"
  - "[[DSA|DSA]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Introduction to Algorithms|Textbook: Introduction to Algorithms]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/Problems Solver|Problems Solver]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Weekly Board|Weekly Board]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/Preparation & Sources|Preparation & Sources]]"
next: "Use the exact bundle/file rows from DSA; restore title-only prompt bodies without editing the raw captures"
---
# CSCI 4041 Relation - Files, concepts and preparation weeks
This note maps the TIP103 captures and personal syllabus to the specific CSCI 4041 textbook, lecture, coding, homework and project files that support them. Each row names its use and preparation week; adjacency is labeled where the interview pattern goes beyond the source.
Source root: `D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041`. Personal week numbers mean October 12-December 28, 2026. CSCI lecture folder numbers retain the completed course’s original numbering.
## Unit 1-5 crosswalk
| Capture | Direct or adjacent CSCI material | Preparation weeks | Missing bridge |
|---|---|---|---|
| U1 S1-S2 | [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]]; CLRS 10.1 directly covers arrays/matrices | W1, W2, W5, W7 | Python string handling, two-pointer invariants, intervals and interview explanation |
| U2 S1-S2 | [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-H Hashing\|B-H Hashing]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-Q Sorting search and heaps\|B-Q Sorting search and heaps]] for the heap topic named in the header; no heap prompt is captured | W1, W2, W3, W5 | Dict/set problem patterns versus collision-handling implementation |
| U3 S1 | [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-R Recursion\|B-R Recursion]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-D DP and backtracking\|B-D DP and backtracking]] | W1, W2, W3, W6 | Whole-batch partitioning, recursive expression parsing, output-sensitive search |
| U3 S2 | [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-S Stacks and queues\|B-S Stacks and queues]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-A Arrays and strings\|B-A Arrays and strings]] | W1, W2, W5, W10 | Monotonic-next-greater and minimum-edit bracket tasks |
| U4 S1-S2 | [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-L Linked lists and OOP\|B-L Linked lists and OOP]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-T Trees and BSTs\|B-T Trees and BSTs]] | W1, W2, W4 | General-tree interview contracts and object identity |
| U5 S1-S2 | [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-G Graph traversal\|B-G Graph traversal]]; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation#B-P Weighted shortest paths\|B-P Weighted shortest paths]] is an extension, not required for any-cost paths | W1, W2, W8, W9 | State modeling, directedness and output-sensitive path enumeration |
## Source corrections
- Union-find source exists: CLRS Chapter 19 and `Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb`, task 3 / `better_kruskal`. A dedicated vault concept note is the missing layer.
- String source exists in CLRS Chapter 32; arrays/matrices are explicit in 10.1. Dedicated interview string/window/tries notes are still absent.
- Backtracking source exists in the maze project. A separate interview backtracking index and DP/backtracking distinction are still needed.
- `Midterm_Project/Multiway Search Tree/2-3-Trees(first_publication).pdf` is actually J. D. Ullman’s Fast Algorithms for the Elimination of Common Subexpressions. Its tree techniques do not make it a introductory 2-3-tree source. Hold it from required reading.
- `DesignandAnalysisofExperiments-Chapter4.pdf` opens with Data Structures for Set Manipulation Problems. Its filename is not its verified content title.
- `CodingHW_1(chapter2-CLRS).ipynb` is absent from the current source folder. Use the present lecture and Paper HW1 sources; do not link a nonexistent file.
- Some Unit 5 image asset URLs include `unit10_session1` or `unit10_session2`; keep the captured Unit 5 labels and flag portal reconciliation rather than renumbering the raw notes.
## B-A Arrays and strings
TIP evidence: U1 S1-S2; U3 S2. Personal weeks: W1, W2, W5, W7. Textbook: CLRS 2.1-2.3, 10.1; string-matching extension 32.1-32.4.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 1 & 2|Week - 1 & 2]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 1 & 2|Chapter - 1 & 2]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 7 & 10|Chapter - 7 & 10]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Time Complexity|Time Complexity]]
- [Lectures/Week - 1 & 2/ch2_Asymptotic_Analysis.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 1 & 2/ch2_Asymptotic_Analysis.ipynb>)
- [Lectures/Week - 1 & 2/ch2_Asymptotic_Analysis-FLOPS.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 1 & 2/ch2_Asymptotic_Analysis-FLOPS.ipynb>)
- [Lectures/Week - 4/Ch7_QuickSort(AlgorithmicModifcationExamples).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch7_QuickSort(AlgorithmicModifcationExamples).ipynb>)
Coverage: CSCI array/invariant support is direct; interview two-pointer, sliding-window, interval and Python string techniques need the captured CodePath material and Handbook sheets.
## B-H Hashing
TIP evidence: U2 S1-S2. Personal weeks: W1, W2, W5, W10. Textbook: CLRS 11.1-11.5; Appendix B.1; bit-vector application in CodingHW5.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 8|Week - 8]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 11|Chapter - 11]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Data Structures & Methods/Hashing|Hashing]]
- [Lectures/Week - 8/Ch11_ChainHashMap.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ChainHashMap.ipynb>)
- [Lectures/Week - 8/Ch11_ProbeHashMap.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ProbeHashMap.ipynb>)
- [Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb>)
Coverage: Hash-table internals support dict/set complexity. Frequency maps, normalized keys and prefix-sum lookups require an explicit transfer from those internals.
## B-R Recursion
TIP evidence: U3 S1. Personal weeks: W1, W2, W3, W6. Textbook: CLRS 4.1-4.5; 14.1 and 14.3 for memoization.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 3|Week - 3]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 3 & 4|Chapter - 3 & 4]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/Divide and Conquer|Divide and Conquer]]
- [Lectures/Week - 3/Ch4_Divide_and_Conquer(Examples).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 3/Ch4_Divide_and_Conquer(Examples).ipynb>)
- [Lectures/Week - 3/Ch4_Divide_and_Conquer(Matrix-Multiply).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 3/Ch4_Divide_and_Conquer(Matrix-Multiply).ipynb>)
Coverage: Recurrences and recursion are supported. Whole-batch partitioning, nested-expression parsing and output-sensitive backtracking need additional interview practice. A memoization header alone does not prove mastery.
## B-S Stacks and queues
TIP evidence: U3 S2. Personal weeks: W1, W2, W5, W10. Textbook: CLRS 10.1, 16.1-16.4.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 4|Week - 4]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 7 & 10|Chapter - 7 & 10]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Data Structures & Methods/Elementary Data Structures|Elementary Data Structures]]
- [Lectures/Week - 4/Ch10_Stacks_and_Queues.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch10_Stacks_and_Queues.ipynb>)
- [Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb>)
Coverage: Basic ADTs are direct. Monotonic stacks, queue-via-stacks amortization and expression parsing are interview extensions.
## B-L Linked lists and OOP
TIP evidence: U3 S1 P4-P5; U4 S1. Personal weeks: W1, W2, W3, W10. Textbook: CLRS 10.2; object/reference conventions in lecture code.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 4|Week - 4]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 7 & 10|Chapter - 7 & 10]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Data Structures & Methods/Elementary Data Structures|Elementary Data Structures]]
- [Lectures/Week - 4/Ch10_LinkedLists.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch10_LinkedLists.ipynb>)
- [Homework/Coding/Ch10_LinkedLists.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/Ch10_LinkedLists.ipynb>)
- [Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb>)
Coverage: Node operations are direct. Track identity, aliasing, head/tail changes and mutation contracts; sorted merging differs from the transcript interleaving task.
## B-T Trees and BSTs
TIP evidence: U4 S2. Personal weeks: W1, W2, W4. Textbook: CLRS 10.3, 12.1-12.3; 13.1-13.4 and 18 as academic extensions.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 5|Week - 5]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 6 & 12|Chapter - 6 & 12]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Data Structures & Methods/Elementary Data Structures|Elementary Data Structures]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Trees/AVL Trees|AVL Trees]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Trees/B-Trees|B-Trees]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Midterm Project/AVL Tree Project|AVL Tree Project]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Midterm Project/Midterm Project|Midterm Project]]
- [Lectures/Week - 4/Ch10_BinaryTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch10_BinaryTree.ipynb>)
- [Lectures/Week - 5/Ch12_BinarySearchTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch12_BinarySearchTree.ipynb>)
- [Lectures/Week - 5/Ch12_Examples.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch12_Examples.ipynb>)
- [Lectures/Week - 5/Ch12_Examples-Copy_and_Delete.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch12_Examples-Copy_and_Delete.ipynb>)
- [Midterm_Project/AVL Tree/AVLTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/AVLTree.ipynb>)
- [Midterm_Project/AVL Tree/Experiment.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/Experiment.ipynb>)
Coverage: Tree representation and BST operations are direct. A right-child-only vine is different from a level-wise right-side view. Balance assumptions in captured complexity prompts do not apply to arbitrary interview trees.
## B-G Graph traversal
TIP evidence: U5 S1-S2. Personal weeks: W1, W2, W8, W9. Textbook: CLRS 20.1-20.5; Appendix B.4.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 11|Week - 11]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 12|Week - 12]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 20|Chapter - 20]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Graphs/Graph Algorithms|Graph Algorithms]]
- [Lectures/Week - 11/Ch20_Graphs_and_BFS.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 11/Ch20_Graphs_and_BFS.ipynb>)
- [Lectures/Week - 11/Ch20_AdjacencyLists_and_DFS.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 11/Ch20_AdjacencyLists_and_DFS.ipynb>)
- [Lectures/Week - 12/Ch20_Topological_Sort_Connected_Components.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 12/Ch20_Topological_Sort_Connected_Components.ipynb>)
- [Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb>)
Coverage: Representations, BFS/DFS, parent reconstruction and topological order are direct. Preserve directedness, neighbor order and grid adjacency. U5 flight cost requests any path, not a minimum-cost path.
## B-Q Sorting search and heaps
TIP evidence: U1 arrays; U2 header mentions heaps, but captured prompts do not establish heap practice. Personal weeks: W3, W7. Textbook: CLRS 2.1-2.3, 3.1-3.3, 4.3-4.5, 6.1-6.5, 7.1-7.4; 8-9 and 16 as bridges.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 1 & 2|Week - 1 & 2]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 3|Week - 3]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 4|Week - 4]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 5|Week - 5]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 6 & 12|Chapter - 6 & 12]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/HeapSort|HeapSort]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/QuickSort|QuickSort]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/Sorting Algorithms|Sorting Algorithms]]
- [Lectures/Week - 1 & 2/Ch2_Merge_Sort.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 1 & 2/Ch2_Merge_Sort.ipynb>)
- [Lectures/Week - 4/Ch7_QuickSort.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch7_QuickSort.ipynb>)
- [Lectures/Week - 5/Ch6_Heaps.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch6_Heaps.ipynb>)
- [Lectures/Week - 5/Ch6_Heaps-PriorityQueue.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch6_Heaps-PriorityQueue.ipynb>)
- [Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb>)
Coverage: Heap/BST/partition mechanics are direct. Binary-search boundary contracts, streaming order statistics and heap-based interview designs need transfer practice.
## B-D DP and backtracking
TIP evidence: U3 recursion; syllabus sample units 7-9; U5 S2 DAG path enumeration. Personal weeks: W6, W7, W9. Textbook: CLRS 14.1-14.5; recursion state from Chapter 4.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 9|Week - 9]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 14|Chapter - 14]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/Dynamic Programming|Dynamic Programming]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/Divide and Conquer|Divide and Conquer]]
- [Lectures/Week - 9/ch14_DynamicProgramming(Fibonacci).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 9/ch14_DynamicProgramming(Fibonacci).ipynb>)
- [Lectures/Week - 9/Ch14_DynamicProgramming(Knapsack).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 9/Ch14_DynamicProgramming(Knapsack).ipynb>)
- [Lectures/Week - 9/Ch14_DynamicProgramming(Knapsack)-Testing.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 9/Ch14_DynamicProgramming(Knapsack)-Testing.ipynb>)
- [Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb>)
- [Final Project/Maze/Final.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Final.ipynb>)
Coverage: State, recurrence and memoization are present. Separate choice-tree backtracking from overlapping-subproblem DP; account for output size in path/permutation enumeration.
## B-I Greedy and intervals
TIP evidence: U1 S2 interval tasks; syllabus sample unit 7. Personal weeks: W7. Textbook: CLRS 15.1-15.4; weighted scheduling bridge to 14.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 10|Week - 10]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 15|Chapter - 15]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/Greedy Algorithms|Greedy Algorithms]]
- [Lectures/Week - 10/Ch15_GreedyAlgorithms(ActivitySelectionProblem).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 10/Ch15_GreedyAlgorithms(ActivitySelectionProblem).ipynb>)
- [Lectures/Week - 10/Ch15_GreedyAlgorithms(HuffmanCoding).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 10/Ch15_GreedyAlgorithms(HuffmanCoding).ipynb>)
- [Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb>)
Coverage: Activity selection, counterexamples and Huffman are direct. Weighted scheduling is a DP bridge; sorting intervals alone does not establish a valid greedy choice.
## B-U Union-find and MST
TIP evidence: Syllabus sample unit 6; connectivity extension to U5. Personal weeks: W8. Textbook: CLRS 19.1-19.3, 21.1-21.2.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 12|Week - 12]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 21|Chapter - 21]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Graphs/Minimum Spanning Trees|Minimum Spanning Trees]]
- [Lectures/Week - 12/Ch21_MinimumSpanningTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 12/Ch21_MinimumSpanningTree.ipynb>)
- [Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb>)
Coverage: A standalone union-find note is absent, but CLRS Chapter 19 and CodingHW9 better_kruskal already supply union by rank and path compression. This is a note/index gap, not missing source material.
## B-P Weighted shortest paths
TIP evidence: Syllabus sample unit 6; U5 weighted-path task is only adjacent. Personal weeks: W9. Textbook: CLRS 22.1-22.3, 23.1-23.3.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 13|Week - 13]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 22|Chapter - 22]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 23|Chapter - 23]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Graphs/Shortest Paths|Shortest Paths]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Final Project/Final Project Report - Revised|Final Project Report - Revised]]
- [Lectures/Week - 13/Ch22_Single-Source_Shortest_Path.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 13/Ch22_Single-Source_Shortest_Path.ipynb>)
- [Lectures/Week - 13/Ch23_All-Pairs_Shortest_Path.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 13/Ch23_All-Pairs_Shortest_Path.ipynb>)
- [Final Project/Maze/Final.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Final.ipynb>)
- [Final Project/Maze/Experiment.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Experiment.ipynb>)
- [Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb>)
Coverage: Dijkstra, Bellman-Ford and APSP are direct. Stop-limited, minimax and transport-state problems require new state/model choices. Heuristic pathfinding papers remain optional.
## B-F Flow extension
TIP evidence: CSCI extension; not listed among standard TIP103 topics. Personal weeks: W10. Textbook: CLRS 24.1-24.3; 25 as optional matching extension.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 14|Week - 14]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 24|Chapter - 24]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Graphs/Maximum Flow|Maximum Flow]]
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Final Project/Network Flow Project|Network Flow Project]]
- [Lectures/Week - 14/Ch24_Maximum_Flow.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 14/Ch24_Maximum_Flow.ipynb>)
- [Lectures/Week - 14/Ch20(Graphs-CodeBase)-NETWORK.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 14/Ch20(Graphs-CodeBase)-NETWORK.ipynb>)
- [Final Project/Network Flow/Distribution-Network-Template.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Network Flow/Distribution-Network-Template.ipynb>)
Coverage: Study the existing residual-network example. Research papers and a full new flow implementation are optional within the fixed deadline.
## B-X Tries and string patterns
TIP evidence: Interview supplement to U1/U2; not evidenced as a dedicated captured session. Personal weeks: W5, W6. Textbook: CLRS 32.1-32.4 as optional string-matching reference; Handbook trie material.
- [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Data Structures & Methods/Hashing|Hashing]]
Coverage: No dedicated CSCI trie, prefix-sum or sliding-window note exists. Use the verified Handbook sheets and official problem contracts; do not label these as professor-taught methods.
## Complete original-file inventory
132 educational files are enumerated below, including duplicate copies and optional outputs. Notebook cells, function names, imports and task text were inspected; PDF text was extracted, with relevant sections sampled. Image-only theory references were visually sampled. Indexing a file does not mean the student has studied it or that every page was reread.
| Exact file | Primary preparation week | Role / content evidence |
|---|---|---|
| [Final Project/Heuristic Pathfinding/A_Formal_Basis_for_the_Heuristic_Determination_of_Minimum_Cost_Paths(Astar)-1967-68.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Heuristic Pathfinding/A_Formal_Basis_for_the_Heuristic_Determination_of_Minimum_Cost_Paths(Astar)-1967-68.pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Heuristic Pathfinding/Ch20(Graphs-CodeBase)-HeuristicSearch.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Heuristic Pathfinding/Ch20(Graphs-CodeBase)-HeuristicSearch.ipynb>) | W9 | Optional project scaffold/extension. Observed: matrixgraph:; vertex:; add_edge(self,i,j,weight=1):; adj(self,u):; weight(self,u,v):. |
| [Final Project/Heuristic Pathfinding/Correction_to_AFormalBasisfortheHeuristicDeterminationofmincostpaths-1971.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Heuristic Pathfinding/Correction_to_AFormalBasisfortheHeuristicDeterminationofmincostpaths-1971.pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Heuristic Pathfinding/ExperimentswiththeGraphTraverserProgram(Astar)-1966.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Heuristic Pathfinding/ExperimentswiththeGraphTraverserProgram(Astar)-1966.pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Heuristic Pathfinding/Generalized Best-First Search Strategies and the Optimality of Astar-1985.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Heuristic Pathfinding/Generalized Best-First Search Strategies and the Optimality of Astar-1985.pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Heuristic Pathfinding/HeuristicPathfinding-Template.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Heuristic Pathfinding/HeuristicPathfinding-Template.ipynb>) | W9 | Optional project scaffold/extension. Observed: random_floorplan(n):; dual_graph(Obstacles):; minheap:; left(self,i):; right(self,i):. |
| [Final Project/Maze/An_Algorithm_for_Path_Connections_and_Its_Applications-1961.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/An_Algorithm_for_Path_Connections_and_Its_Applications-1961.pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Maze/backtracking_64_solution.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/backtracking_64_solution.png>) | W9 | Optional project output comparison. |
| [Final Project/Maze/Bad_Maze64x64.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Bad_Maze64x64.png>) | W9 | Optional project output comparison. |
| [Final Project/Maze/Ch20(Graphs-CodeBase)-MAZE.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Ch20(Graphs-CodeBase)-MAZE.ipynb>) | W9 | Required study reference; task priorities are in the problem catalog. Observed: matrixgraph:; vertex:; add_edge(self,i,j,weight=1):; adj(self,u):; weight(self,u,v):. |
| [Final Project/Maze/Experiment.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Experiment.ipynb>) | W9 | Required study reference; task priorities are in the problem catalog. Observed: time_generator(gen, n, trials=GEN_TRIALS, base_seed=BASE_SEED):; time_solver(M, solver_key, trials=SOLVER_TRIALS):; run_solver_experiment(size, seed=BASE_SEED):; solver_bar_chart(results, size):. |
| [Final Project/Maze/Fast_Maze_Router-Soukup1978.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Fast_Maze_Router-Soukup1978.pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Maze/Final.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Final.ipynb>) | W9 | Required study reference; task priorities are in the problem catalog. Observed: cell_index(row,col,n):; cell_coordinates(index,n):; add_undirected_edge(G,i,j,weight=1):; remove_undirected_matrix_edge(G,i,j):; has_edge(G,i,j):. |
| [Final Project/Maze/fp2_backtracking_64_solution.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/fp2_backtracking_64_solution.png>) | W9 | Identical-byte copy of [Final Project/Maze/backtracking_64_solution.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/backtracking_64_solution.png>); reference it instead of duplicating study. |
| [Final Project/Maze/fp2_kruskal_64_solution.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/fp2_kruskal_64_solution.png>) | W9 | Optional project output comparison. |
| [Final Project/Maze/fp2_wilson_64_solution.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/fp2_wilson_64_solution.png>) | W9 | Optional project output comparison. |
| [Final Project/Maze/Introduction_part_1.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Introduction_part_1.pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Maze/kruskal_64_solution.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/kruskal_64_solution.png>) | W9 | Identical-byte copy of [Final Project/Maze/fp2_kruskal_64_solution.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/fp2_kruskal_64_solution.png>); reference it instead of duplicating study. |
| [Final Project/Maze/Maze-Template.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Maze-Template.ipynb>) | W9 | Optional project scaffold/extension. Observed: kruskal(G):; minheap:; left(self,i):; right(self,i):; parent(self,i):. |
| [Final Project/Maze/Networks - Winter 1977 - Hadlock - A shortest path algorithm for grid graphs.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Networks - Winter 1977 - Hadlock - A shortest path algorithm for grid graphs.pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Maze/Paper_ Maze Generation and Solving.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Paper_ Maze Generation and Solving.pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Maze/Presentation_of_a_MazeSolving_MachineTransactions_8th_Cybernetics_Conference_Josiah_Macy_Jr._Foundation_1952..pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/Presentation_of_a_MazeSolving_MachineTransactions_8th_Cybernetics_Conference_Josiah_Macy_Jr._Foundation_1952..pdf>) | W9 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Maze/wilson_64_solution.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/wilson_64_solution.png>) | W9 | Identical-byte copy of [Final Project/Maze/fp2_wilson_64_solution.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Maze/fp2_wilson_64_solution.png>); reference it instead of duplicating study. |
| [Final Project/Network Flow/A Primal-dual Algorithm for the capacitated Hitchcock Problem.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Network Flow/A Primal-dual Algorithm for the capacitated Hitchcock Problem.pdf>) | W10 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Network Flow/a-simple-algorithm-for-finding-maximal-network-flows-and-an-application-to-the-hitchcock-problem.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Network Flow/a-simple-algorithm-for-finding-maximal-network-flows-and-an-application-to-the-hitchcock-problem.pdf>) | W10 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Network Flow/Ch20(Graphs-CodeBase)-NETWORK.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Network Flow/Ch20(Graphs-CodeBase)-NETWORK.ipynb>) | W10 | Identical-byte copy of [Lectures/Week - 14/Ch20(Graphs-CodeBase)-NETWORK.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 14/Ch20(Graphs-CodeBase)-NETWORK.ipynb>); reference it instead of duplicating study. |
| [Final Project/Network Flow/Distribution-Network-Template.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Network Flow/Distribution-Network-Template.ipynb>) | W10 | Optional project scaffold/extension. Observed: location:; info(self):; network(graph):; vertex:; edge:. |
| [Final Project/Network Flow/MaximalFlowThroughANetwork-FordFulkerson-1954.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Network Flow/MaximalFlowThroughANetwork-FordFulkerson-1954.pdf>) | W10 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Network Flow/NetworkFlowTheory_Ford(1956).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Network Flow/NetworkFlowTheory_Ford(1956).pdf>) | W10 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Final Project/Network Flow/OntheMaxFLowMinCutTheoremofNetworks.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Final Project/Network Flow/OntheMaxFLowMinCutTheoremofNetworks.pdf>) | W10 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Homework/Coding/Ch10_LinkedLists.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/Ch10_LinkedLists.ipynb>) | W2 | Identical-byte copy of [Lectures/Week - 4/Ch10_LinkedLists.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch10_LinkedLists.ipynb>); reference it instead of duplicating study. |
| [Homework/Coding/Ch11_ChainHashMap.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/Ch11_ChainHashMap.ipynb>) | W5 | Identical-byte copy of [Lectures/Week - 8/Ch11_ChainHashMap.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ChainHashMap.ipynb>); reference it instead of duplicating study. |
| [Homework/Coding/Ch11_ProbeHashMap.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/Ch11_ProbeHashMap.ipynb>) | W5 | Identical-byte copy of [Lectures/Week - 8/Ch11_ProbeHashMap.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ProbeHashMap.ipynb>); reference it instead of duplicating study. |
| [Homework/Coding/Ch12_BinarySearchTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/Ch12_BinarySearchTree.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: binarysearchtree:; node:; search(self,x,k):; min(self,x):; max(self,x):. |
| [Homework/Coding/Ch20(Graphs-CodeBase)-1.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/Ch20(Graphs-CodeBase)-1.ipynb>) | W8 | Identical-byte copy of [Lectures/Week - 13/Ch20(Graphs-CodeBase)-1.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 13/Ch20(Graphs-CodeBase)-1.ipynb>); reference it instead of duplicating study. |
| [Homework/Coding/Ch20(Graphs-CodeBase).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/Ch20(Graphs-CodeBase).ipynb>) | W8 | Required study reference; task priorities are in the problem catalog. Observed: matrixgraph:; vertex:; add_edge(self,i,j,weight=1):; adj(self,u):; weight(self,u,v):. |
| [Homework/Coding/Ch6_ArrayTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/Ch6_ArrayTree.ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: arraytree:; add_root(self,k):; add_left(self,p,k):; add_right(self,p,k):; delete(self,x):. |
| [Homework/Coding/Ch6_Heaps.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/Ch6_Heaps.ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: heap(arraytree):; sort(self):; build_max_heap(self):; max_heapify(self,i):. |
| [Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_2(chapter4-CLRS).ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: MatMul(A,B,C,n):; MatMulRecursive(A,B,C,n):; check_matmul(A,B,C):; check_matadd(A,B,C):; MatMulRecursiveGeneral(A,B,C,n):. |
| [Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_3(chapter10-CLRS).ipynb>) | W2 | Required study reference; task priorities are in the problem catalog. Observed: stack:; stack_empty(self):; push(self,x):; pop(self):; queue:. |
| [Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_4(chapter6_and_12-CLRS).ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: priorityqueue(arraytree):; min(self):; extract_min(self):; min_heap_insert(self,k):; min_heapify(self,i):. |
| [Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_5(chapter11-CLRS).ipynb>) | W5 | Required study reference; task priorities are in the problem catalog. Observed: dynamicset:; insert(self,x):; search(self,x):; delete(self,x):; chainhashmapMAX(chainhashmap):. |
| [Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_6(chapter14-CLRS).ipynb>) | W6 | Required study reference; task priorities are in the problem catalog. Observed: cut_rod(p,n):; memoizes_cut_rod(p,n):; memoized_cut_rod_aux(p,n,r):; memoizes_cut_rod_fixed(p,n,c):; memoized_cut_rod_aux_fixed(p,n,r,c):. |
| [Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_7(chapter15-CLRS).ipynb>) | W7 | Required study reference; task priorities are in the problem catalog. Observed: activity:; generate_activity_set(n):; feasible(S):; Brute_Force_Activity_Selection(S):; activity_value:. |
| [Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_8(chapter20-CLRS).ipynb>) | W8 | Required study reference; task priorities are in the problem catalog. Observed: multigraph(graph):; add_edge(self,i,j,weight=1):; graph_hw8_1(graph):; out_degree(self,x):; in_degree(self,x):. |
| [Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Coding/CodingHW_9(chapter20-23-CLRS).ipynb>) | W8 | Required study reference; task priorities are in the problem catalog. Observed: Topological_Sort(G):; DFS_VISIT(G,u):; Topological_Sort20_4_5(G):; DFS_SCC(G):; DFS_VISIT(G,u):. |
| [Homework/Paper/Paper HW - 1 (Ch - 2).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 1 (Ch - 2).pdf>) | W1 | Required study reference; task priorities are in the problem catalog. |
| [Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 2 (Ch - 3 & 4).pdf>) | W3 | Required study reference; task priorities are in the problem catalog. |
| [Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 3 (Ch - 7 & 10).pdf>) | W2 | Required study reference; task priorities are in the problem catalog. |
| [Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 4 (Ch - 6 & 12).pdf>) | W3 | Required study reference; task priorities are in the problem catalog. |
| [Homework/Paper/Paper HW - 5 (Ch - 11).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 5 (Ch - 11).pdf>) | W5 | Required study reference; task priorities are in the problem catalog. |
| [Homework/Paper/Paper HW - 6 (Ch - 14).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 6 (Ch - 14).pdf>) | W6 | Required study reference; task priorities are in the problem catalog. |
| [Homework/Paper/Paper HW - 7 (Ch - 15).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 7 (Ch - 15).pdf>) | W7 | Required study reference; task priorities are in the problem catalog. |
| [Homework/Paper/Paper HW - 8 (Ch - 20).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 8 (Ch - 20).pdf>) | W8 | Required study reference; task priorities are in the problem catalog. |
| [Homework/Paper/Paper HW - 9 (Ch - 21).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Homework/Paper/Paper HW - 9 (Ch - 21).pdf>) | W8 | Required study reference; task priorities are in the problem catalog. |
| [Lectures/Week - 1 & 2/ch2_Asymptotic_Analysis-FLOPS.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 1 & 2/ch2_Asymptotic_Analysis-FLOPS.ipynb>) | W1 | Required study reference; task priorities are in the problem catalog. Observed: insertion_sort_cost(A,n):; insertion_sort_python_cost(A,n):; merge_cost(A,p,q,r):; merge_sort2_cost(A,p,r):; merge_sort_cost(A,n):. |
| [Lectures/Week - 1 & 2/ch2_Asymptotic_Analysis.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 1 & 2/ch2_Asymptotic_Analysis.ipynb>) | W1 | Required study reference; task priorities are in the problem catalog. Observed: insertion_sort(A,n):; insertion_sort_python(A,n):; merge(A,p,q,r):; merge_sort2(A,p,r):; merge_sort(A,n):. |
| [Lectures/Week - 1 & 2/Ch2_Merge_Sort.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 1 & 2/Ch2_Merge_Sort.ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: merge(A,p,q,r):; merge_sort(A,p,r):; merge_list(A,B):; merge_sort_list(A):; sameQ(A,B):. |
| [Lectures/Week - 10/Ch15_GreedyAlgorithms(ActivitySelectionProblem).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 10/Ch15_GreedyAlgorithms(ActivitySelectionProblem).ipynb>) | W7 | Required study reference; task priorities are in the problem catalog. Observed: activity:; generate_activity_set(n):; recursive_selection(sorted_S,i,j):; recursive_selection(S):; recursive_selectionR(sorted_S,i,j):. |
| [Lectures/Week - 10/Ch15_GreedyAlgorithms(HuffmanCoding).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 10/Ch15_GreedyAlgorithms(HuffmanCoding).ipynb>) | W7 | Required study reference; task priorities are in the problem catalog. Observed: make_C(s):; heap_item:; Huffman(C):; get_encoder(root_node):; traverse(node,string):. |
| [Lectures/Week - 10/Ch6_Ch12(required_for_Huffman).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 10/Ch6_Ch12(required_for_Huffman).ipynb>) | W7 | Required study reference; task priorities are in the problem catalog. Observed: arraytree:; add_root(self,k):; add_left(self,p,k):; add_right(self,p,k):; delete(self,x):. |
| [Lectures/Week - 11/Ch20_AdjacencyLists_and_DFS.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 11/Ch20_AdjacencyLists_and_DFS.ipynb>) | W2 | Required study reference; task priorities are in the problem catalog. Observed: graph:; vertex:; edge:; add_edge(self,i,j,weight=1):; adj(self,u):. |
| [Lectures/Week - 11/Ch20_Graphs_and_BFS.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 11/Ch20_Graphs_and_BFS.ipynb>) | W2 | Required study reference; task priorities are in the problem catalog. Observed: graph:; vertex:; add_edge(self,i,j,weight=1):; adj(self,u):; incoming_links(self,u):. |
| [Lectures/Week - 12/Ch20(Graphs-CodeBase).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 12/Ch20(Graphs-CodeBase).ipynb>) | W8 | Required study reference; task priorities are in the problem catalog. Observed: matrixgraph:; vertex:; add_edge(self,i,j,weight=1):; adj(self,u):; weight(self,u,v):. |
| [Lectures/Week - 12/Ch20_Topological_Sort_Connected_Components.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 12/Ch20_Topological_Sort_Connected_Components.ipynb>) | W8 | Required study reference; task priorities are in the problem catalog. Observed: Topological_Sort(G):; DFS_VISIT(G,u):; DFS_SCC(G):; DFS_VISIT(G,u):; construct_reverse_graph(G):. |
| [Lectures/Week - 12/Ch21_MinimumSpanningTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 12/Ch21_MinimumSpanningTree.ipynb>) | W8 | Required study reference; task priorities are in the problem catalog. Observed: kruskal(G):; minheap:; left(self,i):; right(self,i):; parent(self,i):. |
| [Lectures/Week - 12/Graph-Examples.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 12/Graph-Examples.ipynb>) | W8 | Required study reference; task priorities are in the problem catalog. |
| [Lectures/Week - 13/Ch20(Graphs-CodeBase)-1.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 13/Ch20(Graphs-CodeBase)-1.ipynb>) | W9 | Required study reference; task priorities are in the problem catalog. Observed: matrixgraph:; vertex:; add_edge(self,i,j,weight=1):; adj(self,u):; weight(self,u,v):. |
| [Lectures/Week - 13/Ch22_Single-Source_Shortest_Path.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 13/Ch22_Single-Source_Shortest_Path.ipynb>) | W9 | Required study reference; task priorities are in the problem catalog. Observed: initialize_single_source(G,s):; relax(u,v,w_uv):; bellman_ford(G,s):; minheap:; left(self,i):. |
| [Lectures/Week - 13/Ch23_All-Pairs_Shortest_Path.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 13/Ch23_All-Pairs_Shortest_Path.ipynb>) | W9 | Required study reference; task priorities are in the problem catalog. Observed: extend_shortest_paths(L_prev,W,L,n):; slow_apsp(W,L0,n):; extend_shortest_paths_with_PI(L_prev,W,L,PI,n):; slow_apsp_with_PI(W,L_0,n):; faster_apsp(W,n):. |
| [Lectures/Week - 14/Ch20(Graphs-CodeBase)-2.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 14/Ch20(Graphs-CodeBase)-2.ipynb>) | W10 | Required study reference; task priorities are in the problem catalog. Observed: matrixgraph:; vertex:; add_edge(self,i,j,weight=1):; adj(self,u):; weight(self,u,v):. |
| [Lectures/Week - 14/Ch20(Graphs-CodeBase)-NETWORK.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 14/Ch20(Graphs-CodeBase)-NETWORK.ipynb>) | W10 | Required study reference; task priorities are in the problem catalog. Observed: matrixgraph:; vertex:; add_edge(self,i,j,weight=1):; adj(self,u):; weight(self,u,v):. |
| [Lectures/Week - 14/Ch24_Maximum_Flow.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 14/Ch24_Maximum_Flow.ipynb>) | W10 | Required study reference; task priorities are in the problem catalog. Observed: network(graph):; edge:; add_edge(self,i,j,capacity=1,flow=0):; edges(self):; flow(self,u,v):. |
| [Lectures/Week - 3/Ch4_Divide_and_Conquer(Examples).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 3/Ch4_Divide_and_Conquer(Examples).ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: min_DnC(A,p,r):; inner_prod_DnC(x,y,n):; check_inner(x,y,output):; vector_add_DnC(x,y,z,n):; check_sum(x,y,z):. |
| [Lectures/Week - 3/Ch4_Divide_and_Conquer(Matrix-Multiply).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 3/Ch4_Divide_and_Conquer(Matrix-Multiply).ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: MatMul(A,B,C,n):; check_matmul(A,B,C):; MatMulRecursive(A,B,C,n):. |
| [Lectures/Week - 4/Ch10_BinaryTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch10_BinaryTree.ipynb>) | W2 | Required study reference; task priorities are in the problem catalog. Observed: binarytree:; node:; add_root(self,k):; add_left(self,p,k):; add_right(self,p,k):. |
| [Lectures/Week - 4/Ch10_LinkedLists.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch10_LinkedLists.ipynb>) | W2 | Required study reference; task priorities are in the problem catalog. Observed: linkedlist:; node:; search(self,k):; prepend(self,k):; insert(self,k,k2):. |
| [Lectures/Week - 4/Ch10_Stacks_and_Queues.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch10_Stacks_and_Queues.ipynb>) | W2 | Required study reference; task priorities are in the problem catalog. Observed: stack:; stack_empty(self):; push(self,x):; pop(self):; queue:. |
| [Lectures/Week - 4/Ch7_QuickSort(AlgorithmicModifcationExamples).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch7_QuickSort(AlgorithmicModifcationExamples).ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: sameQ(A,B):; Quicksort(A,p,r):; Partition(A,p,r):; Randomized_Quicksort(A,p,r):; Randomized_Partition(A,p,r):. |
| [Lectures/Week - 4/Ch7_QuickSort-Recursion-Tree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch7_QuickSort-Recursion-Tree.ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: Quicksort(A,p,r):; Partition(A,p,r):; sameQ(A,B):; Randomized_Quicksort(A,p,r):; Randomized_Partition(A,p,r):. |
| [Lectures/Week - 4/Ch7_QuickSort-Visualization.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch7_QuickSort-Visualization.ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: Quicksort(A,p,r):; Partition(A,p,r):. |
| [Lectures/Week - 4/Ch7_QuickSort.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch7_QuickSort.ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: Quicksort(A,p,r):; Partition(A,p,r):; sameQ(A,B):; Randomized_Quicksort(A,p,r):; Randomized_Partition(A,p,r):. |
| [Lectures/Week - 5/Ch12_BinarySearchTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch12_BinarySearchTree.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: binarysearchtree:; node:; search(self,x,k):; min(self,x):; max(self,x):. |
| [Lectures/Week - 5/Ch12_Examples-Copy_and_Delete.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch12_Examples-Copy_and_Delete.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: pre_order(T,node):; copy(T):; copy_traverse(node):; post_order(T,node):; delete(T):. |
| [Lectures/Week - 5/Ch12_Examples.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch12_Examples.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: in_order(T,node):; pre_order(T,node):; post_order(T,node):; tree_min(T,node):; tree_max(T,node):. |
| [Lectures/Week - 5/Ch6_ArrayTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch6_ArrayTree.ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: arraytree:; add_root(self,k):; add_left(self,p,k):; add_right(self,p,k):; delete(self,x):. |
| [Lectures/Week - 5/Ch6_Heaps-PriorityQueue.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch6_Heaps-PriorityQueue.ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: heappriorityqueue(arraytree):; sort(self):; maximum(self):; extract_max(self):; increase_key(self,idx):. |
| [Lectures/Week - 5/Ch6_Heaps.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 5/Ch6_Heaps.ipynb>) | W3 | Required study reference; task priorities are in the problem catalog. Observed: heap(arraytree):; sort(self):; build_max_heap(self):; max_heapify(self,i):. |
| [Lectures/Week - 6/AVL-tree(original).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 6/AVL-tree(original).pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Lectures/Week - 6/B-Trees(original).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 6/B-Trees(original).pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Lectures/Week - 6/Ch12_BinarySearchTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 6/Ch12_BinarySearchTree.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: binarysearchtree:; node:; search(self,x,k):; min(self,x):; max(self,x):. |
| [Lectures/Week - 6/Ch13_BalancedSearchTrees.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 6/Ch13_BalancedSearchTrees.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: balancedtree(binarysearchtree):; node:; compute_height(self,x):; update_height(self,x):; left_rotate(self,x):. |
| [Lectures/Week - 6/Ch18_B-Tree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 6/Ch18_B-Tree.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: Btree:; node:; search(self,x,k):; split(self,x,i):; insert(self,k):. |
| [Lectures/Week - 7/2008-09LLRB(slides).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 7/2008-09LLRB(slides).pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Lectures/Week - 7/Left-Leaning_Red-black_Trees(Sedgewick-2008).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 7/Left-Leaning_Red-black_Trees(Sedgewick-2008).pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Lectures/Week - 7/LLRB-Tree(Sedgewick)-Construction.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 7/LLRB-Tree(Sedgewick)-Construction.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: LLRB:; node:; search(self,key):; insert(self,key):; insert_node(self,h,key):. |
| [Lectures/Week - 8/Ch10_LinkedLists.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch10_LinkedLists.ipynb>) | W5 | Identical-byte copy of [Lectures/Week - 4/Ch10_LinkedLists.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 4/Ch10_LinkedLists.ipynb>); reference it instead of duplicating study. |
| [Lectures/Week - 8/Ch11_ChainHashMap-Analysis.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ChainHashMap-Analysis.ipynb>) | W5 | Required study reference; task priorities are in the problem catalog. Observed: chainhashmapANALYSIS:; item:; insert(self,x):; delete(self,x):; h(self,key):. |
| [Lectures/Week - 8/Ch11_ChainHashMap-ChainLengthDistribution.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ChainHashMap-ChainLengthDistribution.ipynb>) | W5 | Required study reference; task priorities are in the problem catalog. Observed: chainhashmapANALYSIS:; item:; insert(self,x):; delete(self,x):; h(self,key):. |
| [Lectures/Week - 8/Ch11_ChainHashMap.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ChainHashMap.ipynb>) | W5 | Required study reference; task priorities are in the problem catalog. Observed: chainhashmap:; item:; h(self,key):; insert(self,x):; search(self,key):. |
| [Lectures/Week - 8/Ch11_ProbeHashMap-Analysis.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ProbeHashMap-Analysis.ipynb>) | W5 | Required study reference; task priorities are in the problem catalog. Observed: probehashmapANALYSIS:; h(self,key):; insert(self,k):; search(self,k):; delete(self,q):. |
| [Lectures/Week - 8/Ch11_ProbeHashMap-ProbeLengthDistribution.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ProbeHashMap-ProbeLengthDistribution.ipynb>) | W5 | Required study reference; task priorities are in the problem catalog. Observed: probehashmapANALYSIS:; h(self,key):; insert(self,k):; search(self,k):; delete(self,q):. |
| [Lectures/Week - 8/Ch11_ProbeHashMap.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 8/Ch11_ProbeHashMap.ipynb>) | W5 | Required study reference; task priorities are in the problem catalog. Observed: probehashmap:; h(self,key):; insert(self,k):; search(self,k):; delete(self,q):. |
| [Lectures/Week - 9/ch14_DynamicProgramming(Fibonacci).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 9/ch14_DynamicProgramming(Fibonacci).ipynb>) | W6 | Required study reference; task priorities are in the problem catalog. Observed: FibRecursive(n):; FibRecursiveTree(n):; FibMemoize(n):; FibMemR(n):; FibMemoizeTree(n):. |
| [Lectures/Week - 9/Ch14_DynamicProgramming(Knapsack)-Testing.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 9/Ch14_DynamicProgramming(Knapsack)-Testing.ipynb>) | W6 | Required study reference; task priorities are in the problem catalog. Observed: item:; generate_item_set(N,M):; Brute_Force(Items,M):; knapsack(Items,M):; re_construct(Items,best,M,N):. |
| [Lectures/Week - 9/Ch14_DynamicProgramming(Knapsack).ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 9/Ch14_DynamicProgramming(Knapsack).ipynb>) | W6 | Required study reference; task priorities are in the problem catalog. Observed: item:; generate_item_set(N,M):; Brute_Force(Items,M):; knapsack(Items,M):; re_construct(Items,best,M,N):. |
| [Midterm_Project/AVL Tree/ArtofComputerProgrammingVol3-BalancedTreesMultiwayTrees.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/ArtofComputerProgrammingVol3-BalancedTreesMultiwayTrees.pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Midterm_Project/AVL Tree/AVL tree paper.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/AVL tree paper.pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Midterm_Project/AVL Tree/AVL-tree(original).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/AVL-tree(original).pdf>) | W4 | Identical-byte copy of [Lectures/Week - 6/AVL-tree(original).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 6/AVL-tree(original).pdf>); reference it instead of duplicating study. |
| [Midterm_Project/AVL Tree/AVLTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/AVLTree.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: avltree(balancedtree):; node:; get_balance(self,x):; rebalance(self,x):; insert(self,k):. |
| [Midterm_Project/AVL Tree/Ch12_BinarySearchTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/Ch12_BinarySearchTree.ipynb>) | W4 | Identical-byte copy of [Lectures/Week - 6/Ch12_BinarySearchTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 6/Ch12_BinarySearchTree.ipynb>); reference it instead of duplicating study. |
| [Midterm_Project/AVL Tree/Ch13_BalancedSearchTrees.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/Ch13_BalancedSearchTrees.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: balancedtree(binarysearchtree):; node:; compute_height(self,x):; update_height(self,x):; left_rotate(self,x):. |
| [Midterm_Project/AVL Tree/CSCI 4041 Midterm Project - Balanced Tree Report.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/CSCI 4041 Midterm Project - Balanced Tree Report.pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Midterm_Project/AVL Tree/DataStructuresandAlgorithmsinPython-Chapter11.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/DataStructuresandAlgorithmsinPython-Chapter11.pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Midterm_Project/AVL Tree/Experiment.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/Experiment.ipynb>) | W4 | Required study reference; task priorities are in the problem catalog. Observed: count_avltree(avltree):; left_rotate(self, x):; right_rotate(self, x):; insertion_seq(n):; pick(arr):. |
| [Midterm_Project/Multiway Search Tree/2-3-Trees(first_publication).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Multiway Search Tree/2-3-Trees(first_publication).pdf>) | W4 | Hold: actual paper is common-subexpression elimination; not a 2-3-tree introduction. |
| [Midterm_Project/Multiway Search Tree/AhoHopcroftUllman-DataStructuresandAlgorithms-Chapter5.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Multiway Search Tree/AhoHopcroftUllman-DataStructuresandAlgorithms-Chapter5.pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Midterm_Project/Multiway Search Tree/ArtofComputerProgrammingVol3-BalancedTreesMultiwayTrees.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Multiway Search Tree/ArtofComputerProgrammingVol3-BalancedTreesMultiwayTrees.pdf>) | W4 | Identical-byte copy of [Midterm_Project/AVL Tree/ArtofComputerProgrammingVol3-BalancedTreesMultiwayTrees.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/ArtofComputerProgrammingVol3-BalancedTreesMultiwayTrees.pdf>); reference it instead of duplicating study. |
| [Midterm_Project/Multiway Search Tree/Ch12_MultiWayTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Multiway Search Tree/Ch12_MultiWayTree.ipynb>) | W4 | Optional balanced-tree alternative. Observed: multiwaytree:; node:; add_root(self,k):; add_child(self,x,k):; delete(self,x):. |
| [Midterm_Project/Multiway Search Tree/DataStructuresandAlgorithmsinPython-Chapter11.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Multiway Search Tree/DataStructuresandAlgorithmsinPython-Chapter11.pdf>) | W4 | Identical-byte copy of [Midterm_Project/AVL Tree/DataStructuresandAlgorithmsinPython-Chapter11.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/AVL Tree/DataStructuresandAlgorithmsinPython-Chapter11.pdf>); reference it instead of duplicating study. |
| [Midterm_Project/Multiway Search Tree/DesignandAnalysisofExperiments-Chapter4.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Multiway Search Tree/DesignandAnalysisofExperiments-Chapter4.pdf>) | W4 | Optional: cover reads Data Structures for Set Manipulation Problems, Chapter 4. |
| [Midterm_Project/Red Black Tree/A_dichromatic_framework_for_balanced_trees.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Red Black Tree/A_dichromatic_framework_for_balanced_trees.pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Midterm_Project/Red Black Tree/Ch12_BinarySearchTree.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Red Black Tree/Ch12_BinarySearchTree.ipynb>) | W4 | Optional balanced-tree alternative. Observed: binarysearchtree:; node:; search(self,x,k):; min(self,x):; max(self,x):. |
| [Midterm_Project/Red Black Tree/Ch13_DiChromaticTrees.ipynb](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Red Black Tree/Ch13_DiChromaticTrees.ipynb>) | W4 | Optional balanced-tree alternative. Observed: RBtree:; node:; search(self,x,k):; min(self,x):; max(self,x):. |
| [Midterm_Project/Red Black Tree/Left-Leaning_Red-black_Trees(Sedgewick-2008).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Red Black Tree/Left-Leaning_Red-black_Trees(Sedgewick-2008).pdf>) | W4 | Identical-byte copy of [Lectures/Week - 7/Left-Leaning_Red-black_Trees(Sedgewick-2008).pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Lectures/Week - 7/Left-Leaning_Red-black_Trees(Sedgewick-2008).pdf>); reference it instead of duplicating study. |
| [Midterm_Project/Red Black Tree/Sedgewick-Algorithms-Chapter15.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Red Black Tree/Sedgewick-Algorithms-Chapter15.pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Midterm_Project/Red Black Tree/Sedgewick-AlgorithmsinC-Chapter15.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Midterm_Project/Red Black Tree/Sedgewick-AlgorithmsinC-Chapter15.pdf>) | W4 | Optional theory/report reference; title/content checked, scanned items visually sampled. |
| [Technical Interview/CodePath TIP103 Syllabus.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Technical Interview/CodePath TIP103 Syllabus.pdf>) | W1 | Verified seven-page Direct-to-Student syllabus. |
| [Textbook/Introduction to Algorithms - DSA.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Textbook/Introduction to Algorithms - DSA.pdf>) | W1 | Required textbook by selected sections; includes missing note topics. |
| [Textbook/ITA Part 1.pdf](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Textbook/ITA Part 1.pdf>) | W1 | Required foundation reference; excerpt of CLRS fourth edition. |
| [Textbook/Puru/DAA Syllabus.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Textbook/Puru/DAA Syllabus.png>) | W5 | Optional curriculum comparison; not TIP103 or UMN authority. |
| [Textbook/Puru/DSA Syllabus.png](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/Textbook/Puru/DSA Syllabus.png>) | W5 | Optional curriculum comparison; not TIP103 or UMN authority. |
## Support files and excluded infrastructure
| Files / directory | Inventory treatment |
|---|---|
| [AGENTS.md](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/AGENTS.md>); [AI_CONTEXT.md](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/AI_CONTEXT.md>) | Source-workspace instructions; their old `10_UMN` output paths are superseded by the user’s current Jarvis path. |
| [DSA Common To Share All.lnk](<D:/_Anant/10_Areas/UMN/Classes/CSCI/CSCI 4041/DSA Common To Share All.lnk>) | Explicitly excluded by the previous user decision; not opened as a study resource. |
| `.venv/**` (3194 files) | Python environment/dependencies, not educational assignments. Every descendant falls under this exclusion. |
| `.kiro/**` (11 files) | Source tooling/configuration; instruction files read where relevant, configuration values not exposed. Every descendant is accounted for here. |
## Textbook coverage beyond the existing chapter notes
| Sections in the actual fourth-edition PDF | Plan use | Vault gap |
|---|---|---|
| 8-9: linear sorting, medians/selection | W3 transfer/reference | No dedicated chapter notes |
| 16: amortized analysis and dynamic tables | W3, W5, W10 complexity bridge | No dedicated chapter note |
| 17: augmentation and interval trees | W4 optional extension | No dedicated chapter note |
| 19: disjoint sets | W8 required with CodingHW9 task 3 | No dedicated chapter/concept note |
| 24-25: flow and bipartite matching | W10 academic extension | Chapter 24 exists; Chapter 25 does not |
| 32: string matching, KMP and suffix arrays | W5 optional reference, not a substitute for interview window techniques | No dedicated chapter note |
| Appendices A-D | W1/W3 recurrence, sets, probability and matrix lookup | Use textbook directly |
| Other advanced chapters 26-31, 33-35 | Catalogued textbook reference outside the required interview window | No claim of full chapter study |
## Vault-note inventory
| Existing note | Preparation use |
|---|---|
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/Divide and Conquer\|Divide and Conquer]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/Dynamic Programming\|Dynamic Programming]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/Greedy Algorithms\|Greedy Algorithms]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/HeapSort\|HeapSort]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/QuickSort\|QuickSort]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Algorithms/Sorting Algorithms\|Sorting Algorithms]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Concepts Board\|Concepts Board]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Data Structures & Methods/Elementary Data Structures\|Elementary Data Structures]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Data Structures & Methods/Hashing\|Hashing]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Graphs/Graph Algorithms\|Graph Algorithms]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Graphs/Maximum Flow\|Maximum Flow]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Graphs/Minimum Spanning Trees\|Minimum Spanning Trees]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Graphs/Shortest Paths\|Shortest Paths]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Introduction to Algorithms\|Introduction to Algorithms]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Time Complexity\|Time Complexity]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Trees/AVL Trees\|AVL Trees]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Concepts/Trees/B-Trees\|B-Trees]] | Use the corresponding bundle above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/CSCI 4041 Board\|CSCI 4041 Board]] | Course/reference index |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Final Project/Final Project Report - Revised\|Final Project Report - Revised]] | W9 maze/pathfinding or W10 network flow |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Final Project/Final Project Report\|Final Project Report]] | W9 maze/pathfinding or W10 network flow |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Final Project/Heuristic Pathfinding Project\|Heuristic Pathfinding Project]] | W9 maze/pathfinding or W10 network flow |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Final Project/Maze Project Details\|Maze Project Details]] | W9 maze/pathfinding or W10 network flow |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Final Project/Maze Project\|Maze Project]] | W9 maze/pathfinding or W10 network flow |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Final Project/Network Flow Project\|Network Flow Project]] | W9 maze/pathfinding or W10 network flow |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Midterm Project/AVL Tree Project\|AVL Tree Project]] | W4 balanced-tree source and project review |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Midterm Project/Midterm Project\|Midterm Project]] | W4 balanced-tree source and project review |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Midterm Project/Multiway Search Tree Project\|Multiway Search Tree Project]] | W4 balanced-tree source and project review |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Midterm Project/Red Black Tree Project\|Red Black Tree Project]] | W4 balanced-tree source and project review |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Competitive Coding/HackerRank Practice Test Prompt\|HackerRank Practice Test Prompt]] | Execution/catalog/rules, linked from DSA |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Detailed Problems List\|Detailed Problems List]] | Execution/catalog/rules, linked from DSA |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/How to Solve Problems\|How to Solve Problems]] | Execution/catalog/rules, linked from DSA |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Weekly Set\|Weekly Set]] | Execution/catalog/rules, linked from DSA |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 1 & 2\|Chapter - 1 & 2]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 11\|Chapter - 11]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 13\|Chapter - 13]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 14\|Chapter - 14]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 15\|Chapter - 15]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 18\|Chapter - 18]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 20\|Chapter - 20]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 21\|Chapter - 21]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 22\|Chapter - 22]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 23\|Chapter - 23]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 24\|Chapter - 24]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 3 & 4\|Chapter - 3 & 4]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 6 & 12\|Chapter - 6 & 12]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Chapter - 7 & 10\|Chapter - 7 & 10]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Textbook/Introduction to Algorithms\|Introduction to Algorithms]] | Use the corresponding bundle and printed CLRS sections |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 1 & 2\|Week - 1 & 2]] | Original CSCI week 1; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 10\|Week - 10]] | Original CSCI week 10; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 11\|Week - 11]] | Original CSCI week 11; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 12\|Week - 12]] | Original CSCI week 12; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 13\|Week - 13]] | Original CSCI week 13; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 14\|Week - 14]] | Original CSCI week 14; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 3\|Week - 3]] | Original CSCI week 3; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 4\|Week - 4]] | Original CSCI week 4; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 5\|Week - 5]] | Original CSCI week 5; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 6\|Week - 6]] | Original CSCI week 6; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 7\|Week - 7]] | Original CSCI week 7; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 8\|Week - 8]] | Original CSCI week 8; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Week - 9\|Week - 9]] | Original CSCI week 9; map by topic through the bundles above |
| [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Weekly/Weekly Board\|Weekly Board]] | Course/reference index |
## Open questions
- [ ] Restore the 21 title-only alternate prompt bodies from the CodePath portal. Their catalog rows stay on hold until then.
- [ ] Add compact bridges for tries, windows, prefix sums and union-find when study produces an actual explanation; existing sources are already assigned.
