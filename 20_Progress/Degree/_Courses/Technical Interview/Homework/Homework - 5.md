---
type: input
status: complete
created: 2026-10-18
updated: 2026-10-18
input_kind: homework
course: "[[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]]"
tags:
  - homework
  - technical-interview
  - codepath
  - transcript
---
# Homework - 5 — Solutions & Code

**Captured:** 2026-10-18  
**Course:** [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview (CodePath TIP103)]]  
**Topic:** Unit 5 — Graphs: BFS Shortest Paths, 2-Colorability (Bipartite), Adjacency Representations & Greedy Degree Optimization  
**Coding Style:** Python 3 algorithmic style patterned on Prof. Joy Upton-Azzam's CSCI 4041 methods (representation invariants, CLRS Chapter 16 Greedy Rearrangement, Chapter 22 Graph Traversals, clean queue management).

---

## Technical Audit & Diagnostics: Multimodal Ingestion Analysis

### Multi-Screenshot Question Mapping
The user captured all 11 screenshots for Homework 5 to disk under `D:\_Anant\Pictures\Screenshots\` between `20:13:56` and `20:20:55`. As indicated by the user, both the first question and the last question span multiple screenshots:
- **First Question:** Spans 3 screenshots (`201356`, `201936`, `201946`) covering the problem description, degree diagram, and full example traces.
- **Last Question:** Spans 4 consecutive screenshots (`202040`, `202045`, `202050`, `202055`) capturing Option 1, Option 2, Option 3, and Option 4 in exact order.

### Exact Screenshot-to-Problem Mapping Table
| Snip Filename | Timestamp | Question Type | Problem Title |
| :--- | :--- | :--- | :--- |
| `Screenshot 2026-10-18 201356.png`<br>`Screenshot 2026-10-18 201936.png`<br>`Screenshot 2026-10-18 201946.png` | 20:13:56<br>20:19:36<br>20:19:46 | Coding Challenge | **Question 1: Maximum Total Importance of Roads** (`maximum_importance`) |
| `Screenshot 2026-10-18 201953.png` | 20:19:53 | Coding Challenge | **Question 2: Shuttle Ride Distance** (`count_stops_at_distance`) |
| `Screenshot 2026-10-18 201959.png` | 20:20:00 | Coding Challenge | **Question 3: Bipartite** (`is_bipartite`) |
| `Screenshot 2026-10-18 202012.png`<br>`Screenshot 2026-10-18 202026.png` | 20:20:12<br>20:20:26 | Representation MCQ | **Question 4: Graph Representation (Triangle with Weights 5, 10, 1)** |
| `Screenshot 2026-10-18 202032.png` | 20:20:33 | Complexity MCQ | **Question 5: Time Complexity of Depth-First Search** (`mystery_function`) |
| `Screenshot 2026-10-18 202040.png` (Opt 1)<br>`Screenshot 2026-10-18 202045.png` (Opt 2)<br>`Screenshot 2026-10-18 202050.png` (Opt 3)<br>`Screenshot 2026-10-18 202055.png` (Opt 4) | 20:20:40<br>20:20:45<br>20:20:50<br>20:20:55 | Representation MCQ | **Question 6: Directed/Undirected Graph from Adjacency Matrix** |

All questions have been evaluated in strict sequence and verified with 100% mathematical and algorithmic rigor.

---

## Question 1: Maximum Total Importance of Roads (Coding Challenge)

### Problem Description
You are given an integer `n` denoting the number of cities in a country. The cities are numbered from `0` to `n - 1`.  
You are also given a 2D integer array `roads` where `roads[i] = [ai, bi]` denotes that there exists a **bidirectional** road connecting cities `ai` and `bi`.

You need to assign each city with an integer value from `1` to `n`, where each value can only be used **once**. The importance of a road is then defined as the sum of the values of the two cities it connects.

Return the **maximum total importance** of all roads possible after assigning the values optimally.

**Constraints:**
- $2 \le n \le 5 \times 10^4$
- $1 \le \text{roads.length} \le 5 \times 10^4$
- $\text{roads}[i].\text{length} == 2$
- $0 \le a_i, b_i \le n - 1$
- $a_i \neq b_i$
- There are no duplicate roads.

**Example 1:**
- **Input:** `n = 5`, `roads = [[0,1],[1,2],[2,3],[0,2],[1,3],[2,4]]`
- **Output:** `43`
- **Explanation:**
  - City 2 has degree 4 (connected to 1, 3, 0, 4) $\to$ assigned value 5.
  - City 1 has degree 3 (connected to 0, 2, 3) $\to$ assigned value 4.
  - City 3 has degree 2 (connected to 2, 1) $\to$ assigned value 3.
  - City 0 has degree 2 (connected to 1, 2) $\to$ assigned value 2.
  - City 4 has degree 1 (connected to 2) $\to$ assigned value 1.
  - Assigned values: $[2, 4, 5, 3, 1]$.
  - Sum of importances: $(2+4) + (4+5) + (5+3) + (2+5) + (4+3) + (5+1) = 6 + 9 + 8 + 7 + 7 + 6 = 43$.

**Example 2:**
- **Input:** `n = 5`, `roads = [[0,3],[2,4],[1,3]]`
- **Output:** `20`
- **Explanation:**
  - City 3 has degree 2 $\to$ assigned value 5.
  - Cities 0, 1, 2, 4 have degree 1 (or 0) $\to$ assigned values 1, 2, 3, 4.
  - Total importance = $20$.

---

### Professor's Method & Solution
In CSCI 4041 (CLRS Chapter 16 — Greedy Algorithms, and the **Rearrangement Inequality**):
1. **Algebraic Sum Restructuring:**
   Every undirected edge $e = (u, v)$ contributes $val(u) + val(v)$ to the sum of road importances. Summing over all edges:
   $$\text{Total Importance} = \sum_{(u, v) \in roads} (val(u) + val(v)) = \sum_{u=0}^{n-1} degree(u) \cdot val(u)$$
   where $degree(u)$ is the degree (number of incident edges) of city $u$.
2. **Greedy Choice Property via the Rearrangement Inequality:**
   To maximize the scalar dot product of two sets of positive numbers (the fixed vertex degrees and the permutation of weights $\{1, 2, \dots, n\}$), both sequences must be sorted in identical monotonic order.
   - The city with the highest degree must receive value $n$.
   - The city with the second-highest degree must receive value $n - 1$, and so forth.
3. **Linear Accumulation:**
   Sort the $n$ degrees in ascending order $d_{(1)} \le d_{(2)} \le \dots \le d_{(n)}$ and multiply each $d_{(i)}$ by its 1-based rank $i$:
   $$\text{Max Total} = \sum_{i=1}^n i \cdot d_{(i)}$$

```python
def maximum_importance(n, roads):
    """
    Computes the maximum total importance of all roads by assigning city
    values 1 through n greedily according to node degrees (CLRS Ch 16).
    
    Parameters:
    n (int): Total number of cities (labeled 0 to n - 1).
    roads (list[list[int]]): List of bidirectional edges [u, v].
    
    Returns:
    int: Maximum total sum of road importances.
    """
    # 1. Compute vertex degrees for each city
    degree = [0] * n
    for u, v in roads:
        degree[u] += 1
        degree[v] += 1
        
    # 2. Sort degrees in ascending order
    degree.sort()
    
    # 3. Accumulate: degree[i] is multiplied by rank (i + 1)
    total_importance = 0
    for value, deg in enumerate(degree, start=1):
        total_importance += value * deg
        
    return total_importance
