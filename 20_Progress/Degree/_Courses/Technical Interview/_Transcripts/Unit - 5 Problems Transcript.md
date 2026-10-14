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
# Unit - 5 Problems Transcript
**Captured:** 2026-10-13
**Source:**
## Session - 1
Paste the untouched transcript below, inside the fence. Do not edit, clean, or summarize here — this file is the raw capture. Summarization happens in the linked brief once `/transcript-to-brief` runs.

````
## Unit 5: Session 1

### Intro to Graphs & Traversals (BFS/DFS) | Graphs

In this session, students will learn about how to build and manipulate different representations of graphs, including lists of edges, adjacency lists, and adjacency matrices. Students will also be introduced to the two primary traversal algorithms for graphs: Breadth First Search and Depth First Search.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/5#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/5#!overview).

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

_**Please Note:**_ **It is not required or expected** that you complete all of the practice problems! In some sessions you may only complete 1 problem and that's okay.

Strengthening your **approach** to problems, and your **ability to speak and engage through the process** are key skills most often underdeveloped for engineers at this stage - focus on those in our small groups for your long term success!

You can always return to problems independently, after class time, to embrace the technical concepts and gain additional practice.

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

Problem 1: There and Back

As a flight coordinator for CodePath airlines, you have a 0-indexed adjacency list `flights` with `n` nodes where each node represents the ID of a different destination and `flights[i]` is an integer array indicating that there is a flight from destination `i` to each destination in `flights[i]`. Write a function `bidirectional_flights()` that returns `True` if for every flight from a destination `i` to a destination `j` there also exists a flight from destination `j` to destination `i`. Return `False` otherwise.

```
def bidirectional_flights(flights):
    pass
```

Example Usage:

_Example 1: `flights1`_

