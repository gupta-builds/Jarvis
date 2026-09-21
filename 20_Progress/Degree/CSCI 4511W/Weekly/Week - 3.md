---
type: class
input_kind: lecture
status: seed
created: 2026-09-21
updated: 2026-09-21
area:
  - "[[UMN Board]]"
tags:
  - "#class"
  - "#Lecture"
next: "Fill in the rest of Week 3's lecture capture (Lecture 03 9/16 and Lecture 04 9/21) beyond the Short Quiz 02 section"
---
# Week - 3
## What you must be able to do
- 
- 
## Key ideas (short)
- 
## Concepts created today
New concept notes spawned from this lecture. One per line.
- 
## Examples worth keeping
Concrete examples, cases, or numbers from the lecture. The example that made the concept click.
- 
## Lecture
<!-- Reproduce the lecture's structure with one ### section per major part. Use tabs for nested content. -->
### 1. Section title
## Textbook integration
<!-- State what the textbook adds beyond lecture. Link the actual chapter and name the missing framework or test. -->
> [!IMPORTANT]
> Main chapters:
## Short Quiz - 2
Sliding Tile Puzzle (8-puzzle) problem-formulation definitions. Sourced from `CSCI4511W Lecture 03` (Sep 16, 2026, "Problem-Solving Agents"), slides "Search Problem Definitions" / "Search Problem Definitions, continued" (`Actions(s)`, `Result(s,a)`, `Is-Goal(s)`, `Action-Cost(s,a,s')` definitions) and the same lecture's "Example Search Problem: Sliding Tile Puzzle" slide (3x3 grid, Start State / Goal State diagram). AIMA Ch. 3 ("Solving Problems by Searching") is the textbook source the lecture cites (Best-First Search pseudocode is labeled "Book figure 3.7"), but the local textbook PDF could not be opened in this session (exceeds the 20MB read limit and the PDF-page-render tool, poppler, is not installed on this machine) - answers below apply the lecture's own stated definitions to the puzzle's grid geometry, not a directly quoted textbook passage, and that gap is flagged per sub-answer below.

**Q1.1** - Max number of different actions `Actions(s)` could return for an 8-puzzle state: **4**. The lecture defines `Actions(s)` only abstractly ("actions available to the agent"); the number 4 is not stated verbatim in the slides. It follows from applying that definition to the puzzle's own 3x3 grid (shown in the same lecture's Sliding Tile Puzzle slide): moves are legal blank-tile shifts (up/down/left/right), and the max over all states occurs when the blank sits in the center square, which borders all four directions. Corner blank positions allow only 2, edge positions only 3 - the question asks for the maximum, so 4.

**Q1.2** - Max number of different states `Result(s,a)` could return for a specific state `s` and a specific legal action `a`: **1**. Lecture 03 defines `Result(s,a)` as the "description of what actions do" (the transition model) - for one fixed state and one fixed legal action, sliding a specific tile into the blank has exactly one outcome. The 8-puzzle as formulated in lecture is deterministic (not stated as a distinct axiom in the slides, but implied by `Result` being a single-valued function of `(s,a)` rather than a distribution).

**Q1.3** - Can the 8-puzzle have multiple solutions from a single initial state? **Yes.** Lecture 03 defines Solution as "path from initial state to a goal state" (not necessarily the optimal one). Since the blank can be moved back and forth (e.g., left then right returns to a visited state), many distinct action sequences reach the same goal state, so multiple solutions (and, in fact, multiple equal-length optimal ones via symmetric move orderings) exist. Not a number given verbatim in the lecture; this is a direct application of the lecture's own Solution definition to the reversibility of sliding-tile moves.

**Q1.4** - Changing `Action-Cost(s,a,s')` from 1 to 2 for every action: **(b) No effect on optimal solution path length or state space.** Doubling every action's cost is a uniform positive scalar multiple applied to every path, so it preserves the relative cost ordering between all paths - whichever action sequence was cheapest (shortest) before is still cheapest after, so the optimal solution's path length (number of actions) is unchanged, and the state space (the set of reachable states, defined independently of Action-Cost per Lecture 03's Search Problem Definitions) is unchanged. Only the numeric path cost of every solution doubles, which the quiz options don't list as a choice. (a), (c), (d) are not supported by the lecture's definitions of state space and optimal solution ("solution with lowest cost for all actions in its path").

**Q1.5** - Redefining `Is-Goal(s)` to accept any state where every tile is correctly adjacent (cyclically, mod the 1/8 endpoint exception) rather than one exact configuration: **(a) Optimal solution paths would be much shorter, in general.** Lecture 03 defines Is-Goal(s) as the goal test over the state space; broadening it to accept an entire equivalence class of configurations (all rotations/reflections preserving the correct relative tile ordering) means many more states in the same state space now satisfy Is-Goal, so the nearest accepted goal state from a given initial state is reachable in fewer moves on average. The state space itself is unchanged (b, c are not supported - state space is defined by states/actions, not by which states pass the goal test).

## Takeaways (questions to resolve)
- [ ] ⏬ 
- [ ] 
## Lecture-to-textbook synthesis
<!-- Use one highlighted definition, then mechanism, lecture example, textbook link, concept links, warning, and summary. -->
The synthesis entry that earns status: sprout. Fill after you've read the textbook section for this week.
- == ==
- *Mechanism:*
- Lecture example/scenario:
- Textbook connection: 
- Concept links: 
> [!WARNING]
> - 

> [!SUMMARY]
> - 
## Flashcards
#cards/csci4511w
