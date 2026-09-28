
# Prompts
## Notebook
Gemini Notebook (the July 2026 rename of NotebookLM) runs on the Gemini 3.5 model family with no user-facing model picker — Google folded the education-tuned LearnLM behavior into the default Gemini Notebook experience rather than exposing it as a setting, which is why there was nothing to configure. [Same tool, new name: NotebookLM is now Gemini Notebook](https://it.rutgers.edu/2026/09/10/same-tool-new-name-notebooklm-is-now-gemini-notebook/), [NotebookLM April 2026 Update: New Features, Gemini Model, and Power-User Guide](https://leadershipinchange.com/p/gemini-notebooklm-ai-research-2026)

Workflow: fresh Gemini Notebook chat per chapter, upload that chapter's sources, paste the filled prompt below, save the output as the chapter note in `20_Progress/Degree/[COURSE]/Textbook/`. No chat memory carries over — if continuity with a prior chapter's terminology matters, upload that prior chapter's saved `.md` note as an extra source and say so in the prompt.

**Character limit, confirmed 2026-09-21:** Gemini Notebook's paste box rejects the single-shot ~5,590-character prompt below the master template's full length. A ~3,798-character version (cutting FORMATTING RULES, VOCABULARY RECONCILIATION, OUTPUT CONTRACT, and the content-density mandate) went through, and the output was noticeably thinner for it. Do not cut instructions to fit — split the chapter into two or three prompts fed into the **same** Gemini Notebook chat instead, each kept under ~3,000 characters. Every rule stays in every part; only the section SCOPE shrinks.

### Master prompt (reusable — fill the brackets each week, for any future course)
```
You are producing a source-grounded study note for a university course, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy on essays/coding does not apply, but you must still never invent facts beyond the attached sources.

SOURCES AND PRIORITY
1. PRIMARY, load-bearing source: [TEXTBOOK NAME], Chapter [N] — "[CHAPTER TITLE]". The note's structure and depth come from this chapter, in the book's own order.
2. SECONDARY, emphasis source: [LECTURE FILE NAME(S)]. Use this only to decide what to expand, which vocabulary/function names/examples the professor used verbatim, what the professor has NOT yet covered, and — importantly — whether the professor pulled in content that technically belongs to a different chapter (flag this explicitly, don't silently fold it into the wrong chapter's note).
3. BACKGROUND, non-content source: [DISCUSSION/POLICY FILE NAME]. Do not summarize this as chapter content — it is course-policy context only.

SCOPE
Cover every part of this chapter that discusses these real functions/concepts, taken from the actual lecture: [LIST OF REAL FUNCTION NAMES / CONCEPTS]. Find the book's own subsection numbers and titles yourself from the uploaded PDF — do not assume any subsection numbering I give you is correct if it conflicts with what you see in the source.

STRUCTURE — output exactly these headings in this order, nothing added or removed:
# [Chapter Title]
## Chapter Summary
One sentence claim with exactly one ==highlighted== phrase, then "*Mechanism:*" explaining how the claim works.
## Key Concepts
Every named term from the chapter, **bolded** on first use, one line each: what it means and why it matters to the chapter's argument.
## Full Reading Notes
One ### subheading per numbered subsection, using the book's own subsection numbers and titles verbatim. Every distinct claim, example, and piece of reasoning in that subsection must appear in some form — if I could learn something from re-reading the original PDF that isn't in your note, the note has failed. Reproduce named examples, numbered lists, function signatures, and code excerpts in full (as fenced code where the book gives code), don't compress into "etc."
## Worked Example
One end-to-end example (use the chapter's own running example if it has one) that ties the whole section's concepts together.
## Connections
- Lecture: what the lecture(s) emphasized from this material, which real function names/examples appeared on slides vs. only in the book, and whether the lecture pulled in content that technically belongs to a different chapter (name that chapter).
- Textbook: nothing to fill here yet, leave the line as "(pending next chapter)".
## Open Questions
3–5 items as Markdown tasks ("- [ ] ...") — genuine unresolved questions or self-test prompts a student should be able to answer after really understanding this material, not busywork.
## Flashcards
5–8 cards testing mechanisms and contrasts, not labels. Format: "Question::Answer #cards/ai" one per line, or multiline with "?" separator for longer answers.

FORMATTING RULES (violating these is a failure, not a style choice)
- Zero blank lines between a heading and its first line of content, and zero blank lines between consecutive list items or sections.
- ==highlight== markers: exactly one per major ## heading, reserved for the single most important definitional claim in that section.
- **bold**: named concepts/functions/terms on first introduction only, not general emphasis.
- *label:* italics for sub-category intro labels like *Mechanism:* or *Pitfall:*.
- No marketing or filler language: avoid words like "transformative," "powerful," "seamless," "leverage," "comprehensive," "unlock," "landscape," "journey" — say the actual mechanism instead.
- No sentence that could be pasted into a generic study-guide site unchanged. Every sentence should carry a mechanism, example, contrast, or explicit uncertainty.
- Cite page numbers for direct definitions or close paraphrases, in parentheses.

OUTPUT CONTRACT
Return the entire note as a single fenced Markdown code block (```markdown ... ```) so nothing gets reinterpreted by the chat UI when copied into Obsidian. Do not add commentary before or after the code block.

Before answering, silently verify: every numbered subsection in the scope has its own ### heading; every bolded term is actually defined; the highlight count per ## section is exactly one; the code block is the entire response.
```

## Codex
Second half of the two-set workflow: Notebook (above) builds the per-lecture textbook chapter notes; Codex builds the weekly synthesis note that fuses that lecture material with the transcript. Run: `codex` CLI, model dictated originally as "gpt 5.6 sol medium effort" — not a real slug, almost certainly a garbled **gpt-5.1-codex, reasoning effort: medium**; confirm the exact model string your own `codex` install exposes before running, this note does not guess further. Unlike the Notebook prompts, Codex has real file read/write access in this vault — the prompt below has it write the finished note straight to `Week - N.md` rather than returning a blob to hand-paste.

**Order of operations:** run this only after that week's Notebook prompts have already landed the matching `Lecture - N.md` / `Chapter - N.md` textbook notes — the weekly prompt cites those notes by path for the Textbook integration and synthesis sections rather than re-deriving textbook content itself, and has nothing real to cite if they don't exist yet.

**Granularity, on purpose different from Notebook's:** one prompt per **week**, not per lecture, and never split into parts — the whole week's transcript(s) go into a single run. Codex's context and file access make the Notebook char-limit workaround (splitting a single chapter into 2-3 chats) unnecessary here. The discipline that replaces it: every claim in `## Lecture` must trace to the transcript, every claim in `## Textbook integration` must trace to the already-landed textbook note — never to Codex's own general knowledge of the subject, even where that knowledge happens to be correct, because the point of the note is capturing what THIS professor said and what THIS book covered, not a generically correct treatment.

### Master prompt (reusable — fill the brackets each week, for any future course)
```
<role>You are filling in one week's lecture-synthesis note inside a university student's personal Obsidian vault, for personal study only — not a graded submission, so course AI-use policy on graded work does not apply, but never invent facts beyond the attached sources; where a source is silent, leave the template's placeholder rather than guessing. You have file read/write access in this repo — use it, don't just print output.</role>
<sources>
PRIMARY (lecture): [TRANSCRIPT FILE PATH(S) — every transcript covering this week, full path, real date each one covers. If a transcript spans lecture content from an adjacent week (recap, or the professor running behind), say so rather than force-fitting it into only this week's note].
SECONDARY (textbook): [PATH(S) to the already-landed Lecture/Chapter note(s) in Textbook/ for the lecture(s) this week covers — these supply the Textbook integration delta; do not re-derive textbook content from general knowledge of the subject].
STANDARD: [[Weekly Standard]] and [[Week Template]] govern every heading below — read both in full before writing; they are the content contract, not just a formatting guide.
DESTINATION: [PATH TO Week - N.md]. If the file doesn't exist yet, create it from [[Week Template]]'s frontmatter first. If it exists, preserve its frontmatter exactly (never remove or rename keys) and replace only the body.
</sources>
<process>Read every transcript for the week in full before writing — these are real spoken lecture, not slides, so structure is conversational and topic breaks don't line up with file boundaries; find the real topic breaks yourself rather than assuming one transcript file equals one lecture-numbered topic. Read the landed textbook note(s) in full. Cross-check explicitly: does the transcript cover material the landed textbook note doesn't have yet (professor ahead of the book), or does the book cover something not yet lectured? State that delta plainly in Textbook integration rather than smoothing over it.</process>
<scope>Cover every real topic, worked example, derivation/proof step, and aside-with-actual-content from this week's transcript(s) — skip pure logistics/scheduling banter, but keep anything the professor flagged as testable, foundational, or a recurring theme: [LIST THE WEEK'S REAL LECTURE NUMBERS/TOPICS]. Reproduce derivations, proofs, and worked examples in full, in the professor's own order and notation — if I could learn something from re-listening to the lecture that isn't in the note, the note has failed.</scope>
<output_structure>
Fill every heading [[Week Template]] defines, in order, for real week number [N]:
## What you must be able to do — objective bullets, the week's textbook chapter/lecture linked first
## Key ideas (short) — 3-6 compressed claims, bolding the named concept and the key contrast word
## Concepts created today — new [[Concept - ]] links this week's material justifies, or state plainly that none were needed
## Examples worth keeping — real worked examples/cases from the transcript, never invented ones
## Lecture — one `### N. Title` per real topic break in the transcript, using real date(s); reproduce derivations/proofs/code/examples in full, tab-indenting sub-content
## Textbook integration — the delta beyond lecture, sourced from the landed Lecture/Chapter note(s), linked, stating explicitly any book-ahead-of-lecture or lecture-ahead-of-book gap found during cross-check
## Takeaways (questions to resolve) — 2-5 genuine `- [ ]` open questions answerable by a follow-up read or drill
## Lecture-to-textbook synthesis — the exact six-part shape from [[Weekly Standard]]: one `==highlight==` (the note's only one), `*Mechanism:*`, lecture example/scenario, textbook connection, concept links, then `> [!WARNING]` (the real common confusion/failure mode) and `> [!SUMMARY]` (one sentence on what the week is really about)
## Flashcards — 5-8+ cards under `#cards/[course-slug]`, testing mechanisms and contrasts, not labels
</output_structure>
<formatting_rules>Follow [[Weekly Standard]]'s Per-Heading Standard exactly — **bold** named concepts/terms/functions on first use, `$...$` for math/code notation, exactly one `==highlight==` in the entire note (inside the synthesis section only). No marketing or filler language; no sentence that could describe any course's generic version of this topic — every sentence should carry this professor's real phrasing, example, or a real book citation.</formatting_rules>
<output_contract>Write the result directly to [DESTINATION PATH] via file edit, preserving frontmatter. Then update `Weekly Board.md`'s Map section with one real sentence for this week, per [[Week Standard]]. Report back in chat: which headings got real sourced content vs. which were left as an honest placeholder because neither source covered them, plus any lecture/textbook delta found during the cross-check.</output_contract>
```

# CSCI 4511W — Chapter 3 & Weekly Note Prompts
Written 2026-09-28, Week 4 of the semester, after reading [[CSCI 4511W Board]]'s full schedule, the [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]], both landed chapter notes ([[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]], [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2]]), [[Weekly Standard]], [[Textbook Standard]], [[Week Template]], and every real lecture PDF in the source folder (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Lecture\`) through Lecture 06 — including the new Lecture 06 (Sep 28, "Informed Search") that prompted this pass. Chapter 3 has no note yet; it covers the whole AIMA search unit across Weeks 2–4 (§3.1–3.6). Two prompts split it exactly on the Board's own reading-date boundary: Part 1 is everything assigned 9/16–9/23 (uninformed search), Part 2 is everything assigned 9/28–9/30 (informed/heuristic search). Two more prompts pre-build Chapter 4 (§4.1.1–4.4, Weeks 5–6) now, so the course stays read-ahead of the week it's due — matching the [[CSCI 4511W Workflow]] rule that textbook notes land before the lecture whenever the source is available. Chapter 4 has no matching lecture file yet (Lecture 07+ isn't released), so both of its prompts are textbook-only and flagged to re-run once a lecture PDF lands.
## Textbook Reading Prompts (Gemini Notebook)
Same workflow as the master Notebook prompt above: one fresh Gemini Notebook chat for Chapter 3 (both parts, same chat, same file, matching the char-limit split rule already documented above), a second fresh chat for Chapter 4. Upload the sources named in each `<sources>` block, paste the prompt, save the output as `20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3.md` / `Chapter - 4.md`.
### Chapter 3, Part 1 of 2 — Problem Formulation & Uninformed Search (AIMA §3.1–3.4.4)
```
<role>You are an expert AI teaching assistant working through Russell & Norvig's AIMA 4th edition with a student who already has Chapter 2's agent vocabulary (PEAS, rational agent, agent program) but is new to search. Define every new term at first use and explain mechanism, not just label.</role>
<sources>
PRIMARY: `CSCI 4511W Textbook.pdf`, Chapter 3, sections 3.1 (Problem-Solving Agents), 3.2 (Example Problems), 3.3 (Search Algorithms), 3.4 (Uninformed Search Strategies: 3.4.1 breadth-first, 3.4.2 Dijkstra's/uniform-cost, 3.4.3 depth-first, 3.4.4 depth-limited & iterative-deepening) — upload this file. Scope stops at 3.4.4; ignore 3.4.5 bidirectional search and everything from 3.5 onward (that is Part 2, a separate prompt in this same chat).
SECONDARY (what's actually been taught — upload if available, otherwise rely on the transcript below): Lecture 03 (Sep 16, "Problem-Solving Agents") introduces the problem-solving process (goal formulation → problem formulation → search → execution), the search-problem definitions State space / Initial state / Is-Goal(s) / Actions(s) / Result(s,a) / Action-Cost(s,a,s') / Path / Solution / Optimal Solution, the sliding-tile-puzzle example (3x3 grid, Start/Goal states), and Best-First Search pseudocode the slides label "Book figure 3.7" (Node class, frontier as a PriorityQueue(order=f), a reached dict, an expand() generator). Lecture 04 (Sep 21) derives Breadth-First Search from that same framework by setting f(n)=0 (PriorityQueue acts like a Queue), fixes an early-goal-test bug by moving the goal check inside the expand loop, defines the four evaluation metrics (Completeness, Cost-Optimality, Time Complexity, Space Complexity), then derives Depth-First Search by setting f(n)=-n.path_cost (acts like a Stack) and removing the reached dict so states can be revisited. Lecture 05 (Sep 23) fills in the analysis table — BFS: complete if finite state space, cost-optimal if action costs constant & positive, O(b^d) time and space; DFS: complete only if no cycles and finite, never cost-optimal, O(b^m) time, O(mb) space; DLS (depth-limited): never complete, never cost-optimal, O(b^l) time, O(lb) space; IDDFS: complete if finite, cost-optimal if constant costs, O(b^d) time, O(db) space (b=branching factor, d=depth of optimal solution, m=max path length, l=depth limit) — then introduces Uniform-Cost Search (f(n)=n.path_cost, assuming every action cost exceeds some ϵ>0), gives the real expand() function using Actions(s)/Result(s,a)/Action-Cost(s,a,s'), and a worked UCS tree example (nodes A-O with real edge weights).
Cite both the book's own figure numbers/proofs AND the lecture's Python framing — flag explicitly anywhere the lecture's single-framework presentation (every algorithm = Best-First Search with a different f) simplifies or diverges from how the book presents each algorithm.
</sources>
<process>Read the uploaded chapter fully before writing. Find the book's own real subsection numbers and titles from the PDF itself — verify they match the numbering given above and flag any mismatch rather than silently trusting either source.</process>
<scope>Cover, in the book's own order: 3.1 the problem-solving agent's four-step process and the static/fully-observable/known/discrete/deterministic assumption it relies on; 3.2 the book's own formal problem definition (state space, initial state, actions, transition model, goal test, path cost) applied to the book's own named example problems — reproduce the book's actual examples (not only the lecture's sliding-tile one), and flag if the lecture's puzzle differs from the book's; 3.3 the book's Best-First-Search algorithm, its real figure number, the node data structure, frontier/reached, and the book's own definitions of completeness/cost-optimality/time/space complexity in terms of b, d, m; 3.4.1–3.4.4 each uninformed strategy's real mechanism plus the exact conditions under which it is complete/cost-optimal and its real time/space complexity as the book proves it — flag explicitly anywhere the lecture's completed table differs from what the book states.</scope>
<output_structure>
# Chapter - 3 — Solving Problems by Searching (Part 1: Uninformed Search)
## Chapter Summary
## Key Concepts
## Full Reading Notes (one ### per real book subsection: 3.1, 3.2, 3.3, 3.4.1, 3.4.2, 3.4.3, 3.4.4)
## Worked Example (the book's own example problem worked end-to-end through one uninformed strategy)
## Connections (state plainly: lecture used the sliding-tile puzzle and a from-scratch Python Best-First framework as its running vehicle; note every point where lecture's framing adds to, simplifies, or diverges from the book's own pseudocode/proofs)
## Open Questions (3-5, testing exact complexity/completeness conditions)
## Flashcards (6-8, #cards/csci4511w)
</output_structure>
<formatting_rules>One blank line between blocks. Exactly one ==highlight== per ## section, on the single most important definitional claim. **Bold** terms on first use only. *Label:* italics for sub-labels. Cite real page numbers for definitions/proofs. No filler or marketing language. Reproduce pseudocode as fenced code exactly as the book gives it.</formatting_rules>
<output_contract>Return the entire note as one fenced markdown code block, nothing outside it. Before answering, verify: every real subsection 3.1-3.4.4 has its own ### heading; the highlight count per ## section is exactly one; the lecture-divergence note is present in Connections.</output_contract>
```
### Chapter 3, Part 2 of 2 — Informed (Heuristic) Search (AIMA §3.5–3.6)
```
<role>Same role as Part 1 — same Gemini Notebook chat, continuing the same Chapter 3 note.</role>
<sources>
PRIMARY: `CSCI 4511W Textbook.pdf`, Chapter 3, sections 3.5 (Informed/Heuristic Search Strategies: 3.5.1 greedy best-first, 3.5.2 A* search including admissibility/consistency and the optimality proof, 3.5.3 search contours, 3.5.4 satisficing search/weighted A*, 3.5.5 memory-bounded search — IDA*, RBFS, SMA*, 3.5.6 bidirectional heuristic search) and 3.6 (Heuristic Functions: 3.6.1 effect of heuristic accuracy, 3.6.2 generating heuristics from relaxed problems, 3.6.3 pattern databases, 3.6.4 landmarks, 3.6.5-3.6.6 learning heuristics) — already uploaded in this chat.
SECONDARY (emphasis — covers 3.5.1-3.5.2 only): Lecture 06 (Sep 28, "Informed Search") reviews BFS/IDDFS/UCS as "uninformed," defines a heuristic h(n) as an estimate of a node's distance to the goal, Greedy Best-First as f(n)=h(n), and A* as f(n)=g(n)+h(n) where g(n) is path cost. It works two full worked examples step-by-step (frontier/reached shown at every expand): a 15-node tree (A-O, labeled h(n) values) run once under Greedy and once under A*, reaching different goals/paths from the same tree; and a Minnesota-cities exercise (Crookston/Duluth/Morris/Minneapolis/St. Paul/Rochester, real road distances, straight-line-distance heuristic h_SLD to Rochester). It closes with unanswered discussion questions on A*'s completeness/cost-optimality conditions and its time/space complexity — treat these as genuinely open in the lecture, to be answered from the book's proofs, not from the lecture itself.
No lecture file exists yet for 3.5.3-3.6.6 (Lecture 07, Sep 30, not yet in the source folder as of this prompt's writing) — cover that material from the book alone and say so plainly in Connections rather than inventing lecture emphasis.
</sources>
<process>Read the full chapter before writing. Use the book's own real subsection numbers/titles, verified against the PDF.</process>
<scope>Cover, in the book's order: 3.5.1-3.5.2 greedy best-first and A* exactly as the lecture introduced them, then the book's fuller treatment — admissibility, consistency, and the book's proof that A* with a consistent heuristic is cost-optimal (answer the lecture's own open discussion questions here, sourced from the proof, not guessed); 3.5.3-3.5.6 search contours, weighted A*/satisficing search, the memory-bounded variants (IDA*, RBFS, SMA*) and their real trade-offs, and bidirectional heuristic search; 3.6.1 how heuristic accuracy (effective branching factor, dominance) changes search performance; 3.6.2-3.6.4 generating heuristics from relaxed problems, pattern databases, and landmarks, each with the book's own worked example; 3.6.5-3.6.6 the book's brief treatment of learning heuristics.</scope>
<output_structure>
## Full Reading Notes (continued — one ### per real subsection: 3.5.1 through 3.5.6, 3.6.1 through 3.6.6; do not repeat Part 1's headings)
## Worked Example (reproduce the lecture's own tree-example Greedy run AND A* run side by side — same tree, different f(n) — showing where they diverge; then note the Minnesota-cities exercise as a second real worked case)
## Connections (answer the lecture's open A*-completeness/cost-optimality/complexity questions using the book's proof; flag that 3.5.3-3.6.6 currently has no matching lecture, pending Lecture 07)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w — at least one card per named heuristic-generation method)
</output_structure>
<formatting_rules>Identical to Part 1.</formatting_rules>
<output_contract>Return the continuation as one fenced markdown code block, nothing outside it, not repeating Part 1's headings. Verify every subsection 3.5.1-3.6.6 has its own ### heading and the A* discussion questions are answered with a real citation.</output_contract>
```
### Chapter 4, Part 1 of 2 — Local Search & Optimization (AIMA §4.1.1–4.2) — future chapter, no lecture yet
```
<role>Same expert-AI-TA role as the Chapter 3 prompts. This is a pure textbook read-ahead — no lecture has happened yet, so teach directly from the book, precisely, without inventing what a professor might emphasize.</role>
<sources>
PRIMARY: `CSCI 4511W Textbook.pdf`, Chapter 4, sections 4.1 (Local Search and Optimization Problems: 4.1.1 hill-climbing search, 4.1.2 simulated annealing, 4.1.3 local beam search, 4.1.4 evolutionary/genetic algorithms) and 4.2 (Local Search in Continuous Spaces) — upload this file.
SECONDARY: none available. Per [[CSCI 4511W Board]]'s schedule this is Week 5 reading (Mon 10/5 = §4.1.1-4.1.3, Wed 10/7 = §4.1.4-4.2); as of this prompt's writing (2026-09-28) no Lecture 07+ PDF exists in the source folder. Write the Connections section's lecture line as "(pending — no lecture PDF landed yet, re-run this chat once Week 5's lecture PDF is available and add the delta)" rather than guessing what will be emphasized.
</sources>
<process>Read the full sections before writing. Use the book's own real subsection numbers/titles.</process>
<scope>Cover, in the book's order: 4.1.1 hill-climbing and its real named failure modes (local maxima, ridges, plateaux/shoulders) and the standard fixes (random-restart, sideways moves); 4.1.2 simulated annealing's real mechanism (the temperature schedule, the probability of accepting a worse move) and why it can escape local maxima that hill-climbing cannot; 4.1.3 local beam search and how it differs from running k random-restart hill-climbs independently (shared information between the k states) plus its stochastic-beam-search variant; 4.1.4 evolutionary/genetic algorithms — population, fitness function, selection, crossover, mutation, and the book's own worked example (if it gives one, e.g. 8-queens); 4.2 local search in continuous state spaces — gradient ascent/descent, Newton-Raphson, and the added difficulty of constrained optimization.</scope>
<output_structure>
# Chapter - 4 — Search in Complex Environments (Part 1: Local Search & Optimization)
## Chapter Summary
## Key Concepts
## Full Reading Notes (one ### per real subsection: 4.1.1, 4.1.2, 4.1.3, 4.1.4, 4.2)
## Worked Example (the book's own worked example, most likely 8-queens under hill-climbing/genetic algorithms — reproduce it exactly, including any real numbers the book gives)
## Connections (state plainly this chapter predates its own lecture; link forward to [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 5|Week - 5]] once it exists, per the note above)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w)
</output_structure>
<formatting_rules>Identical to the Chapter 3 prompts.</formatting_rules>
<output_contract>Return the entire note as one fenced markdown code block, nothing outside it. Verify every subsection 4.1.1-4.2 has its own ### heading and the pending-lecture note is present in Connections.</output_contract>
```
### Chapter 4, Part 2 of 2 — Nondeterministic & Partially Observable Search (AIMA §4.3–4.4) — future chapter, no lecture yet
```
<role>Same role as Part 1 — same chat, continuing the same Chapter 4 note.</role>
<sources>
PRIMARY: `CSCI 4511W Textbook.pdf`, Chapter 4, sections 4.3 (Search with Nondeterministic Actions: 4.3.1 the erratic vacuum world, 4.3.2 AND-OR search trees, 4.3.3 "try, try again"/cyclic solutions) and 4.4 (Search in Partially Observable Environments: 4.4.1 sensorless/conformant search, 4.4.2 searching in partially observable environments, 4.4.3 solving partially observable problems, 4.4.4 an agent design for partially observable environments) — already uploaded in this chat.
SECONDARY: none available. Per the Board this is the Week 6 Monday reading (10/12), and no matching lecture PDF exists yet as of 2026-09-28. Same pending-lecture note as Part 1.
</sources>
<process>Read the full sections before writing. Use the book's own real subsection numbers/titles.</process>
<scope>Cover, in the book's order: 4.3.1 the erratic vacuum world as the book's running nondeterministic example (why a single action can have multiple possible results); 4.3.2 AND-OR search trees — OR nodes (agent choices) vs. AND nodes (environment's possible outcomes) and how a solution becomes a subtree/contingency plan rather than a single path; 4.3.3 the "try, try again" idea for problems where no acyclic solution exists but a cyclic one does; 4.4.1 sensorless (conformant) search over belief states when the agent has no sensors at all; 4.4.2 searching when the agent has partial observations — how belief states update after both actions and percepts; 4.4.3 the book's method for turning a partially observable problem into a search over belief states; 4.4.4 the book's design for an agent that acts in a partially observable environment (interleaving search/planning with execution).</scope>
<output_structure>
## Full Reading Notes (continued — one ### per real subsection: 4.3.1 through 4.3.3, 4.4.1 through 4.4.4; do not repeat Part 1's headings)
## Worked Example (the book's erratic-vacuum-world AND-OR tree, reproduced with its real states/branches)
## Connections (same pending-lecture note as Part 1; note the conceptual line from 4.3's AND-OR trees to 4.4's belief-state search)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w)
</output_structure>
<formatting_rules>Identical to Part 1.</formatting_rules>
<output_contract>Return the continuation as one fenced markdown code block, not repeating Part 1's headings. Verify every subsection 4.3.1-4.4.4 has its own ### heading.</output_contract>
```
## Weekly Synthesis Prompts (gpt-5.1-codex CLI, reasoning effort medium)
Reusable — fill the brackets each week. This splits the single Codex master prompt above into four sequential passes instead of one shot: each week has two lectures, a landed textbook chapter (or two, when a chapter spans the week boundary), a Monday short quiz to fold in, and a synthesis section that must not be rushed. Running it as A → B → C → D gives a real checkpoint between the two lectures (so Monday's live capture is safe before Wednesday's class even happens) and keeps the textbook cross-check honest (C can't run before both lectures and the matching Chapter note exist). Run A right after Monday's lecture, B right after Wednesday's, C once both lecture sections and the matching `Chapter - N.md` exist, D last, in the same or a following session.
### Weekly Prompt A — Monday lecture + Short Quiz
```
<role>You are filling in the Monday half of one week's lecture-synthesis note inside a university student's personal Obsidian vault, for personal study only. Never invent facts beyond the attached sources; where a source is silent, leave the template's placeholder rather than guessing. You have file read/write access — use it.</role>
<sources>
PRIMARY (lecture): [PATH TO MONDAY'S LECTURE PDF, e.g. `Lecture\CSCI4511W Lecture 0N.pdf`], real date [DATE].
STANDARD: [[Weekly Standard]] and [[Week Template]] govern every heading below — read both in full before writing.
DESTINATION: `20_Progress/Degree/CSCI 4511W/Weekly/Week - [N].md`. If the file doesn't exist yet, create it from [[Week Template]]'s frontmatter first (`type: class`, `input_kind: lecture`, `status: seed`, `area:` linking [[CSCI 4511W Board]] and the matching chapter, `tags: [#class, #Lecture]`, `next:` → next week). If it exists, preserve its frontmatter exactly and add to the body without deleting any existing `## Lecture` content — this course's weeks sometimes already have a partial start (see Week - 1/Week - 3's real history) that must not be overwritten.
</sources>
<process>Read the full Monday lecture PDF before writing. Find its own real slide-section breaks; don't assume a fixed number of ### subsections.</process>
<scope>Cover every real topic, announcement-relevant policy note (skip pure logistics), definition, worked example, and pseudocode/code shown on Monday's slides. This week's Monday is a Short Quiz day per [[CSCI 4511W Board]]'s schedule (every Monday except exam weeks) — add a `## Short Quiz - [N]` heading (matching the exact style already used in [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 3|Week - 3]]'s Short Quiz 02 section: source the covered lecture/slide titles explicitly, answer each real quiz question if the quiz content is known, and flag plainly whenever an answer requires inference beyond what the slides state verbatim — never invent a question the quiz didn't actually ask).</scope>
<output_structure>Fill or extend, in order, using real content only for what Monday's lecture supports — leave every other heading as the template's placeholder for Prompts B-D to fill:
## What you must be able to do (Monday-supported objectives only — link the matching [[Chapter - N]] first)
## Key ideas (short) (Monday-supported claims only)
## Examples worth keeping (Monday's real examples only)
## Lecture — add `### 1. [Title]` onward for every real topic break in Monday's slides, tab-indenting sub-content; reproduce pseudocode/derivations in full
## Short Quiz - [N] (new heading, per the scope note above)
</output_structure>
<formatting_rules>Follow [[Weekly Standard]]'s Per-Heading Standard exactly. **Bold** named concepts/terms/functions on first use. No filler or marketing language; no sentence that could describe any course's generic version of this topic.</formatting_rules>
<output_contract>Write directly to the destination path via file edit, preserving frontmatter and any existing content. Report back in chat: which headings got real content, and confirm no existing `## Lecture` capture was overwritten.</output_contract>
```
### Weekly Prompt B — Wednesday lecture
```
<role>Same role as Prompt A, continuing the same week note.</role>
<sources>
PRIMARY (lecture): [PATH TO WEDNESDAY'S LECTURE PDF], real date [DATE].
STANDARD: same as Prompt A.
DESTINATION: same `Week - [N].md`, already has Monday's content from Prompt A — preserve it, extend rather than replace.
</sources>
<process>Read the full Wednesday lecture PDF before writing. If it opens with a recap of Monday's material, use the recap to verify Prompt A's note is consistent rather than re-explaining it at length.</process>
<scope>Cover every real topic, definition, worked example, and pseudocode/code from Wednesday's slides not already captured by Monday. Note explicitly in the Lecture section if Wednesday continues or corrects something from Monday (this course's lectures regularly pick up mid-analysis-table from the prior class — preserve that continuity rather than treating each lecture as isolated).</scope>
<output_structure>
## What you must be able to do — extend with Wednesday-supported objectives, so the full list covers both lectures
## Key ideas (short) — extend, keep total at 3-6 compressed claims for the whole week
## Examples worth keeping — extend with Wednesday's real examples
## Lecture — continue numbering `### 2. [Title]` onward from where Monday's section left off
</output_structure>
<formatting_rules>Identical to Prompt A.</formatting_rules>
<output_contract>Write directly to the destination path via file edit. Report back in chat: which headings were extended, and flag any place Wednesday's content corrected or continued Monday's.</output_contract>
```
### Weekly Prompt C — Textbook integration
```
<role>Same role, continuing the same week note. This pass cross-checks lecture against the landed textbook note — do not re-derive textbook content from general knowledge of AI, even where that knowledge happens to be correct.</role>
<sources>
PRIMARY (textbook): [PATH(S) TO `Chapter - N.md` / relevant Part(s) in `20_Progress/Degree/CSCI 4511W/Textbook/`] — the already-landed, source-checked chapter note(s) covering this week's reading per [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]].
SECONDARY (lecture): this week's own `Lecture` section, already written by Prompts A-B.
STANDARD: same as Prompts A-B.
DESTINATION: same `Week - [N].md`.
</sources>
<process>Read the full landed Chapter note(s) and this week's Lecture section in full. Cross-check explicitly: does the lecture cover material the landed textbook note doesn't have yet (professor ahead of the book), or does the book cover something not yet lectured? State that delta plainly rather than smoothing it over — this course's own textbook notes already track this pattern (see [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2]]'s Connections section for the expected shape).</process>
<scope>Every framework, proof, named function/algorithm, or distinction the textbook adds beyond what lecture stated — not a restatement of the Lecture section.</scope>
<output_structure>
## Textbook integration — replace the `> [!IMPORTANT] Main chapters:` placeholder with the real chapter link(s), then state the real delta: what the book proves/covers that lecture only asserted or skipped, and vice versa if lecture ran ahead of the book
</output_structure>
<formatting_rules>Identical to Prompts A-B. Link the real [[Chapter - N]] note(s), not a bare chapter number.</formatting_rules>
<output_contract>Write directly to the destination path via file edit. Report back in chat: the real lecture/textbook delta found, in one or two sentences.</output_contract>
```
### Weekly Prompt D — Synthesis, concepts, flashcards, Board update
```
<role>Same role, finishing the same week note. This is the pass most likely to get rushed — per [[Weekly Workflow]], do not skip or thin out the synthesis section.</role>
<sources>
PRIMARY: the week note's own `## Lecture`, `## Textbook integration`, and `## Short Quiz` sections, already written by Prompts A-C.
STANDARD: [[Weekly Standard]]'s exact six-part synthesis shape; [[Concept Standard]] for any new concept notes.
DESTINATION: same `Week - [N].md`, plus `20_Progress/Degree/CSCI 4511W/Weekly/Weekly Board.md` and [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]].
</sources>
<process>Read the full week note as written so far before adding anything — every claim below must trace back to what Prompts A-C already established, not to new material.</process>
<scope>Decide honestly whether this week's material justifies a new [[Concept - ]] note (AI concept notes should capture representations, agent/environment assumptions, search states/actions/costs, algorithm guarantees, complexity, or admissibility/consistency conditions per [[CSCI 4511W Workflow]] — do not create one just to fill the heading). Write 2-5 genuine open questions. Build the synthesis section in the exact required shape.</scope>
<output_structure>
## Concepts created today — real [[Concept - ]] links this week's material justifies, or state plainly that none were needed and why
## Takeaways (questions to resolve) — `- [ ]` tasks only, 2-5 genuine questions
## Lecture-to-textbook synthesis — one `==highlight==` (the note's only one, a real definitional claim), `*Mechanism:*`, a real lecture example/scenario, the textbook connection linking [[Chapter - N]], concept links, then `> [!WARNING]` (the real common confusion or failure mode this week's material invites) and `> [!SUMMARY]` (one sentence on what the week is really about)
## Flashcards — 5-8+ cards under `#cards/csci4511w`, testing mechanisms and contrasts (e.g. BFS vs. DFS vs. A* conditions), not labels
</output_structure>
<formatting_rules>Follow [[Weekly Standard]]'s Per-Heading Standard exactly — one `==highlight==` total, inside the synthesis section only. No filler language.</formatting_rules>
<output_contract>Write directly to the destination path via file edit. Then update `Weekly Board.md`'s Map section with one real sentence for this week, and update the Textbook Map's status for the covered chapter/section if it changed. Report back in chat: the concept-note decision and reasoning, plus which headings still have honest placeholders because no source covered them.</output_contract>
```
## Verification notes, 2026-09-28
Checked before writing the above: [[CSCI 4511W Board]]'s Schedule table (Chapter 3 = §3.1–3.6 across Weeks 2–4, no gaps; Chapter 4 = §4.1.1–4.4 across Weeks 5–6, §4.5 online search is never assigned) cross-checked against the [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]]'s chapter table — both agree. Read `CSCI4511W Lecture 03.pdf` through `Lecture 06.pdf` in full (not summarized from the Board) to source the SECONDARY emphasis blocks above; confirmed Lecture 06 is real, dated Sep 28, 2026, and covers Greedy Best-First/A* (AIMA §3.5.1–3.5.2) with two full worked examples. Confirmed the real source folder is `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\` (holds Lecture 02–06, the textbook PDF, two Discussion PDFs, and `Pratice Problems/`) — the Board's own "Source of Truth" callout cited a stale `D:\Users\_Anant\...` path, corrected in that note today. No source exists yet for Lecture 07+ (Chapter 4's lecture emphasis) or for the discussion-section meeting time — both remain open per the Board's own unresolved list.

