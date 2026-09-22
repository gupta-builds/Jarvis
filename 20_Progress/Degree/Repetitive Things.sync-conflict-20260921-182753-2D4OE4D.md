
# Prompts
## Notebook
Gemini Notebook (the July 2026 rename of NotebookLM) runs on the Gemini 3.5 model family with no user-facing model picker — Google folded the education-tuned LearnLM behavior into the default Gemini Notebook experience rather than exposing it as a setting, which is why there was nothing to configure. [Same tool, new name: NotebookLM is now Gemini Notebook](https://it.rutgers.edu/2026/09/10/same-tool-new-name-notebooklm-is-now-gemini-notebook/), [NotebookLM April 2026 Update: New Features, Gemini Model, and Power-User Guide](https://leadershipinchange.com/p/gemini-notebooklm-ai-research-2026)

Workflow: fresh Gemini Notebook chat per chapter, upload that chapter's sources, paste the filled prompt below, save the output as the chapter note in `20_Progress/Degree/CSCI 4511W/Textbook/`. No chat memory carries over — if continuity with a prior chapter's terminology matters, upload that prior chapter's saved `.md` note as an extra source and say so in the prompt.

**Character limit, confirmed 2026-09-21:** Gemini Notebook's paste box rejects the single-shot ~5,590-character prompt below the master template's full length. A ~3,798-character version (cutting FORMATTING RULES, VOCABULARY RECONCILIATION, OUTPUT CONTRACT, and the content-density mandate) went through, and the output was noticeably thinner for it. Do not cut instructions to fit — split the chapter into two prompts fed into the **same** Gemini Notebook chat instead, each kept under ~3,000 characters (comfortable margin below the ~3,798 working ceiling, since the true cap is still unconfirmed). Part 1 asks only for the first half's `### ` subsections; Part 2 (same chat, so it can see Part 1's output) asks for the second half's subsections plus the whole-chapter wrap — Chapter Summary, Key Concepts, Worked Example, Connections, Open Questions, Flashcards — built from both messages together. Every rule (content density, formatting, vocabulary reconciliation, single-code-block output) stays in both parts; only the section SCOPE shrinks.
### CSCI 4511W
#### Chapter 2 instance — Intelligent Agents (two-part, fits the character limit, filled 2026-09-21)
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
### MGMT 3015
Source folder: `D:\_Anant\10_Areas\UMN\Classes\Minor\MGMT 3015\` — real textbook PDF (`MGMT 3015 - Entrepreneurship, 5th Edition.pdf`) and five real lecture slide decks in `Lecture\`, confirmed present 2026-09-21 (see [[MGMT 3015 Board]]'s Source of Truth). PDF page offset: textbook page N = PDF page N+22 (Chapter 1 starts textbook p. 1 = PDF p. 23) — use this when telling Gemini Notebook which pages to extract from an uploaded full-book PDF, or extract a chapter-only PDF first with `qpdf` before uploading.
#### Chapter - 1 & 2
Textbook pages 1-69 (PDF pages 23-91). Covers Session 2 (Mon 9/14, `2026 f3015 S2 What does it take to be an entrepreneurs Final.pptx`) and Session 3 (Wed 9/16, `2026 S3015 S3 Entrepreneurial Persoanlity.pptx`). Upload once to a fresh Gemini Notebook: a Ch 1-2-only PDF extract (pp. 1-69 / PDF pp. 23-91), both slide decks above. Send Part 1, read the reply, then send Part 2 in the same chat.
##### Part 1 of 2 — Chapter 1, "The Power of Entrepreneurship" (all named subsections)
```
You are producing a source-grounded study note for a personal Obsidian study note — not a graded submission, so course AI policy on written assignments does not apply here (this is not the Profile/New Business Idea report). Never invent facts beyond the attached sources.

SOURCES
PRIMARY: Zacharakis, Bygrave & Corbett, "Entrepreneurship," 5th ed., Chapter 1 "The Power of Entrepreneurship," pp. 1-40. The note's structure and depth come from this chapter, section by section, in the book's own order.
SECONDARY: "2026 F3015 S1 Introduction.pptx" (Session 1, 9/9) and "S2 What does it take to be an entrepreneur" (Session 2, 9/14). Use only to flag which stats/vocabulary the professor used verbatim (e.g. the ~44% GDP / ~46% workforce figures) and what lecture has not reached yet — never to replace textbook depth.

THIS IS PART 1 OF 2 for this chapter note. A follow-up prompt covers Chapter 2 and the whole-note wrap (summary, key concepts, worked example, connections, open questions, flashcards). Do not write those now.

