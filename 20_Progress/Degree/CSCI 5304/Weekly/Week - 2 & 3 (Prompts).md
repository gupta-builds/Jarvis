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
next: "Run the four Notebook prompts first, land the four Lecture chapter notes, then run the two Codex prompts to build Week - 2.md and Week - 3.md"
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

## Part 1 — Notebook prompts (textbook chapter notes)
Fill the reusable master prompt in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] § Notebook. Primary source for all four: `Textbook & Resources/CSCI 5304 Textbook.pdf` (the replaced, readable edition) — upload the whole PDF once per fresh Gemini Notebook chat, then run these in sequence in the same chat so terminology stays consistent across Lectures 2-5. Trefethen & Bau's own chapter numbering is called "Lecture N" and the course reuses it directly (confirmed in [[CSCI 5304 Board]] and [[20_Progress/Degree/CSCI 5304/Textbook/Textbook Map|Textbook Map]]) — do **not** file these as `Chapter - N.md`, use `Lecture - N.md` to match (see Open flags).

### Lecture 2 & 3 — Orthogonality and Norms (single prompt — taught as one combined session, Tue 9/15)
```
You are producing a source-grounded study note for a university course, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy on essays/coding does not apply, but you must still never invent facts beyond the attached sources.

SOURCES AND PRIORITY
1. PRIMARY, load-bearing source: Numerical Linear Algebra (Trefethen & Bau), Lecture 2 ("Orthogonal Vectors and Matrices") and Lecture 3 ("Norms"). The note's structure and depth come from these two chapters, in the book's own order, treated as one combined note since the professor taught them together.
2. SECONDARY, emphasis source: the transcript of the 2026-09-15 lecture (uploaded separately, or paste the relevant excerpt). Use this only to decide what to expand, which terms/examples the professor used verbatim, what the professor has NOT yet covered from Lecture 3 (the professor ran out of time mid-norms and picked it back up the following class), and whether the professor pulled in content technically belonging to a different lecture (flag this explicitly).
3. BACKGROUND, non-content source: none for this pair.

SCOPE
Cover every part of Lecture 2 and Lecture 3 that discusses: the adjoint/transpose notation and inner product; the geometric law-of-cosines derivation of the inner-product/angle relationship; orthogonality (x*y = 0) and orthogonal/unitary matrices (Q*Q = I); the proof that unitary transformations preserve length and angle; the norm axioms (positivity, triangle inequality, scaling); the 1-norm, 2-norm, ∞-norm, general p-norm, and weighted norms; unit-ball shapes per norm. Find the book's own subsection numbers and titles yourself from the uploaded PDF — do not assume any numbering I give you is correct if it conflicts with what you see in the source. Flag explicitly if the lecture stopped partway through Lecture 3's content (it did — induced/operator matrix norms were pushed to the next class session, do not fabricate lecture coverage of them here).

STRUCTURE — output exactly these headings in this order, nothing added or removed:
# Lecture 2 & 3 — Orthogonal Vectors and Matrices; Norms
## Chapter Summary
One sentence claim with exactly one ==highlighted== phrase, then "*Mechanism:*" explaining how the claim works.
## Key Concepts
Every named term from both chapters, **bolded** on first use, one line each: what it means and why it matters to the chapter's argument.
## Full Reading Notes
One ### subheading per numbered subsection, using the book's own subsection numbers and titles verbatim, covering both Lecture 2 and Lecture 3 in the book's order. Every distinct claim, example, and piece of reasoning in that subsection must appear in some form — if I could learn something from re-reading the original PDF that isn't in your note, the note has failed. Reproduce named examples, numbered lists, and any formulas in full (as fenced math/code where the book gives derivations), don't compress into "etc."
## Worked Example
One end-to-end example (use the chapter's own running example if it has one, e.g. the unitary-matrix length/angle preservation proof or a concrete unit-ball comparison across norms) that ties the section's concepts together.
## Connections
- Lecture: what the 2026-09-15 lecture emphasized from this material, which terms/examples appeared verbatim vs. only in the book, and explicitly note that the lecture left Lecture 3's induced/operator matrix norms for the next class session — do not treat that content as covered here.
- Textbook: nothing to fill here yet, leave the line as "(pending next chapter)".
## Open Questions
3-5 items as Markdown tasks ("- [ ] ...") — genuine unresolved questions or self-test prompts a student should be able to answer after really understanding this material, not busywork.
## Flashcards
5-8 cards testing mechanisms and contrasts, not labels. Format: "Question::Answer #cards/5304" one per line, or multiline with "?" separator for longer answers.

FORMATTING RULES (violating these is a failure, not a style choice)
- Zero blank lines between a heading and its first line of content, and zero blank lines between consecutive list items or sections.
- ==highlight== markers: exactly one per major ## heading, reserved for the single most important definitional claim in that section.
- **bold**: named concepts/functions/terms on first introduction only, not general emphasis.
- *label:* italics for sub-category intro labels like *Mechanism:* or *Pitfall:*.
- No marketing or filler language: avoid words like "transformative," "powerful," "seamless," "leverage," "comprehensive," "unlock," "landscape," "journey" — say the actual mechanism instead.
- No sentence that could be pasted into a generic study-guide site unchanged. Every sentence should carry a mechanism, example, contrast, or explicit uncertainty.
- Cite page/section numbers for direct definitions or close paraphrases, in parentheses.

OUTPUT CONTRACT
Return the entire note as a single fenced Markdown code block (```markdown ... ```) so nothing gets reinterpreted by the chat UI when copied into Obsidian. Do not add commentary before or after the code block.

Before answering, silently verify: every numbered subsection in the scope has its own ### heading; every bolded term is actually defined; the highlight count per ## section is exactly one; the code block is the entire response.
```

