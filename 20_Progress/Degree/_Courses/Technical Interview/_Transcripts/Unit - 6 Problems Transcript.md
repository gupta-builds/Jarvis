---
type: input
status: seed
created:
input_kind: transcript
source_url:
related_progress: []
tags:
  - transcript
next:
---
# Unit - 6 Problems Transcript

**Captured:** 2026-10-20
**Source:**

## Raw Transcript

Paste the untouched transcript below, inside the fence. Do not edit, clean, or summarize here — this file is the raw capture. Summarization happens in the linked brief once `/transcript-to-brief` runs.

````
## Unit 6: Session 1

### Topological Sort & Dijkstra | Advanced Graphs

In this session, students will continue to practice using BFS and DFS to solve intermediate 2D matrices problems. Students will also be introduced to additional graph algorithms including Dijkstra's Algorithm, Topological Sort, and Union Find.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/6#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/6#!overview).

---

### 🎢 Part 1: Instructor Led Session

We'll spend the first portion of the synchronous class time in large groups, where the instructor will lead class instruction for 30-45 minutes.

### 🧑‍💻 Part 2: Breakout Session

In breakout sessions, we will explore and collaboratively solve problem sets in small groups. Here, the **collaboration, conversation, and approach** are just as important as “solving the problem” - please engage warmly, clearly, and plentifully in the process!

In breakout rooms you will:

- Screen-share the problem/s, and verbally review them together
- Screen-share an interactive coding environment, and talk through the steps of a solution approach
    - ProTip: - An Integrated Development Environment (IDE) is a fancy name for a tool you could use for shared writing of code - like VSCode, PyCharm, Replit.com, Collabed.it, CodePen.io, or other - your staff team will specify which tool to use for this class!
- Screen-share an implementation of your proposed solution
- Independently follow-along, or create an implementation, in your own IDE.

Your program leader/s will indicate which code sharing tool/s to use as a group, and will help break down or provide specific scaffolding with the main concepts above.

**Note on Expectations**

---

### 🔎 Problem Solving Approach

We will approach problems using the six steps in the UMPIRE approach.

**UMPIRE: Understand, Match, Plan, Implement, Review, Evaluate.**

We’ll apply these six steps to the problems we’ll see in the first half of the course.

We will learn to:

- **Understand** the problem
- **Match** identifies common approaches you've seen/used before
- **Plan** a solution step-by-step, and
- **Implement** the solution
- **Review** your solution
- **Evaluate** your solution's time and space complexity and think critically about the advantages and disadvantages of your chosen approach.

---

### Problem Set Version 1

Problem 1: Crafting Survival Gear

In the aftermath of the zombie apocalypse, your survival depends on crafting essential gear from limited resources. You are given a list of strings, `gear` that you can craft and a 2D list `components` where `components[i]` contains the materials you need to craft `gear[i]`.

Some components are basic supplies that you already have, while others need to be crafted from other gear. Additionally, you are given a string array `supplies` containing all the components you initially have in your stash (infinite supply).

Return a list of all the gear you can craft. You can return the list in any order.

```
def craftable_gear(gear, components, supplies):
    pass
```

Example Usage:

```
gear_1 = ["weapon"]
components_1 = [["metal", "wood"]]
supplies_1 = ["metal", "wood", "rope"]

gear_2 = ["weapon", "trap"]
components_2 = [["metal", "wood"], ["weapon", "wire"]]
supplies_2 = ["metal", "wood", "wire"]

gear_3 = ["weapon", "trap", "shelter"]
components_3 = [["metal", "wood"], ["weapon", "wire"], ["trap", "wood", "metal"]]
supplies_3 = ["metal", "wood", "wire"]

print(craftable_gear(gear_1, components_1, supplies_1))
print(craftable_gear(gear_2, components_2, supplies_2))
print(craftable_gear(gear_3, components_3, supplies_3))
```

Example Output:

```
["weapon"]
Example 1 Explanation: You can craft "weapon" since you have the components "metal" and "wood" in your stash.

["weapon", "trap"]
Example 2 Explanation:
- You can craft "weapon" first since you have "metal" and "wood."
- After crafting "weapon", you can craft "trap" since you have "wire" and the "weapon" you just crafted.

["weapon", "trap", "shelter"]
Example 3 Explanation: 
- You can craft "weapon" first.
- With the "weapon" and "wire", you can craft "trap."
- With the "trap", "wood", and "metal," you can craft "shelter."
```

✨ AI Hint: Topological Sort

_Key Skill: Use AI to explain code concepts_