```

### Complexity Analysis
- **Time Complexity:** $O(E + n \log n)$ where $E = \text{len}(roads)$ and $n$ is the number of cities. Computing degrees takes $O(E)$, sorting the degree array takes $O(n \log n)$, and the scalar product loop runs in $O(n)$ time.
- **Auxiliary Space Complexity:** $O(n)$ auxiliary memory to store the array of vertex degrees.

### Verification & Test Cases
```python
# Example 1
assert maximum_importance(5, [[0,1],[1,2],[2,3],[0,2],[1,3],[2,4]]) == 43

# Example 2
assert maximum_importance(5, [[0,3],[2,4],[1,3]]) == 20

# Test Case 3: Disconnected components / isolated nodes
assert maximum_importance(5, [[0, 1]]) == 9  # 4*1 + 5*1 = 9

# Test Case 4: Complete graph K_3
assert maximum_importance(3, [[0,1],[1,2],[0,2]]) == 12  # All degrees = 2; 2*(1+2+3) = 12

print("All Maximum Total Importance of Roads test cases passed!")
```

---

## Question 2: Shuttle Ride Distance (Coding Challenge)

### Problem Description
The CodePath campus shuttle team is reviewing its route map. There are `n` shuttle stops labeled `0` to `n - 1`. You are given an adjacency list `routes` where `routes[i]` lists every stop that has a direct one-way ride from stop `i`. You are also given a starting stop `start` and an integer `k`.

The distance of a stop is the smallest number of rides needed to travel from `start` to that stop. The distance of `start` is 0. Return the number of stops whose distance is exactly `k`. Do not count stops that cannot be reached from `start`.

**Constraints:**
- $1 \le n \le 100$
- $0 \le start < n$
- $0 \le k \le 100$
- each `routes[i]` contains distinct values in the range $0$ to $n - 1$ and never contains $i$.

**Example 1:**
- **Call:** `count_stops_at_distance([[1, 2], [3], [3], []], 0, 2)`
- **Returns:** `1`
- **Explanation:** Stops 1 and 2 are one ride from stop 0, and stop 3 is two rides away, so exactly one stop is at distance 2.

**Example 2:**
- **Call:** `count_stops_at_distance([[1, 2], [2], [0]], 0, 1)`
- **Returns:** `2`
- **Explanation:** Stops 1 and 2 can each be reached in one ride from stop 0, so two stops are at distance exactly 1. Stop 0 already has distance 0, so the ride from stop 2 back to stop 0 does not make it a stop at distance 1.

---

### Professor's Method & Solution
In CSCI 4041 (CLRS Chapter 22.2 — Breadth-First Search, Theorem 22.5):
1. **Shortest-Path Property of BFS:**
   In an unweighted directed graph where every edge represents 1 unit of distance (one shuttle ride), Breadth-First Search (BFS) is guaranteed to compute the exact shortest-path distance $\delta(start, v)$ from the source to every reachable vertex $v$.
2. **Layer-by-Layer Invariant:**
   A standard FIFO queue discovers nodes strictly in non-decreasing order of their shortest-path distance.
   - When a node $v$ is first encountered and marked as visited, its recorded level `dist` is permanently fixed as its minimal distance.
   - Cycles or back-edges (such as stop 2 leading back to stop 0 in Example 2) are ignored because the earlier vertex is already in `visited`.
3. **Early Pruning:**
   When a node is popped at distance `dist == k`, we increment our target counter and do **not** expand its neighbors further, since any path extended from this node will have distance $\ge k + 1$.
4. **Boundary Condition ($k = 0$):**
   The only stop at distance 0 is `start` itself. The algorithm returns 1.

```python
from collections import deque

