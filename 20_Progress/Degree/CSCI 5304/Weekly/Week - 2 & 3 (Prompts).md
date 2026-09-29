---
type: class
input_kind: lecture
status: seed
created: 2026-09-28
updated: 2026-09-28
area:
  - "[[CSCI 5304 Board]]"
tags:
  - "#class"
  - "#Lecture"
next: "Textbook notes are landed - run the two Codex prompts now to build Week - 2.md and Week - 3.md; run the Notebook verification prompts whenever page-cited accuracy is needed"
---
# CSCI 5304 — Textbook + Weekly Prompts, Weeks 2-3 (staging file, 2026-09-28)
Built per the reusable two-set workflow in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] — Notebook prompts land the per-lecture textbook chapter notes first, then Codex prompts fuse those with the real transcript into each week's synthesis note. Week 1 is skipped on purpose (nothing was captured for it — see Open flags). Week 4 is left out on purpose too — its Thursday lecture (9/24, Lectures 6-7, Projection and QR) has no transcript in the source folder yet as of this writing.

## Real source manifest (confirmed by directly reading every file 2026-09-28)
| Date | Class day | Schedule row (per [[CSCI 5304 Board]]) | Real transcript file | What it actually covers |
|---|---|---|---|---|
| Tue 9/8 | Week 1 | Day #1: Ethical Computing | *(none — only `Lecture/Week - 1/5304_Lecture_1_Notes.pdf`, a student's own notes on syllabus/AI-policy/ethics, not math content)* | Logistics, zero-AI-tools policy, the Twin Prime Conjecture/Stadlmann-GPT-6 story as an AI-ethics motivating example, data-center environmental impact |
| Thu 9/10 | Week 1 | Lecture 1, Matrix "Action" | `en-CSCI 5304 September 10 Lecture (multi-source).txt` | Matrix-vector product as linear combination of columns; range/column space; rank; the Vandermonde/polynomial-interpolation worked example; matrix-matrix product as columns of linear combinations; full-rank ⟺ one-to-one; constructive proof of the matrix inverse |
| Tue 9/15 | Week 2 | Lectures 2, 3: Orthogonality and Norms | `en-CSCI 5304 September 15 Lecture (multi-source).txt` | Recap of Lecture 1's column/basis-change idea with a worked numeric example; **Lecture 2**: adjoint/transpose notation, inner product, length, the law-of-cosines angle derivation, orthogonality (x*y=0), unitary/orthogonal matrices (Q*Q=I), length- and angle-preservation proofs; start of **Lecture 3**: norm axioms, the 1-, 2-, ∞-, and general p-norms, unit-ball shapes, weighted norms |
| Thu 9/17 | Week 2 | Quiz #1. Lecture 4, Singular Value Decomposition | `en-CSCI 5304 September 17 Lecture (multi-source).txt` | **Quiz #1 did not happen in class** — professor hadn't written it (real, stated fact — see Board update below); recap of vector p-norms; **induced/operator matrix norms**, the full proof that the matrix 1-norm equals the max absolute column sum; opening of **Lecture 4**: SVD motivation (PCA/eigenfaces/low-rank approximation), geometric picture (unit ball → hyperellipse), formal definitions of U, Σ, V, left/right singular vectors, and the statement (not yet proof) of the existence/uniqueness theorem |
| Tue 9/22 | Week 3 | Lecture 5: More on the SVD | `en-CSCI 5304 September 22 Lecture (multi-source).txt` | Take-home Quiz #1 logistics (posted late, due same day); recap of SVD definitions and the existence/uniqueness theorem statement; **full inductive proof of SVD existence** (define σ1 as the 2-norm of A, construct the reduction to a smaller submatrix B, the diagonal argument U^T A V = Σ); properties: rank = # non-zero singular values, range = span of the U_i (i ≤ rank), null space = span of V_j (j > rank), row space = span of V_i (i ≤ rank); 2-norm(A) = σ1; Frobenius norm = √(Σσ_i²); U's are eigenvectors of AA^T, V's are eigenvectors of A^TA, σ_i are the (non-negative) square roots of the shared eigenvalues |
| Thu 9/24 | Week 3 | Lectures 6, 7: Projection and QR | *(not yet in the source folder — do not write a Week 3 Codex prompt run until this lands, or run the Week 3 prompt now covering only Tuesday's content and re-run/append once Thursday's transcript exists)* | — |

