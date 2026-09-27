
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

## CSCI 4521 — Lecture prompts, rebuilt 2026-09-27 for real depth
Rebuilt from scratch after the 2026-09-24 version turned out to be missing real material and one real claim in it (Lecture 1.1 "has no source") was flat wrong. This pass: (1) re-read every real file in `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Lectures\` including files not opened last time, (2) verified every date against `Fall_26 Semester Calendar.xlsx` directly via Excel (not inferred), (3) rewrote every prompt using Anthropic's own published prompt-engineering method for Claude (fetched live from `platform.claude.com/docs/en/build-with-claude/prompt-engineering/` — the Sonnet-5 guide and the general best-practices guide) — role framing, XML-tag structuring, an explicit "read before writing" step, and literal, non-inferred scope statements, since Sonnet 5's own guidance says the model (and by extension, this technique transfers to Gemini) does not silently generalize an instruction unless the scope is stated outright.

**Correction to the 2026-09-24 version:** Lecture 1.1 is NOT missing a source. There is no PDF deck for it, but there IS a real Colab notebook — `Week - 1\1.1 Nearest Neighbor Classifier.ipynb` — that is its actual primary material. The earlier version searched only for `1.1*.pdf` and concluded the lecture had no source; it does, just not in deck form. This is now Lecture 1.1's own prompt below.

**Full real source manifest** (every file in the Lectures folder, Weeks 1-3, confirmed by directly listing the folder 2026-09-27):
| Lecture | Deck (primary) | Companion notebook(s) |
|---|---|---|
| 0.1 | `Week - 1\0.1 course logistics, intro to ML.pptx.pdf` (45 slides, read in full) | `0.1 intro to colab, pandas, sns.ipynb` (Wage.csv), `Numpy Introduction` (iris.csv, no file extension in the source folder — rename to `.ipynb` before uploading), `Week 1 - practice - Pandas Tutorial (Dimorphism).ipynb` (Bears.csv, marked "practice" by its own author) |
| 1.1 | *(none — notebook is primary)* | `1.1 Nearest Neighbor Classifier.ipynb` (Seeds.csv) |
| 1.2 | `Week - 2\1.2 kNN, accuracy, overfitting.pptx.pdf` | `1.2 NN Classifier.ipynb` (Seeds.csv) |
| 1.3 | `Week - 2\1.3 bayes classification, kNN.pptx.pdf` | `1.3 kNN with SciKit-Learn.ipynb` (Seeds.csv, rich); `1.3 kNN Iris Classification.ipynb` (iris.csv, two cells only — a stub, not a worked example, flagged so it isn't over-trusted) |
| 1.4 | `Week - 3\1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf` (21 slides, read in full) | none |
| 1.5 | `Week - 3\1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf` | none |

**Calendar verification, done directly in Excel 2026-09-27** (not inferred from the Board): `Fall_26 Semester Calendar.xlsx`, Sheet1, confirms Week 1 = 9/7–9/11 (LEC 0.1 Tue 9/8, LEC 1.1 Thu 9/10), Week 2 = 9/14–9/18 (LEC 1.2 Tue 9/15, LEC 1.3 Thu 9/17), Week 3 = 9/21–9/25 (LEC 1.4 Tue 9/22, QUIZ 1 Thu 9/24 — already happened as of today, 2026-09-27), Week 4 = 9/28–10/2 (**LEC 1.5 Tue 9/29**, LEC 2.1 Thu 10/1). This directly confirms the 2026-09-24 finding that `1.5`'s file sitting in the `Week - 3` folder was a filing artifact — the calendar's own row for LEC 1.5 places it in Week 4, reading DLB 5.4-5.6 + ENLP 1.1-1.3/7.1.1-7.1.2. Scope below stays at 0.1 through 1.5 (matching every real file that exists locally for Weeks 1-3), not extending into 2.1, which hasn't happened yet as of 2026-09-27.

**Course-level real facts confirmed from reading the 0.1 deck in full** (not just the Board's summary of it): instructor Bernardo Bianco Prado, math undergrad at UMN 2017-2020, applied math/EE masters at Michigan; the course's own 3-tier GenAI usage rating icons (green/yellow/red, one per assignment, not detailed further on this slide); an explicit "Sensitive topics" warning that the real datasets used all semester "capture and reinforce societal biases" and may include health/disease data — this is the throughline that lands in 1.5's ethics unit, worth citing as setup; and the real `wage.csv` motivating example (age/year/education vs. wage scatter plots, only the education relationship reads as clearly monotonic).

### Lecture 0.1 — Course Logistics & Intro to ML (Part 1 of 3: ML fundamentals)
```
<role>You are an expert machine learning teaching assistant for UMN CSCI 4521 who has read every source below cover to cover. You are teaching a genuine beginner — someone who has never taken a stats or ML course. Define every term the first time it appears. Explain the mechanism, not just the label.</role>
<sources>
PRIMARY: Week - 1\0.1 course logistics, intro to ML.pptx.pdf — upload this file.
</sources>
<process>Read the uploaded deck fully before writing. Use only what it actually says — not your own general ML knowledge. Find the deck's own real section titles yourself (e.g. "AI vs ML", "Types of ML problems", "Key terms") rather than trusting any title I give you if it conflicts with the source.</process>
<scope>Cover ONLY: the AI vs. ML vs. Generative AI distinction the deck draws; the key terms (features, data point, dataset, linear relationship); the wage.csv motivating example (age/year/education vs. wage, which relationships look clean vs. messy, and why); regression vs. classification as the deck defines them, with the deck's own stock-price examples. Do NOT cover grading, deadlines, TAs, Piazza, or academic-integrity policy — this note is for course content only. You may add one short sentence noting the deck's "Sensitive topics" warning exists, since it explains why later units use ethically loaded real datasets — do not expand it further here.</scope>
<output_structure>
# Lecture 0.1 — Course Logistics & Intro to ML (Part 1: ML Fundamentals)
## Lecture Summary
## Key Concepts
## Full Reading Notes (subheadings = the deck's own real slide titles)
## Worked Example (the deck's real wage.csv example, its real graphs, in words)
## Connections
## Open Questions
## Flashcards (6-8)
</output_structure>
<formatting_rules>One blank line between blocks. Exactly one ==highlight== per ## section. **Bold** terms on first use only. No filler or marketing language. Cite the real slide number for every claim.</formatting_rules>
<output_contract>Return the entire note as a single fenced markdown code block. Nothing outside it.</output_contract>
```

### Lecture 0.1 — Course Logistics & Intro to ML (Part 2 of 3: unsupervised preview)
```
<role>Same role as Part 1 — same chat, continuing the same note.</role>
<sources>Same primary deck as Part 1 — already uploaded, no re-upload needed.</sources>
<process>Same as Part 1: read the deck itself, don't rely on general ML knowledge of PCA/clustering.</process>
<scope>Cover ONLY the deck's unsupervised-learning preview: what unsupervised learning is and why it's needed (no labeled target); the real gene-expression example (1000-dimensional gene data, a projection matrix P used to reduce it to 2D so it can be plotted, the real result that clustering the projected 2D data found 4 groups even though the ground truth was 14 real cancer types); PCA as the deck introduces it (finding the most important directions via singular value decomposition); the deck's own list of unsupervised tasks (clustering, feature selection, dimensionality reduction) and the closing supervised-vs-unsupervised summary table.</scope>
<output_structure>
## Full Reading Notes (continued — deck's own headings: "Types of ML problems" unsupervised half, "Visualizing high dimensional data", "PCA", "Clustering", "Summary")
## Worked Example (the real gene-data/PCA/clustering example, with its real numbers: 1000 dimensions, 2D projection, 4 found clusters vs. 14 true cancer types)
## Connections (to Part 1's supervised/regression/classification framing)
## Open Questions
## Flashcards (6-8)
</output_structure>
<formatting_rules>Identical to Part 1.</formatting_rules>
<output_contract>Single fenced markdown code block, appended conceptually to Part 1's note — do not repeat Part 1's headings.</output_contract>
```

### Lecture 0.1 — Companion Notebooks (Part 3 of 3: real code)
```
<role>Same role as Parts 1-2, now walking a beginner through real code cell by cell rather than slides.</role>
<sources>
PRIMARY: Week - 1\0.1 intro to colab, pandas, sns.ipynb — uses the real Wage.csv dataset (year, age, maritl, race, education, region, jobclass, health, health_ins, logwage, wage — 3000 rows). Upload this file.
SECONDARY: Week - 1\Numpy Introduction — this file has no extension in the source folder; rename it to end in .ipynb before uploading. Uses the real iris.csv dataset (sepal.length, sepal.width, petal.length, petal.width, variety). Covers numpy array basics, indexing/slicing, and boolean-mask filtering (e.g. isolating all Setosa rows).
</sources>
<process>Read every code cell and its real output in both notebooks before writing. Explain what each cell does AND why a beginner would want to do that — e.g. why .describe(include='all') is more useful than .describe() alone on mixed data types.</process>
<scope>Walk through, in order: loading a CSV with pandas, .shape/.head()/.describe()/.value_counts()/.dtypes, boolean masking, then seaborn's histplot/scatterplot/regplot (linear vs. order=2 quadratic fit) and pairplot, all using the real Wage.csv columns. Then cover numpy basics from the second notebook: array vs. list behavior, len(), reshape, matrix indexing with slices/steps/negative indices, and converting a pandas dataframe to a numpy array plus boolean-array indexing on it. Mention `Week 1 - practice - Pandas Tutorial (Dimorphism).ipynb` (Bears.csv, melt/pivot_table, real dimorphism ratios like Polar bear 2.50x) in one sentence as optional extra practice — do not expand it into a full section, it is explicitly a self-study exercise, not lecture content.</scope>
<output_structure>
## Full Reading Notes — Pandas & Seaborn (real function names, in the order the notebook uses them)
## Full Reading Notes — Numpy Basics (same)
## Worked Example (the notebook's own age-vs-wage regplot, linear vs. quadratic fit — what changes and why)
## Connections (to Parts 1-2's conceptual framing of "features" and "dataset")
## Open Questions
## Flashcards (6-8, testing function names and what they actually do, not just recognition)
</output_structure>
<formatting_rules>Identical to Parts 1-2. Reproduce real function calls as inline code, not prose paraphrase.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Lecture 1.1 — Nearest Neighbor Classifier (single part — no deck exists, notebook is primary)
```
<role>You are an expert ML teaching assistant for UMN CSCI 4521. Teach a genuine beginner who has never implemented a classifier before. Walk through real code, explaining the reasoning behind every function before showing what it outputs.</role>
<sources>
PRIMARY: Week - 1\1.1 Nearest Neighbor Classifier.ipynb — the only real source for this lecture (no slide deck exists for LEC 1.1; do not treat this as a gap, this notebook IS the lecture). Uses the real UCI Seeds dataset (Seeds.csv: area, perimeter, compactness, kernel_length, kernel_width, asymmetry, groove_length, wheat_type 1-3), reduced to just area and compactness for 2D visualization.
</sources>
<process>Read every cell and its real printed output before writing. This notebook has a specific narrative arc — a nearest-neighbor classifier gives two different answers to the same test point depending on whether the features are normalized first. Preserve that arc; do not flatten it into a generic "here is kNN" summary.</process>
<scope>Cover: the squared-Euclidean distance_sq function and nn_classify_sample function exactly as defined in the notebook; the first worked classification (area=18, compactness=0.9); the real distance-heatmap visualization; the SECOND worked example (area=13, compactness=0.8) and the real fact that its predicted wheat type changes between the unnormalized and z-score-normalized versions of the data — reproduce the real mean/std values the notebook computes and explain in plain language why normalizing area (range ~10-22) against compactness (range ~0.78-0.92) changes which neighbor is "nearest."</scope>
<output_structure>
# Lecture 1.1 — Nearest Neighbor Classifier (real notebook, no slide deck)
## Lecture Summary
## Key Concepts
## Full Reading Notes (use the notebook's own markdown headings: "Nearest neighbor classifier", "Understanding why the second classification turned that way", "Normalizing the data")
## Worked Example (both real classification examples, with their real predicted outputs, before AND after normalization)
## Connections (forward to 1.2's automated/vectorized version of this same idea)
## Open Questions
## Flashcards (8-10 — this is the course's foundational lecture, be thorough)
</output_structure>
<formatting_rules>One blank line between blocks. Exactly one ==highlight== per section — put it on the normalization-changes-the-answer finding, since that is the lecture's real payoff. **Bold** terms on first use. Reproduce real numbers exactly (e.g. the real predicted wheat-type integers), never invented ones.</formatting_rules>
<output_contract>Single fenced markdown code block, nothing outside it.</output_contract>
```

