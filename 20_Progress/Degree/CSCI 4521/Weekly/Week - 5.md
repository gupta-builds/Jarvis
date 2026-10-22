---
type: class
class_kind: week
status: seed
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]"
tags:
  - class
  - lecture
next: "Add protected Week 5 live capture and open the 2.2 notebook directly; capture Quiz 2's real content once reviewed."
---
# CSCI 4521 — Week 5
## What you must be able to do
- Apply tf-idf, stop-word removal, and stemming to a new, unfamiliar text dataset (not just the Pokemon toy example from Week 4) — this week is explicitly a practice week, per the deck's own framing.
- Describe the UseNet/20-newsgroups dataset's real structure (20 newsgroups grouped into topic hierarchies) as a concrete example of a text classification target.
- State, ahead of Week 6's lecture, what the k-means clustering algorithm does mechanically (random assignment, centroid computation, reassignment, convergence) from [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]]'s §12.4.1.
- State HW1's due-date reality (due this week, per the Board's schedule) and the written-report standard set in Week 4 (replicable, justified, classmate-level audience).
## Key ideas (short)
- **This week is deliberately light on new concepts:** LEC 2.2 is framed by the professor as practice, not new material — "we will use" scikit-learn's vectorizers, stop words, and NLTK stemming on a real dataset rather than introducing anything beyond Week 4's toolkit.
- **UseNet/20-newsgroups** is the specific real dataset this course uses for text classification practice — 20,000 posts across 20 newsgroups grouped into five topic hierarchies (computers, recreation, science, politics/religion, miscellaneous).
- **Reading-ahead on clustering (ISL §12.4):** k-means partitions $n$ points into $K$ non-overlapping groups minimizing total within-cluster squared distance; because exact optimization is combinatorially infeasible, the standard algorithm only reaches a local optimum, so it's standard to run it multiple times from different random starts.
- **Reading-ahead on PCA/k-means framing (DLB §5.8):** both are "simple representation" algorithms — PCA gives a low-dimensional, decorrelated continuous code; k-means gives a one-hot, maximally sparse cluster-assignment code.
## Concepts created today
None created in this build.
## Examples worth keeping
- The 20-newsgroups topic hierarchy named directly in the deck: Computers (`comp.graphics`, `comp.os.ms-windows.misc`, `comp.sys.ibm.pc.hardware`, `comp.sys.mac.hardware`, `comp.windows.x`), Recreation (`rec.autos`, `rec.motorcycles`, `rec.sport.baseball`, `rec.sport.hockey`), Science (`sci.crypt`, `sci.electronics`, `sci.med`, `sci.space`), Politics (`talk.politics.misc`, `talk.politics.guns`, `talk.politics.mideast`), Religion (`talk.religion.misc`, `alt.atheism`, `soc.religion.christian`), Miscellaneous (`misc.forsale`) — ~20,000 posts total.
- The deck's own list of tools this week's notebook practices with: `CountVectorizer`, `TfidfVectorizer`, stop words, `SnowballStemmer`, normalized vector distance, and cosine similarity — all Week 4 concepts, applied here rather than introduced.
## Lecture
### Pre-lecture source notes
No protected human live capture is present yet. LEC 2.2 notes come from `Lectures/Week - 4/2.2 nlp practice.pptx.pdf`; a companion notebook `2.2 text classification.ipynb` exists under `Code/Lectures/Weeks 1 - 5/` but has not yet been opened for this build — its real predicted-topic output and any reported accuracy are not yet captured. Quiz 2 happens Thursday this week (10/8); no quiz content has been captured in this vault yet, and HW1 is due this week per the Board's schedule (Tue 10/6).
### 1. LEC 2.2 — NLP Practice (Tue 10/6)
	Opens with a one-slide recap of Week 4's NLP content (vectorization, bag-of-words, L1/L2/cosine similarity, stop words, tf-idf, stemming, bigrams/n-grams), then states today's only agenda item directly: "Practice with NLP concepts using internet posts."
	Introduces UseNet as historical context — a pre-web peer-to-peer asynchronous discussion protocol from 1979, most popular through the 1980s-early 1990s, organized into nine top-level hierarchies (`comp.*`, `humanities.*`, `misc.*`, `news.*`, `rec.*`, `sci.*`, `soc.*`, `talk.*`, `alt.*`) — then names the specific 20-newsgroups subset this course's dataset draws from (see Examples worth keeping).
	States the practice goal directly: predict a post's topic from its content, using the companion notebook, applying `CountVectorizer`, `TfidfVectorizer`, stop words, `SnowballStemmer`-based stemming, normalized vector distance, and cosine similarity — all tools introduced the previous lecture, now applied to a real, messier dataset than the hand-worked Pokemon example.
	Closes with a ChimeIn prompt (submit best/worst examples of "closest story" matches) and a one-line forward-pointer to Week 6: unsupervised methods, clustering, and dimensionality reduction.