[!['flights1' graph diagram](https://courses.codepath.org/course_images/tip103/unit10_session1/there_and_back_ex1.png "'flights1' graph diagram")](https://courses.codepath.org/course_images/tip103/unit10_session1/there_and_back_ex1.png)

_Example 2: `flights2`_[!['flights2' graph diagram](https://courses.codepath.org/course_images/tip103/unit10_session1/there_and_back_ex2.png "'flights2' graph diagram")](https://courses.codepath.org/course_images/tip103/unit10_session1/there_and_back_ex2.png)

```
flights1 = [[1, 2], [0], [0, 3], [2]]
flights2 = [[1, 2], [], [0], [2]]

print(bidirectional_flights(flights1))
print(bidirectional_flights(flights2))
```

Example Output:

```
True
False
```

💡 Hint: Introduction to Graphs

This problem requires you to be familiar with the graph data structure and the different methods for representing graphs. Check out the [Unit 5 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/5#!cheatsheet) if you are unfamiliar with these concepts.

Problem 2: Find Center of Airport

You are a pilot navigating a new airport and have a map of the airport represented as an undirected star graph with `n` nodes where each node represents a terminal in the airport labeled from `1` to `n`. You want to find the center terminal in the airport where the pilots' lounge is located.

Given a 2D integer array `terminals` where each `terminals[i] = [u, v]` indicates that there is a path (edge) between terminal `u` and `v`, return the center of the given airport.

A star graph is a graph where there is one center node and exactly `n-1` edges connecting the center node ot every other node.

```
def find_center(terminals):
    pass
```

Example Usage:

[!['terminals1' graph diagram](https://courses.codepath.org/course_images/tip103/unit10_session1/star_graph.png "'terminals1' graph diagram")](https://courses.codepath.org/course_images/tip103/unit10_session1/star_graph.png)

```
terminals1 = [[1,2],[2,3],[4,2]]
terminals2 = [[1,2],[5,1],[1,3],[1,4]]

print(find_center(terminals1))
print(find_center(terminals2))
```

Example Output:

```
2
1
```

💡 Hint: Star Graph Properties

Observe that in a star graph the center node is connected to all other nodes. It must appear in all but one of the edges.

Problem 3: Finding All Reachable Destinations

You are a travel coordinator for CodePath Airlines, and you're helping a customer find all possible destinations they can reach from a starting airport. The flight connections between airports are represented as an adjacency dictionary `flights`, where each key is a destination, and the corresponding value is a list of other destinations that are reachable through a direct flight.

Given a starting location `start`, return a list of all destinations reachable from the `start` location either through a direct flight or connecting flights with layovers. The list should be provided in ascending order by number of layovers required.

```
def get_all_destinations(flights, start):
    pass
```

Example Usage:

[!['flights' graph diagram](https://courses.codepath.org/course_images/tip103/unit10_session1/finding_all_reachable_destinations.png "'flights' graph diagram")](https://courses.codepath.org/course_images/tip103/unit10_session1/finding_all_reachable_destinations.png)

```
flights = {
    "Tokyo": ["Sydney"],
    "Sydney": ["Tokyo", "Beijing"],
    "Beijing": ["Mexico City", "Helsinki"],
    "Helsinki": ["Cairo", "New York"],
    "Cairo": ["Helsinki", "Reykjavik"],
    "Reykjavik": ["Cairo", "New York"],
    "Mexico City": ["Sydney"],
    "New York": ["Helsinki", "Reykjavik"]   
}

print(get_all_destinations(flights, "Beijing"))
print(get_all_destinations(flights, "Helsinki"))
```

Example Output:

```
['Beijing', 'Mexico City', 'Helsinki', 'Sydney', 'Cairo', 'New York', 'Tokyo', 
'Reykjavik']
['Helsinki', 'Cairo', 'New York', 'Reykjavik']
```

✨ AI Hint: Breadth First Search Traversal

_Key Skill: Use AI to explain code concepts_

To solve this problem, it may be helpful to understand both the **queue** data structure and **breadth first search** algorithm. To learn more about these concepts, visit the Queues section of the [Unit 3 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/3#!cheatsheet) and the Graph Traversal section of the [Unit 5 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/5#!cheatsheet).

If you still have questions, try explaining what you're doing, and ask an AI tool like ChatGPT or GitHub Copilot to help you understand what's confusing you. For example, you might ask:

_"I'm trying to understand how to use a queue to implement breadth first search, but I'm confused about why I wouldn't just use a list. Can you explain the difference?"_

Problem 4: Finding All Reachable Destinations II

You are a travel coordinator for CodePath Airlines, and you're helping a customer find all possible destinations they can reach from a starting airport. The flight connections between airports are represented as an adjacency dictionary `flights`, where each key is a destination, and the corresponding value is a list of other destinations that are reachable through a direct flight.

Given a starting location `start`, write a function `get_all_destinations()` that uses Depth First Search (DFS) to return a list of all destinations that can be reached from `start`. The list should include both direct and connecting flights and should be ordered based on the order in which airports are visited in DFS.

```
def get_all_destinations(flights, start):
    pass
```

Example Usage:

[!['flights' graph diagram](https://courses.codepath.org/course_images/tip103/unit10_session1/finding_all_reachable_destinations.png "'flights' graph diagram")](https://courses.codepath.org/course_images/tip103/unit10_session1/finding_all_reachable_destinations.png)

```
flights = {
    "Tokyo": ["Sydney"],
    "Sydney": ["Tokyo", "Beijing"],
    "Beijing": ["Mexico City", "Helsinki"],
    "Helsinki": ["Cairo", "New York"],
    "Cairo": ["Helsinki", "Reykjavik"],
    "Reykjavik": ["Cairo", "New York"],
    "Mexico City": ["Sydney"]   
}

print(get_all_destinations(flights, "Beijing"))
print(get_all_destinations(flights, "Helsinki"))
```

Example Output:

```
['Beijing', 'Mexico City', 'Sydney', 'Tokyo', 'Helsinki', 'Cairo', 'Reykjavik', 
'New York']
['Helsinki', 'Cairo', 'Reykjavik', 'New York']
```

💡 Hint: Depth First Search

This problem requires you to perform a depth first search traversal of a graph. If you need a primer on how to perform DFS on a graph, check out the unit cheatsheet.

  

Problem 5: Find Itinerary

You are a traveler about to embark on a multi-leg journey with multiple flights to arrive at your final travel destination. You have all your boarding passes, but their order has gotten all messed up! You want to organize your boarding passes in the order you will use them, from your first flight all the way to your last flight that will bring you to your final destination.

Given a list of edges `boarding_passes` where each element `boarding_passes[i] = (departure_airport, arrival_airport)` represents a flight from `departure_airport` to `arrival_airport`, return an array with the itinerary listing out the airports you will pass through in the order you will visit them. Assume that departure is scheduled from every airport except the final destination, and each airport is visited only once (i.e., there are no cycles in the route).

```
def find_itinerary(boarding_passes):
    pass
```

Example Usage:

```
boarding_passes_1 = [
                    ("JFK", "ATL"),
                    ("SFO", "JFK"),
                    ("ATL", "ORD"),
                    ("LAX", "SFO")]

boarding_passes_2 = [
                    ("LAX", "DXB"),
                    ("DFW", "JFK"),
                    ("LHR", "DFW"),
                    ("JFK", "LAX")]

print(find_itinerary(boarding_passes_1))
print(find_itinerary(boarding_passes_2))
```

Example Output:

```
['LAX', 'SFO', 'JFK', 'ATL', 'ORD']
['LHR', 'DFW', 'JFK', 'LAX', 'DXB']
```

💡 Hint: Pseudocode

One possible approach to this problem is to use a dictionary.

1. Create a dictionary that maps each deaprture airport to its corresponding arrival airport for efficient lookup.
2. Identify the starting airport. It is the only airport that is only a departure airport and never an arrival airport.
3. Trace the itinerary by following the mapping from departure to arrival until there are no more flights.

Problem 6: Finding Itinerary II

If you implemented `find_itinerary()` in the previous problem without using Depth First Search, solve it using DFS. If you solved it using DFS, try solving it using an alternative approach.

```
def find_itinerary(boarding_passes):
    pass
```

Example Usage:

```
boarding_passes_1 = [
                    ("JFK", "ATL"),
                    ("SFO", "JFK"),
                    ("ATL", "ORD"),
                    ("LAX", "SFO")]

boarding_passes_2 = [
                    ("LAX", "DXB"),
                    ("DFW", "JFK"),
                    ("LHR", "DFW"),
                    ("JFK", "LAX")]

print(find_itinerary(boarding_passes_1))
print(find_itinerary(boarding_passes_2))
```

Example Output:

```
['LAX', 'SFO', 'JFK', 'ATL', 'ORD']
['LHR', 'DFW', 'JFK', 'LAX', 'DXB']
```

💡 Hint: Pseudocode

One possible approach to this problem is to use Depth First Search. To use DFS:

1. Create an adjacency list where each airport is a key and its corresponding value is a list of destinations (flights) from that airport.
2. Identify the starting airport. It is the only airport that is only a departure airport and never an arrival airport.
3. Using the starting airport as your start point, begin a DFS traversal of the adjacency list. After visiting _all_ destinations for a given airport, add the airport to the itinerary.
4. Since airports are added only after visiting all connected destinations, the resulting itinerary is in reverse order. Reverse the itinerary and return the result.

Problem 7: Number of Flights

You are a travel planner and have an adjacency matrix `flights` with `n` airports labeled `0` to `n-1` where `flights[i][j]` indicates CodePath Airlines offers a flight from airport `i` to airport `j`. You are planning a trip for a client and want to know the minimum number of flights (edges) it will take to travel from airport `start` to their final destination airport `destination` on CodePath Airlines.

Return the minimum number of flights needed to travel from airport `i` to airport `j`. If it is not possible to fly from airport `i` to airport `j`, return `-1`.

```
def counting_flights(flights, i, j):
    pass
```

Example Usage:

```

# Example usage
flights = [
    [0, 1, 1, 0, 0], # Airport 0
    [0, 0, 1, 0, 0], # Airport 1
    [0, 0, 0, 1, 0], # Airport 2
    [0, 0, 0, 0, 1], # Airport 3
    [0, 0, 0, 0, 0]  # Airport 4
]

print(counting_flights(flights, 0, 2))  
print(counting_flights(flights, 0, 4))
print(counting_flights(flights, 4, 0))
```

Example Output:

```
1 
Example 1 Explanation: Flight path: 0 -> 2
3
Example 2 Explanation: Flight path 0 -> 2 -> 3 -> 4
-1
Explanation: Cannot fly from Airport 4 to Airport 0
```

💡 Hint: BFS or DFS?

This problem requires you to use either BFS or DFS. But which should you choose? Check out the _BFS vs DFS_ section of the unit cheatsheet or conduct your own research to determine which algorithm would best suit this problem.

Problem 8: Number of Airline Regions

CodePath Airlines operates in different regions around the world. Some airports are connected directly with flights, while others are not. However, if airport `a` is connected directly to airport `b`, and airport `b` is connected directly to airport `c`, then airport `a` is indirectly connected to airport `c`.

An airline region is a group of directly or indirectly connected airports and no other airports outside of the group.

You are given an `n x n` matrix `is_connected` where `is_connected[i][j] = 1` if CodePath Airlines offers a direct flight between airport `i` and airport `j`, and `is_connected[i][j] = 0` otherwise.

Return the total number of airline regions operated by CodePath Airlines.

```
def num_airline_regions(is_connected):
    pass
```

Example Usage:

```
is_connected1 = [
    [1, 1, 0],
    [1, 1, 0],
    [0, 0, 1]
]

is_connected2 = [
    [1, 0, 0, 1],
    [0, 1, 1, 0],
    [0, 1, 1, 0],
    [1, 0, 0, 1]
]

print(num_airline_regions(is_connected1))
print(num_airline_regions(is_connected2)) 
```

Example Output:

```
2
2
```

### Problem Set Version 2

Problem 1: The Feeling is MutualProblem 2: Network LookupProblem 3: Secret CelebrityProblem 4: Casting Call SearchProblem 5: Casting Call Search IIProblem 6: Copying Seating ArrangementsProblem 7: Gossip ChainProblem 8: Network Strength
````
# Session - 2

```
## Unit 5: Session 2

### Mock Interview | Graphs

In this session, students will continue to explore using Breadth First Search (BFS) and Depth First Search (DFS) algorithms to solve common graph problems. They will learn to manipulate the base algorithm and explore the different use cases of these two traversal algorithms.

You can find session recordings and more on the [resources tab](https://courses.codepath.org/courses/tip103/unit/5#!resources). Session slide decks are available on the [overview tab](https://courses.codepath.org/courses/tip103/unit/5#!overview).

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

Problem 1: Get Flight Cost

You are given an adjacency dictionary `flights` where for any location `source`, `flights[source]` is a list of tuples in the form `(destination, cost)` indicating that there exists a flight from `source` to `destination` at ticket price `cost`.

Given a starting location `start` and a final destination `dest` return the total cost of flying from `start` to `dest`. If it is not possible to fly from `start` to `dest`, return `-1`. If there are multiple possible paths from `start` to `dest`, return any of the possible answers.

```
def calculate_cost(flights, start, dest):
    pass
```

Example Usage:

[![`flights` graph diagram](https://courses.codepath.org/course_images/tip103/unit10_session2/get_flight_cost.png "`flights` graph diagram")](https://courses.codepath.org/course_images/tip103/unit10_session2/get_flight_cost.png)

```
flights = {
    'LAX': [('SFO', 50)],
    'SFO': [('LAX', 50), ('ORD', 100), ('ERW', 210)],
    'ERW': [('SFO', 210), ('ORD', 300)],
    'ORD': [('ERW', 300), ('SFO', 100), ('MIA', 400)],
    'MIA': [('ORD', 400)]
}

print(calculate_cost(flights, 'LAX', 'MIA'))
```

Example Output:

```
550
Explanation: There is a path from LAX -> SFO -> ORD -> MIA with ticket prices 50 + 100 + 400 = 550
960 would also be an acceptable answer following the path from LAX -> SFO -> ERW -> ORD -> MIA
```

✨ AI Hint: Weighted Graphs

_Key Skill: Use AI to explain code concepts_

This problem requires you to be familiar with weighted graphs. Learn more quickly by referencing the [Unit 5 Cheatsheet](https://courses.codepath.org/courses/tip103/unit/5#!cheatsheet)

To explore further, try asking an AI tool like ChatGPT or GitHub Copilot to explain the concept of weighted graphs, how they work, and how to implement them in Python.

💡 Hint: Depth First Search

This problem requires you to perform a depth first search traversal of a graph. If you need a primer on how to perform DFS on a graph, check out the unit cheatsheet.

Problem 2: Expanding Flight Offerings

CodePath Airlines wants to expand their flight offerings so that for any airport they operate out of, it is possible to reach all other airports. They track their current flight offerings in an adjacency dictionary `flights` where each key is an airport `i` and `flights[i]` is an array indicating that there is a flight from destination `i` to each destination in `flights[i]`. Assume that if there is flight from airport `i` to airport `j`, the reverse is also true.

Given `flights`, return the minimum number of flights (edges) that need to be added such that there is flight path from each airport in `flights` to every other airport.

```
def min_flights_to_expand(flights):
    pass
```

Example Usage:

```
flights = {
    'JFK': ['LAX', 'SFO'],
    'LAX': ['JFK', 'SFO'],
    'SFO': ['JFK', 'LAX'],
    'ORD': ['ATL'],
    'ATL': ['ORD']
}

print(min_flights_to_expand(flights))
```

Example Output:

```
1
```
Problem 3: Get Flight Itinerary

Given an adjacency dictionary of flights `flights` where each key is an airport `i` and `flights[i]` is an array indicating that there is a flight from destination `i` to each destination in `flights[i]`, return an array with the flight path from a given `source` location to a given `destination` location.

If there are multiple flight paths from the `source` to `destination`, return any flight path.

```
def get_itinerary(flights, source, destination):
    pass
```

Example Usage:

```
flights = {
    'LAX': ['SFO'],
    'SFO': ['LAX', 'ORD', 'ERW'],
    'ERW': ['SFO', 'ORD'],
    'ORD': ['ERW', 'SFO', 'MIA'],
    'MIA': ['ORD']
}

print(get_itinerary(flights, 'LAX', 'MIA'))
```

Example Output:

```
['LAX', 'SFO', 'ORD', 'MIA']
Explanation: ['LAX', 'SFO', 'ERW', 'ORD', 'MIA'] is also a valid answer
```

💡 Hint: Path Reconstruction

This problem requires you to reconstruct the path taken by either BFS or DFS. To reconstruct a path from BFS/DFS, we can keep track of each node's parent (the node from which it was discovered) during the search. After reaching the target, backtrack from the target node to the start using the parent pointers to trace the path.

Problem 4: Pilot Training

You are applying to become a pilot for CodePath Airlines, and you must complete a series of flight training courses. There are a total of `num_courses` flight courses you have to take, labeled from `0` to `num_courses - 1`. Some courses have prerequisites that must be completed before you can take the next one.

You are given an array `flight_prerequisites` where `flight_prerequisites[i] = [a, b]` indicates that you must complete course `b` first in order to take course `a`.

For example, the pair `["Advanced Maneuvers", "Basic Navigation"]` indicates that to take `"Advanced Maneuvers"`, you must first complete `"Basic Navigation"`.

Return `True` if it is possible to complete all flight training courses. Otherwise, return `False`.

```
def can_complete_flight_training(num_courses, flight_prerequisites):
    pass
```

Example Usage:

```
flight_prerequisites_1 = [['Advanced Maneuvers', 'Basic Navigation']]
flight_prerequisites_2 = [['Advanced Maneuvers', 'Basic Navigation'], ['Basic Navigation', 'Advanced Maneuvers']]

print(can_complete_flight_training(2, flight_prerequisites_1))
print(can_complete_flight_training(2, flight_prerequisites_2))
```

Example Output:

```
True
Example 1 Explanation: There are 2 flight training courses. To take *Advanced Maneuvers*, you must first complete *Basic Navigation*. This is possible.
False
Example 1 Explanation: There are 2 flight training courses. To take *Advanced Maneuvers*, you must first complete *Basic Navigation*, but to take *Basic Navigation*, you must first complete *Advanced Maneuvers*. This creates a cycle, making it impossible to complete all courses.
```

💡 Hint: BFS or DFS?

This problem requires you to use either BFS or DFS. But which should you choose? Check out the _BFS vs DFS_ section of the unit cheatsheet or conduct your own research to determine which algorithm would best suit this problem.

Problem 5: Reorient Flight Routes

There are `n` airports numbered from `0` to `n - 1` and `n - 1` direct flight routes between airports such that there is exactly one way to travel between any two airports (this network forms a tree). Last year, the aviation authority decided to orient the flight routes in one direction due to air traffic regulations.

Flight routes are represented by `connections`, where `connections[i] = [airport_a, airport_b]` represents a one-way flight route from airport `airport_a` to airport `airport_b`.

This year, there will be a major aviation event at the central hub (airport `0`), and many flights need to reach this hub.

Your task is to reorient some flight routes so that every airport can send flights to airport `0`. Return the minimum number of flight routes that need to be reoriented.

It is guaranteed that after the reordering, each airport will be able to send a flight to airport `0`.

```
def min_reorient_flight_routes(n, connections):
    pass
```

Example Usage:

```
n = 6
connections = [[0, 1], [1, 3], [2, 3], [4, 0], [4, 5]]

print(min_reorient_flight_routes(n, connections))
```

Example Output:

```
3
Explanation: 
- Initially, the flight routes are: 0 -> 1, 1 -> 3, 2 -> 3, 4 -> 0, 4 -> 5
- We need to reorient the routes [1, 3], [2, 3], and [4, 5] to ensure that every airport can send a flight to airport 0.
```
Problem 6: Find All Flight Routes

You are given a flight network represented as a directed acyclic graph (DAG) with `n` airports, labeled from `0` to `n - 1`. Your goal is to find all possible flight paths from airport `0` (the starting point) to airport `n - 1` (the final destination) and return them in any order.

The flight network is given as follows: `flight_routes[i]` is a list of all airports you can fly to directly from airport `i` (i.e., there is a one-way flight from airport `i` to airport `flight_routes[i][j]`).

Write a function that returns all possible flight paths from airport `0` to airport `n - 1`.

```
def find_all_flight_routes(flight_routes):
    pass
```

Example Usage 1:

[!['flight_routes_2' graph diagram](https://courses.codepath.org/course_images/tip103/unit10_session2/find_all_flight_routes_ex1.jpg "'flight_routes_2' graph diagram")](https://courses.codepath.org/course_images/tip103/unit10_session2/find_all_flight_routes_ex1.jpg)

```
flight_routes_1 = [[1, 2], [3], [3], []]

print(find_all_flight_routes(flight_routes_1))
```

Example Output 1:

```
[[0, 1, 3], [0, 2, 3]]
Explanation: 
- There are two possible paths from airport 0 to airport 3.
- The first path is: 0 -> 1 -> 3
- The second path is: 0 -> 2 -> 3
```

Example Usage 2:

[!['flight_routes_2' graph diagram](https://courses.codepath.org/course_images/tip103/unit10_session2/find_all_flight_routes_ex2.jpg "'flight_routes_2' graph diagram")](https://courses.codepath.org/course_images/tip103/unit10_session2/find_all_flight_routes_ex2.jpg)

```
flight_routes_2 = [[4,3,1],[3,2,4],[3],[4],[]]

print(find_all_flight_routes(flight_routes_2))
```

Example Output 2:

```
[[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]
```
```