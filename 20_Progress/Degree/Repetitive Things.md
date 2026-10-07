
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
#

## MGMT 3015 — Remaining Textbook Chapter Build Prompts
Added 2026-10-07. Use these in fresh Gemini Notebook chats, one prompt per part, in the same chat for a chapter when a chapter has multiple parts. Upload the textbook PDF and the named lecture deck(s) before pasting. These prompts are for the unwritten textbook layer only; Codex remains responsible for weekly synthesis notes. Measure every filled prompt before pasting: target **under 3,000 characters**. Do not shorten the output contract or formatting rules; split SCOPE further if needed.

### Verified course map and current coverage
The assigned textbook is Zacharakis, Bygrave & Corbett, *Entrepreneurship*, 5th ed. (Wiley, 2019), local source `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\MGMT 3015 - Entrepreneurship, 5th Edition.pdf`. Existing landed notes: [[20_Progress/Degree/MGMT 3015/Textbook/Chapter - 1 & 2|Chapters 1–2]], [[20_Progress/Degree/MGMT 3015/Textbook/Chapter - 3 & 4|Chapter 3; Chapter 4 pending]], and [[20_Progress/Degree/MGMT 3015/Textbook/Chapter - 8|Chapter 8]]. The remaining build is Chapters **4, 5, 6, 7, 9, 10, 11, 12, and 13**. Session mapping: Ch 4 = Sessions 4–5 (Creativity, Idea Generation, Opportunities); Ch 5 = Session 13 (Business Models); Ch 6 = Sessions 10 and 12 (Industry Analysis, Strategy); Ch 7 = Session 23 (Venture Team); Ch 9–11 = Sessions 19–20 (Financing); Ch 12 = Sessions 15–16 (Marketing); Ch 13 = Session 25 (Growth). Session 22, Internationalization, is slides-only and receives no textbook chapter note. Preserve the two Board date anomalies (Session 6 = stated 9/25; Session 16 = stated 10/31) as unresolved source facts; do not silently correct them.

### Shared Notebook instruction — include in every prompt
```text
You are producing a source-grounded Obsidian study note for MGMT 3015, for personal study only. Use only the uploaded textbook and lecture sources; never add general knowledge or repair a source gap from memory. Read the textbook in its own order and identify subsection numbers/titles from the PDF itself. Output exactly these headings: # [Chapter Title]; ## Chapter Summary; ## Key Concepts; ## Full Reading Notes; ## Worked Example; ## Connections; ## Open Questions; ## Flashcards. In Full Reading Notes, use one ### heading per numbered subsection and retain every distinct claim, example, list, caveat, framework, and named case in the scoped pages. Bold each named term on first use and define why it matters. Include page numbers for direct definitions or close paraphrases. Use exactly one ==highlight== per major ## section, no filler, and preserve uncertainty explicitly. Connections must distinguish lecture emphasis from textbook-only content and flag material that belongs to another chapter. Open Questions must contain 3–5 real - [ ] tasks. Flashcards must test mechanisms and contrasts, not labels, under #cards/MGMT. Return the entire note as one fenced ```markdown code block and add no commentary outside it.
```

### Prompt 1 — Chapter 4, “Prototyping Your Ideas”
```text
Use the shared Notebook instruction above. PRIMARY: [TEXTBOOK PDF], Chapter 4, “Prototyping Your Ideas,” textbook pages [FILL: exact range]. SECONDARY: `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\2026 f3015 S4 Idea Generation.pptx` and `2026 S3015 S5 Opportunities.pptx`; use slides only to identify emphasis, terminology, examples, and textbook/lecture gaps. SCOPE: cover every Chapter 4 subsection on prototyping, experiments, testing, feedback, iteration, and any named framework or case in the uploaded pages. Do not summarize Chapter 3 again; state the Chapter 3/4 boundary where the source makes it clear. Produce the complete chapter note under the shared structure. If the existing Chapter - 3 & 4 note is supplied as a source, preserve its Chapter 3 content conceptually but write a complete Chapter 4 section and flag any wrap/integration work still required.
```

### Prompt 2 — Chapter 5, “Business Models”
```text
Use the shared Notebook instruction above. PRIMARY: [TEXTBOOK PDF], Chapter 5, “Business Models,” textbook pages [FILL: exact range]. SECONDARY: no lecture file beyond the course schedule unless `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\` contains a Session 13 deck; if present, upload it and name it here. SCOPE: cover every numbered subsection, business-model definition, component/framework, revenue or value-creation mechanism, named example, case, table, and evaluation test in Chapter 5. The course assigns this chapter to Session 13 (Business Models), after Chapter 6 industry/strategy sessions; preserve that out-of-order teaching relationship in Connections. Produce a complete note, distinguishing textbook content from any slide-only emphasis and leaving unknown lecture coverage unresolved.
```

