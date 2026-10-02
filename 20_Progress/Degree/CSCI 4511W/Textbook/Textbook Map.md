---
type: class
input_kind: textbook
status: sprout
created: 2026-09-09
updated: 2026-10-02
area:
  - "[[CSCI 4511W Board]]"
tags:
  - "#class"
  - "#Textbook"
next: "Run Chapter 5 Gemini Notebook prompts from [[20_Progress/Degree/Repetitive Things|Repetitive Things]] before Week 7 (10/19); add Lecture 07 connection to Chapter - 3 and Weeks 5–6 connections to Chapter - 4 once those lecture PDFs land"
---
# CSCI 4511W — Textbook Map
==Resolved 2026-09-15: the entire semester's reading list is one textbook, Russell & Norvig's *Artificial Intelligence: A Modern Approach* (4th ed.), Chapters 2-9 - the earlier "second uncited source for Chapter 7" concern was a scrambled-paste artifact, not a real gap.== Cross-referenced against the full Schedule section in [[CSCI 4511W Board]].
## Russell & Norvig — Artificial Intelligence: A Modern Approach (4th ed., Pearson 2020)
Full real chapter-to-module-to-date mapping, from the complete Canvas Modules page pasted 2026-09-15:

| Chapter | AIMA Topic | Canvas Module | Reading Due Dates |
|---|---|---|---|
| Ch 2.1-2.4 | Intelligent Agents | Intelligent Agents | 9/14 |
| Ch 3.1-3.4.4 | Solving Problems by Searching (uninformed) | Uninformed Search | 9/16, 9/21, 9/23 |
| Ch 3.5-3.6 | Solving Problems by Searching (informed) | Informed Search | 9/28, 9/30 |
| Ch 4.1.1-4.2 | Search in Complex Environments (local search) | Local Search | 10/5, 10/7 |
| Ch 4.3-4.4 | Search in Complex Environments (cont.) | Search in Complex Environments | 10/12 |
| Ch 5.1-5.6 | Adversarial Search and Games | Games | 10/19, 10/21, 10/26, 10/28 |
| Ch 6.1-6.5 | Constraint Satisfaction Problems | Constraint Satisfaction | 11/2, 11/4, 11/9, 11/11 |
| Ch 7.1-7.6 | Logical Agents (propositional logic) | Propositional Logic | 11/16, 11/18, 11/23 |
| Ch 8.1-9.3 | First-Order Logic; Inference in First-Order Logic | First-Order Logic | 11/30, 12/2, 12/7, 12/9 |
Every module name matches its AIMA chapter's real subject exactly - this is a clean, single-textbook mapping across the whole semester, not an inference. Chapters 1, 10, 11, 12 (named in the syllabus's "Chapters 1-12" claim) never get an assigned reading date anywhere in the real schedule - Chapter 1 is presumably covered by the 9/9 intro session without a formal reading assignment, and 10-12 simply aren't reached this semester despite being named as in-scope.
## Chapter Notes
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1 — Introduction to Artificial Intelligence]] — reviewed 2026-09-20; background framing, rational-agent approach, AI foundations/history, current capabilities, and risks.
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2 — Intelligent Agents]] — reviewed 2026-09-20; agent functions, rationality, PEAS, environment dimensions, agent architectures, learning, and representations.
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3|Chapter 3 — Solving Problems by Searching]] — reconciled 2026-10-02; covers §3.1–3.6: problem formulation, uninformed search (BFS/UCS/DFS/DLS/IDDFS), informed search (greedy/A*/weighted A*/memory-bounded), heuristic construction (relaxed problems, pattern databases, landmarks, learning).
- [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 4|Chapter 4 — Search in Complex Environments]] — reconciled 2026-10-02; covers §4.1.1–4.4.4: local search (hill climbing, simulated annealing, beam search, GAs), continuous optimization, nondeterministic AND-OR search, and belief-state search for partial observability.
## Not Russell & Norvig: "Reading: Vector Semantics"
Due 12/14, inside its own module ("Modern Approaches: Vector Semantics"), with no chapter number given anywhere - this is the one genuinely standalone reading of the semester, confirmed **not** part of AIMA (Russell & Norvig's real Chapter 7 is Logical Agents, not vector semantics - vector semantics/embeddings is standard NLP-textbook material, e.g. Jurafsky & Martin's *Speech and Language Processing*, but no such second text is named anywhere in the syllabus or Modules page). Treat this as a single supplementary paper/handout, not a chapter in any tracked textbook, until Canvas names its actual source.
## Standard
Each chapter note, once created, follows [[Textbook Template]] - one highlight anchor, bolded key concepts, a worked example, a connection back to the matching lecture, and flashcards.
## Status
Four chapter notes are now written. Chapters 1–2 were reviewed directly from the local 4th-edition PDF on 2026-09-20. Chapter 1 is background rather than a dated Canvas reading; Chapter 2 is the first scheduled textbook unit. Chapters 3 and 4 were generated from the NotebookLM prompts in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] (prompts added 2026-09-28) and reconciled on 2026-10-02: merged from 5-part (Ch.3) and 2-part (Ch.4) concatenated fragments into single well-formed notes, fixed frontmatter, stripped garbled citation artifacts, and added Key Concepts for all sections. Lecture connections for Lectures 07 (Ch.3 §3.6) and Weeks 5–6 (Ch.4) remain pending until those lecture PDFs land. The notes are self-contained source-grounded study notes; the weekly lecture-synthesis layer remains separate, per [[Weekly Standard]].
