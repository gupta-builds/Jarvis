
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