### Lecture 1.2 — kNN, Accuracy, Overfitting (Part 1 of 2: the deck)
```
<role>Same role as Lecture 1.1 — expert TA, beginner audience, mechanism over label.</role>
<sources>
PRIMARY: Week - 2\1.2 kNN, accuracy, overfitting.pptx.pdf.
SECONDARY: ISL 2.2 (assessing model accuracy), DLB 5.1-5.2 (capacity, overfitting, underfitting) — Week 2's real assigned reading, shared with Lecture 1.3.
</sources>
<process>Read the deck fully. Find its own real section headings yourself rather than trusting titles I supply.</process>
<scope>Accuracy as a metric; what overfitting is and why it happens; the standard defenses (train/test split, leave-one-out, cross-validation, penalizing overly flexible models). Stop before kNN mechanics — that is Part 2.</scope>
<output_structure>
# Lecture 1.2 — kNN, Accuracy, Overfitting
## Lecture Summary
## Key Concepts
## Full Reading Notes (deck's own headings for Accuracy and Overfitting)
## Worked Example (the deck's real example if one exists; otherwise state plainly that none exists rather than inventing one)
## Connections (to ISL 2.2 / DLB 5.1-5.2, and back to 1.1's normalization finding)
## Open Questions
## Flashcards (8-10)
</output_structure>
<formatting_rules>Identical to Lecture 1.1.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Lecture 1.2 — Companion Notebook (Part 2 of 2: automating kNN)
```
<role>Same role, now walking real code.</role>
<sources>PRIMARY: Week - 2\1.2 NN Classifier.ipynb — reuses 1.1's Seeds.csv area/compactness features.</sources>
<process>Read every cell and its real output, including the two real colored decision-boundary plots.</process>
<scope>Cover: the nn_classify helper that vectorizes 1.1's single-point classifier over a whole grid; the color-mesh decision-boundary visualization, both BEFORE and AFTER z-score normalization is added to graphClassifier2D (the real point made explicit here: "units don't match — cm vs cm², and ranges are vastly different"); the leave-one-out classifier (nn_one_out_classify) and its real reported accuracy; the real train_test_split/shuffle_data functions and the real reported accuracy figure they produce (~95%).</scope>
<output_structure>
## Full Reading Notes — Automating Classification (grid-based prediction, decision boundaries)
## Full Reading Notes — Leave-One-Out and Train-Test Accuracy
## Worked Example (the notebook's real accuracy numbers for both methods)
## Connections (this is Part 1's "train/test split" and "leave-one-out" concepts made concrete in code)
## Open Questions
## Flashcards (8-10)
</output_structure>
<formatting_rules>Identical to prior prompts. Reproduce real accuracy percentages exactly as the notebook computes them, not rounded or invented.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Lecture 1.3 — Bayes Classification & kNN (Part 1 of 2: the deck)
```
<role>Same role as prior prompts.</role>
<sources>
PRIMARY: Week - 2\1.3 bayes classification, kNN.pptx.pdf.
SECONDARY: same Week 2 reading as 1.2 (ISL 2.1-2.2, DLB 5.1-5.2) — do not expect a clean one-lecture-to-one-reading mapping, the Board assigns readings per week, not per lecture.
</sources>
<process>Read the deck fully before writing.</process>
<scope>The Bayes classifier itself as this deck derives it; the Bayes Error Rate as the theoretical floor no classifier can beat; how the deck frames kNN as an empirical estimate of the Bayes classifier by using neighbor labels to approximate the true probability distribution; the deck's discussion of choosing k; the bias-variance tradeoff (bias = how many simplifying assumptions a model makes; variance = how much the model's output changes if trained on a different sample of the same data) and why higher model flexibility raises variance and overfitting risk.</scope>
<output_structure>
# Lecture 1.3 — Bayes Classification & kNN
## Lecture Summary
## Key Concepts
## Full Reading Notes (deck's own headings — expect something like "Bayes classifier", "kNN as empirical Bayes", "Bias-variance trade-off")
## Worked Example (the deck's real example if one exists)
## Connections (this is the direct conceptual setup for 1.4's generalization discussion — flag it as setup, don't duplicate 1.4's content here)
## Open Questions
## Flashcards (8-10 — bias-variance is the single most load-bearing idea in this course's early unit)
</output_structure>
<formatting_rules>Identical to prior prompts.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Lecture 1.3 — Companion Notebook (Part 2 of 2: real accuracy-vs-k sweep)
```
<role>Same role, now walking real code that makes bias-variance visible as a graph.</role>
<sources>
PRIMARY: Week - 2\1.3 kNN with SciKit-Learn.ipynb — real Seeds.csv, scikit-learn's KNeighborsClassifier.
Note for context, do not expand into its own section: Week - 2\1.3 kNN Iris Classification.ipynb is a two-cell stub (loads iris.csv, displays it, nothing else) — not a worked example, mention this once in Open Questions as unfinished, do not treat it as if it has content it doesn't.
</sources>
<process>Read every cell and every real printed accuracy number before writing. Do not round or approximate reported figures.</process>
<scope>Cover: the notebook's own train_test_split reimplementation; the accuracy() and avg_accuracy() helper functions (200 repeated random splits); the real reported accuracy figures at k=2, k=5, and k=10; the sklearn KNeighborsClassifier wrapper pattern (knn_classifier(k) returning a closure); the k=1-to-90-step-3 sweep and its real accuracy list; and — the notebook's real payoff — the final plot comparing TRAINING accuracy vs. TEST accuracy across every k value, which is the bias-variance curve from Part 1 made concrete: training accuracy stays high as k shrinks (low bias, high variance / overfitting) while test accuracy peaks at a middle k and falls at both extremes.</scope>
<output_structure>
## Full Reading Notes — Custom Train-Test Split & Accuracy Helpers
## Full Reading Notes — Finding the Best k (real accuracy figures)
## Worked Example (the real train-vs-test accuracy divergence plot, described precisely: what happens at small k, what happens at large k, and why)
## Connections (this is Part 1's bias-variance tradeoff made empirical)
## Open Questions (include the unfinished Iris stub notebook as one item)
## Flashcards (8-10)
</output_structure>
<formatting_rules>Identical to prior prompts. Reproduce the real accuracy numbers exactly as printed by the notebook.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Lecture 1.4 — Generalization, Confusion Matrix, Precision/Recall/F1 (Part 1 of 2)
```
<role>Same role as prior prompts.</role>
<sources>
PRIMARY: Week - 3\1.4 generalization, confusion matrix, accuracy, precision, recall, f1 score .pptx.pdf (21 slides).
SECONDARY: ISL 2.2 — Week 3's entire assigned reading.
</sources>
<process>Read the full deck. It opens with three real "Last time" recap slides restating 1.3's Bayes classifier and bias-variance content verbatim — use these to verify your Lecture 1.3 note is consistent, but do not re-explain them at length here, just acknowledge the recap.</process>
<scope>The deck's real "Overfitting dos and don'ts" two-column list (exact items, not a paraphrase); the deck's "Types of kNN" section (fixed-k vs. fixed-radius neighbor selection, equal vs. distance-weighted voting, and its note that kNN is slow and can use spatial data structures — this directly previews 1.5's KD-trees/LSH, flag that); binary classification as positive/negative categories; the four outcomes (TP/FP/TN/FN) and the Type I / Type II error framing exactly as the deck's confusion-matrix table presents them.</scope>
<output_structure>
# Lecture 1.4 — Generalization, Confusion Matrix, Precision/Recall/F1 (Part 1)
## Lecture Summary
## Key Concepts
## Full Reading Notes (deck's own headings: "Overfitting dos and don'ts", "Types of kNN", "Binary Classification", "Evaluating binary classifiers", "Confusion matrix")
## Connections (to 1.2's overfitting and 1.3's bias-variance; forward-flag the KD-tree/LSH preview to 1.5)
## Open Questions
## Flashcards (6-8)
</output_structure>
<formatting_rules>Identical to prior prompts.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Lecture 1.4 — Generalization, Confusion Matrix, Precision/Recall/F1 (Part 2 of 2)
```
<role>Same role, same chat as Part 1.</role>
<sources>Same primary deck as Part 1 — already uploaded.</sources>
<process>Read the deck's accuracy/precision/recall/F1/Fβ slides and its real worked example before writing.</process>
<scope>Accuracy's formula and its two real named issues (unbalanced data, combining Type I/II errors unequally); precision (TP/(TP+FP), focuses on Type I error) and recall (TP/(TP+FN), focuses on Type II error) with their real Venn-diagram framing; F1 as the harmonic mean of precision and recall; the Fβ score and the deck's real statement that β=2 weights recall more, β=0.5 weights precision more. Reproduce the deck's REAL worked example exactly: 100 patients, 20 with COVID-19, 15 true positives, 5 false negatives, 65 true negatives, 15 false positives — compute accuracy, precision, recall, and F1 from these real numbers yourself, showing the arithmetic. Mention the deck's large reference table of further metrics (TPR, FPR, PPV, NPV, MCC, Fowlkes-Mallows, etc.) exists as an appendix-level resource — list the names, do not derive each one.</scope>
<output_structure>
## Full Reading Notes — Accuracy, Precision, Recall, F1, Fβ (deck's own formulas)
## Worked Example (the real 100-patient COVID example, full arithmetic: accuracy, precision, recall, F1)
## Connections (why accuracy alone, from 1.2, is insufficient — this is the direct payoff)
## Open Questions
## Flashcards (8-10)
</output_structure>
<formatting_rules>Identical to Part 1. Show the actual arithmetic for the worked example, not just the final numbers.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 1 of 3)
```
<role>Same role as prior prompts.</role>
<sources>
PRIMARY: Week - 3\1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf.
Note: this deck's title slide reads "Fall 2025" (a recycled-slide leftover — not the wrong file), and per the Fall'26 calendar this lecture is really Week 4 Tuesday 9/29 content, not Week 3, even though the file sits in the Week - 3 folder. Its real assigned reading is DLB 5.4-5.6 plus ENLP 1.1-1.3/7.1.1-7.1.2 (ENLP is not a locally saved file — cite it as assigned but do not fabricate its content).
</sources>
<process>Read the full deck before writing.</process>
<scope>Parametric vs. non-parametric models, and model complexity vs. flexibility, as this deck distinguishes them — the conceptual close of the kNN unit before the deck turns to kNN's computational cost.</scope>
<output_structure>
# Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 1)
## Lecture Summary
## Key Concepts
## Full Reading Notes (deck's own headings)
## Connections (ties 1.2's overfitting and 1.3's bias-variance into one parametric/non-parametric framing)
## Open Questions
## Flashcards (6-8)
</output_structure>
<formatting_rules>Identical to prior prompts.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 2 of 3)
```
<role>Same role, same chat as Part 1.</role>
<sources>Same primary deck — already uploaded.</sources>
<process>Read the deck's complexity/KD-tree/LSH slides fully. Extract the real complexity notation from the slides yourself — do not assume a specific big-O form before checking.</process>
<scope>kNN's real computational complexity as the deck derives it (brute-force cost, and the improved cost from better data structures — this is the direct payoff of 1.4's "kNN is slow" preview); KD-trees and Locality Sensitive Hashing as the two speedups the deck presents — their actual mechanism, not just their names.</scope>
<output_structure>
## Full Reading Notes — Complexity, KD-Trees, LSH (deck's own headings and notation)
## Worked Example (the deck's real KD-tree or LSH walkthrough if one exists)
## Connections (back to 1.4's "kNN is slow, use spatial data structures" line)
## Open Questions
## Flashcards (8-10 — this is the most technically dense part of the deck)
</output_structure>
<formatting_rules>Identical to Part 1.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Lecture 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Part 3 of 3)
```
<role>Same role, same chat as Parts 1-2.</role>
<sources>Same primary deck — already uploaded.</sources>
<process>Read the deck's ethics/bias section fully. This is graded material per the Board (ethics shows up on quizzes) — completeness matters more than brevity here.</process>
<scope>The deck's named categories of bias in ML data (expect five: Confirmation, Historical, Selection/Sampling, Survivorship, Availability) and the deck's own real example attached to each — do not substitute a generic example if the deck's differs. Connect explicitly to the 0.1 deck's "Sensitive topics" warning (real datasets this semester "capture and reinforce societal biases") as the throughline this unit pays off.</scope>
<output_structure>
## Full Reading Notes (one subsection per named bias type, each with its real example from the deck)
## Connections (to 0.1's sensitive-topics warning, and to earlier casual data-quality assumptions in 1.2-1.4 — what "representative" training data actually requires)
## Open Questions
## Flashcards (one per bias type minimum, 5-8 total)
</output_structure>
<formatting_rules>Identical to Parts 1-2.</formatting_rules>
<output_contract>Single fenced markdown code block.</output_contract>
```