### Lecture 4 — The Singular Value Decomposition (single prompt — definitions and existence statement only, Thu 9/17)
```
You are producing a source-grounded study note for a university course, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy on essays/coding does not apply, but you must still never invent facts beyond the attached sources.

SOURCES AND PRIORITY
1. PRIMARY, load-bearing source: Numerical Linear Algebra (Trefethen & Bau), Lecture 4 ("The Singular Value Decomposition"). The note's structure and depth come from this chapter, in the book's own order.
2. SECONDARY, emphasis source: the transcript of the 2026-09-17 lecture, SVD portion only (the first ~35 minutes covered leftover Lecture 3 material on induced matrix norms — exclude that from this note, it belongs to the Lecture 2 & 3 note above). Use this to decide which real motivating applications the professor emphasized (PCA, eigenfaces, low-rank approximation for image/video/audio storage) and to flag that the professor stated the existence/uniqueness theorem but explicitly deferred its proof to the next class session — do not fabricate proof content here.
3. BACKGROUND, non-content source: none.

SCOPE
Cover: the motivation for the SVD (why it's the single most important decomposition in the book, its role as a theoretical and computational tool, its independent multi-discoverer history); the geometric picture (unit ball → hyperellipse under any m×n matrix action); the formal definitions of U (left singular vectors, unitary), Σ (diagonal, non-negative, ordered σ1 ≥ σ2 ≥ ...), and V (right singular vectors, unitary); the pre-image relationship AV_i = σ_i U_i; the contrast with eigenvalue decomposition (SVD requires no restriction on shape/rank/repeated values, eigendecomposition does); and the statement of the existence/uniqueness theorem (every matrix has an SVD; singular values are always uniquely determined; if square with no repeated singular values, U and V are unique too). Do NOT include the proof of this theorem — the professor explicitly deferred it, and it belongs in the Lecture 5 note below.

STRUCTURE — output exactly these headings in this order, nothing added or removed:
# Lecture 4 — The Singular Value Decomposition
## Chapter Summary
One sentence claim with exactly one ==highlighted== phrase, then "*Mechanism:*" explaining how the claim works.
## Key Concepts
Every named term, **bolded** on first use, one line each: what it means and why it matters.
## Full Reading Notes
One ### subheading per numbered subsection, using the book's own subsection numbers and titles verbatim. Every distinct claim, example, and piece of reasoning in that subsection must appear in some form. Reproduce named examples and formulas in full.
## Worked Example
The book's own geometric example of the unit ball transforming into a hyperellipse, with the σ1/u1 longest-axis relationship made concrete.
## Connections
- Lecture: the professor's real motivating applications (PCA, eigenfaces, low-rank approximation), and explicitly flag that the existence/uniqueness proof was deferred to the next lecture — do not summarize a proof that wasn't given yet.
- Textbook: state what Lecture 4's own reading connects back to from Lecture 1 (full-rank ⟺ one-to-one) and Lecture 3 (norms), since the professor explicitly linked SVD to both in class.
## Open Questions
3-5 items as Markdown tasks — include at least one about why the existence proof matters given the theorem was only stated, not proven, in this lecture.
## Flashcards
5-8 cards testing mechanisms and contrasts, not labels. Format: "Question::Answer #cards/5304".

FORMATTING RULES (violating these is a failure, not a style choice)
- Zero blank lines between a heading and its first line of content, and zero blank lines between consecutive list items or sections.
- ==highlight== markers: exactly one per major ## heading.
- **bold**: named concepts/functions/terms on first introduction only.
- *label:* italics for sub-category intro labels like *Mechanism:* or *Pitfall:*.
- No marketing or filler language.
- No sentence that could be pasted into a generic study-guide site unchanged.
- Cite page/section numbers for direct definitions or close paraphrases, in parentheses.

OUTPUT CONTRACT
Return the entire note as a single fenced Markdown code block (```markdown ... ```). Do not add commentary before or after the code block.

Before answering, silently verify: every numbered subsection in the scope has its own ### heading; every bolded term is actually defined; the highlight count per ## section is exactly one; the code block is the entire response.
```