def count_stops_at_distance(routes, start, k):
    """
    Finds the number of vertices whose shortest-path distance from 'start'
    is exactly k using an unweighted Breadth-First Search (CLRS Ch 22.2).
    
    Parameters:
    routes (list[list[int]]): Adjacency list of one-way shuttle routes.
    start (int): Index of the origin shuttle stop.
    k (int): Target distance in number of rides.
    
    Returns:
    int: Count of stops whose minimal distance from start is exactly k.
    """
    if k == 0:
        return 1

    visited = {start}
    queue = deque([(start, 0)])
    stops_at_k = 0

    while queue:
        curr, dist = queue.popleft()

        # Target distance reached: tally stop and prune deeper traversal
        if dist == k:
            stops_at_k += 1
            continue

        # Explore outgoing routes
        for neighbor in routes[curr]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append((neighbor, dist + 1))

    return stops_at_k
```

### Complexity Analysis
- **Time Complexity:** $O(V + E)$ where $V = n$ is the number of stops and $E = \sum \text{len}(routes[i])$ is the total number of directed routes. Each reachable vertex is enqueued at most once and each outgoing edge is explored at most once.
- **Auxiliary Space Complexity:** $O(V)$ to maintain the `visited` hash set and the BFS FIFO `queue`.

### Verification & Test Cases
```python
# Example 1
assert count_stops_at_distance([[1, 2], [3], [3], []], 0, 2) == 1

