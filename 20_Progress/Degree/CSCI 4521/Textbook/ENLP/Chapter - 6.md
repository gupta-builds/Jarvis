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
next: "Verify §6.4 page numbers against the rendered PDF; reconcile with Week 6 live capture once LEC 2.5 lands."
---
# ENLP Chapter 6 — Contextualized Embeddings, §6.4 Transformer-Based Models: BERT
**Source:** *Embeddings in Natural Language Processing* (Pilehvar & Camacho-Collados, 2020), Chapter 6, §6.4-§6.4.2, pp. 81-84.
**Read from:** `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Textbook & Resources\ENLP Textbook CSCI 4521.pdf`.
**Course role:** Week 6's assigned reading (ENLP 6.4), supporting LEC 2.5 "modern text embedding" — BERT is the course's concrete example of a representation that moved past both the static embeddings of [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 3|Chapter 3]] and GPT's unidirectional limitation.
## Chapter Summary
==BERT makes the Transformer architecture bidirectional by replacing the standard "predict the next word" language-modeling objective with Masked Language Modeling — predicting randomly masked tokens using context from both sides at once — which was the missing piece GPT's unidirectional training couldn't provide.==
*Mechanism:* Transformers beat RNNs on two axes (parallelizable training, unrestricted long-range attention via self-attention) but a naive bidirectional training objective would let a word "see itself" through multiple layers of context — BERT's fix is Masked Language Modeling, where ~15% of input tokens are replaced (80% with `[MASK]`, 10% with a random word, 10% left unchanged) and the model must predict the true token using both left and right context. A second objective, Next Sentence Prediction, trains the model to judge whether one sentence genuinely follows another, giving it a cross-sentence relational signal MLM alone doesn't provide.
## Key Concepts
- **Why Transformers over RNNs:** (1) Transformers process input in parallel rather than sequentially, suiting GPU/TPU hardware; (2) self-attention gives access to *all* positions in a sentence regardless of distance, removing the locality bias RNNs have from processing token-by-token in one direction.
- **GPT's limitation:** GPT uses the Transformer *Decoder* only (discards the encoder), trained with a standard unidirectional next-word-prediction objective — while reading a token, it can only attend to previously-seen tokens, which limits it for tasks where understanding a word requires *future* context too.
- **Why bidirectional training wasn't trivial before BERT:** naively conditioning on both left and right context in a multi-layer Transformer lets a token's representation "leak" information about itself through the stacked self-attention layers — this is the specific obstacle BERT's Masked Language Modeling objective is designed to avoid.
- **Masked Language Modeling (MLM) (§6.4.1):** replaces "predict the next token" with "predict the masked token," using both left and right context simultaneously. The 80/10/10 masking-strategy split (mask with `[MASK]` / replace with a random word / leave unchanged) exists specifically so the model can't lean on the mere presence of `[MASK]` as a reliable signal at inference time, when `[MASK]` never actually appears.
- **Next Sentence Prediction (NSP) (§6.4.2):** a binary classification auxiliary task — given sentence A and a candidate sentence B, predict whether B truly follows A (with the real next sentence swapped for a random one 50% of the time during training). Gives the model an inter-sentence relational signal, shown useful for tasks like Natural Language Inference and Question Answering.
## Full Reading Notes
### §6.4 Transformer-Based Models: BERT (p. 81)
Opens by crediting Transformers' two structural advantages over RNNs (parallelism, unrestricted-range self-attention), with the concrete disambiguation example: the word "cell" in a sentence about biology can be correctly disambiguated by looking at the *following* word "membrane" — something a strictly left-to-right model cannot use. Introduces GPT (Radford, 2018) as the first major Transformer-based representation-learning model, noting it uses a modified "Transformer Decoder" (encoder discarded) and popularized the finetuning procedure (§6.6). Names GPT's unidirectionality as its core limitation, then introduces BERT (Devlin et al., 2019) as the fix: same Transformer architecture, but using the *encoder* (not decoder) and replacing next-word prediction with Masked Language Modeling to achieve genuine bidirectionality.
### §6.4.1 Masked Language Modeling (p. 82)
Gives the exact masking example from the text: "the structure of cell membrane is known as fluid mosaic" → "the structure of cell [MASK] is known [MASK] fluid mosaic," with the model asked to recover the masked tokens using the surrounding (bidirectional) context. States the masking rate (~15% of tokens) and the three-way split for *how* a selected token is altered: 80% replaced with `[MASK]`, 10% replaced with a random word, 10% left unchanged — explicitly noting the model is never told *which* tokens were altered or what they originally were, only that some fraction of the input was affected.
### §6.4.2 Next Sentence Prediction (p. 83)
Describes NSP as a binary classification task run alongside MLM during pretraining: given sentence A and sentence B, predict whether B is truly the sentence that follows A. Half the training examples replace the real next sentence with a randomly sampled one, to keep the task balanced. States this objective's payoff directly in tasks requiring cross-sentence reasoning (Natural Language Inference, Question Answering), per Devlin et al. (2019).
## Worked Example
- The exact masking example ("the structure of cell membrane is known as fluid mosaic" → masked version with two `[MASK]` tokens) is the chapter's own concrete illustration — worth being able to reproduce exactly, including the 80/10/10 masking-strategy split, since a quiz testing "interpret this method's mechanism" would plausibly give a new sentence and ask what masking would look like.
- The "cell / membrane" disambiguation example is the chapter's motivating case for *why* bidirectional context matters at all — a clean one-sentence justification for self-attention's advantage over strictly left-to-right processing.
## Connections
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 6|Week 6]] is the week this section supports (LEC 2.5, modern text embedding).
- [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 3|ENLP Chapter 3]]'s Word2Vec/GloVe (§3.2) produce one fixed vector per word regardless of context; BERT's contextualized embeddings are this chapter's direct answer to that limitation — the same word gets a different representation depending on its sentence.
- [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 7|ENLP Chapter 7]]'s sentence-embedding section (§7.1.2) cites this chapter's `[CLS]`-token mechanism (§6.4.3, not itself in this week's assigned range) as the modern default way to obtain a sentence-level representation from BERT.
## Open Questions
- [ ] Verify §6.4-§6.4.2 page numbers against the rendered PDF.
- [ ] §6.4.3 (Training) is immediately adjacent but not in this week's assigned range (ENLP 6.4 only, not 6.4.3) — confirmed out of scope, not a gap, though it's the section [[20_Progress/Degree/CSCI 4521/Textbook/ENLP/Chapter - 7|Chapter 7's]] `[CLS]`-token reference points to; worth reading informally if a quiz question needs that detail.
- [ ] Check `Code/Lectures/Week 6 - 10/2.5 modern text embeddings.ipynb` directly to confirm whether the course's hands-on work uses a pretrained BERT model (e.g. via Hugging Face) or stays at the conceptual level for this particular lecture.
## Flashcards
What specific problem does Masked Language Modeling solve that a naive bidirectional Transformer couldn't?::Naive bidirectional conditioning in a multi-layer Transformer lets a token indirectly "see itself" through stacked self-attention; masking the token and predicting it from context sidesteps this. #cards/csci4521
What is BERT's masking strategy for a token selected for the ~15% masking rate?::80% of the time replace it with `[MASK]`, 10% of the time replace it with a random word, 10% of the time leave it unchanged — the model is never told which case applies. #cards/csci4521
What does Next Sentence Prediction train the model to do, and why is the real-next-sentence replaced randomly half the time?::Predict whether sentence B truly follows sentence A; replacing the real next sentence with a random one 50% of the time keeps the binary classification task balanced. #cards/csci4521
Why can GPT not use future context the way BERT can?::GPT uses only the Transformer Decoder with a standard next-word-prediction objective, so while reading a token it can only attend to previously-seen tokens — it is unidirectional by construction. #cards/csci4521
