---
type: concept
course: CSCI 4041
status: sprout
mastery (1/10): 0
created: 2026-02-01
topics:
  - "[[CSCI 4041 Board]]"
  - "[[Introduction to Algorithms]]"
related:
  - "[[DSA]]"
---
# Time Complexity Boxes
## MOC
- [[10_UMN/CSCI 4041/Week - 1 & 2#Key ideas (textbook)|Week - 1 & 2]]
- [[10_UMN/CSCI 4041/Textbook/Chapter - 1 & 2#2.2 Analyzing Algorithms|Chapter - 1 & 2 - Analyzing Algorithms]]
- [[10_UMN/CSCI 4041/Concepts/Algorithms/Sorting Algorithms#Complexity + Tradeoffs|Sorting Algorithms - Complexity + Tradeoffs]]
- [[10_UMN/CSCI 4041/Concepts/Graphs/Graph Algorithms#Complexity + Tradeoffs|Graph Algorithms - Complexity + Tradeoffs]]

## Definition
- **Time complexity** measures how the amount of work grows as the input size grows.
- **Space complexity** measures how extra memory usage grows.
- In this course, asymptotic notation is used to describe eventual growth rather than exact timing on one machine.

## Foundation Box
### Asymptotic Notation
> [!summary]
> - **O(g(n))**: eventual upper bound
> - **Ω(g(n))**: eventual lower bound
> - **Θ(g(n))**: tight bound up to constant factors

## [[10_UMN/CSCI 4041/Textbook/Chapter - 1 & 2#Getting Started|Chapter - 1 & 2]]
### Linear Search
> [!summary] Linear Search
> - Best case: $Θ(1)$
> - Worst / average: $Θ(n)$
> - Extra space: $O(1)$

### Insertion Sort
> [!summary] Insertion Sort
> - Best case: $Θ(n)$
> - Worst / average: $Θ(n^2)$
> - Extra space: $O(1)$ for the in-place version

### Merge Sort
> [!summary] Merge Sort
> - Recurrence: $T(n)=2T(n/2)+Θ(n)$
> - All cases: $Θ(n \log n)$
> - Extra space: $Θ(n)$ in the lecture's list-based implementations

## [[10_UMN/CSCI 4041/Concepts/Algorithms/QuickSort#Complexity + Tradeoffs|QuickSort]]
### QuickSort
> [!summary] QuickSort
> - Best / average: $Θ(n \log n)$
> - Worst: $Θ(n^2)$
> - Extra space: recursion stack, typically $O(\log n)$ on average

## [[10_UMN/CSCI 4041/Concepts/Algorithms/HeapSort#Complexity + Tradeoffs|HeapSort]]
### Heap Operations
> [!summary] Heap Basics
> - `MAX-HEAPIFY`: $O(\log n)$
> - `BUILD-MAX-HEAP`: $O(n)$
> - `HEAPSORT`: $O(n \log n)$
> - Extra space: $O(1)$ auxiliary

## [[10_UMN/CSCI 4041/Concepts/Data Structures & Methods/Hashing#Complexity + Tradeoffs|Hashing]]
### Hash Tables
> [!summary] Hashing
> - Chaining average search: $Θ(1 + α)$
> - Open addressing average search: near constant when $α$ is small
> - Worst case: $Θ(n)$

## [[10_UMN/CSCI 4041/Concepts/Algorithms/Dynamic Programming#Complexity + Tradeoffs|Dynamic Programming]]
### Dynamic Programming
> [!summary] Common DP Patterns
> - Fibonacci memoized: $Θ(n)$
> - Fibonacci bottom-up: $Θ(n)$
> - Knapsack: $O(NM)$
> - LCS: $Θ(mn)$

## [[10_UMN/CSCI 4041/Concepts/Graphs/Graph Algorithms#Complexity + Tradeoffs|Graph Algorithms]]
### Graph Traversals
> [!summary] BFS / DFS
> - BFS: $O(V + E)$
> - DFS: $O(V + E)$
> - Topological sort: $O(V + E)$
> - SCC (Kosaraju-style two-pass): $O(V + E)$

## [[10_UMN/CSCI 4041/Concepts/Graphs/Minimum Spanning Trees#Complexity + Tradeoffs|Minimum Spanning Trees]]
### MST
> [!summary] MST
> - Kruskal: dominated by edge sorting, usually $O(E \log E)$
> - Prim with heap: $O(E \log V)$

## Mini-test (answer without looking)
- [ ] Can I explain why `BUILD-MAX-HEAP` is linear?
- [ ] Can I distinguish average-case hash performance from worst-case?
- [ ] Can I identify when a recurrence should solve to linear, logarithmic, or $n \log n$ growth?

## Flashcards
#cards/CSCI4041
1. What does Θ mean::A tight asymptotic bound up to constant factors.
2. Merge-sort time::$Θ(n \log n)$.
3. Quicksort worst case::$Θ(n^2)$.
4. Build-max-heap time::$O(n)$.
5. BFS / DFS time::$O(V + E)$.
6. Knapsack DP time::$O(NM)$.
7. Hashing worst-case search::$Θ(n)$ even though average behavior is much better.