## Update, 2026-09-28: the three core Lecture notes are already landed
[[Lecture - 2 & 3]], [[20_Progress/Degree/MGMT 3015/Weekly/Week - 3]], and [[20_Progress/Degree/MGMT 3015/Weekly/Week - 4]] (merged from what was originally staged below as two parts — see Open flags) are now written, built from the real verified transcripts above plus this book's well-established standard treatment of the material — **not** from a direct PDF read, because this course's local PDF copy doesn't extract cleanly with any tool available locally (three methods tried; see [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|Textbook Map]]'s Methodology note for the full account). This means two things: (1) the Codex prompts in Part 2 below can run **now** — the textbook notes they cite already exist and don't need to wait on Notebook; (2) the Notebook prompts below have been reframed from "generate the note from scratch" to **"verify and enrich the already-landed note"** — Gemini Notebook can actually read this PDF (it isn't limited to local text-extraction tools), so its real job now is confirming exact page numbers and subsection titles, and flagging anywhere the landed note's standard-treatment claims don't match what this exact PDF says.

## Part 1 — Notebook prompts (verify and enrich the landed textbook notes)
Fill the reusable master prompt in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] § Notebook, adapted below for a verification pass rather than a from-scratch build. Primary source for all three: `Textbook & Resources/CSCI 5304 Textbook.pdf` (the replaced, readable edition) — upload the whole PDF once per fresh Gemini Notebook chat, then run these in sequence in the same chat so terminology stays consistent across Lectures 2-5. Trefethen & Bau's own chapter numbering is called "Lecture N" and the course reuses it directly (confirmed in [[CSCI 5304 Board]] and [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|Textbook Map]]) — do **not** file these as `Chapter - N.md`, use `Lecture - N.md` to match (see Open flags). See "Notebook source recommendations" below for what else to upload alongside the textbook to get a sharper result.

### Lecture 2 & 3 — Orthogonality and Norms (verification pass on the already-landed note)
```
You are checking a study note I already wrote against its actual source textbook, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy does not apply, but you must still never invent facts beyond the attached PDF.

SOURCES
1. The uploaded PDF: Numerical Linear Algebra (Trefethen & Bau), full text — you have real access to it; find Lecture 2 ("Orthogonal Vectors and Matrices") and Lecture 3 ("Norms") yourself.
2. My already-written note, pasted below between --- markers. It was built from a real, verified lecture transcript plus general subject knowledge, NOT from a direct read of this PDF (my own local tools couldn't extract clean text from it) — so it has no page citations and its subsection breakdown is descriptive, not numbered to match the book.

TASK
1. Read Lecture 2 and Lecture 3 in the actual PDF in full.
2. Go claim-by-claim through my pasted note's "Full Reading Notes" section. For each claim, either (a) confirm it against the book and add a page-number citation in parentheses, (b) correct it if the book states something different (flag the correction explicitly, don't silently rewrite), or (c) flag it as coming from the lecture only, with no direct textbook analogue, if that's what you find.
3. Tell me the book's own real subsection numbers/titles for Lecture 2 and Lecture 3 (e.g. "2.1", "3.4"), and note where my note's descriptive headings should be relabeled to match them.
4. Tell me if the book covers anything substantial in these two lectures that my note is missing entirely (not just under-cited, but absent).
5. Confirm or correct the note's own explicit claim that the lecture stopped partway through Lecture 3 before covering induced/operator matrix norms — does the book's Lecture 3 include that material, confirming the gap is real?

MY EXISTING NOTE:
---
[PASTE THE FULL CURRENT CONTENTS OF Textbook/Lecture - 2 & 3.md HERE]
---

OUTPUT CONTRACT
Return: (1) a corrected/enriched version of my note as a single fenced Markdown code block, preserving its structure and frontmatter exactly, adding page citations and fixing the ### heading numbers to match the book's real subsection numbers; (2) below the code block, a short plain-text list of every correction you made and why, so I can spot-check them rather than trust them blindly.
```

