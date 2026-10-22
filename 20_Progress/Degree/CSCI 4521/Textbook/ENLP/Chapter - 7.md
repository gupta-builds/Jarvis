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
next: "Verify §7.1.1-§7.1.2 page numbers against the rendered PDF; reconcile with Week 4-5 live capture once LEC 2.1/2.2 land."
---
# ENLP Chapter 7 — Sentence and Document Embeddings, §7.1.1 Bag of Words, §7.1.2 Sentence-Level Training
**Source:** *Embeddings in Natural Language Processing* (Pilehvar & Camacho-Collados, 2020), Chapter 7, §7.1.1-§7.1.2, pp. 97-99.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ENLP Textbook CSCI 4521.pdf`.
**Course role:** Week 4-5's assigned reading (ENLP 7.1.1-7.1.2), supporting LEC 2.1/2.2's move from word-level to sentence/document-level text representation — the course's practical tf-idf/text-classification notebooks are the bag-of-words method this section names.
## Chapter Summary
==Bag-of-words sentence representations combine word vectors while discarding word order, which is simple and effective for many tasks but fails exactly where order matters (sentiment, inference, generation); sentence-level training methods fix this by learning sentence representations directly from a predictive objective instead of composing them from words after the fact.==
*Mechanism:* bag-of-words methods compose a sentence/document vector from its word vectors via simple arithmetic (summation or averaging, optionally weighted by tf-idf), which is unsupervised and needs only raw text, but is blind to word order by construction. Sentence-level training (Skip-Thought, Quick-Thoughts) instead trains an encoder end-to-end on a predictive task over sentence context — predicting the next sentence (via generation or via classification/selection) — so word order is implicitly used by the encoder even though no word-order label is ever given directly.
## Key Concepts
- **Compositionality (§7.1.1):** the general problem of combining smaller units (words) into a representation of a larger unit (a phrase or sentence). Early approaches tested arithmetic operations (multiplication, addition) and found they're complementary rather than one strictly better; later work used linguistically-motivated composition (adjectives as functions over noun vectors) and, more recently, neural compositional functions (recursive neural networks over parse trees).
- **Bag of Words (BoW) (§7.1.1):** a compositional method that disregards word order — word embeddings are averaged (weighted, e.g. by tf-idf, or unweighted) with optional post-processing like PCA. Works fine for tasks insensitive to order but fails on tasks where order carries the signal: sentiment analysis, language inference, and any generation task (e.g. machine translation).
- **Sentence-level training (§7.1.2):** trains sentence representations directly via a predictive objective over sentence context, rather than composing them after the fact from word vectors. **Skip-Thought vectors** use an RNN sequence-to-sequence architecture to *generate* the next sentence from an encoded input sentence. **Quick-Thoughts vectors** reframe this as *classification* — selecting the correct next sentence from a sampled candidate set rather than generating it token by token — which is faster and more scalable since it drops the costly generation step.
- **Pretrained-language-model sentence embeddings (§7.1.2):** the chapter notes that state-of-the-art sentence representations now typically come from pretrained contextualized language models (BERT, see Chapter 6) rather than from either bag-of-words or Skip/Quick-Thoughts — either by taking a single contextualized token embedding (e.g. BERT's `[CLS]` token) as the sentence representation, or by averaging all token embeddings in the sentence.
## Full Reading Notes
### §7.1 Unsupervised Sentence Embeddings (p. 97)
Frames this section's methods as using only unannotated text corpora, directly analogous to the word-embedding models of §3.2 — the "unsupervised" label here means no labeled sentence-pairs are needed, not that no training signal exists at all.
### §7.1.1 Bag of Words (p. 97)
Opens from word-level one-hot vectors (explicitly citing back to §1.2's one-hot representation) and traces the compositionality literature: Mitchell & Lapata (2008) compared arithmetic composition operators and found complementary results rather than a single winner; Baroni & Zamparelli (2010) modeled adjectives as functions transforming noun vectors; Socher et al. (2012/2013b) applied recursive neural networks over parse trees successfully to sentiment analysis. The chapter's own summary move: simple weighted-average-of-word-embeddings (Arora et al., 2017) — optionally with tf-idf weighting and PCA post-processing — is "a strong alternative" to these more complex methods, which is the practical justification for why tf-idf-weighted averaging remains common in applied NLP pipelines like this course's notebooks.
### §7.1.2 Sentence-Level Training (p. 98-100)
Motivates direct sentence training as the fix for BoW's word-order blindness. Walks Skip-Thought vectors' (Kiros et al., 2015) training procedure concretely: (1) input sentence encoded via an RNN seq2seq encoder (architecturally the same family used for machine translation); (2) the encoded representation is decoded to generate the *next* sentence; (3) repeated over millions of sentence pairs. Contrasts this with Quick-Thoughts (Logeswaran & Lee, 2018), which replaces the expensive generation step with a cheaper classification/selection step — given candidate sentences sampled from the corpus, select which one is the real next sentence — making it more scalable to large corpora. Closes by noting that current best practice (as of the book's 2020 writing) has moved past both approaches toward extracting sentence representations directly from pretrained contextualized language models like BERT (cross-referencing §6.4.3's `[CLS]` token mechanism).
## Worked Example
- The Skip-Thought training example given directly in the text: input sentence "The kids were playing with a ball in the garden," target output sentence "The ball fell into a flower pot" — a concrete illustration of what "predict the next sentence" means operationally (encode input → decode into a full generated sentence, not just a label).
- The Quick-Thoughts vs. Skip-Thought contrast is itself a worked comparison worth reproducing exactly: both solve "what follows this sentence," but Skip-Thought generates the full next sentence token-by-token (expensive, slow) while Quick-Thoughts picks the correct one from a sampled candidate set (cheap classification) — the same underlying "predict the context" idea as Word2Vec's Skip-gram, just applied at sentence granularity instead of word granularity.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 4|Week 4]] and [[20_Progress/Degree/CSCI 4521/Weekly/Week - 5|Week 5]] are the weeks this section supports; the course's real `2.1 tf-idf vectorization, sklearn.ipynb` and `2.2 text classification.ipynb` notebooks are concrete bag-of-words/tf-idf implementations of exactly this section's §7.1.1 mechanism.
- [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 1|ENLP Chapter 1]]'s one-hot representation (§1.2) is the explicit starting point this section's bag-of-words method is built from.
- [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 3|ENLP Chapter 3]]'s Word2Vec Skip-gram (§3.2) is the word-level analogue of this section's sentence-level Skip-Thought/Quick-Thoughts — same "predict the surrounding context" idea, one level up in granularity.
- [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 6|ENLP Chapter 6]]'s BERT `[CLS]`-token mechanism (§6.4.3) is this section's own forward reference for how modern sentence embeddings are actually obtained in practice.
## Open Questions
- [ ] Verify §7.1.1-§7.1.2 page numbers against the rendered PDF.
- [ ] Confirm whether the course's `2.1`/`2.2` notebooks implement plain unweighted bag-of-words, tf-idf-weighted averaging, or go as far as Skip-Thought-style sentence training — the notebook filenames ("tf-idf vectorization," "text classification") suggest the course stays at the §7.1.1 bag-of-words/tf-idf level without covering Skip-Thought/Quick-Thoughts, but this is unverified until the notebooks are opened and the live lecture capture lands.
## Flashcards
What is the core limitation of bag-of-words sentence representations?::They discard word order by construction, which makes them unsuitable for tasks where order carries meaning, such as sentiment analysis, language inference, or generation tasks like machine translation. #cards/csci4521
How does Skip-Thought learn a sentence representation, and what does Quick-Thoughts change?::Skip-Thought encodes a sentence with an RNN and decodes (generates) the predicted next sentence; Quick-Thoughts replaces that expensive generation step with a cheaper classification task — selecting the correct next sentence from sampled candidates — making it more scalable. #cards/csci4521
What are the two common ways to get a sentence embedding from a pretrained language model like BERT?::Use a single contextualized token embedding (e.g. the `[CLS]` token) as the sentence representation, or average all the token embeddings in the sentence. #cards/csci4521