### Prompt 3 — Chapter 6, “Industry Analysis and Strategy”
```text
Use the shared Notebook instruction above. PRIMARY: [TEXTBOOK PDF], Chapter 6, “Industry Analysis and Strategy,” textbook pages [FILL: exact range]. SECONDARY: upload any available Session 10 Industry Analysis and Session 12 Strategy decks from `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\`; name each file exactly. SCOPE: cover the entire chapter in book order, including every industry-analysis force/tool, strategic choice, framework, test, figure/table, case, example, and caveat. Do not collapse distinct frameworks into one generic strategy summary. Connections must separate material emphasized in Session 10 from Session 12, identify chapter content not in slides, and note that Session 13 then assigns Chapter 5 Business Models. Output a complete Chapter 6 note under the shared structure.
```

### Prompt 4 — Chapter 7, “The Venture Team”
```text
Use the shared Notebook instruction above. PRIMARY: [TEXTBOOK PDF], Chapter 7, “The Venture Team,” textbook pages [FILL: exact range]. SECONDARY: upload the Session 23 Venture Team lecture deck if available in `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\`; otherwise state that lecture emphasis is unavailable. SCOPE: cover every subsection on venture-team formation, roles, founder/team characteristics, relationships, organization, conflict, incentives, or other mechanisms actually present in the chapter; retain all named cases, lists, tests, and caveats. The chapter is assigned to Session 23 (11/30), after the slides-only Internationalization session; do not invent a connection between them. Produce the complete note and mark every unavailable lecture comparison as unresolved.
```

### Prompt 5 — Chapters 9–11, Financing (three prompts in one chat)
```text
Use the shared Notebook instruction above separately for each chapter. PRIMARY: [TEXTBOOK PDF], Chapter [9 OR 10 OR 11], “[EXACT TITLE FROM PDF],” textbook pages [FILL: exact range]. SECONDARY: upload any Session 19 Financing 1 and Session 20 Financing 2 decks from `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\`; identify which chapter each slide section appears to emphasize. SCOPE: only the selected chapter's numbered subsections, preserving distinct financing mechanisms, stages, instruments, decision criteria, calculations, examples, tables, cases, risks, and caveats. Do not merge Chapters 9, 10, and 11 into one note or silently assign a slide to the wrong chapter. The course teaches all three across Sessions 19–20; Connections must state chapter-to-session uncertainty where the sources do not resolve it. Return one complete note for the selected chapter. Repeat with a fresh SCOPE for each of Chapters 9, 10, and 11.
```

### Prompt 6 — Chapter 12, “Marketing”
```text
Use the shared Notebook instruction above. PRIMARY: [TEXTBOOK PDF], Chapter 12, “Marketing,” textbook pages [FILL: exact range]. SECONDARY: upload the Session 15 Marketing #1 and Session 16 Marketing #2 decks from `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\` if present; preserve their actual filenames and dates. SCOPE: cover every numbered subsection, marketing concept, customer/market mechanism, research or segmentation tool, positioning/communication decision, example, case, table, and caveat in the chapter. Do not compress two distinct lecture sessions into one generic paragraph. Connections must distinguish Session 15 from Session 16, textbook-only material from slide emphasis, and the unresolved stated Session 16 date (10/31) from the likely calendar interpretation. Produce the complete Chapter 12 note.
```

### Prompt 7 — Chapter 13, “Growth”
```text
Use the shared Notebook instruction above. PRIMARY: [TEXTBOOK PDF], Chapter 13, “Growth,” textbook pages [FILL: exact range]. SECONDARY: upload the Session 25 Growth deck if available in `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\Lecture\`; otherwise explicitly mark lecture coverage unavailable. SCOPE: cover every numbered subsection on venture growth, growth choices, constraints, measurement, organization, financing, risks, failure modes, named cases, figures/tables, and decision criteria actually present in the chapter. The course assigns it to Session 25 (12/7), before final business-plan work; do not infer content from that sequence. Produce a complete chapter note, retaining unresolved questions where the uploaded sources do not answer them.
```

### Landing and verification contract
For each output, save the returned Markdown into `20_Progress/Degree/MGMT 3015/Textbook/Chapter - [N].md`, preserving valid frontmatter and the course's existing wikilinks. Then read the note against [[30_Order/Standards/Courses/Textbook Standard]], compare definitions/examples/page ranges to the PDF, and update [[20_Progress/Degree/MGMT 3015/Textbook/Textbook Map|Textbook Map]] with status only—do not duplicate chapter prose there. Link the relevant week after the weekly note exists. If a source, chapter title, page range, or lecture deck is missing, retain `[FILL: ...]` or an explicit unresolved marker; do not invent it. After all chapters land, append one concise entry to [[60_Claude/07_AI_Information/Session Logs/log.md]] describing which notes were created, which remain incomplete, and which source gaps remain.