### Lecture 4 — The Singular Value Decomposition (verification pass on the already-landed note)
```
You are checking a study note I already wrote against its actual source textbook, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy does not apply, but you must still never invent facts beyond the attached PDF.

SOURCES
1. The uploaded PDF: Numerical Linear Algebra (Trefethen & Bau), full text — find Lecture 4 ("The Singular Value Decomposition") yourself.
2. My already-written note, pasted below between --- markers. Built from a real, verified lecture transcript plus general subject knowledge, not from a direct read of this PDF — no page citations, descriptive (not book-numbered) subsection headings.

TASK
1. Read Lecture 4 in the actual PDF in full.
2. Go claim-by-claim through my note's "Full Reading Notes" section — confirm/cite with real page numbers, correct anything the book states differently (flag it, don't silently rewrite), or flag lecture-only claims with no textbook analogue.
3. Give me the book's own real subsection numbers/titles for Lecture 4 and note where my headings should be relabeled to match.
4. Tell me if the book's Lecture 4 covers anything substantial my note is missing entirely.
5. Confirm: does the book's Lecture 4 include the existence/uniqueness theorem's *proof*, or does the book itself also defer the proof to a later lecture (matching what the professor did in class)? My note explicitly claims the proof was deferred — verify that's also true of the book's own structure, not just this professor's pacing.

MY EXISTING NOTE:
---
[PASTE THE FULL CURRENT CONTENTS OF Textbook/Lecture - 4.md HERE]
---

OUTPUT CONTRACT
Return: (1) a corrected/enriched version of my note as a single fenced Markdown code block, preserving structure and frontmatter, adding page citations and real subsection numbers; (2) below the code block, a short plain-text list of every correction made and why.
```

### Lecture 5 — More on the SVD (verification pass on the already-landed note; one prompt, one file, no parts)
> [!WARNING] Naming correction from the original version of this file
> This was originally staged as two separate prompts targeting two separate files, `Lecture - 5 (Part 1).md` and `Lecture - 5 (Part 2).md`. That was wrong — the vault's own convention (established in CSCI 4521's multi-part lecture prompts) keeps all parts of one lecture in **one file**; only the Notebook *chat* gets split into parts when a single lecture is too dense for one pass. This has been corrected: the landed note is the single file [[20_Progress/Degree/MGMT 3015/Weekly/Week - 4]], and the prompt below is a single verification pass. If the PDF's real Lecture 5 content turns out too dense for one Notebook exchange, split the exchange into two messages in the same chat, but still target one output file.

```
You are checking a study note I already wrote against its actual source textbook, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy does not apply, but you must still never invent facts beyond the attached PDF.

SOURCES
1. The uploaded PDF: Numerical Linear Algebra (Trefethen & Bau), full text — find Lecture 5 ("More on the SVD") yourself.
2. My already-written note, pasted below between --- markers. It covers two things this one lecture actually taught: the full inductive existence proof (σ1 definition, unitary basis extension, block decomposition, w=0 argument, induction, base case) and the properties that follow (rank/range/null-space/row-space via U/V, 2-norm and Frobenius norm via Σ, the A^TA/AA^T eigenvector relationship, and the numerical-instability warning). Built from a real, verified lecture transcript plus general subject knowledge, not from a direct read of this PDF — no page citations, descriptive (not book-numbered) subsection headings.

TASK
1. Read Lecture 5 in the actual PDF in full - both the proof and the properties sections.
2. Go claim-by-claim through my note's two "Full Reading Notes" sections (proof, then properties) — confirm/cite with real page numbers, correct anything the book presents differently (the professor's own proof structure may genuinely differ from the book's - flag differences explicitly rather than forcing them to match), or flag lecture-only claims with no direct textbook analogue.
3. Give me the book's own real subsection numbers/titles for Lecture 5 and note where my headings should be relabeled to match.
4. Tell me if the book's Lecture 5 covers anything substantial my note is missing entirely.
5. Confirm whether the book itself states the same numerical-instability warning about computing SVD via A^TA/AA^T eigenvectors, or whether that was the professor's own addition - this matters for whether it's textbook-sourced or lecture-sourced in the final note.

MY EXISTING NOTE:
---
[PASTE THE FULL CURRENT CONTENTS OF Textbook/Lecture - 5.md HERE]
---

OUTPUT CONTRACT
Return: (1) a corrected/enriched version of my note as a single fenced Markdown code block, preserving structure and frontmatter, adding page citations and real subsection numbers, still as ONE note covering both the proof and the properties; (2) below the code block, a short plain-text list of every correction made and why.
```

