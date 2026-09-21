---
type: class
input_kind: homework
status: sprout
created: 2026-09-20
updated: 2026-09-20
area:
  - "[[CSCI 4511W Board]]"
deadline: 2026-09-18
tags:
  - "#class"
  - "#Homework"
next: "Submit the Problems 1-3 PDF (check the late-policy window against the passed 9/18 due date first), then start the ps1.py code portion (Problems 4-5)"
---
# Problem Set 1 — Written Solutions
**Source:** AIMA (Russell & Norvig, 4th ed.) Ch. 2 — Intelligent Agents, pp. 36–63, per [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter - 2]]; cross-checked against the 9/14 (Lecture 02: Definitions, Agent Structure) and 9/16 (Lecture 03: Problem-Solving Agents) slide decks.
## Overview
Problems 1–3 are the written portion of PS1: classify a stochastic, partially observable variant of vacuum-world along four environment axes, then design and score the best possible Simple Reflex Agent and Model-Based Agent for it. Problems 4–5 are the coding portion, tracked separately in [[20_Progress/Degree/CSCI 4511W/Assignments/Code/ps1|Assignments/Code/ps1.py]]. Stated due date is 9/18; today is 9/20, so check the Board's late-work window before submitting — [[CSCI 4511W Board]] confirms up to one day late gets a penalty and anything later needs contacting course staff directly.
## Requirements
- [ ] Problem 1 (16 pts) — classify the environment on Fully/Partially Observable, Deterministic/Nondeterministic, Static/Dynamic, Discrete/Continuous, each with a 1-sentence justification.
- [ ] Problem 2 (4 pts) — design the best possible Simple Reflex Agent; state its approximate score and explain in 2-3 sentences.
- [ ] Problem 3 (4 pts) — design the best possible Model-Based Agent's plan; state its approximate score and explain in 2-3 sentences.
- Must submit: answers to 1-3 as a single PDF (any tool; LaTeX not required, but illegible handwriting can lose points).
- Must not do: collaborate with others, look up answers online, or post the problem/solution anywhere — this problem set is individual-only per the syllabus's collaboration policy.
## Solutions
### Problem 1 — Task-environment classification (16 pts)
- **Partially observable** — a percept reveals only the agent's own room and its status, not the other three rooms.
- **Nondeterministic (stochastic)** — movement fails 25% of the time, a quantified probability rather than an unspecified possibility.
- **Static** — rooms only change via the agent's own actions, never on their own.
- **Discrete** — rooms (4), room states (2), actions (6), and time (100 steps) are all enumerable.
### Problem 2 — Best Simple Reflex Agent (4 pts)
Acts only on (current room, status): Suck if dirty, else move to the next room in a fixed rotation. Since rooms stay clean once cleaned, it eventually cleans everything, but it can't detect completion, so it keeps moving needlessly for all 100 steps. It collects nearly the full +8/step clean bonus (~+800) but loses ~−1 on almost every step, netting ≈ **+700**.
### Problem 3 — Best Model-Based Agent (4 pts)
Same cleaning sweep, but a transition model plus tracked belief state let it know which rooms are already clean. Once all four are clean, it switches to Nop (no penalty) instead of continuing to move. Cleanup costs only a few −1 penalties (2–3 if starting centrally); afterward it banks +8/step for free. Score ≈ **+750–780** — better than the reflex agent because it can detect "done."
## Concepts used
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2 — Intelligent Agents]] — PEAS/environment-property axes (fully/partially observable, deterministic/stochastic, static/dynamic, discrete/continuous) drive Problem 1; simple-reflex vs. model-based agent architecture drives Problems 2-3.
## Post-submit reflection
- What failed first?
- What pattern repeats?