## Textbook integration
This week's assigned reading (ISL §12.4, DLB §5.8 intro + §5.8.2, and a repeat of ENLP §1.1-1.3/§7.1.1-7.1.2) is reading-ahead material for Week 6's clustering lecture, not a direct textbook companion to LEC 2.2's practice content — the Board's own schedule assigns this reading during a practice week rather than the week it's actually lectured on, which this note preserves rather than silently reassigning. See [[20_Progress/Degree/CSCI 4521/Textbook/ISL/Chapter - 12|ISL Chapter 12]] and [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]'s §5.8 sections for the clustering mechanism itself, landed this build in anticipation of Week 6.
## Takeaways (questions to resolve)
- [ ] Open `2.2 text classification.ipynb` directly to capture its real predicted-topic results, any reported classification accuracy, and the "best/worst closest story" examples the ChimeIn prompt asks for.
- [ ] Add protected Week 5 live capture, including HW1 submission discussion and any real class feedback on the UseNet classification exercise.
- [ ] Capture Quiz 2's real content once reviewed or returned.
## Lecture-to-textbook synthesis
==Week 5 is a deliberate practice week: no new mechanism is introduced, and the real test of understanding is whether Week 4's tf-idf/stop-words/stemming/cosine-similarity toolkit still works cleanly on a genuinely messy real-world dataset (20,000 UseNet posts) rather than a three-sentence toy example.==
*Mechanism:* the same pipeline from Week 4 (tokenize → vectorize → weight by tf-idf → measure cosine similarity) is applied unchanged; what changes is the dataset's scale and noise, which is the actual point of a "practice" lecture — a technique that works on a clean three-word toy sentence has to prove it still works once sentence length, vocabulary size, and topic overlap are realistic.
- Lecture example/scenario: classifying a UseNet post into one of 20 newsgroups by its text content alone, using the exact tool stack named in the deck.
- Textbook connection: [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 7|ENLP Chapter 7]]'s §7.1.1 explicitly names bag-of-words' real-world limitation (high dimensionality, no semantics) — the UseNet exercise is the concrete case where that limitation is actually felt, not just stated.
- Concept links: None created in this build.
> [!WARNING]
> Treating this week as "nothing to study" because no new formula appears — the quiz style this course uses (interpret results on a new dataset) means a practice week is exactly the kind of week likely to be tested directly.

> [!SUMMARY]
> Week 5 is the bridge between learning the NLP toolkit (Week 4) and needing it to actually work at real scale (the 20-newsgroups UseNet dataset), while the assigned reading looks ahead to Week 6's clustering unit.
## Flashcards
What is the real dataset this course's NLP-practice lecture uses, and roughly how big is it?::A subset of UseNet newsgroup posts — about 20,000 posts across 20 newsgroups grouped into five topic hierarchies (computers, recreation, science, politics/religion, miscellaneous). #cards/csci4521
What is genuinely new about LEC 2.2 compared to LEC 2.1?::Nothing conceptually — it applies Week 4's tools (CountVectorizer, TfidfVectorizer, stop words, stemming, cosine similarity) to a real, larger, messier dataset rather than introducing a new method. #cards/csci4521
