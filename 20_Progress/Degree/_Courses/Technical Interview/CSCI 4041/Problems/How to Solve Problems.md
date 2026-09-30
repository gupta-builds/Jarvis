---
type: evergreen
status: seed
created: 2026-09-29
tags:
  - technical-interview
  - rules
notes:
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Weekly Set|Weekly Set]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/Problems Solver|Problems Solver]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]]"
next: "Revise Rule 2 into short UMPIRE notes once enough problems have been solved the long way to know what shortens safely"
---
# How to Solve Problems
==No problem gets code before it gets read, understood, and traced back to where the underlying idea was actually taught.==
This is the hard-rule set every problem solved under [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Weekly Set|Weekly Set]] and [[20_Progress/Degree/_Courses/Technical Interview/Problems Solver|Problems Solver]] follows, no exceptions while these three rules stand. It is a living file - it gets tightened and added to as real problems expose gaps in it, not written once and forgotten.
## Rule 1 — Read First, Research Second, Then Think
Read the problem statement in full, twice, before forming any opinion about the approach. Do not skim for the pattern and jump to code. Once the problem is actually understood, research it through [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]] and the underlying [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/CSCI 4041 Board|CSCI 4041]] weekly/textbook/concept notes for the topic it belongs to — find what the textbook and the lecture already established about this exact family of problem before inventing an approach from scratch. Only after that research is the actual solution thought through, on paper or in the head, before any code gets written.
## Rule 2 — Solve With UMPIRE, Every Time
Every problem gets broken down with the full UMPIRE method before code — this is what makes the problem's shape visible instead of guessed at, and it stays the full six-step version until enough problems have been solved this way that a shorter personal shorthand is actually earned, not assumed:
- **U**nderstand — restate the problem in your own words; identify inputs, outputs, and constraints; ask what's actually being asked before what's being tested.
- **M**atch — name the pattern or data structure this resembles from CSCI 4041 material (two pointers, DP, graph traversal, etc.) and cite which note it's coming from.
- **P**lan — sketch the approach in pseudocode or plain English before touching real code; state the expected time/space complexity up front.
- **I**mplement — write the real code only once the plan is set, not as a way of discovering the plan.
- **R**eview — trace through the code by hand against the plan and at least one example; check edge cases explicitly rather than assuming they're covered.
- **E**valuate — state the actual final time/space complexity and whether it matches the Plan step's estimate; if it doesn't, say why.
## Rule 3 — Human Code, Explained, Rooted
Every line of code is written by hand — no AI-generated solutions, ever, for a problem logged under this system. Comments are short but genuinely communicative: they explain *why* a non-obvious step exists, not *what* the syntax does. Every solved-problem note carries a written explanation of the approach, interlinked to the exact CSCI 4041 week/textbook/concept note the underlying idea traces back to, and interlinked to the exact resource the problem itself was pulled from (a [[20_Progress/Degree/_Courses/Technical Interview/Problems Solver|Problems Solver]] resource, a Grind 75 topic page, a company-tagged CSV row) so the root of both the problem and the idea used to solve it stays traceable.
## Status
Three rules, unrevised since first written 2026-09-29. Nothing has been solved under this system yet to know which parts survive contact with real problems.