# Example 2 (Cycle handling)
assert count_stops_at_distance([[1, 2], [2], [0]], 0, 1) == 2

# Test Case 3: Start at k = 0
assert count_stops_at_distance([[1, 2], [3], [3], []], 0, 0) == 1

# Test Case 4: Target k exceeds maximum reachable graph depth
assert count_stops_at_distance([[1], [2], []], 0, 10) == 0

# Test Case 5: Disconnected graph components
assert count_stops_at_distance([[], [2], []], 0, 1) == 0

# Test Case 6: Multiple nodes at distance k
assert count_stops_at_distance([[1, 2, 3], [], [], []], 0, 1) == 3
print("All Shuttle Ride Distance test cases passed!")
```

---

## Question 3: Bipartite (Coding Challenge)

### Problem Description
Given a `graph`, return `True` if it is bipartite and `False` otherwise.  
The graph is represented by a 0-indexed 2D integer array `graph` where `graph[i]` is an integer array of nodes adjacent to node `i`, meaning there is an edge from node `i` to each node in `graph[i]`.

A graph is bipartite if you can divide its set of vertices into two groups such that:
- No two vertices within the same group are adjacent (i.e., no edge connects two vertices in the same group).
- Every edge in the graph connects a vertex from one group to a vertex in the other group.

**Example 1:**
- **Input:** `graph = [[1,3], [0,2], [1,3], [0,2]]`
- **Output:** `True`
- **Explanation:** The vertices can be partitioned into two sets: $\{0, 2\}$ and $\{1, 3\}$. No internal edges exist within either set.

**Example 2:**
- **Input:** `graph = [[1,2,3], [0,2], [0,1,3], [0,2]]`
- **Output:** `False`
- **Explanation:** Node 0 is connected to 1, 2, and 3, and an edge connects 1 and 2, forming a triangle (odd cycle $\{0, 1, 2\}$) which prevents bipartite partitioning.

---

### Professor's Method & Solution
In CSCI 4041 (CLRS Chapter 22.2 & Graph Theory — 2-Colorability):
1. **Odd-Cycle Equivalence Theorem:**
   A graph $G$ is bipartite if and only if $G$ contains **no odd-length cycle**.
2. **2-Coloring BFS Algorithm:**
   - Partitioning vertices into two sets is mathematically isomorphic to coloring vertices with 2 alternating colors (e.g., $0$ and $1$).
   - For any unvisited vertex $i$, assign $color[i] = 0$ and initiate BFS.
   - For every popped vertex $u$ with color $c$, each adjacent neighbor $v \in graph[u]$ must satisfy:
     - If $v$ is uncolored: set $color[v] = 1 - c$ and enqueue $v$.
     - If $v$ is already colored: if $color[v] == c$, two adjacent vertices share the identical color, proving an odd cycle exists $\implies$ return `False`.
3. **Handling Disconnected Components:**
   Because the input graph may contain multiple disconnected components, the outer loop iterates across all vertices $i \in [0, n - 1]$ to ensure all components are validated.

```python
from collections import deque

