
# Prompts
## Notebook
Gemini Notebook (the July 2026 rename of NotebookLM) runs on the Gemini 3.5 model family with no user-facing model picker — Google folded the education-tuned LearnLM behavior into the default Gemini Notebook experience rather than exposing it as a setting, which is why there was nothing to configure. [Same tool, new name: NotebookLM is now Gemini Notebook](https://it.rutgers.edu/2026/09/10/same-tool-new-name-notebooklm-is-now-gemini-notebook/), [NotebookLM April 2026 Update: New Features, Gemini Model, and Power-User Guide](https://leadershipinchange.com/p/gemini-notebooklm-ai-research-2026)

Workflow: fresh Gemini Notebook chat per chapter, upload that chapter's sources, paste the filled prompt below, save the output as the chapter note in `20_Progress/Degree/CSCI 4511W/Textbook/`. No chat memory carries over — if continuity with a prior chapter's terminology matters, upload that prior chapter's saved `.md` note as an extra source and say so in the prompt.

**Character limit, confirmed 2026-09-21:** Gemini Notebook's paste box rejects the single-shot ~5,590-character prompt below the master template's full length. A ~3,798-character version (cutting FORMATTING RULES, VOCABULARY RECONCILIATION, OUTPUT CONTRACT, and the content-density mandate) went through, and the output was noticeably thinner for it. Do not cut instructions to fit — split the chapter into two prompts fed into the **same** Gemini Notebook chat instead, each kept under ~3,000 characters (comfortable margin below the ~3,798 working ceiling, since the true cap is still unconfirmed). Part 1 asks only for the first half's `### ` subsections; Part 2 (same chat, so it can see Part 1's output) asks for the second half's subsections plus the whole-chapter wrap — Chapter Summary, Key Concepts, Worked Example, Connections, Open Questions, Flashcards — built from both messages together. Every rule (content density, formatting, vocabulary reconciliation, single-code-block output) stays in both parts; only the section SCOPE shrinks.

### Master prompt (reusable — fill the brackets each week)
```
You are producing a source-grounded study note for a university course, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy on essays/coding does not apply, but you must still never invent facts beyond the attached sources.

SOURCES AND PRIORITY
1. PRIMARY, load-bearing source: [TEXTBOOK NAME], Chapter [N] — "[CHAPTER TITLE]", pp. [START]–[END]. The note's structure and depth come from this chapter, section by section, in the book's own order.
2. SECONDARY, emphasis source: [LECTURE FILE NAME], the lecture slides for this chapter. Use this only to decide what to expand, which vocabulary/diagram labels the professor uses verbatim, and what the professor has NOT yet covered (mark those gaps, do not skip the textbook content anyway).
3. BACKGROUND, non-content source: [DISCUSSION FILE NAME]. Do not summarize this as chapter content — it is course-policy context only.

SCOPE
Cover only [SECTION RANGE, e.g. "2.1 through 2.4, every numbered subsection"]. Do not summarize chapters or sections outside this range even if the source PDF contains them.

STRUCTURE — output exactly these headings in this order, nothing added or removed:
# [Chapter Title]
## Chapter Summary
One sentence claim with exactly one ==highlighted== phrase, then "*Mechanism:*" explaining how the claim works.
## Key Concepts
Every named term from the chapter, **bolded** on first use, one line each: what it means and why it matters to the chapter's argument.
## Full Reading Notes
One ### subheading per numbered subsection, using the book's own subsection numbers and titles verbatim (e.g. "### 2.2.1 Performance measures"). Every distinct claim, example, and piece of reasoning in that subsection must appear in some form — if I could learn something from re-reading the original PDF that isn't in your note, the note has failed. Reproduce named examples, numbered lists, and formulas in full (LaTeX via $...$ or $$...$$), don't compress them into "etc."
## Worked Example
One end-to-end example (use the chapter's own running example if it has one) that ties the whole section's concepts together.
## Connections
- Lecture: what the lecture slides emphasized from this material, and what they have not reached yet — be specific about which named concepts appeared on slides vs. only in the book.
- Textbook: nothing to fill here yet, leave the line as "(pending next chapter)".
## Open Questions
3–5 items as Markdown tasks ("- [ ] ...") — genuine unresolved questions or self-test prompts a student should be able to answer after really understanding this material, not busywork.
## Flashcards
5–8 cards testing mechanisms and contrasts, not labels. Format: "Question::Answer #cards/ai" one per line, or multiline with "?" separator for longer answers.

FORMATTING RULES (violating these is a failure, not a style choice)
- Zero blank lines between a heading and its first line of content, and zero blank lines between consecutive list items or sections.
- ==highlight== markers: exactly one per major ## heading, reserved for the single most important definitional claim in that section.
- **bold**: named concepts/terms on first introduction only, not general emphasis.
- *label:* italics for sub-category intro labels like *Mechanism:* or *Failure mode:*.
- No marketing or filler language: avoid words like "transformative," "powerful," "seamless," "leverage," "comprehensive," "unlock," "landscape," "journey" — say the actual mechanism instead.
- No sentence that could be pasted into a generic study-guide site unchanged. Every sentence should carry a mechanism, example, contrast, or explicit uncertainty.
- Cite page numbers for direct definitions or close paraphrases, in parentheses.

VOCABULARY RECONCILIATION
The lecture may use terms or a shorter list of properties than the textbook (e.g. the lecture's own definitions, or a trimmed set of environment-property axes). When lecture and textbook vocabulary diverge, cover the textbook's full version, then add a short > [!NOTE] callout naming the lecture's variant and how it differs. Never silently drop textbook content because the lecture used a shorter list.

OUTPUT CONTRACT
Return the entire note as a single fenced Markdown code block (```markdown ... ```) so nothing gets reinterpreted by the chat UI when copied into Obsidian. Do not add commentary before or after the code block.

Before answering, silently verify: every numbered subsection in the scope has its own ### heading; every bolded term is actually defined; the highlight count per ## section is exactly one; the code block is the entire response.
```

