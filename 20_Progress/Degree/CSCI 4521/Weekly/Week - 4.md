---
type: class
class_kind: week
status: seed
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 1|ENLP Chapter 1]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 7|ENLP Chapter 7]]"
tags:
  - class
  - lecture
next: "Add protected Week 4 live capture, especially the class's own real-world bias examples (ChimeIn activity) and the actual HW1-due-day discussion."
---
# CSCI 4521 — Week 4
## What you must be able to do
- Use [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]'s bias/variance vocabulary to distinguish parametric from non-parametric models and state the data/explainability trade-off between them.
- State kNN's computational complexity (brute-force vs. spatially-accelerated) and explain, at a mechanism level, how KD-trees and Locality Sensitive Hashing each reduce it.
- Name the five types of data bias this course teaches (Confirmation, Historical, Selection/Sampling, Survivorship, Availability) and give a real-world example of each distinct from the deck's own.
- Use [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 1|ENLP Chapter 1]] to explain why one-hot word representation solves the variable-size problem but not the no-similarity problem.
- Build a bag-of-words feature vector for a short sentence by hand, including tokenization.
## Key ideas (short)
- **Parametric vs. non-parametric:** a parametric model assumes a functional form and fits finitely many parameters (needs less data, more explainable, risks the wrong functional form); a non-parametric model (like kNN) makes no form assumption but needs much more data and gives no interpretable function.
- **kNN's real bottleneck:** brute-force 1-NN costs $O(dn)$ per query; KD-trees and LSH both bring this to $O(d\log n)$ by exploiting spatial locality, at the cost of possibly missing the true nearest neighbor.
- **KD-trees vs. LSH, when each wins:** KD-trees excel in low dimensions (a few dozen features) but degrade in high dimensions as space fragments into tiny buckets; LSH controls region size via the number of random hyperplanes and outperforms KD-trees once dimensionality climbs past roughly 20 features.
- **Data bias is a property of the data, not (only) the algorithm:** the deck's own framing — a biased model is usually downstream of biased data, not a flaw introduced by the learning algorithm itself.
- **Bag-of-words (ENLP §7.1.1, Ch.1 §1.2):** represents text as word-frequency counts, ignoring order — simple and unsupervised but blind to anything order-dependent (sentiment, inference, generation).
## Concepts created today
None created in this build.
## Examples worth keeping
- The deck's own bias-type examples: Confirmation Bias (only asking PlayStation users why PlayStation beats Switch); Historical Bias (using COVID-period Minneapolis traffic data to model current traffic); Selection/Sampling Bias (optional surveys skew toward people with strong — good or bad — experiences); Survivorship Bias (WWI planes that returned were the only ones analyzed for armor placement, ignoring the ones that didn't return); Availability Bias (ML studies disproportionately using college-student samples for a broader target population).
- LEC 2.1's three-sentence similarity puzzle ("How do pokemon trainers catch pokemon?" / "What is the strongest Pokemon?" / "How do I restart my phone?") motivates why "similar" needs a precise, computable definition before any ML method can use it.
- LEC 2.1's worked bag-of-words example: "How do pokemon trainers catch pokemon?" → vocabulary `[how, do, pokemon, trainers, catch]` → counts `[1,1,2,1,1]` (note "pokemon" appears twice). The two-sentence extension shows how the vocabulary and count vectors grow together as new sentences are added.
- The stop-words worked example strips `[how, to, the, a, who]`-type words from the three Pokemon/phone sentences, leaving `(pokemon, trainers, catch, pokemon)`, `(strongest, pokemon)`, `(restart, phone)` — visibly clarifying which two sentences share real thematic content.
## Lecture
### Pre-lecture source notes
No protected human live capture is present yet. LEC 1.5 notes come from `Lectures/Week - 3/1.5 kNN wrap up, kd trees, lsh, complexity, bias.pptx.pdf` (filed in the Week-3 source folder but confirmed, per the professor's own schedule, to be real Week 4 Tuesday content — a known filing offset, not a scheduling error). LEC 2.1 notes come from `Lectures/Week - 4/2.1 text data, intro to nlp.pptx.pdf`; a companion notebook `2.1 tf-idf vectorization, sklearn.ipynb` exists under `Code/Lectures/Weeks 1 - 5/` but has not yet been opened for this build.
### 1. LEC 1.5 — kNN Wrap-up, KD-Trees, LSH, Complexity, Bias (Tue 9/29)
	Opens by distinguishing parametric models (assume a functional form, e.g. linear regression $f(x)=a^\top x+b$, fit fewer parameters, need less data, more explainable, risk the wrong form) from non-parametric models (e.g. kNN; no functional-form assumption, need much more data, give no interpretable function, can model essentially any shape).
	States kNN's real computational cost directly: 1-NN is $O(dn)$ brute-force (loop over $n$ points, $d$ features each); full $k$NN is $O(kdn)$ without acceleration. Spatial data structures (after an $O(dn)$ sort/build step) bring neighbor search to $O(d\log n)$ — "approximate kNN" trades a small risk of missing the true nearest neighbor for this speedup by finding $m\gg k$ candidates quickly, then selecting the $k$ closest of those.
	KD-trees: recursively split space along one feature at a time, at that feature's median, cycling through features at each depth — described step-by-step with the professor's own cited diagrams (Prof. Jenny Chen's kd-tree notes). Search resembles a binary search with extra steps to account for distance rather than simple ordering.
	LSH: splits space using $l$ random hyperplanes (where $l\gtrsim\log n$), each point hashed to a bit-vector indicating which side of every hyperplane it falls on; points sharing a hash live in the same region and are the ones compared. The deck gives the exact linear-algebra mechanism: stack the hyperplanes' normal vectors and biases into a matrix $A$, append $-1$ to the query point $x$ to form $p=[x^\top,-1]^\top$, then $H(x)=s(Ap)$ where $s$ thresholds each entry to 0/1.
	KD-trees vs. LSH trade-off stated directly: KD-trees outperform in low dimensions (roughly under a few dozen features) but degrade in high dimensions since space fragments into very small buckets; LSH's region size is tunable via hyperplane count and wins once dimensionality exceeds roughly 20 features.
	Closes with "why kNN matters" (simple, well-motivated, flexible, adaptable to almost any task, extendable to regression by averaging neighbor values) and a forward-look at the rest of the semester (dimensionality reduction helps accelerate kNN; regression/classification units build parametric alternatives; deep neural networks act like a parametric summary of kNN's intuitions), then the Ethics in ML section: defines bias/ethics/equity/accountability/deception/fairness/alignment/control, states that **the main source of ML model bias is bias already present in the data**, and names five specific types (Confirmation, Historical, Selection/Sampling, Survivorship, Availability), each with the deck's own worked example (see Examples worth keeping above).
### 2. LEC 2.1 — Unit 2 Intro, Text Data, Intro to NLP (Thu 10/1)
	Opens with HW1 written-report guidance (replicable from the report alone, justify every choice, write for a classmate-level audience, clean notebook organization, clarity is graded) before the content proper. Previews all of Unit 2: text vectorization, cosine similarity, NLP basics (tf-idf, stemming, stop words, bigrams), k-means clustering, PCA, and combining kNN with unsupervised methods — plus a warning about "leakage in training" to come.
	Defines NLP as drawing on linguistics, CS, and AI to understand/represent/reason about human language, lists common NLP tasks (speech recognition, NLI, text generation/QA, MT, summarization), then poses the three-sentence similarity puzzle to motivate needing a precise definition of "similar."
	Introduces bag-of-words as counting word occurrences independent of order, worked through the Pokemon-sentence example exactly (vocabulary and count-vector construction shown step by step, see Examples worth keeping).
	Tokenization is defined as splitting on whitespace, then lowercasing and stripping punctuation — with the exact Python one-liner shown: `"Oh... hello there world!".replace(".","").replace("!","").lower().split()`. Vectorization is defined as turning tokens into a numeric vector, demoed with `np.unique`.
	Introduces $L_1$/$L_2$ distance for comparing text vectors, then normalization (dividing by the vector's own norm) and cosine similarity/distance as the angle-based alternative that automatically ignores vector magnitude — explicitly flagged as "very common in text-based learning."
	Stop words are defined and worked through the same three-sentence example (see Examples worth keeping), with an explicit caveat slide (quoting a Google Developer Relations post: "'To be or not to be' is just a collection of stop words, but stop words alone don't do it any justice") that naive stop-word removal has real failure modes.
	Introduces term frequency, document frequency, and inverse document frequency ($\log(1/df)$) building up to tf-idf as their product, then stemming (reducing inflected words to a root, e.g. "cared"→"care"), naming the Snowball/Porter-algorithm stemmer and the NLTK toolkit (with a literal code example: `nltk.stem.SnowballStemmer('english').stem("follow")` → `follow`, same for "followers"/"following"). Introduces $n$-grams (bigrams as the $n=2$ case) with the "to be or not to be" worked example, their advantages (multi-word concepts, limited context, disambiguating homographs) and disadvantages (best $n$ is dataset-dependent, large $n$ raises variance). Closes naming bag-of-words' real limitations directly: it ignores word meaning (the deck's own "big/small/tiny cheese" example — BOW can't tell these apart meaningfully) and is order-independent ("man bites dog" vs. "dog bites man" look identical to BOW).
## Textbook integration
[[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]'s §5.4-§5.6 (estimators, bias, MLE, Bayesian statistics) is this week's assigned reading but connects to LEC 1.5 only loosely — the deck's own "bias" is about data/ethics, while the textbook's "bias" (§5.4.2) is the statistical estimator property $E[\hat\theta]-\theta$. These are genuinely different senses of the same word; do not conflate the deck's ethics-bias framing with the textbook's estimator-bias framing on a quiz. [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 1|ENLP Chapter 1]]'s one-hot/VSM framing (§1.2) is the direct conceptual ancestor of LEC 2.1's bag-of-words vectorization — the deck doesn't use the term "one-hot" explicitly but its count-vector construction is the same underlying idea extended from per-word to per-sentence counting. [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 7|ENLP Chapter 7]]'s §7.1.1 bag-of-words section is the textbook's own more formal treatment of exactly what LEC 2.1 demonstrates by hand — the textbook adds the compositionality framing (word-embedding averaging as an alternative composition method) that the lecture doesn't cover this week.
## Takeaways (questions to resolve)
- [ ] Add protected Week 4 live capture — in particular, the class's own real-world examples for each of the five bias types (the deck explicitly asks students to submit these on ChimeIn) and any HW1-due-day discussion.
- [ ] Open `2.1 tf-idf vectorization, sklearn.ipynb` directly to check whether it reproduces the deck's hand-worked bag-of-words/tf-idf example or jumps straight to `sklearn.feature_extraction.text` vectorizers.
- [ ] Confirm whether DLB §5.4-§5.6's estimator-bias and this week's data/ethics-bias are ever explicitly contrasted in class, since they share a name but not a mechanism — a real confusion risk worth asking about directly.
## Lecture-to-textbook synthesis
==The word "bias" means two unrelated things in this week's material — a statistical estimator's systematic deviation from the truth (textbook) and a data-collection or human-judgment skew that produces unfair or unrepresentative models (lecture) — and the course tests both without flagging which sense is meant.==
*Mechanism:* DLB's estimator bias is a number, $E[\hat\theta_m]-\theta$, computable and sometimes provably zero; the lecture's data bias (confirmation, historical, selection, survivorship, availability) is a qualitative failure mode in how data was collected or framed, with no single formula — fixing one has nothing to do with fixing the other.
- Lecture example/scenario: the deck's five named bias types each come with a real-world example (Switch-vs-PlayStation confirmation bias, COVID-era Minneapolis traffic historical bias, optional-survey selection bias, WWI-plane survivorship bias, college-student-sample availability bias) — none of these are about an estimator's expectation, they're all about what data got collected or who got asked.
- Textbook connection: [[20_Progress/Degree/CSCI 4521/Textbook/DLB/Chapter - 5|DLB Chapter 5]]'s §5.4.2 worked Bernoulli/Gaussian examples are the textbook's version of "bias," entirely about estimator expectation, not data collection.
- Concept links: None created in this build.
> [!WARNING]
> Answering a quiz question about "bias" with the wrong sense of the word — the textbook reading and the lecture both use the term this week, but for genuinely unrelated concepts.

> [!SUMMARY]
> Week 4 closes Unit 1 by naming kNN's real computational cost and how to reduce it (KD-trees, LSH), names data bias as a distinct ethics concern from statistical estimator bias, and opens Unit 2 by giving text data a precise, computable notion of "similar" via bag-of-words and cosine similarity.
## Flashcards
Why does a KD-tree degrade in high-dimensional data while LSH does not degrade the same way?::KD-trees split space into increasingly small buckets as dimensionality grows, becoming unwieldy; LSH's region size is controlled by the number of random hyperplanes, letting it scale better past roughly 20 features. #cards/csci4521
What is the one thing the deck states is the main source of ML model bias?::Bias that already exists in the training data — not a flaw introduced by the learning algorithm itself. #cards/csci4521
Why does cosine similarity "automatically ignore vector magnitude"?::It measures the angle between two vectors (their normalized direction), not their length, so two vectors pointing the same way are maximally similar regardless of how long either one is. #cards/csci4521
What does tf-idf multiply together, and what does a low idf value indicate?::Term frequency times inverse document frequency; a low idf (near the document frequency being close to the total document count) indicates the word is common across documents and therefore less informative. #cards/csci4521
Why can bag-of-words not distinguish "man bites dog" from "dog bites man"?::BOW counts word occurrences independent of order, so both sentences produce the identical count vector. #cards/csci4521
