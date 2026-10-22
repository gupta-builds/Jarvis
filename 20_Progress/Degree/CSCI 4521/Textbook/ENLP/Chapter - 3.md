---
type: class
class_kind: textbook
status: sprout
created: 2026-10-22
updated: 2026-10-22
area:
  - "[[CSCI 4521 Board]]"
  - "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
tags:
  - class
  - textbook
next: "Verify §3.2 page numbers against the rendered PDF; reconcile with Week 6 live capture once LEC 2.5 lands."
---
# ENLP Chapter 3 — Word Embeddings, §3.2 Predictive Models
**Source:** *Embeddings in Natural Language Processing* (Pilehvar & Camacho-Collados, 2020), Chapter 3, §3.2, pp. 29-31.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ENLP Textbook CSCI 4521.pdf`.
**Course role:** Week 6's assigned reading (ENLP 3.2), supporting LEC 2.5 "modern text embedding" — this is the book's own treatment of Word2Vec and GloVe, the two embedding methods the course's `2.5 modern text embeddings.ipynb` notebook almost certainly implements or wraps.
## Chapter Summary
==Predictive word embeddings (Word2Vec, GloVe) replace counting co-occurrences directly with training a model to predict context from a word (or vice versa) — a shift that turned out to produce denser, lower-dimensional, and more useful vectors than the count-based models that preceded them.==
*Mechanism:* Word2Vec's CBOW predicts a target word from its surrounding context; its Skip-gram predicts the surrounding context from the target word — both trained with a simple feedforward architecture under a language-modeling-style objective. GloVe instead explicitly optimizes so that the dot product of two word vectors approximates the log of their co-occurrence count, without using a neural network at all, yet is still classified as "predictive" because it departs from pure counting and uses SGD on a non-convex objective rather than an exact matrix decomposition.
## Key Concepts
- **Predictive vs. count-based embeddings:** predictive models are trained with a language-modeling-style objective (predict a word given context, or context given a word); this section's own point is that Skip-gram can be *proven* equivalent to implicitly factorizing a PMI co-occurrence matrix (Levy & Goldberg, 2014b) — meaning the predictive/count-based divide is not as sharp mechanically as the names suggest, even though the training procedures look very different.
- **Word2Vec CBOW:** predicts the current (target) word $w_t$ from its surrounding context window $W_t=w_{t-n},\dots,w_{t-1},w_{t+1},\dots,w_{t+n}$, minimizing $-\log p(w_t\mid W_t)$.
- **Word2Vec Skip-gram:** the reverse direction — given the target word, predict each word in its surrounding context. Same feedforward input/hidden/output architecture as CBOW, with input/output roles swapped.
- **GloVe's explicit objective:** optimizes $w_i^\top w_k + b_i + b_k = \log(X_{ik})$ for every word pair $(i,k)$, where $X_{ik}$ is their co-occurrence count and $b_i,b_k$ are bias terms — directly fitting the dot product of two word vectors to the log of how often they co-occur, rather than learning that relationship implicitly through a prediction task the way Word2Vec does.
- **Why GloVe counts as "predictive" despite not being a neural network:** it's grouped with the neural predictive models because it emerged in the same wave of embeddings that moved past pure count-based methods, and because it's optimized with Stochastic Gradient Descent on a non-convex objective — unlike SVD-based count models, which have an exact, guaranteed-optimal decomposition.
## Full Reading Notes
### §3.2 Predictive Models (p. 29-31)
Opens by motivating the shift to neural-network-based embeddings: efficiency/speed advantages for processing large text corpora, and the ability to learn genuinely dense representations (citing Bengio et al. 2003, Collobert & Weston 2008, Collobert et al. 2011, Turian et al. 2010) — though the text notes this line of work only became dominant once hardware/software caught up, "in the last decade." Introduces Word2Vec (Mikolov et al., 2013) and its two architectures (CBOW, Skip-gram) with the loss formulation for CBOW given explicitly (Eq. 3.2). Figure 3.1 shows the shared CBOW/Skip-gram architecture: input layer sized to the vocabulary, encoding context as combined one-hot vectors; output layer, same size, holding the target word's one-hot vector during training. Cites Levy & Goldberg's (2014b) proof connecting Skip-gram to implicit PMI matrix factorization — a bridge back to §3.1.1's count-based PMI method. Introduces GloVe (Pennington et al., 2014) with its optimization objective (Eq. 3.3) and the intuition behind it: the *ratio* of co-occurrence probabilities with a third "probe" word is more informative about semantic association than a raw co-occurrence probability alone. Closes by listing (without deriving) several further refinements: dependency-parse-informed embeddings, symmetric-pattern-based embeddings, subword-unit embeddings, probability-distribution word representations, and multilingual embedding spaces — each with its own citation, flagged in this note as named-but-not-detailed, matching the chapter's own level of treatment.
## Worked Example
- The CBOW loss $-\log p(w_t\mid W_t)$ and GloVe's objective $w_i^\top w_k+b_i+b_k=\log(X_{ik})$ are the two equations worth being able to write from memory and explain in words — a quiz testing "interpret this method's results" is far more likely to ask "what is this model trying to do" than to ask for a full derivation.
- The PMI-factorization equivalence (Levy & Goldberg, 2014b) is a genuinely surprising, quiz-worthy fact: two methods that look completely different in training procedure (neural prediction vs. explicit matrix factorization) turn out to solve mathematically related objectives — a good example of the course's own "interpret results, don't just recall definitions" testing style.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] is the week this section supports (LEC 2.5, modern text embedding); `Code/Lectures/Week 6 - 10/2.5 modern text embeddings.ipynb` is this course's real hands-on implementation, not yet checked against this note.
- [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 1|ENLP Chapter 1]]'s one-hot representation (§1.2) is the exact input encoding Word2Vec's input/output layers use (Figure 3.1).
- [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 6|ENLP Chapter 6]]'s BERT builds directly on the idea of a predictive language-modeling objective this section introduces, extended to contextual (not fixed) word vectors.
## Open Questions
- [ ] Verify §3.2 page numbers against the rendered PDF.
- [ ] §3.1's count-based models (PMI, dimensionality reduction, random indexing) are referenced here but are not themselves part of this week's assigned reading — confirmed out of scope per the Board's schedule, not a gap, but worth reading if a quiz question references "count-based vs. predictive" directly.
- [ ] Check `Code/Lectures/Week 6 - 10/2.5 modern text embeddings.ipynb` directly to confirm whether the course implements Word2Vec, GloVe, or both, and whether it uses a pretrained embedding table rather than training either model from scratch.
## Flashcards
What is the difference between Word2Vec's CBOW and Skip-gram objectives?::CBOW predicts the target word from its surrounding context; Skip-gram predicts the surrounding context words given the target word — same architecture, reversed prediction direction. #cards/csci4521
What does GloVe's training objective directly fit, and how does that differ from Word2Vec's approach?::GloVe fits the dot product of two word vectors (plus bias terms) to the log of their co-occurrence count, an explicit objective; Word2Vec instead learns vectors implicitly through a word-prediction task. #cards/csci4521
What surprising theoretical connection does this section name between Skip-gram and count-based models?::Levy & Goldberg (2014b) proved Skip-gram is equivalent to an implicit factorization of a PMI co-occurrence matrix — so the predictive and count-based approaches are more mathematically related than their training procedures suggest. #cards/csci4521