### Lecture 5 — More on the SVD, Part 1 of 2: Existence Proof & Diagonal Argument (Tue 9/22)
```
You are producing a source-grounded study note for a university course, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy on essays/coding does not apply, but you must still never invent facts beyond the attached sources.

SOURCES AND PRIORITY
1. PRIMARY, load-bearing source: Numerical Linear Algebra (Trefethen & Bau), Lecture 5 ("More on the SVD"), the existence-proof portion.
2. SECONDARY, emphasis source: the transcript of the 2026-09-22 lecture, first half (the proof itself: defining σ1 as the 2-norm of A, constructing the reduction to submatrix B via the U1/V1 extension-to-unitary argument, the inductive step, and the diagonal argument U^TAV = Σ). Use this to reproduce the professor's own real proof structure and notation, flagging anywhere the professor's argument differs from or simplifies the book's.
3. BACKGROUND, non-content source: none.

SCOPE
Cover, in full derivation form: the definition σ1 = the 2-norm of A = sup(‖Ax‖/‖x‖); the existence of v1 such that Av1 = σ1u1; extending u1 and v1 to full unitary bases (U1 = [u1 | U⊥], V1 = [v1 | V⊥]) using the projector I − u1u1* construction; the block decomposition U1^TAV1 = [[σ1, w^T],[0, B]] and the proof that w = 0 (via the norm inequality ‖S‖ ≥ ‖S·(σ1,w)^T‖/‖(σ1,w)‖ ≥ (σ1² + w^Tw)^(1/2)); the inductive step assuming B = U2Σ2V2^T and assembling the full A = UΣV^T; the base case (1×1 matrix); and the resulting fact that singular values are uniquely determined via this induction. Reproduce the real algebra steps the professor worked through, not just the conclusion.

STRUCTURE — output exactly these headings in this order, nothing added or removed:
## Full Reading Notes — Existence Proof (continuing from Lecture 4's theorem statement; use the book's own subsection numbers/titles for the proof portion)
## Worked Example (the professor's own concrete step-by-step of the block decomposition and why w=0, with the real inequality chain)
## Connections (to Lecture 4's theorem statement — this is that theorem's proof — and to Lecture 1's full-rank/one-to-one result, which the professor explicitly reused for the "pre-images are unique" argument)
## Open Questions (include one on why the proof is inductive rather than direct, and one on why this construction isn't how SVD is actually computed)
## Flashcards (8-10 — this is the course's most proof-heavy lecture so far, be thorough. Format: "Question::Answer #cards/5304")

FORMATTING RULES (violating these is a failure, not a style choice)
- Zero blank lines between a heading and its first line of content, and zero blank lines between consecutive list items or sections.
- Exactly one ==highlight== across this whole part — put it on the U^TAV = Σ diagonal-argument result, since that's the proof's real payoff.
- **bold** terms/functions on first use. *label:* italics for sub-category labels.
- No marketing or filler language.
- Reproduce the real inequality chain and matrix block algebra exactly, in fenced math notation, not paraphrased into prose.

OUTPUT CONTRACT
Return the entire note as a single fenced Markdown code block. Nothing outside it.
```