This problem may be solved with topological sort. Check out the Advanced section of the [Unit 6 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/6#!cheatsheet) for more information.

If you need more info, you can ask an AI tool like ChatGPT or GitHub Copilot to help you understand topological sort. For example, you can ask:

_"What is topological sort, and when is it useful for solving coding problems?"_

_"Can you walk me through an example of topological sort in action?"_

Problem 2: Spread the Zombie Cure

In the aftermath of the zombie apocalypse, a cure has been developed to stop the infection, but it must be distributed across a network of survivor camps. The camps are connected by communication lines, and you need to determine how quickly the cure can reach all the camps. Each camp is represented as a node in the network, and each communication line is represented as a directed edge with a travel time.

You are given an integer `n`, representing the number of camps (nodes), and a list of travel times `times`, where `times[i] = (u, v, w)` indicates that it takes `w` time for the cure to travel from camp `u` to camp `v`. You will send the cure from a starting camp `k`.

Return the minimum time it takes for all camps to receive the cure. If it is impossible for all camps to receive the cure, return `-1`.

```
def spread_cure(n, times, k):
    pass
```

Example Usage:

```
times_1 = [(2, 1, 1), (2, 3, 1), (3, 4, 1)]
times_2 = [(1, 2, 1), (2, 3, 2), (1, 3, 4)]
times_3 = [(1, 2, 1)]

print(spread_cure(1, times_1, 2))
print(spread_cure(3, times_2, 1))
print(spread_cure(2, times_3, 2))
```

Example Output:

```
2
Example 1 Explanation: Starting from camp 2, the cure travels to camp 1 in 1 unit 
of time, to camp 3 in 1 unit of time, and from camp 3 to camp 4 in 1 additional unit of time. 
The cure reaches all camps within 2 units of time.

3
Example 2 Explanation: Starting from camp 1, the cure can reach camp 2 in 1 unit 
of time and camp 3 via camp 2 in a total of 3 units of time (1+2). Therefore, the 
minimum time to reach all camps is 3 units.

-1
Example 3 Explanation: It is impossible for the cure to travel from camp 2 to camp 1 
since there is no direct or indirect communication line to connect the camps.
```

✨ AI Hint: Dijkstra's Algorithm

_Key Skill: Use AI to explain code concepts_

This problem can be solved using Dijkstra's Algorithm, a very popular algorithm for finding the shortest path in a weighted graph.

For a refresher, check out the Advanced section of the [Unit 6 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/6#!cheatsheet).

If you need help understanding Dijkstra's Algorithm, you can ask an AI tool like ChatGPT or GitHub Copilot to explain it to you, and even provide a step-by-step example of the algorithm in action.

We recommend trying to understand the **algorithm** first, and only attempt implementation once you have a solid grasp of how it works.

✨ AI Hint: Priority Queues

_Key Skill: Use AI to explain code concepts_

Dijkstra's uses a priority queue instead of a normal queue. Check out the Priority Queue section of the [Unit 6 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/6#!cheatsheet) for more information.

You can also ask an AI tool like ChatGPT or GitHub Copilot, like this:

_"What is the difference between a normal queue and a priority queue, and why do we need to use a priority queue in Dijkstra's algorithm?"_

Problem 3: Number of Survival Camps

There are a series of survival camps that have cropped up around the city since the zombie apocalypse started. Given an `m x n` 2D binary grid `city` which represents a map of `1`s (a survival camp) and `0`s (zombie controlled land), use Union Find to return the number of islands.

A survival camp is surrounded by zombie controlled land and is formed by connecting adjacent `1`s horizontally or vertically. You may assume all four edges of the grid are all surrounded by zombie controlled land.

```
def num_camps(city):
    pass
```

Example Usage:

```
city_1 = [
  [1,1,1,1,0],
  [1,1,0,1,0],
  [1,1,0,0,0],
  [0,0,0,0,0]
]

city_2 = [
  [1,1,0,0,0],
  [1,1,0,0,0],
  [0,0,1,0,0],
  [0,0,0,1,1]
]

print(num_camps(city_1))
print(num_camps(city_2))
```

Example Output:

```
1
3
```

✨ AI Hint: Union Find/Disjoint Set Union

_Key Skill: Use AI to explain code concepts_

This problem can be solved using Union Find, also called Disjoint Set Union. Learn more quickly by referencing the [Unit 6 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/6#!cheatsheet)

To explore further, try asking an AI tool like ChatGPT or GitHub Copilot to explain the concept of Union Find, along with examples of how it works.

Problem 4: Find Eventual Safe Locations

There is a directed graph of `n` nodes where each node represents a location in a zombie infested city. Each node is labeled from `0` to `n - 1`. The graph is represented by a 0-indexed 2D integer array `city` where `city[i]` is an integer array of nodes adjacent to node `i`, meaning there is a directed edge from node `i` to each node in `city[i]`.

A node is a _terminal location_ if it has no outgoing edges. A node is a _safe location_ if every possible path starting from that node leads to a terminal location (or another safe location).

Return an array containing all the safe locations (nodes) of the graph. The answer should be sorted in ascending order.

```
def eventual_safe_locations(city):
    pass
```

Example Usage:

_Example 1:_[!['city_1' graph diagram](https://courses.codepath.org/course_images/tip103/unit11_session2/eventual_safe_locations.png "'city_1' graph diagram")](https://courses.codepath.org/course_images/tip103/unit11_session2/eventual_safe_locations.png)

```
city_1 = [
    [1,2], # Location 0
    [2,3], # Location 1
    [5],   # Location 2
    [0],   # Location 3
    [5],   # Location 4
    [],    # Location 5
    []     # Location 6
    ]

city_2 = [
    [1,2,3,4], # Location 0
    [1,2],     # Location 1
    [3,4],     # Location 2
    [0,4],     # Location 3
    []         # Location 4
    ]

print(eventual_safe_locations(city_1))
print(eventual_safe_locations(city_2))
```

Example Output:

```
[2,4,5,6]
Example 1 Explanation: The given graph is shown above.
Nodes 5 and 6 are terminal locations as there are no outgoing edges from either of them.
Every path starting at locations 2, 4, 5, and 6 all lead to either location 5 or 6.

[4]
Example 2 Explanation:
Only location 4 is a terminal location, and every path starting at node 4 leads to node 4.
```

✨ AI Hint: Topological Sort

_Key Skill: Use AI to explain code concepts_

This problem may be solved with topological sort. Check out the Advanced section of the [Unit 6 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/6#!cheatsheet) for more information.

If you need more info, you can ask an AI tool like ChatGPT or GitHub Copilot to help you understand topological sort. For example, you can ask:

_"What is topological sort, and when is it useful for solving coding problems?"_

_"Can you walk me through an example of topological sort in action?"_

Problem 5: Maximizing Zombie Avoidance

In a post-apocalyptic world, you need to find the safest path through a series of zombie-infested zones. The zones are connected by roads, but each passage has a probability of success for safely making it through without encountering zombies. You must find the path that maximizes your chances of survival when traveling from one safe zone to another.

You are given an undirected graph with `n` nodes where each node represents a safe zone and each edge represents a road between two zones and has a probability of success. The graph is represented by an edge list, where `edges[i] = [a, b]` means that there is an undirected passage between zone `a` and zone `b` with a probability of success `succ_prob[i]`.

Given two zones, `start` and `end`, find the path that maximizes the probability of survival when traveling from the `start` zone to the `end` zone and return that maximum probability. If there is no safe path from start to end, return `0`. Round your answer to the nearest hundredth.

```
def max_survival_probability(n, edges, succ_prob, start, end):
    pass
```

Example Usage 1:

[![Example 1 Graph Diagram](https://courses.codepath.org/course_images/tip103/unit11_session2/maximizing_zombie_avoidance_ex1.png "Example 1 Graph Diagram")](https://courses.codepath.org/course_images/tip103/unit11_session2/maximizing_zombie_avoidance_ex1.png)

```
edges_1 = [[0, 1], [1, 2], [0, 2]]
succ_prob_1 = [0.5, 0.5, 0.2]

print(max_survival_probability(3, edges_1, succ_prob_1, 0, 2))
```

Example Output 1:

```
0.25
Example 1 Explanation:
The possible paths from zone 0 to zone 2 are:
- 0 -> 1 -> 2, with probability 0.5 * 0.5 = 0.25.
- 0 -> 2, with probability 0.2.
The safest path has a probability of 0.25.
```

Example Usage 2:

[![Example 2 Graph Diagram](https://courses.codepath.org/course_images/tip103/unit11_session2/maximizing_zombie_avoidance_ex2.png "Example 2 Graph Diagram")](https://courses.codepath.org/course_images/tip103/unit11_session2/maximizing_zombie_avoidance_ex2.png)

```
edges_2 = [[0, 1], [1, 2], [0, 2]]
succ_prob_2 = [0.5, 0.5, 0.3]

print(max_survival_probability(3, edges_2, succ_prob_2, 0, 2))
```

Example Output 2:

```
0.3
Example 2 Explanation:
The possible paths from zone 0 to zone 2 are:
- 0 -> 1 -> 2, with probability 0.5 * 0.5 = 0.25.
- 0 -> 2, with probability 0.3.
The safest path has a probability of 0.3.
```

Example Usage 3:

[![Example 3 Graph Diagram](https://courses.codepath.org/course_images/tip103/unit11_session2/maximizing_zombie_avoidance_ex3.png "Example 3 Graph Diagram")](https://courses.codepath.org/course_images/tip103/unit11_session2/maximizing_zombie_avoidance_ex3.png)

```
edges_3 = [[0, 1]]
succ_prob_3 = [0.5]

print(max_survival_probability(2, edges_3, succ_prob_3, 0, 1))
```

Example Output 3:

```
0.5
Example 3 Explanation:
There is only one path between zone 0 and zone 1, with a probability of 0.5.
```

✨ AI Hint: Dijkstra's Algorithm

_Key Skill: Use AI to explain code concepts_

This problem can be solved using Dijkstra's Algorithm, a very popular algorithm for finding the shortest path in a weighted graph.

For a refresher, check out the Advanced section of the [Unit 6 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/6#!cheatsheet).

If you need help understanding Dijkstra's Algorithm, you can ask an AI tool like ChatGPT or GitHub Copilot to explain it to you, and even provide a step-by-step example of the algorithm in action.

We recommend trying to understand the **algorithm** first, and only attempt implementation once you have a solid grasp of how it works.

Problem 6: Rebuilding the Safe Zones

In the post-apocalyptic world, several survivor camps are scattered across the land. To unite these camps and form a network of safe zones, you need to rebuild the roads between them. However, the rebuilding process comes with a cost, and resources are limited.

You are given an integer `n` representing the number of survivor camps, labeled from `1` to `n`. You are also given an array `connections`, where `connections[i] = [x, y, cost]` indicates that rebuilding the road between camp `x` and camp `y` will cost `cost` resources.

Your goal is to minimize the total cost of connecting all the camps so that there is at least one safe path between every pair of camps. If it is impossible to connect all the camps, return `-1`.

```
def min_rebuilding_cost(n, connections):
    pass
```

Example Usage 1:

[![Example 1 graph diagram](https://courses.codepath.org/course_images/tip103/unit11_session2/rebuilding_safe_zones_ex1.png "Example 1 graph diagram")](https://courses.codepath.org/course_images/tip103/unit11_session2/rebuilding_safe_zones_ex1.png)

```
connections_1 = [[1, 2, 5], [1, 3, 6], [2, 3, 1]]

print(min_rebuilding_cost(3, connections_1))
```

Example Output 1:

```
6
Example 1 Explanation:
The minimum cost to connect all the camps is to rebuild the road between camp 2 and camp 3 (cost 1) and the road between camp 1 and camp 2 (cost 5). The total cost is 6.
```

Example Usage 2:

[![Example 2 graph diagram](https://courses.codepath.org/course_images/tip103/unit11_session2/rebuilding_safe_zones_ex2.png "Example 2 graph diagram")](https://courses.codepath.org/course_images/tip103/unit11_session2/rebuilding_safe_zones_ex2.png)

```
connections_2 = [[1, 3, 2], [2, 4, 4]]
print(min_rebuilding_cost(4, connections_2))
```

Example Output 2:

```
-1
Example 2 Explanation:
It is impossible to connect all 4 camps since there is no connection between camps 1 and 2, and camps 1 and 4.
```

💡 Hint: Kruskal's Algorithm

This problem can be solved using Kruskal's Algorithm which finds the Minimum Spanning Tree (MST) of a graph. The MST of a graph is a subgraph of a weighted, connected, and undirected graph that connects all the vertices with the minimum possible total edge weight, while ensuring there are no cycles.

Kruskal's Algorithm Pseudocode:

```
def kruskal(Graph G):
    1. Initialize an empty set or list MST to store the edges of the Minimum Spanning Tree.
    2. Sort all edges of the graph by their weight in non-decreasing order.
    
    3. Initialize a Disjoint Set Union (DSU) data structure for the vertices.
       - Each vertex starts in its own set.
       
    4. For each edge (u, v) in the sorted list of edges:
          a. If u and v are in different sets (i.e., no cycle is formed by adding this edge):
              i. Add the edge (u, v) to the MST.
              ii. Union the sets containing u and v (merge the sets).
              
    5. Return the MST.

```

Note that Kruskal's is not in scope for the Unit 6 assessments. This is simply an extra challenge problem. For an introduction to Kruskal's algorithm and minimum spanning trees, see the Minimum Spanning Trees section of the [Unit 9 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/9#!cheatsheet).

### Problem Set Version 2

Problem 1: Schedule Banquet TasksProblem 2: Connecting Roads for WinterProblem 3: Number of TownsProblem 4: Find the Royal LineageProblem 5: Minimum Effort Path to the CastleProblem 6: Reinforce the Kingdom's Strongholds
````
