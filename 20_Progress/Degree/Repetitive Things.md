
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

## CSCI 4521 — Lecture prompts, grounded in the real lecture slides (Lec 0.1, 1.2–1.5, Weeks 1–3, reviewed in full 2026-09-24)
Picked by the same two-part filter used for CSCI 4061: real lecture files actually sitting in the source folder for the target weeks, and zero existing chapter notes in the vault to duplicate. CSCI 5304 failed the first test (see correction above); CSCI 4511W and MGMT 3015 failed the second (both already have chapter/lecture notes written). CSCI 4521 passed both — `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Lectures\` has five real decks across Weeks 1-3, and [[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|CSCI 4521 Textbook Map]] confirms zero chapter notes exist as of 2026-09-15. All five were read in full this session: `Week - 1\0.1 course logistics, intro to ML.pptx.pdf`, `Week - 2\1.2 kNN, accuracy, overfitting.pptx.pdf`, `Week - 2\1.3 bayes classification, kNN.pptx.pdf`, `Week - 3\1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf`, `Week - 3\1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf`.

**Real, verified discovery that changes the prompt design.** Unlike APUE for CSCI 4061, this course has no single textbook it walks through chapter by chapter. The slides themselves say "adapted from Stephen Guy and Shelby Ziccardi" — they're the professor's own original teaching material, built around whatever concept is being taught that day (kNN, then confusion matrices, then kd-trees), not a chapter's table of contents. ISL and DLB run alongside as separate background reading, assigned per-week in the Board's own Schedule table (Week 1: ISL 2.1, 2.3 + DLB 2.1-2.8, 3.1-3.3, 5.1 — Week 2: ISL 2.1, 2.2 + DLB 5.1, 5.2 — Week 3: ISL 2.2 only), not mapped one-to-one onto a lecture. So every prompt below treats the **lecture deck as PRIMARY** (it's this course's real "textbook") and cites the matching ISL/DLB sections as SECONDARY depth reading, and asks Gemini to organize "Full Reading Notes" around the **lecture's own real slide-section headings** (e.g., "Accuracy," "Overfitting," "How do we choose k?") rather than book subsection numbers, since a slide deck doesn't have those. This is a deliberate, evidence-based departure from the CSCI 4061 template, not a shortcut — note it in the note-file itself so a future read of this file doesn't assume the two courses' prompts should look identical.

> [!WARNING] Lecture 1.1 is missing from the source folder
> The Board's schedule puts LEC 1.1 ("intro to classification, nearest neighbor, normalization") on Week 1 Thursday, before LEC 1.2. LEC 1.2's own "Last time" recap slide confirms it happened — it references classifying wheat-seed data by nearest neighbor and a caution about distance measurements being sensitive to unit/magnitude scaling — but there is no `1.1*.pdf` anywhere in the local Lectures folder, only 0.1, 1.2, 1.3, 1.4, 1.5. **No grounded prompt is written for LEC 1.1 below** — do not invent one from general kNN knowledge. Find the real deck (Canvas, a classmate, or the professor) before writing that note; until then, LEC 1.2's recap slide is the only real secondhand evidence of what it covered.

> [!WARNING] Two more real artifacts worth knowing about before running these
> The `1.5` deck's title slide still says "Fall 2025" — a recycled-slide leftover, not a sign you have the wrong file. And `1.5` physically lives in the `Week - 3` folder even though the Board's schedule puts LEC 1.5 on Week 4 Tuesday — the professor is running slightly ahead of the printed schedule, or whoever saved the file filed it under the wrong week folder. Either way, don't let the folder name override what the deck itself says it covers.

### Lecture 0.1 — Course Logistics & Intro to ML
**SOURCES AND PRIORITY**
- Primary: `Week - 1\0.1 course logistics, intro to ML.pptx.pdf` — upload this file itself.
- Secondary: ISL 2.1 (what is statistical learning), DLB 2.1-2.8 (linear algebra refresher) — cite only where the deck actually touches these, don't force a link that isn't there.
**SCOPE:** The non-logistics content only — skip grading/policy slides entirely, this note is for course content, not admin. Cover: what machine learning is at the level this deck introduces it, and whatever early preview of unsupervised methods (clustering/PCA) the deck gives before the course dives into supervised classification in 1.1/1.2.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (organized under the deck's own real section headings, found by you in the uploaded PDF — do not use headings I haven't verified), Connections (to ISL 2.1 if genuinely relevant), Open Questions, Flashcards (5-8).
**FORMATTING RULES:** One blank line between every block. Exactly one `==highlight==` per section, on the single most load-bearing sentence. Bold key terms on first use only. No marketing language ("powerful," "game-changing," "revolutionize"). Cite the real slide title/number for any factual claim.
**OUTPUT CONTRACT:** Return everything inside a single fenced markdown code block, nothing outside it.
*(Single part — this deck is short once logistics is excluded.)*

### Lecture 1.2 — kNN, Accuracy, Overfitting (Part 1 of 2)
**SOURCES AND PRIORITY**
- Primary: `Week - 2\1.2 kNN, accuracy, overfitting.pptx.pdf`.
- Secondary: ISL 2.2 (assessing model accuracy), DLB 5.1-5.2 (capacity, overfitting, underfitting) — Week 2's real assigned reading.
**SCOPE (Part 1):** Accuracy as a metric, what overfitting actually is and why it happens, and the standard defenses against it — the train/test split, leave-one-out and cross-validation, and penalizing overly flexible models. Stop before the deck's own kNN-mechanics section; that's Part 2.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (use the deck's real section headings for Accuracy and Overfitting, found by you in the PDF), Worked Example (if the deck has a concrete accuracy/overfitting example, reproduce it faithfully; otherwise state none exists rather than inventing one), Connections (to ISL 2.2 / DLB 5.1-5.2), Open Questions, Flashcards (8-10 — this is dense material).
**FORMATTING RULES:** same as above (blank lines, one highlight per section, bold on first use, no marketing language, cite real slide numbers).
**OUTPUT CONTRACT:** single fenced markdown code block only.

### Lecture 1.2 — kNN, Accuracy, Overfitting (Part 2 of 2)
**SOURCES AND PRIORITY:** same primary/secondary as Part 1 — same chat, same uploaded PDF, no re-upload needed.
**SCOPE (Part 2):** The kNN algorithm itself as this deck introduces it — the classification rule, how k is chosen, what "perfect classifier" and unavoidable/irreducible error mean in this context, and the practical mechanics of automating/visualizing nearest-neighbor classification the deck walks through.
**STRUCTURE:** Full Reading Notes (kNN mechanics and the choosing-k discussion, deck's own headings), Worked Example (the deck's real kNN walkthrough, reproduced faithfully with its real numbers if it has one), Connections (forward to 1.3's Bayes-classifier framing of kNN — flag it as a preview, don't pre-explain Bayes here), Open Questions, Flashcards (6-8).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Part 1.

### Lecture 1.3 — Bayes Classification & kNN (Part 1 of 2)
**SOURCES AND PRIORITY**
- Primary: `Week - 2\1.3 bayes classification, kNN.pptx.pdf`.
- Secondary: same Week 2 reading (ISL 2.1-2.2, DLB 5.1-5.2) — this lecture and 1.2 share one week's assigned reading, so don't expect a clean one-lecture-to-one-reading mapping.
**SCOPE (Part 1):** The Bayes classifier itself — its derivation/definition as this deck presents it, and the Bayes Error Rate as the theoretical floor no classifier can beat. Stop before the deck connects this back to kNN.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (deck's own Bayes-classifier headings), Worked Example (the deck's real Bayes-classifier example if one exists), Connections, Open Questions, Flashcards (6-8).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to 1.2 Part 1.

### Lecture 1.3 — Bayes Classification & kNN (Part 2 of 2)
**SOURCES AND PRIORITY:** same as Part 1 — same chat.
**SCOPE (Part 2):** How this deck frames **kNN as an empirical estimate of the Bayes classifier**, the practical discussion of how to choose k this deck adds beyond 1.2's version, and the deck's introduction of the **bias-variance tradeoff** — what grows and what shrinks as k changes, and why neither extreme (k=1 vs. k=n) is good.
**STRUCTURE:** Full Reading Notes (kNN-as-empirical-Bayes, choosing k, bias-variance — deck's own headings), Connections (this is the conceptual hinge for 1.4's generalization discussion — flag it as setup, don't duplicate 1.4's content here), Open Questions, Flashcards (8-10 — bias-variance is the single most-tested idea in this course's early unit, be thorough).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Part 1.

### Lecture 1.4 — Generalization, Confusion Matrix, Precision/Recall/F1 (Part 1 of 2)
**SOURCES AND PRIORITY**
- Primary: `Week - 3\1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf`.
- Secondary: ISL 2.2 — Week 3's entire assigned reading is this one section, so this prompt can lean harder on the primary deck than the others.
**SCOPE (Part 1):** What generalization means and the deck's own "dos and don'ts" for building a model that generalizes, the different flavors/variants of kNN this deck distinguishes, and the setup for binary classification as a problem this deck is about to formalize.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (deck's own headings for generalization and kNN variants), Connections (back to 1.3's bias-variance framing), Open Questions, Flashcards (6-8).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to prior lectures.

### Lecture 1.4 — Generalization, Confusion Matrix, Precision/Recall/F1 (Part 2 of 2)
**SOURCES AND PRIORITY:** same as Part 1 — same chat.
**SCOPE (Part 2):** The confusion matrix itself (true/false positive/negative, Type I vs. Type II error), and precision, recall, F1, and F-beta scores built from it — including the deck's real worked example applying these metrics (the deck uses a COVID-testing-style scenario; reproduce its actual numbers and framing rather than a generic substitute).
**STRUCTURE:** Full Reading Notes (confusion matrix and each metric, deck's own headings), Worked Example (the deck's real classification-metrics example, full numbers), Connections (why accuracy alone, from 1.2, is insufficient — this is the direct payoff of that earlier gap), Open Questions, Flashcards (8-10).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Part 1.

### Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 1 of 3)
**SOURCES AND PRIORITY**
- Primary: `Week - 3\1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf` (see the two warnings above about this file's "Fall 2025" title slide and its Week-3-folder/Week-4-schedule mismatch before uploading it).
- Secondary: none newly assigned — this deck closes out the unit that started in 1.2/1.3, so treat ISL 2.1-2.2 as still-relevant background rather than fresh reading.
**SCOPE (Part 1):** Parametric vs. non-parametric models, and model complexity vs. flexibility as this deck distinguishes them — the conceptual close-out of the kNN unit before the deck turns to kNN's computational cost.
**STRUCTURE:** Lecture Summary, Key Concepts, Full Reading Notes (deck's own headings), Connections (ties together 1.2's overfitting and 1.3's bias-variance into one parametric/non-parametric framing), Open Questions, Flashcards (6-8).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to prior lectures.

### Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 2 of 3)
**SOURCES AND PRIORITY:** same as Part 1 — same chat.
**SCOPE (Part 2):** kNN's real computational complexity as this deck derives it (the brute-force cost and the improved costs from better data structures), then KD-trees and Locality Sensitive Hashing as the two speedups the deck presents — their actual mechanism, not just their names. Have Gemini extract the real complexity notation from the deck's own slides rather than assuming a specific big-O form.
**STRUCTURE:** Full Reading Notes (complexity, KD-trees, LSH — deck's own headings and notation), Worked Example (the deck's real KD-tree or LSH walkthrough if one exists), Connections, Open Questions, Flashcards (8-10 — this is the most technically dense part of the deck).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Part 1.

### Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 3 of 3)
**SOURCES AND PRIORITY:** same as Parts 1-2 — same chat.
**SCOPE (Part 3):** The deck's ethics/bias-in-ML section — the named categories of bias it teaches (the deck names five: Confirmation, Historical, Selection/Sampling, Survivorship, and Availability bias) and whatever real example the deck attaches to each. This is graded material (per the Board, ethics content shows up on quizzes), so completeness here matters more than brevity.
**STRUCTURE:** Full Reading Notes (one subsection per named bias type, each with its real example from the deck — do not substitute a generic example if the deck's own differs), Connections (to earlier data-quality assumptions made casually in 1.2-1.4, e.g. what "representative" training data actually requires), Open Questions, Flashcards (one per bias type minimum, 5-8 total).
**FORMATTING RULES / OUTPUT CONTRACT:** identical to Parts 1-2.

### Open flags — read before running any of the above
- **Naming departs from CSCI 4061 on purpose.** File the generated notes as `Textbook/Lecture - 0.1.md`, `Lecture - 1.2.md`, etc. (matching the professor's own LEC numbering from the Board's schedule table), not `Chapter - N.md` — this course has no chapters to name them after. CSCI 4521's Textbook folder currently has zero notes, so this doesn't collide with anything.
- **Lecture 1.1 has no grounded prompt** — its real deck isn't in the source folder. Track down the actual file before writing that note; don't fill the gap with generic kNN-intro content.
- **Reading assignments are per-week, not per-lecture** — the Board's Schedule table bundles both weekly lectures under one reading list (e.g., Week 2's ISL 2.1-2.2 + DLB 5.1-5.2 covers both 1.2 and 1.3 together), so the SECONDARY sources repeat across a week's two prompts by design, not by mistake.
- **Order of operations:** 0.1 is standalone and can run anytime. 1.2 and 1.3 share Week 2's reading — run them in the same or adjacent sessions so the bias-variance thread stays connected. 1.4 and 1.5 both belong to Week 3; 1.5 needs three parts given how much real technical content (complexity, KD-trees, LSH, five bias types) is packed into one deck.
- **This file now has two courses ready to run in parallel** — CSCI 4061 above and CSCI 4521 here — matching the intent of running two Gemini Notebook chats side by side. No third course has been requested yet; don't get ahead of what's actually been asked.