### Lecture 5 — More on the SVD, Part 2 of 2: Properties, Norms, and Eigenvalue Connections (Tue 9/22)
```
You are producing a source-grounded study note for a university course, in Obsidian-flavored Markdown, for personal study only — not a graded submission, so course AI-use policy on essays/coding does not apply, but you must still never invent facts beyond the attached sources.

SOURCES AND PRIORITY
1. PRIMARY, load-bearing source: Numerical Linear Algebra (Trefethen & Bau), Lecture 5 ("More on the SVD"), the properties portion (following the existence proof in Part 1).
2. SECONDARY, emphasis source: the transcript of the 2026-09-22 lecture, second half — the properties the professor derived after the proof: rank, range, null space, row space in terms of U/V; the 2-norm and Frobenius norm in terms of singular values; and the AA^T/A^TA eigenvector relationship.
3. BACKGROUND, non-content source: none.

SCOPE
Cover: rank(A) = number of non-zero singular values; range(A) = span of {u_i : i ≤ rank}; null space of A = span of {v_j : j > rank}; row space of A = span of {v_i : i ≤ rank}; the 2-norm of A = σ1; the Frobenius norm of A = √(Σσ_i²) (derived via trace(A^TA) = trace(VΣ^TΣV^T) = trace(Σ^TΣ)); the theorem that A^TA = VΣ²V^T and AA^T = UΣ²U^T, making the u_i eigenvectors of AA^T, the v_i eigenvectors of A^TA, and σ_i the non-negative square roots of the shared non-zero eigenvalues; and the professor's explicit warning that computing the SVD by taking eigenvectors of A^TA/AA^T is theoretically valid but numerically bad (squares the norm, so squares the conditioning problem) — this is a real, load-bearing warning, keep it.

STRUCTURE — output exactly these headings in this order, nothing added or removed:
## Full Reading Notes — Rank, Range, Null Space, Row Space via U/V (book's own subsection numbers/titles)
## Full Reading Notes — Matrix Norms and the A^TA / AA^T Eigenvalue Connection
## Worked Example (the trace-based derivation of the Frobenius norm formula, worked through step by step)
## Connections (to Lecture 3's matrix-norm definitions — this is where the induced 2-norm gets its clean σ1 formula — and forward-flag that the professor said computing SVD via A^TA/AA^T eigenvectors is numerically bad practice, previewing later stability lectures)
## Open Questions (include one on why squaring the matrix (A^TA) squares the conditioning problem, since the professor asserted this without full derivation)
## Flashcards (8-10, including at least one distinguishing "singular values" from "eigenvalues" precisely. Format: "Question::Answer #cards/5304")

FORMATTING RULES (violating these is a failure, not a style choice)
- Zero blank lines between a heading and its first line of content, and zero blank lines between consecutive list items or sections.
- Exactly one ==highlight== across this whole part — put it on the A^TA=VΣ²V^T / AA^T=UΣ²U^T result, since it's this part's real payoff.
- **bold** terms/functions on first use. *label:* italics for sub-category labels.
- No marketing or filler language.
- Reproduce the real trace/eigenvalue algebra exactly, in fenced math notation.

OUTPUT CONTRACT
Return the entire note as a single fenced Markdown code block. Nothing outside it.
```

