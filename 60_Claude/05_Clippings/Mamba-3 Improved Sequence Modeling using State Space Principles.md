---
title: "Mamba-3: Improved Sequence Modeling using State Space Principles"
source: "https://arxiv.org/abs/2603.15569?utm_source=sp_auto_dm&fbclid=PAVERFWAQ6GtdleHRuA2FlbQIxMABzcnRjBmFwcF9pZA8xMjQwMjQ1NzQyODc0MTQAAaccCl07QQ5AhX2Hqv1KvfDd1iPRMhJfi8Esswft90xBEsPd5IYobc4zcmkSFw_aem_CzJ9srKtqKloSIsmVtKENQ"
author:
  - "[[Aakash Lahoti]]"
  - "[[Kevin Y. Li]]"
  - "[[Berlin Chen]]"
  - "[[Caitlin Wang]]"
  - "[[Aviv Bick]]"
  - "[[J. Zico Kolter]]"
  - "[[Tri Dao]]"
  - "[[Albert Gu]]"
published:
created: 2026-04-10
description: "Abstract page for arXiv paper 2603.15569: Mamba-3: Improved Sequence Modeling using State Space Principles"
tags:
  - "clippings"
---
## Title:Mamba-3: Improved Sequence Modeling using State Space Principles

Authors:[Aakash Lahoti](https://arxiv.org/search/cs?searchtype=author&query=Lahoti,+A), [Kevin Y. Li](https://arxiv.org/search/cs?searchtype=author&query=Li,+K+Y), [Berlin Chen](https://arxiv.org/search/cs?searchtype=author&query=Chen,+B), [Caitlin Wang](https://arxiv.org/search/cs?searchtype=author&query=Wang,+C), [Aviv Bick](https://arxiv.org/search/cs?searchtype=author&query=Bick,+A), [J. Zico Kolter](https://arxiv.org/search/cs?searchtype=author&query=Kolter,+J+Z), [Tri Dao](https://arxiv.org/search/cs?searchtype=author&query=Dao,+T), [Albert Gu](https://arxiv.org/search/cs?searchtype=author&query=Gu,+A)

[View PDF](https://arxiv.org/pdf/2603.15569) [HTML (experimental)](https://arxiv.org/html/2603.15569v1)

> Abstract:Scaling inference-time compute has emerged as an important driver of LLM performance, making inference efficiency a central focus of model design alongside model quality. While the current Transformer-based models deliver strong model quality, their quadratic compute and linear memory make inference expensive. This has spurred the development of sub-quadratic models with reduced linear compute and constant memory requirements. However, many recent linear models trade off model quality and capability for algorithmic efficiency, failing on tasks such as state tracking. Moreover, their theoretically linear inference remains hardware-inefficient in practice. Guided by an inference-first perspective, we introduce three core methodological improvements inspired by the state space model (SSM) viewpoint of linear models. We combine: (1) a more expressive recurrence derived from SSM discretization, (2) a complex-valued state update rule that enables richer state tracking, and (3) a multi-input, multi-output (MIMO) formulation for better model performance without increasing decode latency. Together with architectural refinements, our Mamba-3 model achieves significant gains across retrieval, state-tracking, and downstream language modeling tasks. At the 1.5B scale, Mamba-3 improves average downstream accuracy by 0.6 percentage points compared to the next best model (Gated DeltaNet), with Mamba-3's MIMO variant further improving accuracy by another 1.2 points for a total 1.8 point gain. Across state-size experiments, Mamba-3 achieves comparable perplexity to Mamba-2 despite using half of its predecessor's state size. Our evaluations demonstrate Mamba-3's ability to advance the performance-efficiency Pareto frontier.

| Comments: |
| --- |
| Subjects: | Machine Learning (cs.LG) |
| Cite as: | [arXiv:2603.15569](https://arxiv.org/abs/2603.15569) \[cs.LG\] |
|  | (or [arXiv:2603.15569v1](https://arxiv.org/abs/2603.15569v1) \[cs.LG\] for this version) |
|  | [https://doi.org/10.48550/arXiv.2603.15569](https://doi.org/10.48550/arXiv.2603.15569) |

## Submission history

From: Kevin Li \[[view email](https://arxiv.org/show-email/940f2a12/2603.15569)\]  
**\[v1\]** Mon, 16 Mar 2026 17:30:08 UTC (247 KB)  

[Which authors of this paper are endorsers?](https://arxiv.org/auth/show-endorsers/2603.15569) | Disable MathJax ([What is MathJax?](https://info.arxiv.org/help/mathjax.html))