SCOPE
Cover every named Chapter 1 subsection in book order: Entrepreneurship and Small Business in the United States; Entrepreneurial Revolution; Entrepreneurship Revolution Strikes Gold; Creative Destruction; Causes of the Entrepreneurial Revolution; Changes in the Entrepreneurial Framework Conditions; Churning and Economic Growth; Global Entrepreneurship Monitor (with its own Principal Findings, Activity, Necessity/Opportunity/Gender, Age Distribution, Growth Expectations and Job Creation, and Entrepreneurship Ecosystems subsections).

LECTURE VOCABULARY NOTE
Session 1's slides cite ~44% of U.S. GDP and ~46% of the private workforce from small/new business (sourced to SBA data, called "approximate" on the slide). Confirm the book's own GEM-sourced figures in the Global Entrepreneurship Monitor subsection and flag in a > [!NOTE] callout whether they match, and which is more precise.

OUTPUT
One ### subheading per named subsection, book's own titles verbatim. Every distinct claim, example, statistic, and piece of reasoning must appear in some form — if re-reading the original PDF would teach me something not in your note, the note has failed. Reproduce named examples, case sidebars (e.g. the GE/Walmart "Changing Economy" sidebar), and numbered lists in full, never compress into "etc." **Bold** named concepts/terms on first use only. Exactly one ==highlight== for the single most important definitional claim in this response (Schumpeter's definition of an entrepreneur, in Entrepreneurial Revolution). Use *label:* italics for sub-labels. Cite page numbers for direct definitions or close paraphrases, in parentheses. No marketing language ("powerful," "comprehensive," "unlock," "leverage," "seamless," "landscape"). Zero blank lines between a heading and its content or between consecutive list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
##### Part 2 of 2 — Chapter 2, "The Entrepreneurial Process," and the whole-note wrap
```
PART 2 OF 2 for this chapter note, same rules as before: never invent facts beyond the attached sources, personal study note not a graded submission.

SCOPE — FIRST HALF
Cover Chapter 2, "The Entrepreneurial Process," pp. 41-69, all named subsections in book order: Critical Factors for Starting a New Enterprise; Evaluating Opportunities for New Businesses; Determining Resource Needs and Acquiring Resources; Profit Potential; Ingredients for a Successful New Business. One ### subheading per subsection, book's own titles verbatim. Every distinct claim, example, and framework must appear in some form — if re-reading the PDF would teach me something missing here, this has failed.

LECTURE VOCABULARY NOTE
Sessions 1-2 both use a three-stage "Opportunity Discovery → Opportunity Evaluation → Opportunity Exploitation, inside a Context" diagram as the course's structural frame. Map this explicitly onto Chapter 2's own section structure (which of Critical Factors / Evaluating Opportunities / Determining Resource Needs corresponds to which lecture stage) in a > [!NOTE] callout. Session 3's six named entrepreneurial attributes (determination, energy, drive for financial success, need to achieve, independence, support network) are not their own book subheading — check whether "Ingredients for a Successful New Business" is where the book covers them, and note explicitly if the book's list differs from the lecture's six.

SCOPE — SECOND HALF: whole-chapter-note wrap
Using everything from this message and the previous Chapter 1 message, now add:
## Chapter Summary — one sentence claim spanning both chapters, exactly one ==highlight==, then "*Mechanism:*" paragraph.
## Key Concepts — every named term from all of Ch 1-2, **bolded** on first use, one line each.
## Worked Example — one full case walkthrough using the book's own Chapter 1 or 2 sidebar/case content (not the end-of-chapter Case study — that's a separate longer case, summarize it only if it's short enough to fit one paragraph).
## Connections — Lecture: state plainly which of Sessions 1-3's frameworks the book formalizes vs. only lecture covers (e.g. the four-type personality quiz from Session 3 has no book equivalent — say so). Textbook: "(pending Chapter 3 — search)".
## Open Questions — 3-5 Markdown tasks ("- [ ] ..."), genuine self-test prompts.
## Flashcards — 5-8 cards, mechanisms not labels: "Question::Answer #cards/MGMT".

RULES
Highlight budget: Chapter 2 section gets zero new ==highlights== (Chapter 1 already used the one); Chapter Summary, Key Concepts, Worked Example, Open Questions, and Flashcards each get exactly one ==highlight== of their own single most important claim. Cite page numbers for direct definitions. *label:* italics for sub-labels. No marketing language. Zero blank lines between a heading and its content or between list items. Where lecture and book vocabulary diverge, add one short > [!NOTE] callout, never silently drop book content for a shorter lecture list.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
#### Chapter - 3 & 4
Textbook pages 70-119 (PDF pages 92-141). Covers Session 4 (Mon 9/21, `2026  f3015 S4 Idea Generation.pptx`) and Session 5 (Wed 9/23, `2026 S3015 S5 Opportunities.pptx`). Upload once to a fresh Gemini Notebook: a Ch 3-4-only PDF extract (pp. 70-119 / PDF pp. 92-141), both slide decks above.
##### Part 1 of 2 — Chapter 3, "Opportunity Recognition, Shaping, and Reshaping"
```
You are producing a source-grounded study note for a personal Obsidian study note — not a graded submission. Never invent facts beyond the attached sources.

