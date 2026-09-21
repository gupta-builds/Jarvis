
# Prompts
## Notebook
Gemini Notebook (the July 2026 rename of NotebookLM) runs on the Gemini 3.5 model family with no user-facing model picker — Google folded the education-tuned LearnLM behavior into the default Gemini Notebook experience rather than exposing it as a setting, which is why there was nothing to configure. [Same tool, new name: NotebookLM is now Gemini Notebook](https://it.rutgers.edu/2026/09/10/same-tool-new-name-notebooklm-is-now-gemini-notebook/), [NotebookLM April 2026 Update: New Features, Gemini Model, and Power-User Guide](https://leadershipinchange.com/p/gemini-notebooklm-ai-research-2026)

Workflow: fresh Gemini Notebook chat per chapter, upload that chapter's sources, paste the filled prompt below, save the output as the chapter note in `20_Progress/Degree/CSCI 4511W/Textbook/`. No chat memory carries over — if continuity with a prior chapter's terminology matters, upload that prior chapter's saved `.md` note as an extra source and say so in the prompt.

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

### Chapter 2 instance — Intelligent Agents (ready to paste, filled 2026-09-20)
Upload to a fresh Gemini Notebook: `CSCI 4511W Textbook.pdf` (or a Chapter 2-only extract, pp. 36–63), `CSCI4511W Lecture 02.pdf`, `Discussion 2.pdf`. Then paste:
```
You are producing a source-grounded study note for a university course, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy on essays/coding does not apply, but you must still never invent facts beyond the attached sources.

SOURCES AND PRIORITY
1. PRIMARY, load-bearing source: Russell & Norvig, "Artificial Intelligence: A Modern Approach," 4th ed. — Chapter 2, "Intelligent Agents," pp. 36–63. The note's structure and depth come from this chapter, section by section, in the book's own order.
2. SECONDARY, emphasis source: "CSCI4511W Lecture 02" (Sep 14, 2026, "Definitions, Agent Structure"). Use this only to decide what to expand, which vocabulary/diagram labels the professor uses verbatim, and what the professor has NOT yet covered — mark those gaps, do not skip the textbook content anyway. Note specifically: the lecture defines Agent, Percept, Percept Sequence, and State (a professor-added term, not one of the book's own glossary entries — flag this); its environment-properties slide headlines only Observability, Agent Number, Determinism, Static vs. Dynamic, and Discrete vs. Continuous (the book covers seven axes total — cover all seven, flag the shorter lecture list); its agent-architecture diagrams stop at Simple Reflex, Model-Based Reflex, and Goal-Based agents, reproducing these exact box labels: Percept, Sensors, Condition-action rules, "What action I should take," Actuators, Model of World, "How the world evolves," "What agent actions do," Goals, "Model of world if I take certain actions." The lecture has not yet reached Utility-Based or Learning agents — cover them from the book anyway and flag that lecture hasn't gotten there.
3. BACKGROUND, non-content source: "Discussion 2" (course AI-use policy, 9/18/2026). Do not summarize this as chapter content — it is course-policy context only.

SCOPE
Cover only sections 2.1 through 2.4, every numbered subsection (2.1; 2.2 with 2.2.1–2.2.3; 2.3 with 2.3.1–2.3.2; 2.4 with 2.4.1–2.4.7). Do not summarize chapters or sections outside this range even if the source PDF contains them.

STRUCTURE — output exactly these headings in this order, nothing added or removed:
# Chapter 2 — Intelligent Agents
## Chapter Summary
One sentence claim with exactly one ==highlighted== phrase, then "*Mechanism:*" explaining how the claim works.
## Key Concepts
Every named term from the chapter, **bolded** on first use, one line each: what it means and why it matters to the chapter's argument.
## Full Reading Notes
One ### subheading per numbered subsection, using the book's own subsection numbers and titles verbatim (e.g. "### 2.2.1 Performance measures"). Every distinct claim, example, and piece of reasoning in that subsection must appear in some form — if I could learn something from re-reading the original PDF that isn't in your note, the note has failed. Reproduce named examples, numbered lists, and formulas in full (LaTeX via $...$ or $$...$$), don't compress them into "etc." Reproduce the three agent diagrams from the lecture as described box-and-arrow flows, using the exact labels listed above.
## Worked Example
The automated taxi PEAS/environment-classification example, run end-to-end through the chapter's own reasoning.
## Connections
- Lecture: what the 9/14 lecture emphasized from this material, and what it has not reached yet — be specific about which named concepts appeared on slides vs. only in the book.
- Textbook: "(pending Chapter 3 — search)".
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
When lecture and textbook vocabulary diverge (see the SECONDARY source notes above), cover the textbook's full version, then add a short > [!NOTE] callout naming the lecture's variant and how it differs. Never silently drop textbook content because the lecture used a shorter list.

OUTPUT CONTRACT
Return the entire note as a single fenced Markdown code block (```markdown ... ```) so nothing gets reinterpreted by the chat UI when copied into Obsidian. Do not add commentary before or after the code block.

Before answering, silently verify: every numbered subsection in the scope has its own ### heading; every bolded term is actually defined; the highlight count per ## section is exactly one; the code block is the entire response.
```

### Open flags — read before running this
- **Week numbering mismatch:** Lecture 02 (Ch 2, "Intelligent Agents") is the Monday 9/14 session, which the syllabus schedule and [[20_Progress/Degree/CSCI 4511W/Weekly/Weekly Board|Weekly Board]] both place in calendar **Week 2**, not Week 1 — Week 1 (9/7–9/13) was Labor Day plus the intro lecture and the Turing discussion. The vault's `Week - 1.md` note does hold real Ch. 2 vocabulary (Performance Measure, Environment, Actuators, Sensors, Vacuum World) from the 9/9 intro lecture, which is probably why "week 1" felt right — but the dated Ch. 2 lecture content itself belongs under `Week - 2.md`. Worth confirming which week label you actually want before filing the output.
- **A Chapter 2 note already exists:** [[20_Progress/Degree/CSCI 4511W/Textbook/Chapter - 2|Chapter - 2]] was already written directly (not via Gemini Notebook) and is already fairly deep — decide whether this Gemini Notebook pass is meant to replace it, or run in parallel as a cross-check.
- **AI policy scope:** [[Discussion 2]]'s course policy governs graded submissions (essays, problem sets); it does not restrict personal study notes built from the textbook and slides, since nothing here gets submitted for credit.