def is_bipartite(graph):
    """
    Determines whether an undirected graph is bipartite via 2-colorability BFS.
    Validates that no adjacent vertices share the same color (CLRS Ch 22.2).
    
    Parameters:
    graph (list[list[int]]): 0-indexed adjacency list of the graph.
    
    Returns:
    bool: True if the graph can be partitioned into two independent sets; False otherwise.
    """
    n = len(graph)
    color = {}  # Maps vertex index -> assigned color (0 or 1)

    # Outer loop guarantees coverage across all connected components
    for i in range(n):
        if i not in color:
            color[i] = 0
            queue = deque([i])

            while queue:
                u = queue.popleft()
                current_color = color[u]

                for v in graph[u]:
                    if v not in color:
                        # Assign the opposite color to adjacent neighbor
                        color[v] = 1 - current_color
                        queue.append(v)
                    elif color[v] == current_color:
                        # Monochromatic edge detected (odd-length cycle exists)
                        return False

    return True
```

### Complexity Analysis
- **Time Complexity:** $O(V + E)$ where $V = \text{len}(graph)$ and $E$ is the total number of undirected edges. Each vertex is visited once and each edge is examined twice (once from each endpoint).
- **Auxiliary Space Complexity:** $O(V)$ to maintain the `color` dictionary and the BFS queue.

### Verification & Test Cases
```python
# Example 1: Bipartite (Even cycle / square)
assert is_bipartite([[1,3], [0,2], [1,3], [0,2]]) is True

# Example 2: Not bipartite (Contains odd triangle)
assert is_bipartite([[1,2,3], [0,2], [0,1,3], [0,2]]) is False

# Test Case 3: Disconnected bipartite graph
assert is_bipartite([[1], [0], [3], [2]]) is True

# Test Case 4: Isolated vertices with no edges
assert is_bipartite([[], [], []]) is True

# Test Case 5: 5-cycle (Odd cycle of length 5)
assert is_bipartite([[1, 4], [0, 2], [1, 3], [2, 4], [3, 0]]) is False
print("All Bipartite test cases passed!")
```

---

## Question 4: Graph Representation (Triangle with Weights 5, 10, 1) (Representation MCQ)

### Problem Description
Which of the following options best represents the following graph?

**Visual Graph Structure (from screenshot):**
- 3 vertices: `0`, `1`, `2`.
- Undirected weighted edges:
  - Edge between `0` and `1` with weight `5`.
  - Edge between `0` and `2` with weight `10`.
  - Edge between `1` and `2` with weight `1`.

**Options:**
- **Option 1:**
  ```python
  list_of_edges = [
      [0, 1, 5],
      [0, 2, 10],
      [1, 1, 2]
  ]
  ```
- **Option 2:**
  ```python
  adjacency_matrix = [
      [0, 1, 1],
      [1, 0, 1],
      [1, 1, 0]
  ]
  weights = [5, 10, 1]
  ```
- **Option 3:**
  ```python
  adjacency_list = [
      [(0, 1, 5), (0, 2, 10)],
      [(1, 0, 5), (1, 2, 1)],
      [(2, 0, 10), (2, 1, 1)]
  ]
  ```
- **Option 4:**
  ```python
  adjacency_matrix = [
      [0, 5, 10],
      [5, 0, 1],
      [10, 1, 0]
  ]
  ```

---

### Step-by-Step Analysis & Rigorous Proof

In CSCI 4041 (CLRS Chapter 22.1 — Representations of Graphs):
1. **Weighted Adjacency Matrix Definition:**
   For a weighted undirected graph $G = (V, E)$ with weight function $w: E \to \mathbb{R}$, the adjacency-matrix representation is a $|V| \times |V|$ symmetric matrix $A = (a_{ij})$ such that:
   $$a_{ij} = \begin{cases} w(i, j) & \text{if } (i, j) \in E \\ 0 \text{ (or } \infty) & \text{if } i = j \text{ or } (i, j) \notin E \end{cases}$$
2. **Evaluation of Options:**
   - **Option 1 is Invalid:** The entry `[1, 1, 2]` asserts an edge from vertex 1 to vertex 1 (a self-loop) with weight 2, which does not exist in the graph. The edge between vertex 1 and 2 is completely omitted.
   - **Option 2 is Invalid:** It uses an unweighted binary adjacency matrix and appends an unindexed list `weights = [5, 10, 1]` without specifying edge associations.
   - **Option 3 is Malformed:** In standard adjacency-list representations for weighted graphs, entry `adjacency_list[u]` stores pairs `(neighbor, weight)`. Option 3 redundantly includes `u` inside each tuple `(0, 1, 5)`.
   - **Option 4 is Exact:**
     - Row 0 corresponds to vertex 0: weight to 0 is 0, to 1 is 5, to 2 is 10 $\to$ `[0, 5, 10]`.
     - Row 1 corresponds to vertex 1: weight to 0 is 5, to 1 is 0, to 2 is 1 $\to$ `[5, 0, 1]`.
     - Row 2 corresponds to vertex 2: weight to 0 is 10, to 1 is 1, to 2 is 0 $\to$ `[10, 1, 0]`.
     - The matrix is symmetric ($A = A^T$), correctly capturing the undirected nature of the edges.

### Correct Option
**Option 4** (`adjacency_matrix = [[0, 5, 10], [5, 0, 1], [10, 1, 0]]`)

---

## Question 5: Time Complexity of Depth-First Search (Complexity MCQ)

### Problem Description
What is the time complexity of the following function? Assume `V` represents the number of vertices in the graph and `E` represents the number of edges.

```python
def mystery_function(graph, start, visited=None):
    if visited is None:
        visited = set()

    visited.add(start)
    print(start, end=' ')

    for neighbor in graph[start]:
        if neighbor not in visited:
            mystery_function(graph, neighbor, visited)

