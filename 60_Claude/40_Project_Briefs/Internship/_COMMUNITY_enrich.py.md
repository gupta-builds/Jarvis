---
type: community
members: 25
---

# enrich.py

**Members:** 25 nodes

## Members
- [[All-or-nothing counterpart to _prioritize_and_cap (2026-09-07     decision) — re]] - rationale - run_pipeline.py
- [[Layer 3.5 — the debate a deterministic pairwise comparator that decides which]] - rationale - core/debate.py
- [[Same bucket for both candidates — stage 2 is explicitly a no-op here     per spe]] - rationale - tests/test_debate.py
- [[Scoped per-bucket per the tunable budget dict — each bucket fills only     from]] - rationale - run_pipeline.py
- [[Standard cmp semantics negative if a should rank first, positive if     b shoul]] - rationale - core/debate.py
- [[Task L — the deterministic pairwise 'debate' comparator. Each stage is tested in]] - rationale - tests/test_debate.py
- [[Two non-preferred candidates (stage 1 ties), different buckets, one     bucket's]] - rationale - tests/test_debate.py
- [[Two preferred companies with different dates — stage 1 ties (both     'high'), r]] - rationale - tests/test_debate.py
- [[_candidate()]] - code - tests/test_debate.py
- [[_preference_rank()]] - code - core/debate.py
- [[_prioritize_and_cap()]] - code - run_pipeline.py
- [[_select_exact_quota()]] - code - run_pipeline.py
- [[bucket_urgency=None (the default) skips stage 2 entirely, falling     straight t]] - rationale - tests/test_debate.py
- [[compute_bucket_urgency()]] - code - core/debate.py
- [[debate.py]] - code - core/debate.py
- [[debate_compare()]] - code - core/debate.py
- [[test_debate.py]] - code - tests/test_debate.py
- [[test_debate_compare_missing_date_posted_sorts_last()]] - code - tests/test_debate.py
- [[test_debate_compare_prefers_bucket_at_risk_of_going_unfilled()]] - code - tests/test_debate.py
- [[test_debate_compare_prefers_preferred_company_with_identical_dates()]] - code - tests/test_debate.py
- [[test_debate_compare_recency_is_final_tiebreak()]] - code - tests/test_debate.py
- [[test_debate_compare_skips_bucket_fill_need_for_same_bucket_pair()]] - code - tests/test_debate.py
- [[test_debate_compare_ties_between_two_preferred_companies_falls_through()]] - code - tests/test_debate.py
- [[test_debate_compare_without_bucket_urgency_skips_stage_2()]] - code - tests/test_debate.py
- [[{bucket max(0, budgetbucket - candidate_countbucket)} for every     bucket]] - rationale - core/debate.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/enrichpy
SORT file.name ASC
```

## Connections to other communities
- 8 edges to [[_COMMUNITY_run_pipeline.py]]
- 6 edges to [[_COMMUNITY_test_classify.py]]
- 3 edges to [[_COMMUNITY_test_identity.py]]
- 2 edges to [[_COMMUNITY_test_company_cache.py]]
- 2 edges to [[_COMMUNITY_matches]]
- 1 edge to [[_COMMUNITY_filter.py]]
- 1 edge to [[_COMMUNITY_normalize.py]]

## Top bridge nodes
- [[test_debate.py]] - degree 16, connects to 4 communities
- [[debate.py]] - degree 11, connects to 4 communities
- [[_prioritize_and_cap()]] - degree 7, connects to 3 communities
- [[debate_compare()]] - degree 15, connects to 2 communities
- [[compute_bucket_urgency()]] - degree 8, connects to 2 communities