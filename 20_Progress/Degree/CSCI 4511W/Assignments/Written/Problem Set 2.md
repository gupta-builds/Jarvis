---
type: class
input_kind: homework
status: sprout
created: 2026-10-09
updated: 2026-10-09
area:
  - "[[CSCI 4511W Board]]"
deadline: 2026-10-09
tags:
  - "#class"
  - "#Homework"
notes:
  - "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 3|Week 3]]"
  - "[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 4|Week 4]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]]"
  - "[[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 4|Chapter 4]]"
next: "Review and submit the concise written answers to Problems 4-5; coding Problems 1-3 are already submitted, per the user."
---
# Problem Set 2
## Overview
PS2 uses uninformed search on Romania, A* on sliding puzzles, and search representations for package ordering. Problems 1-3 are implemented in [[20_Progress/Degree/CSCI 4511W/Assignments/Code/ps2.py|ps2.py]]; Problems 4-5 have written answers below. The three-page assignment states October 9, 2026 as the due date, without a time. The user confirms that coding Problems 1-3 were completed and submitted correctly. The written answers to Problems 4-5 remain to be submitted.
## Sources and scope
The original source folder is `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W`. All source paths below are relative to it. Textbook references use the actual PDF page index, starting at 1; this locally stored textbook has 2,145 PDF pages, so these are not the printed-page references in older vault notes.

| Source                                                    | Verified material used                                                                                                                    |
| --------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| `Homework/ps2.pdf`, all three pages                       | Exact questions, state tuples, points, due date, and collaboration rule. All pages were extracted and visually inspected.                 |
| `Code/Homework/ps2.py`                                    | Instructor-provided example methods, required names, constructor usage, instrumentation, and `.solution()` return pattern.                |
| `Code/aima-python/aima/search.py`                         | Actual implementations of graph searches, iterative deepening, A*, `EightPuzzle`, `GraphProblem`, Romania map, and `InstrumentedProblem`. |
| `Code/aima-python/aima/utils.py`                          | Priority queue and imported NumPy dependency.                                                                                             |
| `CSCI 4511W Textbook.pdf`, §3.1.1, PDF pp. 150-152        | States, finite action sets, transition model, goals, and additive path costs.                                                             |
| Same textbook, §3.2.1, PDF pp. 157-158                    | Sliding-puzzle representation, blank movement, unit costs, and parity.                                                                    |
| Same textbook, §3.3-3.4, PDF pp. 164-187                  | Nodes, queues, repeated states, completeness, BFS, DFS, and iterative deepening.                                                          |
| Same textbook, §3.5.1-3.5.4, PDF pp. 189-201              | Greedy ordering, A*, admissibility, consistency, and weighted A*.                                                                         |
| Same textbook, §3.6-3.6.2, PDF pp. 212-216                | Numbered-tile Manhattan distance and admissibility through relaxation.                                                                    |
| Same textbook, §4.1-4.1.1, PDF pp. 234-238                | Complete-state optimization, objective functions, neighbors, and local minima.                                                            |
| `Lecture/CSCI4511W Lecture 03.pdf`, slides 10-17          | Problem formulation and the professor's best-first framework.                                                                             |
| `Lecture/CSCI4511W Lecture 04.pdf`, slides 3-20           | Node fields, goal tests, frontier ordering, and uninformed search.                                                                        |
| `Lecture/CSCI4511W Lecture 05.pdf`, slides 12-19          | Iterative deepening, positive action-cost bound, and successor generation.                                                                |
| `Lecture/CSCI4511W Lecture 06.pdf`, slides 4-32           | Greedy and A* evaluation functions and worked search traces.                                                                              |
| `Lecture/CSCI4511W Lecture 07.pdf`, slides 3-10 and 14-19 | Completeness, admissibility, weighted A*, Manhattan distance, and relaxed problems.                                                       |
The Board, Chapters 3-4, Weeks 3-4, and the existing search concept notes provide continuity. Lecture 07 is now present, although Week 4 still contains dated statements that it was missing on October 2. Its actual slides control this assignment's lecture claims. Lecture 02 was reviewed for context; its agent definitions do not change the PS2 solutions.
The source inventory contains `ps1.py`, `ps2.py`, and the AIMA repository, but no separate instructor-authored lecture `.py` files outside that repository. `ps1.py` already contains completed work, so its added solution comments cannot be attributed to the professor. The reliable coding patterns here are the supplied PS2 examples and the professor's Python-like pseudocode in the slides. No online sources were used.
## Requirements
The assignment totals 48 points. Each part below has a solution or implementation; the checkboxes track the student's review and submission, rather than claiming that generated work has been submitted.