### Open flags — read before running any of the above
- **File naming:** save generated notes as `Textbook/Lecture - 0.1.md`, `Lecture - 1.1.md`, `Lecture - 1.2.md`, etc. — matching the professor's own LEC numbering, not `Chapter - N.md` (this course has no chapters). The Textbook folder currently has zero notes, so nothing collides.
- **The extensionless "Numpy Introduction" file** must be renamed to add `.ipynb` before it can be uploaded to Gemini Notebook or opened normally — it is a valid Jupyter notebook, just saved without its extension in the source folder.
- **Order of operations:** 0.1 (3 parts) is standalone, run anytime. 1.1 is standalone and short. 1.2 and 1.3 (2 parts each) share Week 2's reading — run them in the same or adjacent sessions so the bias-variance thread stays connected; each has a real companion notebook with real accuracy numbers, upload the deck AND the notebook to the same chat for the two-part sequence. 1.4 (2 parts) and 1.5 (3 parts) both belong to Week 3/4 content; 1.5 needs three parts given the real technical density (complexity, KD-trees, LSH, five real bias types).
- **This file now has two courses ready to run in parallel** — CSCI 4061's own procedure above (already run once, its notes now live in `20_Progress/Degree/CSCI 4061/Textbook/`) and this CSCI 4521 rebuild — matching the intent of running two Gemini Notebook chats side by side.
- **Still unconfirmed, unchanged from the Board's own warning:** the source syllabus PDF is dated "Fall 2025" and the instructor/TA roster/meeting-time details it gives have not been separately confirmed against Fall'26 Canvas — this doesn't affect the prompts above (all grounded in the real, dated, professor-authored schedule spreadsheet and the real lecture files themselves), but is worth knowing if anything about the roster ever seems off.