SOURCES
PRIMARY: Zacharakis, Bygrave & Corbett, "Entrepreneurship," 5th ed., Chapter 3 "Opportunity Recognition, Shaping, and Reshaping," pp. 70-101.
SECONDARY: "S4 Idea Generation.pptx" (Session 4, 9/21). Use only to flag lecture vocabulary/tactics that map onto the book's framework, never to replace textbook depth.

THIS IS PART 1 OF 2. A follow-up prompt covers Chapter 4 and the whole-note wrap. Do not write those now.

SCOPE
Cover every named subsection in book order: From Glimmer to Action: How Do I Come Up with a Good Idea?; Is Your Idea an Opportunity?; The Opportunity Checklist; "I Don't Have an Opportunity."

LECTURE VOCABULARY NOTE
Session 4 names three ideation methods (watch/listen for opportunity, use your networks via weak ties, flash of insight) and cites Granovetter's 1973 Strength of Weak Ties finding by name. Check whether "From Glimmer to Action" covers the same three methods, uses different names for them, or adds a fourth the lecture didn't mention — state the match or mismatch in a > [!NOTE] callout. Also confirm whether the book's "Opportunity Checklist" matches the evaluation criteria Session 5's slides use (bring that forward as an open question if Session 5 hasn't been captured yet).

OUTPUT
One ### subheading per subsection, book's own titles verbatim. Every distinct claim, example, and framework must appear in some form. Reproduce the Opportunity Checklist's actual criteria in full, never "etc." **Bold** named concepts on first use. Exactly one ==highlight== for the single most important claim (the book's own test for "is your idea an opportunity"). *label:* italics for sub-labels. Cite page numbers for direct definitions. No marketing language. Zero blank lines between a heading and its content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
##### Part 2 of 2 — Chapter 4, "Prototyping Your Ideas," and the whole-note wrap
```
PART 2 OF 2 for this chapter note, same rules as before.

SCOPE — FIRST HALF
Cover Chapter 4, "Prototyping Your Ideas," pp. 102-119, all named subsections: What Is Prototyping?; Types of Prototyping. One ### subheading per subsection, book's own titles verbatim.

LECTURE VOCABULARY NOTE
Neither Session 4 nor Session 5's slides mention prototyping at all — this is real, book-only content as of 2026-09-21. State plainly in a > [!NOTE] callout that lecture hasn't reached this material yet, rather than inventing a lecture connection.

SCOPE — SECOND HALF: whole-chapter-note wrap
Using everything from this message and the previous Chapter 3 message, now add:
## Chapter Summary — one sentence claim spanning both chapters, exactly one ==highlight==, then "*Mechanism:*" paragraph.
## Key Concepts — every named term from all of Ch 3-4, **bolded** on first use, one line each.
## Worked Example — one full case walkthrough from the book's own Chapter 3 or 4 content (not the end-of-chapter Case study unless it's short enough for one paragraph).
## Connections — Lecture: state which of Session 4's three ideation methods the book formalizes, and explicitly flag that prototyping (all of Ch 4) is book-only, not yet covered in lecture. Textbook: "(pending Chapter 5 — search)".
## Open Questions — 3-5 Markdown tasks ("- [ ] ..."), genuine self-test prompts.
## Flashcards — 5-8 cards, mechanisms not labels: "Question::Answer #cards/MGMT".

RULES
Highlight budget: Chapter 4 section gets zero new ==highlights== (Chapter 3 already used the one); Chapter Summary, Key Concepts, Worked Example, Open Questions, and Flashcards each get exactly one ==highlight== of their own. Cite page numbers for direct definitions. *label:* italics for sub-labels. No marketing language. Zero blank lines between a heading and its content or between list items.

Return the entire response as a single fenced markdown code block, nothing before or after it.
```
##### Open flags — read before running this
- **Chapter split follows the vault's existing filenames**: `Chapter - 1 & 2.md` and `Chapter - 3 & 4.md` already exist as seed stubs — paste Part 1 + Part 2's combined output into the matching file, then bring it to full [[Textbook Standard]] shape (headings, wikilinks, frontmatter) as an editorial pass, not permission to add facts.
- **Session 5 slides are already extracted** (`2026 S3015 S5 Opportunities.pptx` — opportunity definition, evaluation exercise, SDG exercise) but no Lecture - 5.md exists yet as of 2026-09-21; the Chapter 3-4 prompts above reference it for lecture-vocabulary cross-checks even though its own session note isn't built.
- **AI policy scope**: [[MGMT 3015 Board]]'s AI policy ("may not use these tools to write your reports") governs graded submissions (the Profile, New Business Idea, Reflection, Written Business Plan); it does not restrict personal study notes built from the textbook and slides, since nothing here gets submitted for credit.