| Part                             | Required deliverable                                                                                       | Where covered                              |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------------------ |
| 1a, 8 points shared with 1b      | Oradea to Vaslui; separate BFS, DFS, and IDS instrumented problems; return goal-test counts in that order. | `PS2.problem_1a`                           |
| 1b                               | Neamt to Lugoj; the same three searches and return order.                                                  | `PS2.problem_1b`                           |
| 2a, 8 points shared across 2a-2d | A* from `(4,0,1,5,8,2,7,6,3)` to the default goal, using the default heuristic.                            | `PS2.problem_2a`                           |
| 2b                               | A* from `(1,4,0,6,5,2,8,3,7)` to `(1,2,3,8,0,4,7,6,5)`, using the default heuristic.                       | `PS2.problem_2b`                           |
| 2c                               | A* from `(6,4,3,7,8,1,0,5,2)` to the same specified goal, using the default heuristic.                     | `PS2.problem_2c`                           |
| 2d                               | Implement `mhd(node)` for the specified goal and repeat 2c with that heuristic.                            | `mhd`, `PS2.problem_2d`                    |
| 3a, 8 points shared across 3a-3c | Accept every clockwise cyclic ordering of 1-8 around a central blank.                                      | `EasyEightPuzzle.goal_test`                |
| 3b                               | Supply an admissible default heuristic that is not identically zero.                                       | `EasyEightPuzzle.h`                        |
| 3c                               | Solve `(4,0,1,5,8,2,7,6,3)` with that subclass's default heuristic and return the path.                    | `PS2.problem_3c`                           |
| 4a, 12 points shared with 4b     | Give a greedy-search counterexample with an exactly correct heuristic.                                     | Written answer below.                      |
| 4b                               | Explain completeness of `g + 2h` in 2-3 sentences without assuming a finite state space.                   | Written answer and assumption check below. |
| 5a, 12 points shared with 5b     | Give a complete state formulation for package ordering.                                                    | Written answer below.                      |
| 5b                               | Explain how to generate slightly different successor states.                                               | Written answer below.                      |
- [ ] Review the written answers to Problems 4-5 before submitting.
- [x] Submit the modified `ps2.py` for Problems 1-3. The user confirms correct completion and submission.
- [ ] Submit written answers to Problems 4-5 using the assignment's actual submission instructions. The local PDF does not specify their file format or upload destination.
- [ ] Check whether a TA code review is assigned. The Board gives a general window of ten days after the due date, but this PDF does not assign a PS2 review.
The PDF requires individual work, forbids collaboration with others, looking up answers online, and posting problems or solutions to websites. It encourages office hours. It does not state a separate AI-tool policy; this draft does not establish one or represent submission as the student's own unaided work.
## Coding reasoning
### Problem 1: count actual goal tests
Each method creates three independent `InstrumentedProblem(GraphProblem(start, goal, romania_map))` instances, runs the required searches, and returns `(bfs.goal_tests, dfs.goal_tests, ids.goal_tests)`. Reusing one wrapper would accumulate the counts from different searches.
In this local library, `goal_tests` counts calls to `goal_test`, `succs` counts calls to `actions`, and `states` counts calls to `result`. The starter's printed `Su` explanation is imprecise: it is an expansion/successor-query counter, not the number of individual successor states. Only `goal_tests` belongs in the requested return tuple.
BFS tests newly discovered states, DFS tests popped nodes, and IDS repeatedly performs depth-limited searches. IDS can therefore make many more goal tests than the number of distinct cities. Preserve the supplied map and its neighbor order; changing them can change the observed counts.