## Part 2 — Codex prompts (weekly synthesis notes)
Fill the reusable master prompt in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] § Codex. The Lecture notes both prompts below cite already exist ([[Lecture - 2 & 3]], [[20_Progress/Degree/MGMT 3015/Weekly/Week - 3]], [[20_Progress/Degree/MGMT 3015/Weekly/Week - 4]]) — these two Codex prompts can run now, independent of whether the Notebook verification pass above has happened yet.

### Week 2 — build `20_Progress/Degree/CSCI 5304/Weekly/Week - 2.md`
```
<role>You are filling in one week's lecture-synthesis note inside a university student's personal Obsidian vault, for personal study only — not a graded submission, so course AI-use policy on graded work does not apply, but never invent facts beyond the attached sources; where a source is silent, leave the template's placeholder rather than guessing. You have file read/write access in this repo — use it, don't just print output.</role>
<sources>
PRIMARY (lecture): `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Lecture\Transcripts\Week 2 & 3\en-CSCI 5304 September 15 Lecture (multi-source).txt` (Tue 9/15, Lectures 2-3) and `...\en-CSCI 5304 September 17 Lecture (multi-source).txt` (Thu 9/17, Lecture 4 + the quiz-that-didn't-happen).
SECONDARY (textbook): `20_Progress/Degree/CSCI 5304/Textbook/Lecture - 2 & 3.md` and `20_Progress/Degree/CSCI 5304/Textbook/Lecture - 4.md` (land these from the Notebook prompts above before running this).
STANDARD: [[Weekly Standard]] and [[Week Template]] govern every heading below — read both in full before writing.
DESTINATION: `20_Progress/Degree/CSCI 5304/Weekly/Week - 2.md`. This file does not exist yet — create it from [[Week Template]]'s frontmatter (type: class, input_kind: lecture, status: seed, area linking [[CSCI 5304 Board]], tags #class/#Lecture, next pointing to Week - 3).
</sources>
<process>Read both transcripts in full before writing. Note that the 9/17 transcript opens with ~10 minutes on why Quiz #1 didn't happen in class (real, keep as one factual line in the note's own framing if relevant, but this is not lecture content — don't pad the Lecture section with it) before recapping norms and starting Lecture 4. Read both landed textbook notes in full. Cross-check: the transcript's Lecture 3 coverage stopped before induced/operator matrix norms — confirm the landed textbook note flags this same gap (it should, per the Notebook prompt that built it) rather than silently completing it from the book alone.</process>
<scope>Cover: the Lecture 1 recap (columns-as-weights, the concrete b=Ax worked numeric example); Lecture 2 in full (adjoint/transpose, inner product, angle derivation, orthogonality, unitary matrices, length/angle preservation); Lecture 3 through vector norms, p-norms, and weighted norms (stop where the lecture stopped — do not add induced norms here, they belong to Week 2's own later coverage on 9/17); the 9/17 recap of norms; and Lecture 4's motivation, geometric picture, U/Σ/V definitions, and the existence/uniqueness theorem statement (proof deferred to Week 3).</scope>
<output_structure>
Fill every heading [[Week Template]] defines, in order, for Week 2:
## What you must be able to do — objectives spanning Lectures 2-4, linking [[Lecture - 2 & 3]] and [[Lecture - 4]] first
## Key ideas (short) — 3-6 compressed claims across orthogonality, norms, and SVD's opening idea
## Concepts created today — propose [[Concept - Singular Value Decomposition]] and [[Concept - Matrix and Vector Norms]] if they don't already exist, or state plainly if existing concept notes already cover this
## Examples worth keeping — the real numeric b=Ax example from the 9/15 recap; the unit-ball shape comparisons across norms; the PCA/eigenfaces motivating examples for SVD
## Lecture — three `### ` sections: "1. Lecture 1 recap" (9/15), "2. Lecture 2 — Orthogonality and Lecture 3 — Norms" (9/15), "3. Lecture 4 — The Singular Value Decomposition" (9/17, note the quiz-that-didn't-happen in one line, then the real content)
## Textbook integration — the delta from [[Lecture - 2 & 3]] and [[Lecture - 4]] beyond what lecture covered, stating explicitly that induced/operator norms and the SVD existence proof are both textbook-available but not yet lectured
## Takeaways (questions to resolve) — 2-5 real open questions, including one on why the SVD proof was deferred
## Lecture-to-textbook synthesis — the six-part shape: one ==highlight== (recommend anchoring it on the "every matrix has an SVD, no restrictions" result), *Mechanism:*, lecture example/scenario, textbook connection to [[Lecture - 4]], concept links, `> [!WARNING]` (a real confusion point — e.g. mistaking singular values for eigenvalues, or forgetting SVD needs no square/full-rank restriction), `> [!SUMMARY]`
## Flashcards — 8-10 cards under `#cards/5304`, spanning orthogonality, norms, and SVD definitions
</output_structure>
<formatting_rules>Follow [[Weekly Standard]]'s Per-Heading Standard exactly — bold named concepts/terms on first use, `$...$` for math notation, exactly one ==highlight== in the whole note. No marketing or filler language; every sentence should carry this professor's real phrasing or a real book citation, not a generic textbook-site description of orthogonality/norms/SVD.</formatting_rules>
<output_contract>Write the result directly to `20_Progress/Degree/CSCI 5304/Weekly/Week - 2.md` via file edit. Then update `20_Progress/Degree/CSCI 5304/Weekly/Weekly Board.md`'s Map section and Status count with one real sentence for Week 2. Report back in chat: which headings got real sourced content vs. which were left as an honest placeholder, and confirm the induced-norms/SVD-proof gap was stated rather than silently filled in from general knowledge.</output_contract>
```

### Week 3 — build `20_Progress/Degree/CSCI 5304/Weekly/Week - 3.md`
> [!WARNING] Partial week as of 2026-09-28
> Only Tuesday 9/22's transcript exists in the source folder. Thursday 9/24 (Lectures 6-7, Projection and QR) has no transcript yet. Run this prompt now to cover Tuesday's real content; re-run or append once Thursday's transcript lands rather than inventing Thursday's content from the schedule alone.

```
<role>You are filling in one week's lecture-synthesis note inside a university student's personal Obsidian vault, for personal study only — not a graded submission, so course AI-use policy on graded work does not apply, but never invent facts beyond the attached sources; where a source is silent, leave the template's placeholder rather than guessing. You have file read/write access in this repo — use it, don't just print output.</role>
<sources>
PRIMARY (lecture): `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304\Lecture\Transcripts\Week 2 & 3\en-CSCI 5304 September 22 Lecture (multi-source).txt` (Tue 9/22, Lecture 5). No transcript exists yet for Thu 9/24 (Lectures 6-7, Projection and QR) — do not fabricate that content; leave it as an explicit gap.
SECONDARY (textbook): `20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5.md` (already landed - covers both the existence proof and the properties in one note).
STANDARD: [[Weekly Standard]] and [[Week Template]] govern every heading below — read both in full before writing.
DESTINATION: `20_Progress/Degree/CSCI 5304/Weekly/Week - 3.md`. This file does not exist yet — create it from [[Week Template]]'s frontmatter (type: class, input_kind: lecture, status: seed, area linking [[CSCI 5304 Board]], tags #class/#Lecture, next pointing to Week - 4).
</sources>
<process>Read the 9/22 transcript in full before writing — it opens with take-home Quiz #1 logistics (real, one line only, not lecture content) before recapping SVD definitions and proving the existence theorem. Read the landed Lecture 5 textbook note in full. Cross-check: confirm the proof structure in the landed textbook note matches the professor's real inductive argument (submatrix reduction, diagonal argument) rather than a generic textbook proof — the professor's version and the book's may differ in presentation even though both are valid.</process>
<scope>Cover, from the transcript: the SVD existence proof in full (defining σ1 via the supremum, extending to unitary bases, the block decomposition and the w=0 argument, the inductive assembly of U/Σ/V, the base case); and the properties that follow (rank/range/null-space/row-space via U/V, 2-norm=σ1, Frobenius norm via trace, the AA^T/A^TA eigenvector relationship, and the real warning that computing SVD via A^TA/AA^T eigenvectors is numerically bad practice). Do NOT invent Thursday 9/24's Projection/QR content — leave that as an explicit gap in the Lecture section, labeled, not silently omitted.</scope>
<output_structure>
Fill every heading [[Week Template]] defines, in order, for Week 3:
## What you must be able to do — objectives for Lecture 5's proof and properties, linking [[Lecture - 5]] first; add one objective noting Lectures 6-7 (Tue's content) are still pending
## Key ideas (short) — 3-6 compressed claims: the existence proof's real structure, and the rank/range/norm/eigenvector properties
## Concepts created today — link or create [[Concept - Singular Value Decomposition]] if Week 2 didn't already create it; state plainly if nothing new was needed this week beyond deepening that concept
## Examples worth keeping — the real block-decomposition worked example from the proof; the trace-based Frobenius norm derivation
## Lecture — two `### ` sections: "1. Lecture 5 — SVD Existence Proof" and "2. Lecture 5 — Properties, Norms, and Eigenvalue Connections" (both 9/22); add a third section "3. Lectures 6-7 — Projection and QR (transcript not yet available)" containing only a labeled placeholder, not invented content
## Textbook integration — the delta from both Lecture 5 notes beyond what lecture covered, and the real warning about A^TA/AA^T numerical instability as a forward-link to later stability lectures
## Takeaways (questions to resolve) — 2-5 real open questions, including one on why squaring A doubles the conditioning problem (the professor asserted this without full derivation)
## Lecture-to-textbook synthesis — the six-part shape: one ==highlight== (recommend anchoring on A^TA=VΣ²V^T / AA^T=UΣ²U^T), *Mechanism:*, lecture example/scenario, textbook connection, concept links, `> [!WARNING]` (the real numerical-instability warning about computing SVD via A^TA/AA^T), `> [!SUMMARY]`
## Flashcards — 8-10 cards under `#cards/5304`, covering the proof structure and the properties, with at least one distinguishing singular values from eigenvalues precisely
</output_structure>
<formatting_rules>Follow [[Weekly Standard]]'s Per-Heading Standard exactly — bold named concepts/terms on first use, `$...$` for math notation, exactly one ==highlight== in the whole note. No marketing or filler language; every sentence should carry this professor's real phrasing, proof structure, or a real book citation.</formatting_rules>
<output_contract>Write the result directly to `20_Progress/Degree/CSCI 5304/Weekly/Week - 3.md` via file edit. Then update `20_Progress/Degree/CSCI 5304/Weekly/Weekly Board.md`'s Map section and Status count with one real sentence for Week 3, explicitly noting it's partial pending Thursday's transcript. Report back in chat: which headings got real sourced content, which were left as an honest placeholder, and confirm the Lectures 6-7 gap was labeled rather than invented.</output_contract>
```

## Notebook source recommendations (what to add beyond the textbook + schedule)
As of 2026-09-28 the Gemini Notebook for this course carries only two sources: the textbook PDF and the schedule PDF. That's enough to verify book content in isolation, but too thin to check the lecture-vs-book delta the prompts above ask for, since **the transcripts themselves aren't in Notebook at all yet**. Notebook takes PDFs and Word documents, not `.ipynb` or plain `.txt` — so before running the three verification prompts above, convert and add:
1. **The four `.txt` transcripts, converted to PDF or `.docx`** (`Lecture/Transcripts/Week 2 & 3/*.txt` → print-to-PDF, or paste into a Word doc and save) - without these as real Notebook sources, the "professor's real proof structure may differ from the book's" cross-checks in the prompts above have nothing to compare against inside Notebook itself; you'd be re-pasting transcript excerpts by hand into every prompt instead.
2. **`Textbook & Resources/CSCI 5304 Syllabus.pdf`** (the full 5-page syllabus, not just the 1-page schedule extract already there) - gives Notebook the required-materials and learning-objectives language directly, useful if a prompt ever needs to confirm a topic is actually in scope for the course.
3. **`Homework/Homework - 1.pdf`** - the professor said explicitly in the 9/15 transcript that these problems are pulled straight from the textbook and flagged by problem number; having the real assignment in Notebook lets a future prompt tie Worked Example / Open Questions sections to the actual assigned problems instead of inventing generic practice questions.
4. **`Lecture/Week - 1/5304_Lecture_1_Notes.pdf`** (Izzi Lauer's real written notes on the 9/8 ethics/logistics day) - low priority for the math content, but it's a real, already-PDF source that's currently unused; worth adding only if Week 1 material is ever revisited.
5. **Going forward, any `.ipynb` coding homework** - convert to PDF first (Colab: File → Print → Save as PDF; local Jupyter: `jupyter nbconvert --to pdf`), per the rule now recorded in [[30_Order/Workflows/Courses/Per Class/CSCI 5304 Workflow|CSCI 5304 Workflow]] - none exist in the source folder yet as of 2026-09-28, so this is forward-looking, not an immediate gap.
Skip: `environment.yml`/`README.md` (no math content, not worth a Notebook slot) and the professor's own site/alternate-reference texts named in [[CSCI 5304 Board]]'s Resources section (already links exist there if ever needed - no reason to duplicate them into Notebook for a course this early in).

## Open flags — read before running any of the above
- **File naming for textbook notes, corrected 2026-09-28:** `Lecture - 2 & 3.md`, `Lecture - 4.md`, `Lecture - 5.md` — one file per lecture-or-combined-session in `20_Progress/Degree/CSCI 5304/Textbook/`, matching Trefethen & Bau's own "Lecture N" numbering (confirmed the book itself uses this term, per [[CSCI 5304 Board]]), not `Chapter - N.md`. The original version of this file mistakenly split Lecture 5 into two separate destination files - fixed, see the warning in the Lecture 5 prompt above. All three are already landed as of 2026-09-28.
- **Week 1 is skipped on purpose**, per direct instruction — "nothing was done in it." Its transcript (`September 10 Lecture`) exists and covers real Lecture 1 content, but no Notebook or Codex prompt for it is included here. If it's ever wanted later, the Lecture 1 content is fully captured in the manifest table above and the transcript is real and usable.
- **Week 4 is left out on purpose too** — Thu 9/24's transcript (Lectures 6-7, Projection and QR) isn't in the source folder as of 2026-09-28. Don't extend this file's prompts into Week 4 until that transcript actually exists; re-run this same staging pattern (manifest → Notebook prompts → Codex prompt) once it does, rather than guessing its content from the schedule.
- **Quiz #1 never happened in class** (real fact, confirmed in the 9/17 and 9/22 transcripts) — it became an ungraded-in-person take-home, posted late and due 9/22. This is now noted in [[CSCI 5304 Board]]'s schedule warnings section as of this update, since the printed schedule still shows it as an in-class Thursday event.
- **Order of operations, revised now that the core notes are landed:** the two Codex prompts can run immediately - they don't need the Notebook verification pass. Run the Notebook verification prompts whenever page-cited accuracy matters (e.g. before an exam-review pass), uploading the "Notebook source recommendations" list above first so the cross-checks they ask for actually have something to check against.
- **This pattern is now the reusable one for the rest of the semester** — the master templates live in [[20_Progress/Degree/Repetitive Things|Repetitive Things]], and each future week just needs a manifest table plus filled brackets like this file, not a redesign.
- **Local PDF limitation, logged once here rather than repeated per note:** this course's local textbook PDF copy does not extract cleanly with any tool available in this environment (poppler's page-render is unavailable, and `pdftotext` returns corrupted glyphs due to the PDF's own font encoding) - full account in [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|Textbook Map]]'s Methodology note. This is why every landed Lecture note carries a page-citation-pending warning and why the Notebook prompts above are framed as verification passes rather than from-scratch builds.
