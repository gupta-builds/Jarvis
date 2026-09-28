
# Prompts
## Notebook
Gemini Notebook (the July 2026 rename of NotebookLM) runs on the Gemini 3.5 model family with no user-facing model picker — Google folded the education-tuned LearnLM behavior into the default Gemini Notebook experience rather than exposing it as a setting, which is why there was nothing to configure. [Same tool, new name: NotebookLM is now Gemini Notebook](https://it.rutgers.edu/2026/09/10/same-tool-new-name-notebooklm-is-now-gemini-notebook/), [NotebookLM April 2026 Update: New Features, Gemini Model, and Power-User Guide](https://leadershipinchange.com/p/gemini-notebooklm-ai-research-2026)

Workflow: fresh Gemini Notebook chat per chapter, upload that chapter's sources, paste the filled prompt below, save the output as the chapter note in `20_Progress/Degree/[COURSE]/Textbook/`. No chat memory carries over — if continuity with a prior chapter's terminology matters, upload that prior chapter's saved `.md` note as an extra source and say so in the prompt.

**Character limit, confirmed 2026-09-21 and reconfirmed 2026-09-28:** Gemini Notebook's paste box rejects the single-shot ~5,590-character prompt below the master template's full length; a real paste attempt on 2026-09-28 was cut off mid-sentence at ~3,900 characters. Treat **3,000 characters as the real target, not a soft suggestion** — measure the filled prompt's length before pasting (`(Get-Content -Raw file.txt).Length` in PowerShell, or `wc -c` on the raw text) and if it's over 3,000, split further rather than pasting and hoping. Do not cut FORMATTING RULES, OUTPUT CONTRACT, or any other instruction block to make room — a ~3,798-character version that cut those sections went through but produced noticeably thinner output. The only thing allowed to shrink is SCOPE, by splitting the chapter into more, narrower parts fed into the **same** Gemini Notebook chat.

**How to get the best output within that budget, learned from the 2026-09-28 CSCI 4511W rebuild:**
- **Split on the course's own reading-assignment boundaries, not an arbitrary half/third of the chapter.** A syllabus that assigns a chapter across five separate reading dates is handing you five natural, already-justified SCOPE boundaries — use them. A dense chapter legitimately needs four or five parts; that is not a failure of the two-or-three-part guideline, it is the guideline working (see the CSCI 4511W Chapter 3 prompts below for a worked example).
- **Never restate an entire lecture in prose inside SOURCES.** The model reads the uploaded lecture PDF directly — a paragraph reconstructing everything the lecture said is redundant with the upload and is the single biggest source of wasted characters. SOURCES should name the file to upload and give one to two sentences pointing at what to emphasize or cross-check, not a summary the model doesn't need.
- **Write SCOPE as a tight list of subsection + a short phrase, not full sentences per subsection.** "3.4.1: BFS's real mechanism and proof of its complete/cost-optimal conditions" does the job in one line; a paragraph explaining why doesn't add coverage, it adds characters.
- **Keep OUTPUT_STRUCTURE headings as bare headings**, not headings with an explanatory sentence under each — the FORMATTING RULES block already governs how each section should read.
- Every part still gets the full ROLE/PROCESS/FORMATTING_RULES/OUTPUT_CONTRACT scaffolding in full; only SOURCES and SCOPE get leaner as a discipline, never truncated by cutting a required section.

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
Written 2026-09-28, Week 4 of the semester, after reading [[CSCI 4511W Board]]'s full schedule, the [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]], both landed chapter notes ([[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 1|Chapter 1]], [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter 2]]), [[Weekly Standard]], [[Textbook Standard]], [[Week Template]], and every real lecture PDF in the source folder (`D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Lecture\`) through Lecture 06 — including the new Lecture 06 (Sep 28, "Informed Search") that prompted this pass. Chapter 3 has no note yet; it covers the whole AIMA search unit across Weeks 2–4 (§3.1–3.6). **Revised 2026-09-28 after a real paste attempt hit the Gemini Notebook character limit documented in the Notebook section above:** the original 2-part split produced a 5,496-character Part 1, nearly double the safe budget. Chapter 3 is now five prompts, one per the Board's own reading-assignment row (§3.1–3.2 for 9/16, §3.3–3.4.2 for 9/21, §3.4.3–3.4.4 for 9/23, §3.5 for 9/28, §3.6 for 9/30) — every part measured under 3,000 characters before being written here. Two prompts pre-build Chapter 4 (§4.1.1–4.4, Weeks 5–6) the same way, so the course stays read-ahead of the week it's due — matching the [[CSCI 4511W Workflow]] rule that textbook notes land before the lecture whenever the source is available. Chapter 4 has no matching lecture file yet (Lecture 07+ isn't released), so both of its prompts are textbook-only and flagged to re-run once a lecture PDF lands.
## Textbook Reading Prompts (Gemini Notebook)
Same workflow as the master Notebook prompt above: one fresh Gemini Notebook chat for all of Chapter 3 (five parts, same chat, same growing file), a second fresh chat for Chapter 4 (two parts). Upload the sources named in each `<sources>` block, paste the prompt, save the output as `20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 3.md` / `Chapter - 4.md`. Every part below is written to the lean discipline in the Notebook section's character-limit guidance above: SOURCES points at what to upload rather than restating it, SCOPE is a tight list, and every part still carries the full FORMATTING RULES and OUTPUT CONTRACT.
### Chapter 3, Part 1 of 5 — Problem-Solving Agents & Example Problems (AIMA §3.1–3.2)
```
<role>Expert AI TA teaching AIMA 4th ed. to a student who has Chapter 2's agent vocabulary but is new to search. Define every new term at first use; explain mechanism, not label.</role>
<sources>
PRIMARY: `CSCI 4511W Textbook.pdf`, Ch. 3, §3.1 (Problem-Solving Agents) and §3.2 (Example Problems) only — upload this file. Stop at the end of 3.2; later prompts in this chat cover 3.3 onward.
SECONDARY: upload `Lecture 03.pdf` (Sep 16) if available. It frames the process as goal formulation → problem formulation → search → execution and works the sliding-tile puzzle as its own running example — use it only to flag whether that example differs from the book's own named examples.
</sources>
<process>Read the uploaded sections fully. Get the book's own real subsection numbers/titles from the PDF itself.</process>
<scope>3.1: the four-step process and the environment assumptions it requires (static, fully observable, known, discrete, deterministic). 3.2: the book's formal problem definition (state space, initial state, actions, transition model, goal test, path cost) applied to every one of the book's own named example problems — reproduce them all.</scope>
<output_structure>
# Chapter - 3 — Solving Problems by Searching (Part 1 of 5: Problem-Solving Agents & Example Problems)
## Chapter Summary
## Key Concepts
## Full Reading Notes (### 3.1, ### 3.2)
## Worked Example (one book example worked end-to-end through the formal definition)
## Connections (where Lecture 03's sliding-tile framing adds to or differs from the book's own examples)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w)
</output_structure>
<formatting_rules>One blank line between blocks. Exactly one ==highlight== per ## section. **Bold** terms on first use. Cite real page numbers. No filler language. Fenced code for any pseudocode.</formatting_rules>
<output_contract>Return as one fenced markdown code block, nothing outside it. Verify: 3.1 and 3.2 each have their own ### heading; highlight count is exactly one per section.</output_contract>
```
### Chapter 3, Part 2 of 5 — Search Algorithms, BFS & Uniform-Cost (AIMA §3.3–3.4.2)
```
<role>Same role — same chat, continuing the same Chapter 3 note.</role>
<sources>
PRIMARY: same textbook, §3.3 (Search Algorithms) and §3.4.1-3.4.2 (breadth-first search; Dijkstra's algorithm/uniform-cost search) — already uploaded. Stop at the end of 3.4.2.
SECONDARY: upload `Lecture 04.pdf` (Sep 21) if available. It gives a Best-First Search framework (node, frontier as a PriorityQueue(order=f), reached, expand()) and derives BFS by setting f(n)=0 — flag anywhere this single-framework presentation diverges from how the book presents these algorithms separately.
</sources>
<process>Read the uploaded sections fully. Use the book's own real subsection numbers/titles.</process>
<scope>3.3: the book's Best-First-Search algorithm, its real figure number, node/frontier/reached, and its own completeness/cost-optimality/time/space-complexity definitions (in terms of b, d). 3.4.1: BFS's mechanism and proof of its complete/cost-optimal conditions. 3.4.2: uniform-cost search's mechanism, its ϵ>0 assumption, and its proof.</scope>
<output_structure>
## Full Reading Notes (continued — ### 3.3, ### 3.4.1, ### 3.4.2; don't repeat Part 1's headings)
## Worked Example (BFS or UCS traced through a small graph, the book's own if it gives one)
## Connections (where Lecture 04's one-framework-for-everything framing simplifies the book's separate treatments)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w)
</output_structure>
<formatting_rules>Identical to Part 1.</formatting_rules>
<output_contract>Return as one fenced markdown code block, continuing Part 1, not repeating its headings.</output_contract>
```
### Chapter 3, Part 3 of 5 — Depth-First & Iterative-Deepening Search (AIMA §3.4.3–3.4.4)
```
<role>Same role, same chat.</role>
<sources>
PRIMARY: same textbook, §3.4.3 (depth-first search and the problem of memory) and §3.4.4 (depth-limited and iterative-deepening search) — already uploaded. Stop at the end of 3.4.4; §3.4.5 bidirectional search is not assigned in this course per [[CSCI 4511W Board]], skip it.
SECONDARY: upload `Lecture 05.pdf` (Sep 23) if available. It fills in the real completeness/cost-optimality/complexity table for BFS/DFS/DLS/IDDFS (DFS: complete only if no cycles & finite, never cost-optimal, O(b^m) time, O(mb) space; DLS: never complete/cost-optimal, O(b^l) time, O(lb) space; IDDFS: complete/cost-optimal if finite & constant costs, O(b^d) time, O(db) space).
</sources>
<process>Read the uploaded sections fully. Use the book's own real subsection numbers/titles.</process>
<scope>3.4.3: DFS's mechanism, why it isn't cost-optimal, its memory advantage over BFS, and the cycle/infinite-branch failure case. 3.4.4: depth-limited search's mechanism and incompleteness, then iterative-deepening's mechanism and proof that it recovers BFS's completeness/optimality at DFS's space cost.</scope>
<output_structure>
## Full Reading Notes (continued — ### 3.4.3, ### 3.4.4; don't repeat prior headings)
## Worked Example (IDDFS traced through a small tree, showing the repeated shallow re-exploration)
## Connections (whether Lecture 05's completed table matches the book's own proven bounds exactly)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w — include the full BFS/DFS/DLS/IDDFS comparison as one card)
</output_structure>
<formatting_rules>Identical to prior parts.</formatting_rules>
<output_contract>Return as one fenced markdown code block, continuing prior parts, not repeating their headings.</output_contract>
```
### Chapter 3, Part 4 of 5 — Informed Search: Greedy & A* (AIMA §3.5)
```
<role>Same role, same chat.</role>
<sources>
PRIMARY: same textbook, §3.5 (3.5.1 greedy best-first, 3.5.2 A* incl. admissibility/consistency and the optimality proof, 3.5.3 search contours, 3.5.4 weighted A*/satisficing search, 3.5.5 memory-bounded search — IDA*/RBFS/SMA*, 3.5.6 bidirectional heuristic search) — already uploaded. Stop at the end of 3.5; §3.6 is the next prompt.
SECONDARY: upload `Lecture 06.pdf` (Sep 28, "Informed Search") if available. It defines h(n), Greedy as f(n)=h(n), A* as f(n)=g(n)+h(n), and works two examples step-by-step (a 15-node labeled tree under both; a Minnesota-cities exercise with real distances and a straight-line heuristic). It ends with open questions on A*'s completeness/cost-optimality/complexity conditions — answer these from the book's proof, not by guessing.
</sources>
<process>Read the uploaded section fully. Use the book's own real subsection numbers/titles.</process>
<scope>3.5.1-3.5.2: greedy and A* as the lecture introduced them, then the book's admissibility/consistency conditions and its proof that A* with a consistent heuristic is cost-optimal — this answers the lecture's own open questions, cite the proof. 3.5.3-3.5.6: search contours, weighted A*, the memory-bounded variants and their trade-offs, bidirectional heuristic search.</scope>
<output_structure>
## Full Reading Notes (continued — ### 3.5.1 through ### 3.5.6)
## Worked Example (the lecture's own tree example under both Greedy and A* side by side, showing where they diverge)
## Connections (answer the lecture's open A* questions here, citing the book's proof)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w)
</output_structure>
<formatting_rules>Identical to prior parts.</formatting_rules>
<output_contract>Return as one fenced markdown code block, continuing prior parts.</output_contract>
```
### Chapter 3, Part 5 of 5 — Heuristic Functions (AIMA §3.6) — no lecture yet
```
<role>Same role, same chat. No lecture exists yet for this section — teach directly from the book.</role>
<sources>
PRIMARY: same textbook, §3.6 (3.6.1 effect of heuristic accuracy, 3.6.2 generating heuristics from relaxed problems, 3.6.3 pattern databases, 3.6.4 landmarks, 3.6.5-3.6.6 learning heuristics) — already uploaded. This closes Chapter 3.
SECONDARY: none yet — Lecture 07 (Sep 30) isn't in the source folder as of this prompt's writing. Write the Connections line as "(pending Lecture 07 — re-run this chat once it lands and add the delta)."
</sources>
<process>Read the uploaded section fully. Use the book's own real subsection numbers/titles.</process>
<scope>3.6.1: how heuristic accuracy (effective branching factor, dominance) changes performance, with the book's own numbers if given. 3.6.2-3.6.4: generating heuristics from relaxed problems, pattern databases, and landmarks, each with the book's own worked example. 3.6.5-3.6.6: the book's treatment of learning heuristics from experience.</scope>
<output_structure>
## Full Reading Notes (continued — ### 3.6.1 through ### 3.6.6)
## Worked Example (the book's own relaxed-problem or pattern-database example)
## Connections (the pending-lecture note above)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w — one card per named heuristic-generation method)
</output_structure>
<formatting_rules>Identical to prior parts.</formatting_rules>
<output_contract>Return as one fenced markdown code block, continuing prior parts. This closes Chapter 3 — verify every subsection 3.1 through 3.6.6 across all five parts has its own ### heading somewhere in the full note.</output_contract>
```
### Chapter 4, Part 1 of 2 — Local Search & Optimization (AIMA §4.1.1–4.2) — future chapter, no lecture yet
```
<role>Same expert-AI-TA role. Pure textbook read-ahead — no lecture has happened yet, so teach directly from the book without inventing what a professor might emphasize.</role>
<sources>
PRIMARY: `CSCI 4511W Textbook.pdf`, Ch. 4, §4.1 (4.1.1 hill-climbing, 4.1.2 simulated annealing, 4.1.3 local beam search, 4.1.4 evolutionary/genetic algorithms) and §4.2 (local search in continuous spaces) — upload this file.
SECONDARY: none. Per [[CSCI 4511W Board]] this is Week 5 reading (Mon 10/5 = §4.1.1-4.1.3, Wed 10/7 = §4.1.4-4.2); no Lecture 07+ PDF exists as of 2026-09-28. Write the Connections line as "(pending — re-run once Week 5's lecture PDF lands)."
</sources>
<process>Read the full sections fully. Use the book's own real subsection numbers/titles.</process>
<scope>4.1.1: hill-climbing's real failure modes (local maxima, ridges, plateaux/shoulders) and the standard fixes. 4.1.2: simulated annealing's mechanism (temperature schedule, probability of accepting a worse move) and why it escapes local maxima hill-climbing can't. 4.1.3: local beam search vs. k independent random-restart hill-climbs, plus stochastic beam search. 4.1.4: genetic algorithms — population, fitness, selection, crossover, mutation, the book's own worked example if given. 4.2: gradient ascent/descent, Newton-Raphson, constrained optimization.</scope>
<output_structure>
# Chapter - 4 — Search in Complex Environments (Part 1 of 2: Local Search & Optimization)
## Chapter Summary
## Key Concepts
## Full Reading Notes (### 4.1.1, 4.1.2, 4.1.3, 4.1.4, 4.2)
## Worked Example (the book's own worked example, reproduced exactly with its real numbers)
## Connections (the pending-lecture note above)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w)
</output_structure>
<formatting_rules>Identical to the Chapter 3 prompts.</formatting_rules>
<output_contract>Return as one fenced markdown code block, nothing outside it. Verify every subsection 4.1.1-4.2 has its own ### heading and the pending-lecture note is present in Connections.</output_contract>
```
### Chapter 4, Part 2 of 2 — Nondeterministic & Partially Observable Search (AIMA §4.3–4.4) — future chapter, no lecture yet
```
<role>Same role — same chat, continuing the same Chapter 4 note.</role>
<sources>
PRIMARY: same textbook, §4.3 (4.3.1 erratic vacuum world, 4.3.2 AND-OR search trees, 4.3.3 "try, try again"/cyclic solutions) and §4.4 (4.4.1 sensorless/conformant search, 4.4.2 searching with partial observations, 4.4.3 solving partially observable problems, 4.4.4 an agent design for partially observable environments) — already uploaded.
SECONDARY: none. Per the Board this is Week 6 Monday reading (10/12); no matching lecture PDF exists yet. Same pending-lecture note as Part 1.
</sources>
<process>Read the full sections fully. Use the book's own real subsection numbers/titles.</process>
<scope>4.3.1: the erratic vacuum world as the book's running nondeterministic example. 4.3.2: AND-OR trees — OR nodes (agent choices) vs. AND nodes (environment outcomes), and why a solution is a contingency subtree, not a path. 4.3.3: cyclic "try, try again" solutions. 4.4.1: sensorless/conformant search over belief states. 4.4.2: belief-state updates after both actions and percepts. 4.4.3: turning a partially observable problem into belief-state search. 4.4.4: the book's agent design for acting under partial observability.</scope>
<output_structure>
## Full Reading Notes (continued — ### 4.3.1 through 4.3.3, 4.4.1 through 4.4.4; don't repeat Part 1's headings)
## Worked Example (the erratic-vacuum-world AND-OR tree, reproduced with its real states/branches)
## Connections (same pending-lecture note as Part 1; the conceptual line from 4.3's AND-OR trees to 4.4's belief-state search)
## Open Questions (3-5)
## Flashcards (6-8, #cards/csci4511w)
</output_structure>
<formatting_rules>Identical to Part 1.</formatting_rules>
<output_contract>Return as one fenced markdown code block, not repeating Part 1's headings. Verify every subsection 4.3.1-4.4.4 has its own ### heading.</output_contract>
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

# MGMT 3015 — Chapter 4/8 & Session Note Prompts
Written 2026-09-28, after reading [[MGMT 3015 Board]]'s full 28-session schedule and grading table, the [[20_Progress/Degree/MGMT 3015/Textbook/Textbook Map|Textbook Map]], both existing chapter notes ([[20_Progress/Degree/MGMT 3015/Textbook/Chapter - 1 & 2|Chapter 1 & 2]], [[20_Progress/Degree/MGMT 3015/Textbook/Chapter - 3 & 4|Chapter 3 & 4]]), all four existing session notes (`Lecture - 1.md` through `Lecture - 4.md`), and the real text of every one of the seven real `.pptx` lecture decks in `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\` — extracted directly (PowerPoint's XML slide/notes text runs, unzipped and parsed; a plain file-read tool cannot open a `.pptx` binary), not guessed from filenames or slide titles.
**Two real problems found and fixed while researching this:** (1) `Chapter - 3 & 4.md`, the [[20_Progress/Degree/MGMT 3015/Textbook/Textbook Map|Textbook Map]]'s `next:` field, and both `Lecture - 1.md` and `Lecture - 4.md` all claimed a Chapter 4/whole-note-wrap Gemini Notebook prompt was "written and ready in `Repetitive Things.md` (### MGMT 3015)" — no such section ever existed in this file (checked directly, and there's no sync-conflict copy of this file either, so it isn't recoverable). Whatever prompt that was is genuinely gone; the two prompts below are freshly written, not a recovery of the old ones. (2) `Lecture - 1.md` and `Lecture - 4.md` both linked their textbook connections to a nonexistent `.../CSCI 4041/Textbook/...` path (a copy-paste artifact from a different course) instead of this course's real `MGMT 3015/Textbook/` notes — corrected directly in both files today.
**Current gaps, confirmed by reading every note's actual state (not its `status:` field alone):** `Chapter - 3 & 4.md` has Chapter 3 fully written but no Chapter 4 section and no whole-note wrap (Chapter Summary, Key Concepts, Open Questions, Flashcards — none of these exist in the note yet, not just a Chapter-3-only version of them). Sessions 1–4 all have real, complete `Lecture - N.md` notes; **Session 5 (Wed 9/23, "Opportunities: Definition & Evaluation") already happened and has no note at all** — the real immediate gap on the session side, same way Chapter 4 is the real immediate gap on the textbook side.
**Execution split, matching how CSCI 4511W's prompts run:** the two textbook prompts below are Gemini Notebook prompts (same char-limit discipline as the Notebook section's guidance above — measured under 3,000 characters each). The session-note prompt is built for a Claude Sonnet 5 agentic build (Claude Code or equivalent) with real file read/write access, using the actual current guidance at `platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5` (fetched 2026-09-28, not recalled from training data) — most relevant here: Sonnet 5 follows instructions **literally** and does not silently generalize a rule from one case to another, so the session-note prompt states explicitly what to do for a content-heavy session, a light group-activity session, and a session with no new content, rather than writing one instruction and hoping it generalizes. It's also written as **one reusable prompt per session, not a four-part sequence like CSCI 4511W's weekly prompts** — that split existed because CSCI 4511W's weeks are always exactly two lectures plus a Monday quiz; MGMT 3015's 28 sessions are genuinely heterogeneous (lecture, case discussion, pure group work, quiz day, presentation day) and don't decompose into a fixed shape, so a single session gets a single well-scoped prompt instead. Recommend running this at Sonnet 5's `high` or `xhigh` effort — this is a multistep, multi-source cross-referencing task (deck + textbook note + prior sessions), and the guide is explicit that under-thinking risk rises at lower effort on tasks like this.
## Textbook Reading Prompts (Gemini Notebook)
Same workflow as the Notebook section above: fresh Gemini Notebook chat, upload the sources named in `<sources>`, paste the prompt, save the output into the named destination note.
### Chapter 4 — Prototyping Your Ideas (completes `Chapter - 3 & 4.md`)
```
<role>Expert entrepreneurship TA working through Zacharakis, Bygrave & Corbett's Entrepreneurship (5th ed.) with a student who already has Chapters 1-3's vocabulary (Timmons Framework, PTA/STA/TTA, the Opportunity Checklist). Define every new term at first use; explain mechanism, not label.</role>
<sources>
PRIMARY: `MGMT 3015 - Entrepreneurship, 5th Edition.pdf`, Chapter 4, "Prototyping Your Ideas" (textbook pp. ~102-119, PDF pp. ~124-141; PDF offset = textbook page + 22) — upload this file. This finishes a combined note whose Chapter 3 half is already written; do not repeat Chapter 3's content.
CURRENT NOTE STATE: `Chapter - 3 & 4.md` has Chapter 3's four body sections, a Chapter-3-only "Examples Worth Keeping" (the ISlide case), and "Connections" — it has NO Chapter Summary, Key Concepts, Open Questions, or Flashcards yet; those are missing entirely, not just missing for Chapter 4.
SECONDARY: none. No session has covered prototyping as of 2026-09-28 (Sessions 4-5 covered ideation and opportunity evaluation only). Write the Connections addition as "(pending - no session has covered prototyping yet)."
</sources>
<process>Read the uploaded chapter fully before writing. Confirm "What Is Prototyping?" and "Types of Prototyping" (named in Chapter 3's own cross-reference notes) against the real PDF, and find the book's actual subsections under them - do not assume a taxonomy, read it from the source.</process>
<scope>What a prototype is and why founders build one before a full business plan; the book's real taxonomy of prototype types; how prototyping connects back to Chapter 3's opportunity-evaluation material (customer segments, the S-curve, the Opportunity Checklist); the chapter's own named case example(s).</scope>
<output_structure>
Append after Chapter 3's existing "I Don't Have an Opportunity" section, before "Examples Worth Keeping":
## Chapter 4: Prototyping Your Ideas
### [the book's own real section headings, found from the PDF]
Then add one new entry to the EXISTING "Examples Worth Keeping" heading (Chapter 4's own case, after the ISlide entry - don't replace it).
Then add these NEW sections after "Connections" (none exist in the note yet):
## Chapter Summary (one sentence spanning both chapters, exactly one ==highlight==)
## Key Concepts (spanning both chapters - re-derive Chapter 3's key terms from its existing body text plus Chapter 4's new ones)
## Open Questions (3-5, spanning both chapters)
## Flashcards (6-8, #cards/MGMT, spanning both chapters)
</output_structure>
<formatting_rules>One blank line between blocks. Exactly one ==highlight== in the whole note. **Bold** terms on first use. Cite real page numbers. No filler language.</formatting_rules>
<output_contract>Return everything to add as one fenced markdown code block, each part clearly labeled with the exact heading it belongs under, so it can be merged into the existing note without duplicating Chapter 3's already-written content.</output_contract>
```
### Chapter 8 — The Business Plan (future chapter, read-ahead for Week 5)
```
<role>Same expert entrepreneurship TA role. Pure textbook read-ahead - no session has covered this yet, so teach directly from the book without inventing what will be emphasized.</role>
<sources>
PRIMARY: `MGMT 3015 - Entrepreneurship, 5th Edition.pdf`, Chapter 8 ("The Business Plan" per [[20_Progress/Degree/MGMT 3015/Textbook/Textbook Map|Textbook Map]]'s chapter-to-session mapping) — upload this file. Find the real page range and section structure from the PDF itself; nothing about its internal structure is known yet, don't assume any subsection numbering.
SECONDARY: none. Assigned for Session 8 (Mon 10/5, "Idea Presentations cont.; The Business Plan; start forming groups") and Session 9 (Wed 10/7, "The Business Plan cont.; Quiz 1") per [[MGMT 3015 Board]] - no lecture deck exists yet as of 2026-09-28. Write the Connections line as "(pending - re-run once Session 8's slide deck lands)."
</sources>
<process>Read the full chapter before writing. Find the book's own real section titles from the PDF - do not assume a generic "business plan template" structure, use what this specific book presents.</process>
<scope>What the book says a business plan needs to contain and why; how it frames the plan as a tool for aligning the Timmons Framework's three forces (Opportunity, Team, Resources - already defined in the Chapter 1&2 note) rather than just a document exercise; any named plan-writing case or template the chapter provides.</scope>
<output_structure>
# Chapter - 8 — The Business Plan
## Chapter Summary
## Key Concepts
## Full Reading Notes (one ### per the book's own real sections)
## Examples Worth Keeping (the book's own case if it gives one)
## Connections (the pending-lecture note above; link back to [[20_Progress/Degree/MGMT 3015/Textbook/Chapter - 1 & 2|Chapter 1 & 2]]'s Timmons Framework)
## Open Questions (3-5)
## Flashcards (6-8, #cards/MGMT)
</output_structure>
<formatting_rules>One blank line between blocks. Exactly one ==highlight==. **Bold** terms on first use. Cite real page numbers. No filler language.</formatting_rules>
<output_contract>Return the entire note as one fenced markdown code block, nothing outside it. Verify every real section of the chapter has its own ### heading, and the pending-lecture note is present in Connections.</output_contract>
```
## Session Note Prompt (Claude Sonnet 5 agentic build)
Reusable - fill the brackets per session. Unlike the textbook prompts above, this runs with real file read/write access (no paste-box or character limit), so it stays as one complete prompt rather than being split for length.
### Session Note — reusable, any session
```
<role>You are filling in one class session's synthesis note inside a university student's personal Obsidian vault, for personal study only. Never invent facts beyond the attached sources; where a source is silent, say so explicitly rather than guessing. You have file read/write access - use it. This task involves multistep cross-referencing across several files; think carefully before writing rather than pattern-matching from the session number alone.</role>
<sources>
PRIMARY (slide deck): [PATH TO THE SESSION'S REAL .pptx FILE in `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\`], real date [DATE], real session number [N] per [[MGMT 3015 Board]]'s Schedule table.
PPTX EXTRACTION: the .pptx file is a binary zip archive - a plain file-read tool cannot open it directly. Before reading it, extract its real text: a .pptx is a zip archive containing `ppt/slides/slideN.xml` (visible slide text, inside `<a:t>...</a:t>` runs) and `ppt/notesSlides/notesSlideN.xml` (speaker notes, same tag). Unzip the file (e.g. PowerShell's `[System.IO.Compression.ZipFile]::OpenRead(...)` reading each slide/notes XML entry, or an available pptx-reading tool/skill if this environment has one) and extract every `<a:t>` text run per slide in order, plus any speaker notes. Read the actual extracted text before writing anything - never guess slide content from the filename alone. Some extracted runs may come out letter-by-letter because of the deck's own text-animation formatting (e.g. "H a s D e t ermin a t i on" instead of "Has Determination") - reconstruct the real words before using them, and flag in Takeaways if a passage is too fragmented to reconstruct with confidence.
SECONDARY (textbook): the matching chapter note in `20_Progress/Degree/MGMT 3015/Textbook/`, per [[20_Progress/Degree/MGMT 3015/Textbook/Textbook Map|Textbook Map]]'s session-to-chapter mapping - read it in full if it exists; if it doesn't exist yet for this session's assigned reading, say so plainly in Textbook integration rather than inventing chapter content.
STANDARD: [[Weekly Standard]] and [[Week Template]] govern every heading below - read both in full before writing, they are the content contract, not just formatting. This course indexes sessions as `Lecture - N.md` (real session number, not calendar week) per [[20_Progress/Degree/MGMT 3015/Lecture/Weekly Board|this course's own Weekly Board]] - always use the real session number from [[MGMT 3015 Board]]'s Schedule table.
DESTINATION: `20_Progress/Degree/MGMT 3015/Lecture/Lecture - [N].md`. If it doesn't exist, create it from [[Week Template]]'s frontmatter (`type: class`, `input_kind: lecture`, `status: sprout`, `area: [[MGMT 3015 Board]]`, `tags: [#class, #Lecture]`, `next:` -> the following real session's Lecture note). If it exists, preserve its frontmatter exactly and add to the body without deleting anything real that's already there.
</sources>
<process>Read the extracted slide text and speaker notes in full before writing. Read the matching textbook chapter note in full if one exists. Cross-check explicitly: does the deck cover material the textbook note doesn't have (professor ahead of the book, or slides-only content like an SDG exercise that never appears in the textbook), or does the book cover something this session's deck doesn't touch? State that delta plainly in Textbook integration.</process>
<scope>This applies identically to every session, regardless of type - a content-heavy lecture, a light group-activity session, a quiz session, or a presentation session. Do not silently generalize "this is a light session" into skipping sections; fill every heading honestly for what that session actually contains:
- Real taught content (definitions, frameworks, named research, case examples): capture it in full, one ### per real topic break in the deck, reproducing named lists/frameworks/examples exactly as the deck gives them, not summarized into "etc."
- A pure activity/presentation/group-work session with no new taught content (e.g. idea pitches, 2-minute presentations, quiz-only sessions): say so explicitly in the Lecture section (what the activity was, its real instructions/format from the deck) rather than padding with invented content, and leave "What you must be able to do" / "Key ideas" thin and honest rather than stretched to match other sessions' density.
- A session whose deck substantially overlaps a prior session's (e.g. reused slides): name the overlap explicitly rather than re-explaining the same content as if new.
</scope>
<output_structure>
Fill every heading [[Week Template]] defines, in order, for the real session number [N]:
## What you must be able to do - testable objectives only if the session supports them; link the matching [[Chapter - N]] first if one is assigned
## Key ideas (short) - 3-6 compressed claims, or fewer if the session is genuinely light; never pad
## Concepts created today - real [[Concept - ]] links this session justifies, or state plainly none were needed
## Examples worth keeping - real cases, exercises, or named examples from the deck, never invented ones
## Lecture - one `### N. Title` per real topic/activity break in the deck, using the real date; reproduce named lists, frameworks, quotes, and exercise instructions in full
## Textbook integration - the real delta from the cross-check above, linked to the actual chapter note, or an explicit "(pending)" note if no chapter note exists yet or none is assigned this session
## Takeaways (questions to resolve) - 2-5 genuine `- [ ]` open questions, including any content the pptx extraction couldn't reconstruct cleanly
## Lecture-to-textbook synthesis - the exact six-part shape from [[Weekly Standard]]: one `==highlight==`, `*Mechanism:*`, a real lecture example/scenario, the textbook connection, concept links, then `> [!WARNING]` (a real common confusion this session invites) and `> [!SUMMARY]` (one sentence on what the session is really about)
## Flashcards - 3-5+ cards under `#cards/MGMT`, testing distinctions and mechanisms, not labels - fewer cards is honest and correct for a genuinely light session, don't inflate the count
</output_structure>
<formatting_rules>Follow [[Weekly Standard]]'s Per-Heading Standard exactly. **Bold** named concepts/frameworks/researchers on first use. Exactly one `==highlight==` in the entire note, inside the synthesis section only. No marketing or filler language; no sentence that could describe any course's generic version of this topic - every sentence should carry this deck's real phrasing, a named example, or a real page citation.</formatting_rules>
<output_contract>Write the result directly to the destination path via file edit, preserving frontmatter. Then update `20_Progress/Degree/MGMT 3015/Lecture/Weekly Board.md`'s Map section with one real sentence for this session, per [[Week Standard]]. Report back in chat: which headings got real sourced content vs. which were left honestly thin because the session itself was light, any deck/textbook delta found during the cross-check, and any pptx-extraction fragments that couldn't be confidently reconstructed.</output_contract>
```
## Verification notes, 2026-09-28
Checked before writing the above: [[MGMT 3015 Board]]'s Schedule table and the [[20_Progress/Degree/MGMT 3015/Textbook/Textbook Map|Textbook Map]]'s chapter-to-session mapping cross-checked against each other - consistent (Ch 4 has no dated reading row of its own, correctly, since Sessions 4-5 assign "Ch 3 & 4" together; Ch 8 is Sessions 8-9). Read the real text of all seven `.pptx` decks in the source folder (Sessions 1-7 currently exist as files - matches the Board's own listed topics exactly, including that Session 6's deck is largely a repeat of Session 5's SDG slides, a real fact worth knowing before writing Session 6's note, not a mistake in this file). Confirmed via direct file listing that `Repetitive Things.md` has never contained an "### MGMT 3015" section and no sync-conflict copy exists, so the prompt that `Chapter - 3 & 4.md`, the Textbook Map, and two Lecture notes all pointed to is unrecoverable - flagged in each of those notes rather than silently assumed lost. Both broken `CSCI 4041` links were confirmed against the real file tree (no such path exists) and corrected to the real `MGMT 3015/Textbook/` paths.