| Method         | Verified return `(BFS, DFS, IDS)` |
| -------------- | --------------------------------- |
| `problem_1a()` | `(16, 10, 217)`                   |
| `problem_1b()` | `(20, 14, 1003)`                  |
These searches choose paths according to depth or stack order, not road distance. For example, 1a's BFS path costs 688 while its DFS path costs 656 in the library's road-distance units. This instance does not make DFS a generally optimal algorithm.
### Problem 2: row-major tuples and A*
Index `i` has row `i // 3` and column `i % 3`; `0` is the blank. `EightPuzzle.actions` returns moves of the blank, not directions in which a numbered tile moves. The constructors preserve every assigned initial and goal tuple. Parts 2a-2c use `astar_search(puzzle).solution()`; 2d supplies `h=mhd`.
For the fixed goal $G=(1,2,3,8,0,4,7,6,5)$, the Manhattan heuristic is
$$h(s)=\sum_{t=1}^{8}\left(|r_s(t)-r_G(t)|+|c_s(t)-c_G(t)|\right).$$
The code locates each numbered tile in the state and goal, then adds its row and column differences. It excludes the blank: one physical action moves a numbered tile and the blank together, so adding both distances could count that action twice. Each move can reduce the numbered-tile sum by at most one; reaching the goal reduces it to zero, which proves it is a lower bound. This is the relaxed-puzzle construction in §3.6.2 and Lecture 07.
For the initial state in 2c/2d, the distances for tiles 1 through 8 are `(3,3,0,2,1,3,1,1)`, totaling 14. The actual shortest solution takes 22 moves, so the initial estimate is a lower bound.
The supplied `EightPuzzle.h` counts every mismatching entry, including `0`. This differs from the textbook's admissible misplaced-tile heuristic, which explicitly excludes the blank. For example, `(1,0,3,8,2,4,7,6,5)` is one move from the assigned goal, but the supplied default returns 2. Parts 2a-2c still use the supplied default exactly as requested; their returned lengths were checked independently rather than assuming this default guarantees optimality.
Do not use the supplied `check_solvability` blindly for custom goals. It tests even inversion parity for the canonical goal, whereas a custom goal requires comparing the initial and goal parities. None of the solution methods relies on that helper.
### Problem 3: eight goals and a distance to the goal set
Read the outside squares clockwise in index order `(0,1,2,5,8,7,6,3)`. `EasyEightPuzzle.__init__` builds eight goals by choosing each possible first tile from 1 through 8 and placing consecutive values modulo 8 around that ring; the center remains `0`. `goal_test(state)` checks membership in those eight tuples. Counterclockwise orderings and states with the blank outside the center are rejected.
The default heuristic is the minimum numbered-tile Manhattan distance over the eight allowed goals:
$$h_{\mathrm{easy}}(s)=\min_{G\in\mathcal{G}}\sum_{t=1}^{8}\left(|r_s(t)-r_G(t)|+|c_s(t)-c_G(t)|\right).$$
To prove admissibility, let $G^*$ be a nearest reachable goal. The minimum cannot exceed the Manhattan estimate for $G^*$, and that estimate cannot exceed the true cost to $G^*$. Thus $h_{\mathrm{easy}}(s)\le h^*(s)$. Do not take the maximum over goals: distance to a more distant goal can overestimate the cost of reaching a nearer accepted goal.
It is also consistent. For neighboring states $s,s'$, choose a goal that minimizes the estimate at $s'$; the numbered-tile Manhattan distance to that fixed goal changes by at most one, so $h_{\mathrm{easy}}(s)\le 1+h_{\mathrm{easy}}(s')$. It is zero at each goal and is not identically zero; the assigned initial state's value is 9.
The starter's `problem_3c` docstring mentions a string representation, while the PDF asks for a solution path and the supplied example returns `.solution()`. This implementation follows the PDF and example and returns a list of blank-move actions. The original prompt text remains in the copied starter for reference.
## Written answers
### Problem 4a
Use directed edges $S\to A=100$, $A\to G=1$, $S\to B=1$, and $B\to G=2$. The exact heuristic is $h(S)=3$, $h(A)=1$, $h(B)=2$, and $h(G)=0$. Greedy chooses A, then G, returning cost 101 instead of the optimal cost 3 through B. It ignores the cost already paid, even when the remaining-cost estimate is perfect.
### Problem 4b
Yes, under the textbook's finite-branching model with $h\ge0$. On an optimal path of cost $C^*$, admissibility gives $g+2h\le2C^*$, while a depth-$d$ node has $g+2h\ge g>d\epsilon$. Only finitely many nodes can have priority at most $2C^*$, so a goal is eventually reached even in an infinite state space; optimality is not guaranteed.
### Problem 5a
Store each package's destination and weight in a table indexed by its unique ID. A state is a permutation of all IDs, representing the complete processing order; initially use $(0,1,\ldots,n-1)$. Minimize total time: 5 seconds for the first package, then 3 for a matching destination, otherwise 4 for weights within 2 ounces, otherwise 5. Assume the 3-second rule takes precedence when both match.
### Problem 5b
For each pair of positions, copy the ordering and swap the two package IDs to create a successor. This preserves every package exactly once and produces $n(n-1)/2$ neighboring states. Evaluate each successor using its total processing time; repeated swaps can reach any possible ordering.
## Work log and verification
On October 9, all three assignment pages were read and visually checked, the local search APIs and instructor-provided examples were inspected, and the relevant textbook sections and all available lecture decks were reviewed. Implementations were written into the existing Jarvis `Assignments/Code` directory. The external starter and AIMA library were retained as source material.
Verification used Python 3.12.14 and the actual local AIMA code with already cached NumPy. No packages, course sources, or answers were retrieved online. The checks called all seven required `PS2` methods, replayed every puzzle action through `EightPuzzle.result`, verified legal moves and final goals, and compared path lengths with independent reverse BFS distances.

| Part | Returned path length | Exact shortest length | Final state           |
| ---- | -------------------- | --------------------- | --------------------- |
| 2a   | 11                   | 11                    | `(1,2,3,4,5,6,7,8,0)` |
| 2b   | 14                   | 14                    | `(1,2,3,8,0,4,7,6,5)` |
| 2c   | 22                   | 22                    | `(1,2,3,8,0,4,7,6,5)` |
| 2d   | 22                   | 22                    | `(1,2,3,8,0,4,7,6,5)` |
| 3c   | 15                   | 15                    | `(8,1,2,7,0,3,6,5,4)` |
The exact returned action lists are recorded below. Different equal-cost paths are possible with other library versions or tie-breaking rules; the submission code computes these paths and does not hard-code them.
### problem_2a verified actions
```python
['RIGHT', 'DOWN', 'DOWN', 'LEFT', 'UP', 'LEFT', 'UP', 'RIGHT', 'RIGHT', 'DOWN', 'DOWN']
```
### problem_2b verified actions
```python
['DOWN', 'LEFT', 'DOWN', 'RIGHT', 'UP', 'LEFT', 'UP', 'RIGHT', 'DOWN', 'LEFT', 'LEFT', 'DOWN', 'RIGHT', 'UP']
```
### problem_2c verified actions
```python
['UP', 'RIGHT', 'RIGHT', 'UP', 'LEFT', 'DOWN', 'RIGHT', 'DOWN', 'LEFT', 'LEFT', 'UP', 'UP', 'RIGHT', 'DOWN', 'LEFT', 'DOWN', 'RIGHT', 'UP', 'RIGHT', 'UP', 'LEFT', 'DOWN']
```
### problem_2d verified actions
```python
['UP', 'RIGHT', 'UP', 'LEFT', 'DOWN', 'RIGHT', 'UP', 'RIGHT', 'DOWN', 'DOWN', 'LEFT', 'UP', 'UP', 'RIGHT', 'DOWN', 'LEFT', 'LEFT', 'UP', 'RIGHT', 'RIGHT', 'DOWN', 'LEFT']
```
### problem_3c verified actions
```python
['DOWN', 'LEFT', 'UP', 'RIGHT', 'RIGHT', 'DOWN', 'LEFT', 'LEFT', 'DOWN', 'RIGHT', 'UP', 'RIGHT', 'DOWN', 'LEFT', 'UP']
```
### Heuristic and goal-predicate checks
- `mhd` was nonnegative, admissible, and consistent on all 181,440 states reachable from its fixed goal and all 483,840 directed legal moves in that component.
- `EasyEightPuzzle.h` was nonnegative, admissible, and consistent on all 362,880 permutations and all 967,680 directed legal moves. Its eight goals span both parity components, so every valid puzzle state can reach at least one accepted goal.
- Enumerating every permutation showed that `goal_test` accepts exactly the eight intended clockwise rotations. It rejects all other permutations, including counterclockwise arrangements and misplaced blanks.
- The one-move default-heuristic counterexample was reproduced, and both paths in 4a were run through local AIMA search.
### Running the solution
The starter retains `sys.path.append('aima-python')`. Launch it from the original course `Code` folder, where `aima-python` is actually located, using a Python environment with NumPy available. Passing the absolute path of the Jarvis solution then uses the existing course library without copying it into the vault.
The verification session used the following equivalent local invocation with the installed interpreter and cached dependency explicitly supplied:
```powershell
@'
import sys, runpy
sys.dont_write_bytecode = True
sys.path[:0] = [r'D:\Apps\uv-cache\archive-v0\FfuuVk4Hct80mqXc',
               r'D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Code\aima-python']
runpy.run_path(r'D:\_Anant\20_Progress\Documents\Jarvis\20_Progress\Degree\CSCI 4511W\Assignments\Code\ps2.py', run_name='__main__')
'@ | & 'C:/Users/anant/AppData/Roaming/uv/python/cpython-3.12.14-windows-x86_64-none/python.exe' -
```
These environment paths are local verification details, not additional code to submit. The search methods return results; the supplied `main()` prints them. Do not replace the local library's default heuristic while answering the default-heuristic parts.
## Concepts used
- [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Uninformed Search|Uninformed search]] supplies the queue, stack, depth-limit, and goal-test distinctions in Problem 1.
- [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Informed Search|Informed search]] supplies A*, admissibility, consistency, and the distinction between greedy and weighted search in Problems 2-4.
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3]] grounds puzzle modeling, Manhattan distance, and search completeness.
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 4|Chapter 4]] grounds the complete permutation state, objective function, and swap neighborhood in Problem 5.
## Submission and post-submit reflection
The user confirms that coding Problems 1-3 were completed and submitted correctly. Written Problems 4-5 remain open. No exact submission timestamp, receipt, grade, or code-review completion has been supplied.
- [ ] After feedback, record the first incorrect assumption or result and the evidence that exposed it.
- [ ] Record feedback on the written reasoning and the package-rule precedence.
- [ ] Record submission and code-review completion when they actually occur.
