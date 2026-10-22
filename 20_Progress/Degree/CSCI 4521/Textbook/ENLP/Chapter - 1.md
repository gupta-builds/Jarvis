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
next: "Verify §1.1-§1.3 page numbers against the rendered PDF; reconcile with Week 4-5 live capture once LEC 2.1/2.2 land."
---
# ENLP Chapter 1 — Introduction, §1.1 Semantic Representation, §1.2 Vector Space Models, §1.3 The Evolution Path of Representations
**Source:** *Embeddings in Natural Language Processing: Theory and Advances in Vector Representations of Meaning* (Pilehvar & Camacho-Collados, 2020), Chapter 1, §1.1-§1.3, pp. 4-8.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ENLP Textbook CSCI 4521.pdf`.
**Course role:** Week 4-5's assigned reading (ENLP 1.1-1.3), supporting LEC 2.1 (text data, intro to NLP) and LEC 2.2 (NLP practice) — this is the book's own on-ramp from "a word is just a string of characters" to the vector-space idea the rest of the course's NLP unit builds on.
## Chapter Summary
==Representing words as raw character encodings (ASCII) loses all notion of semantic similarity and ties representation size to word length; vector space models fix both problems by mapping words to fixed-size, continuous vectors where distance encodes meaning.==
*Mechanism:* one-hot encoding first solves the fixed-size problem (every word gets the same-length vector) but still treats every pair of words as equally dissimilar, since each word occupies its own axis with no shared structure. The Vector Space Model generalizes this to a continuous, lower-dimensional space where semantically similar words (e.g. "desk" and "table") end up close together, and that notion of distance-as-similarity is the one property every embedding method covered later in the book is built to produce, whether from counting (Chapter 3), predicting (Chapter 3), or deep contextual models (Chapter 6).
## Key Concepts
- **Character-level encoding's two failures (§1.1):** (1) semantically similar words ("table"/"desk") get totally unrelated bit patterns, so there's no way to recover similarity from the representation itself; (2) the representation's size scales with word length, which both complicates comparison between words and doesn't fit cleanly into feature-based ML models.
- **One-hot representation (§1.2):** maps each of $m$ vocabulary words to a fixed, $m$-dimensional vector with a single 1 at that word's index and 0 elsewhere. Fixes the variable-size problem but is maximally sparse and still encodes zero notion of similarity — "noon" and "midday" remain exactly as dissimilar (by construction) as any other two distinct words.
- **Vector Space Model (VSM) (§1.2):** generalizes one-hot encoding to a continuous, lower-dimensional "semantic space" where objects (words, documents, sentences, entities — not limited to words) are placed so that spatial distance tracks semantic similarity. This is the **distributed representation** idea: unlike one-hot's one-axis-per-word structure, a VSM lets $n\ll m$ dimensions represent $m$ words by spreading information across all dimensions rather than isolating each word to its own.
- **Why distance-as-similarity matters (§1.2):** once similarity is literal spatial distance, standard geometric/algebraic tooling (nearest-neighbor search, clustering, linear algebra) becomes directly applicable to meaning — this is the property that makes VSM "mathematically well defined" and explains its decades-long dominance in NLP over alternative semantic-representation schemes.
- **The evolution path (§1.3):** VSM originated in information-retrieval document modeling (Salton et al., 1975) and was later extended from documents to words (Schütze 1993, Lund et al. 1995, Landauer & Dumais 1997) — the chapter frames the book's entire later arc (word embeddings → graph embeddings → sense embeddings → contextualized embeddings → sentence/document embeddings) as successive extensions of this one originating idea to new kinds of objects.
## Full Reading Notes
### §1.1 Semantic Representation (p. 4)
Walks the ASCII-encoding example concretely: "desk" → a 32-bit sequence (8 bits/character × 4 characters), "table" → 40 bits (5 characters) — the chapter's own illustration that representation *size* depends on word length under character encoding, independent of the deeper problem that the bits carry no semantic information at all. Closes by naming vector space models as the solution path the rest of the chapter develops.
### §1.2 Vector Space Models (p. 4-6)
Builds one-hot representation first as the simplest fixed-size fix (Figure 1.1's 10-word toy vocabulary example), explicitly naming what it does and doesn't solve: solves the variable-size problem, doesn't solve the no-similarity problem, and in fact makes the dimensionality problem worse since one-hot's dimensionality necessarily equals vocabulary size (hundreds of thousands of words in practice). Introduces the VSM proper (Salton et al., 1975) as the generalization to continuous, lower-dimensional, distance-as-similarity spaces (Figure 1.2's 3-D toy example, Figure 1.3's 2-D t-SNE-reduced real example showing word clusters for "big cats," "birds," "plants"). Notes explicitly that VSM applies beyond words — documents, sentences, concepts, entities — though the chapter's own focus (and most of the book's) is on word-level VSM.
### §1.3 The Evolution Path of Representations (p. 7)
Short section tracing VSM's lineage: originated for document modeling in information retrieval (Salton et al., 1975), then extended to word-level representation by subsequent researchers (Schütze 1993; Lund, Burgess & Atchley 1995; Landauer & Dumais 1997). States directly that VSM's compatibility with both conventional ML and deep learning methods is what has kept it the dominant representation paradigm for decades — setting up the book's later chapters (count-based and predictive word embeddings in Chapter 3) as direct continuations of this lineage.
## Worked Example
- The ASCII bit-count example (desk = 32 bits, table = 40 bits) is a clean, quotable number pair for illustrating the variable-size problem concretely — worth keeping exactly as stated rather than rounding.
- Figure 1.1's 10-word one-hot toy vocabulary is the chapter's concrete illustration of exactly how an index-to-one-hot mapping is built — useful to be able to reconstruct by hand (pick an index 1-10, set that one entry to 1) since quizzes in this course test interpreting a method's mechanics on a new example, not just recalling the name.
- Figure 1.3's real t-SNE-reduced word-vector-space example (word clusters for big cats, birds, and plants, visibly separated) is the chapter's own demonstration that distance-as-similarity actually shows up in real trained vectors, not just as a theoretical property.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]] are the weeks this chapter supports (LEC 2.1 intro to NLP, LEC 2.2 NLP practice).
- [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 3|ENLP Chapter 3]]'s predictive word-embedding models (Word2Vec, GloVe) are the direct technical continuation of this chapter's VSM idea — the "how do we actually learn these vectors" answer this chapter defers.
- [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 7|ENLP Chapter 7]]'s bag-of-words sentence embeddings reuse this chapter's one-hot representation directly as a starting point (§7.1.1 explicitly cites back to this chapter's §1.2).
## Open Questions
- [ ] Verify §1.1-§1.3 page numbers against the actual rendered PDF (taken from `pdftotext -layout`, whose page-break markers can be slightly offset from true page boundaries).
- [ ] No local lecture deck or notebook has been checked for whether LEC 2.1/2.2 (`Lectures/Week - 4/2.1 text data, intro to nlp.pptx.pdf`, `2.2 nlp practice.pptx.pdf`, and the companion notebooks `2.1 tf-idf vectorization, sklearn.ipynb`, `2.2 text classification.ipynb`) actually open with this same one-hot-to-VSM framing or jump straight into practical tf-idf vectorization — check directly once building the Week 4/5 weekly notes' live-capture sections.
## Flashcards
What two distinct problems does character-level (ASCII) word representation have?::It encodes no semantic similarity between words (even synonyms get unrelated bit patterns), and its size scales with word length rather than being fixed. #cards/csci4521
What does one-hot representation fix, and what does it leave unfixed?::It fixes the variable-size problem (every word gets the same-length vector); it does not fix the no-similarity problem, since every pair of distinct words is still maximally dissimilar by construction. #cards/csci4521
What is the defining property of a Vector Space Model that one-hot encoding lacks?::Distance in the space corresponds to semantic similarity — words with related meanings end up spatially close, which one-hot's one-axis-per-word structure cannot represent. #cards/csci4521
Where did the Vector Space Model originate, and how did it reach word-level representation?::It originated in information retrieval for modeling documents (Salton et al., 1975); later researchers (Schütze 1993, Lund et al. 1995, Landauer & Dumais 1997) extended it from documents to words. #cards/csci4521