### Chapter 2 instance — Intelligent Agents (two-part, fits the character limit, filled 2026-09-21)
Upload once to a fresh Gemini Notebook: `CSCI 4511W Textbook.pdf` (or a Chapter 2-only extract, pp. 36–63), `CSCI4511W Lecture 02.pdf`, `Discussion 2.pdf`. Send Part 1, read the reply, then send Part 2 as the next message in the **same** chat so it can build on Part 1's output.
#### Part 1 of 2 — sections 2.1 and 2.2 (~2,755 characters)
```
You are producing a source-grounded study note for a personal Obsidian study note — not a graded submission, so course AI policy on essays/coding does not apply. Never invent facts beyond the attached sources.

SOURCES
PRIMARY: Russell & Norvig, "Artificial Intelligence: A Modern Approach," 4th ed., Chapter 2 "Intelligent Agents," pp. 36–63. The note's structure and depth come from this chapter, section by section, in the book's own order.
SECONDARY: "CSCI4511W Lecture 02" (Sep 14, 2026, "Definitions, Agent Structure"). Use only to flag which vocabulary/diagram labels the professor used verbatim and what the lecture has not reached yet — never to replace textbook depth.
BACKGROUND (not content): "Discussion 2," course AI-use policy — ignore for chapter content.

THIS IS PART 1 OF 2 for this chapter. A follow-up prompt covers 2.3–2.4 and the whole-chapter wrap (summary, key concepts, worked example, connections, open questions, flashcards). Do not write those now — output only what SCOPE and OUTPUT below ask for.

SCOPE
Cover only 2.1 (Agents and Environments) and 2.2 with its subsections 2.2.1, 2.2.2, 2.2.3 (Good Behavior: The Concept of Rationality).

LECTURE VOCABULARY NOTE
The lecture defines Agent, Percept, Percept Sequence, and State. State ("a unique configuration of agent in its environment") is a professor-added term, not one of the book's own named glossary entries in 2.1 — cover it inside the 2.1 subsection anyway, then add one short > [!NOTE] callout flagging that this term is lecture vocabulary, not book vocabulary.

OUTPUT
One ### subheading per numbered subsection, using the book's own subsection numbers and titles verbatim (e.g. "### 2.2.1 Performance measures"). Every distinct claim, example, and piece of reasoning in each subsection must appear in some form — if re-reading the original PDF would teach me something not in your note, the note has failed. Reproduce named examples, numbered lists, and formulas in full (LaTeX via $...$ or $$...$$), never compress into "etc." **Bold** named concepts/terms on first use only, not general emphasis. Exactly one ==highlight== for the single most important definitional claim across this whole response (the formal rationality definition in 2.2.2). Use *label:* italics for sub-labels like *Mechanism:* or *Pitfall:*. Cite page numbers for direct definitions or close paraphrases, in parentheses. No marketing language ("powerful," "comprehensive," "unlock," "leverage," "seamless," "landscape") — say the actual mechanism instead. Zero blank lines between a heading and its content, and zero blank lines between consecutive list items or sections.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
#### Part 2 of 2 — sections 2.3, 2.4, and the whole-chapter wrap (~2,756 characters)
```
PART 2 OF 2 for this chapter, same rules as before: never invent facts beyond the attached sources, personal study note not a graded submission.