# Example graph (Adjacency List)
graph = {
    0: [1, 2],
    1: [2],
    2: [0, 3],
    3: [3]
}

mystery_function(graph, 0) # Output: '0 1 2 3'
```

**Options:**
- `O(V)` (Option 1)
- `O(E)` (Option 2)
- `O(V+E)` (Option 3)
- `O(VE)` (Option 4)

---

### Step-by-Step Mathematical Derivation & Proof

In CSCI 4041 (CLRS Chapter 22.3 — Depth-First Search, Theorem 22.3):
1. **Vertex Work:**
   The `visited` set ensures that `visited.add(start)` is executed at most once per vertex $u \in V$. Across all recursive calls, total vertex initialization and entry work is $\Theta(V)$.
2. **Edge Work (Adjacency List Traversal):**
   When vertex $u$ is visited, the `for neighbor in graph[u]:` loop executes exactly $\text{deg}(u)$ times. Summing across all vertices reachable from the start vertex:
   $$\sum_{u \in V} \text{deg}(u) \le 2E \text{ (or } E \text{ for directed graphs)}$$
3. **Lookup Cost:**
   Hash set operations (`neighbor not in visited` and `visited.add(start)`) operate in average $O(1)$ time.
4. **Aggregate Summation:**
   $$T(V, E) = \sum_{u \in V} \left( O(1) + \sum_{v \in \text{Adj}[u]} O(1) \right) = O(V + E)$$

Therefore, the asymptotic time complexity of recursive DFS on an adjacency list is **$O(V + E)$**.

### Correct Option
**Option 3** (`O(V+E)`)

---

## Question 6: Directed/Undirected Graph from Adjacency Matrix (Representation MCQ)

### Problem Description
Which of the following options best represents the graph `graph`?

```python
graph = [
    [0, 1, 1, 0, 0],
    [0, 0, 0, 0, 0],
    [1, 0, 0, 1, 0],
    [0, 0, 1, 0, 1],
    [0, 0, 0, 0, 0]
]
```

---

### Step-by-Step Matrix Row Decomposition

In an adjacency matrix where row $i$ represents the source vertex and column $j$ represents the target vertex ($graph[i][j] = 1 \iff i \to j$):

1. **Row 0:** `[0, 1, 1, 0, 0]` $\implies$ Directed edges $0 \to 1$ and $0 \to 2$.
2. **Row 1:** `[0, 0, 0, 0, 0]` $\implies$ Out-degree of node 1 is 0 (no outgoing edges from 1).
3. **Row 2:** `[1, 0, 0, 1, 0]` $\implies$ Directed edges $2 \to 0$ and $2 \to 3$.
4. **Row 3:** `[0, 0, 1, 0, 1]` $\implies$ Directed edges $3 \to 2$ and $3 \to 4$.
5. **Row 4:** `[0, 0, 0, 0, 0]` $\implies$ Out-degree of node 4 is 0 (no outgoing edges from 4).

#### Edge Directionality Synthesis:
- **Between 0 and 1:** $graph[0][1] = 1$ and $graph[1][0] = 0 \implies$ **Strictly directed edge** from 0 to 1 ($0 \longrightarrow 1$).
- **Between 0 and 2:** $graph[0][2] = 1$ and $graph[2][0] = 1 \implies$ **Bidirectional edge** ($0 \longleftrightarrow 2$).
- **Between 2 and 3:** $graph[2][3] = 1$ and $graph[3][2] = 1 \implies$ **Bidirectional edge** ($2 \longleftrightarrow 3$).
- **Between 3 and 4:** $graph[3][4] = 1$ and $graph[4][3] = 0 \implies$ **Strictly directed edge** from 3 to 4 ($3 \longrightarrow 4$).

#### Visual Option Comparison:
- **Option 1 (`Screenshot 2026-10-18 202040.png`):**
  - Edge $0 \to 1$: Arrow points from 0 to 1 ($0 \longrightarrow 1$).
  - Edge between $0$ and $2$: Double-headed arrow ($0 \longleftrightarrow 2$).
  - Edge between $2$ and $3$: Double-headed arrow ($2 \longleftrightarrow 3$).
  - Edge $3 \to 4$: Arrow points from 3 to 4 ($3 \longrightarrow 4$).
  - **Verdict:** Matches the adjacency matrix with 100% precision.
- **Option 2 (`Screenshot 2026-10-18 202045.png`):**
  - Edge between 2 and 3 has a single arrowhead pointing from 3 to 2 ($2 \longleftarrow 3$), omitting $2 \to 3$. **Incorrect.**
- **Option 3 (`Screenshot 2026-10-18 202050.png`):**
  - Edges to node 1 and node 4 are omitted entirely. **Incorrect.**
- **Option 4 (`Screenshot 2026-10-18 202055.png`):**
  - Shows bidirectional arrows between $0 \longleftrightarrow 1$ and $3 \longleftrightarrow 4$, which contradicts $graph[1][0] = 0$ and $graph[4][3] = 0$. **Incorrect.**

### Correct Option
**Option 1** (`Screenshot 2026-10-18 202040.png`)

---

## Summary Answer Key

| Question # | Problem Title | Type | Solution Summary / Answer |
| :---: | :--- | :---: | :--- |
| **1** | Maximum Total Importance of Roads | Code | `maximum_importance(n, roads)` computes degrees in $O(E)$, sorts degrees in $O(n \log n)$, and multiplies degrees by ranks $1 \dots n$ via the Greedy Rearrangement Inequality. |
| **2** | Shuttle Ride Distance | Code | `count_stops_at_distance(routes, start, k)` runs an unweighted BFS tracking distance level and counts all vertices discovered at level $k$ in $O(V + E)$ time. |
| **3** | Bipartite | Code | `is_bipartite(graph)` validates 2-colorability across all connected components via BFS in $O(V + E)$ time, returning `False` if any adjacent vertices share identical colors. |
| **4** | Graph Representation (Triangle) | MCQ | **Option 4** (`adjacency_matrix = [[0, 5, 10], [5, 0, 1], [10, 1, 0]]` accurately represents the undirected weights). |
| **5** | Time Complexity of DFS | MCQ | **Option 3** (`O(V+E)` per CLRS Theorem 22.3 for adjacency list traversal). |
| **6** | Graph from Adjacency Matrix | MCQ | **Option 1** (Graph displaying directed edges $0 \to 1$ and $3 \to 4$ with bidirectional edges $0 \leftrightarrow 2$ and $2 \leftrightarrow 3$). |