## Part 2 — Codex prompts (weekly synthesis notes)
Fill the reusable master prompt in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] § Codex. Run each only after that week's Lecture chapter notes above are landed in `20_Progress/Degree/CSCI 5304/Textbook/`.

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
SECONDARY (textbook): `20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5 (Part 1).md` and `20_Progress/Degree/CSCI 5304/Textbook/Lecture - 5 (Part 2).md` (land these from the Notebook prompts above before running this).
STANDARD: [[Weekly Standard]] and [[Week Template]] govern every heading below — read both in full before writing.
DESTINATION: `20_Progress/Degree/CSCI 5304/Weekly/Week - 3.md`. This file does not exist yet — create it from [[Week Template]]'s frontmatter (type: class, input_kind: lecture, status: seed, area linking [[CSCI 5304 Board]], tags #class/#Lecture, next pointing to Week - 4).
</sources>
<process>Read the 9/22 transcript in full before writing — it opens with take-home Quiz #1 logistics (real, one line only, not lecture content) before recapping SVD definitions and proving the existence theorem. Read both landed Lecture 5 textbook notes in full. Cross-check: confirm the proof structure in the landed textbook note matches the professor's real inductive argument (submatrix reduction, diagonal argument) rather than a generic textbook proof — the professor's version and the book's may differ in presentation even though both are valid.</process>
<scope>Cover, from the transcript: the SVD existence proof in full (defining σ1 via the supremum, extending to unitary bases, the block decomposition and the w=0 argument, the inductive assembly of U/Σ/V, the base case); and the properties that follow (rank/range/null-space/row-space via U/V, 2-norm=σ1, Frobenius norm via trace, the AA^T/A^TA eigenvector relationship, and the real warning that computing SVD via A^TA/AA^T eigenvectors is numerically bad practice). Do NOT invent Thursday 9/24's Projection/QR content — leave that as an explicit gap in the Lecture section, labeled, not silently omitted.</scope>
<output_structure>
Fill every heading [[Week Template]] defines, in order, for Week 3:
## What you must be able to do — objectives for Lecture 5's proof and properties, linking [[Lecture - 5 (Part 1)]] and [[Lecture - 5 (Part 2)]] first; add one objective noting Lectures 6-7 (Tue's content) are still pending
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

## Open flags — read before running any of the above
- **File naming for textbook notes:** save as `Lecture - 2 & 3.md`, `Lecture - 4.md`, `Lecture - 5 (Part 1).md`, `Lecture - 5 (Part 2).md` in `20_Progress/Degree/CSCI 5304/Textbook/` — matching Trefethen & Bau's own "Lecture N" numbering (confirmed the book itself uses this term, per [[CSCI 5304 Board]]), not `Chapter - N.md`. The Textbook folder currently holds only `Textbook Map.md`, so nothing collides.
- **Week 1 is skipped on purpose**, per direct instruction — "nothing was done in it." Its transcript (`September 10 Lecture`) exists and covers real Lecture 1 content, but no Notebook or Codex prompt for it is included here. If it's ever wanted later, the Lecture 1 content is fully captured in the manifest table above and the transcript is real and usable.
- **Week 4 is left out on purpose too** — Thu 9/24's transcript (Lectures 6-7, Projection and QR) isn't in the source folder as of 2026-09-28. Don't extend this file's prompts into Week 4 until that transcript actually exists; re-run this same staging pattern (manifest → Notebook prompts → Codex prompt) once it does, rather than guessing its content from the schedule.
- **Quiz #1 never happened in class** (real fact, confirmed in the 9/17 and 9/22 transcripts) — it became an ungraded-in-person take-home, posted late and due 9/22. This is now noted in [[CSCI 5304 Board]]'s schedule warnings section as of this update, since the printed schedule still shows it as an in-class Thursday event.
- **Order of operations:** run all four Notebook prompts first, in one continuous Gemini Notebook chat (same chat keeps terminology consistent across Lectures 2-5), then run the two Codex prompts, Week 2 before Week 3 (Week 3's prompt assumes Week 2's textbook notes already exist for cross-referencing, though it doesn't directly cite them).
- **This pattern is now the reusable one for the rest of the semester** — the master templates live in [[20_Progress/Degree/Repetitive Things|Repetitive Things]], and each future week just needs a manifest table plus filled brackets like this file, not a redesign.