SCOPE — FIRST HALF
Cover 2.3 with subsections 2.3.1, 2.3.2 (The Nature of Environments) and 2.4 with subsections 2.4.1–2.4.7 (The Structure of Agents), from Russell & Norvig, Chapter 2, pp. 36–63. One ### subheading per numbered subsection, book's own titles verbatim. Every distinct claim, example, and formula must appear in some form — if re-reading the PDF would teach me something missing here, this has failed. Reproduce the agent-architecture diagrams (2.4.2–2.4.4) as described box-and-arrow flows using these exact lecture box labels: Percept, Sensors, Condition-action rules, "What action I should take," Actuators, Model of World, "How the world evolves," "What agent actions do," Goals, "Model of world if I take certain actions." Lecture slides stop at Goal-Based — cover Utility-Based (2.4.5) and Learning agents (2.4.6) from the book anyway and note the lecture hasn't reached them.

SCOPE — SECOND HALF: whole-chapter wrap
Using everything from this message and the previous 2.1–2.2 message, now add:
## Chapter Summary — one sentence claim, exactly one ==highlight==, then "*Mechanism:*" paragraph.
## Key Concepts — every named term from all of 2.1–2.4, **bolded** on first use, one line each.
## Worked Example — the automated taxi PEAS/environment-classification example, end to end.
## Connections — Lecture: name which concepts the 9/14 lecture covered vs. book-only, specifically that its environment-properties slide headlined only 5 of the book's 7 axes (Observability, Agent Number, Determinism, Static/Dynamic, Discrete/Continuous — omitting Episodic/Sequential and Known/Unknown). Textbook: "(pending Chapter 3 — search)".
## Open Questions — 3–5 Markdown tasks ("- [ ] ..."), genuine self-test prompts.
## Flashcards — 5–8 cards, mechanisms not labels: "Question::Answer #cards/ai".

RULES
Highlight budget: 2.3–2.4 get zero new ==highlights== (2.2 already used the one Full Reading Notes highlight); Chapter Summary, Key Concepts, Worked Example, Open Questions, and Flashcards each get exactly one ==highlight== of their own single most important claim. Cite page numbers for direct definitions, in parentheses. *label:* italics for sub-labels. No marketing language ("powerful," "comprehensive," "unlock," "leverage," "seamless"). Zero blank lines between a heading and its content or between list items. Where lecture and book vocabulary diverge, add one short > [!NOTE] callout, never silently drop book content for a shorter lecture list.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```

### Open flags — read before running this
- **Week numbering mismatch:** Lecture 02 (Ch 2, "Intelligent Agents") is the Monday 9/14 session, which the syllabus schedule and [[20_Progress/Degree/CSCI 4511W/Weekly/Weekly Board|Weekly Board]] both place in calendar **Week 2**, not Week 1 — Week 1 (9/7–9/13) was Labor Day plus the intro lecture and the Turing discussion. The vault's `Week - 1.md` note does hold real Ch. 2 vocabulary (Performance Measure, Environment, Actuators, Sensors, Vacuum World) from the 9/9 intro lecture, which is probably why "week 1" felt right — but the dated Ch. 2 lecture content itself belongs under `Week - 2.md`. Worth confirming which week label you actually want before filing the output.
- **A Chapter 2 note already exists:** [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter - 2]] was already written directly (not via Gemini Notebook) and is already fairly deep — decide whether this Gemini Notebook pass is meant to replace it, or run in parallel as a cross-check.
- **AI policy scope:** [[Discussion 2]]'s course policy governs graded submissions (essays, problem sets); it does not restrict personal study notes built from the textbook and slides, since nothing here gets submitted for credit.
