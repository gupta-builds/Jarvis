---
type: community
members: 16
---

# test_debate.py

**Members:** 16 nodes

## Members
- [[Same bucket for both candidates — stage 2 is explicitly a no-op here     per spe]] - rationale - tests/test_debate.py
- [[Standard cmp semantics negative if a should rank first, positive if     b shoul]] - rationale - core/debate.py
- [[Task L — the deterministic pairwise 'debate' comparator. Each stage is tested in]] - rationale - tests/test_debate.py
- [[Two non-preferred candidates (stage 1 ties), different buckets, one     bucket's]] - rationale - tests/test_debate.py
- [[Two preferred companies with different dates — stage 1 ties (both     'high'), r]] - rationale - tests/test_debate.py
- [[_candidate()]] - code - tests/test_debate.py
- [[bucket_urgency=None (the default) skips stage 2 entirely, falling     straight t]] - rationale - tests/test_debate.py
- [[debate_compare()]] - code - core/debate.py
- [[test_debate.py]] - code - tests/test_debate.py
- [[test_debate_compare_missing_date_posted_sorts_last()]] - code - tests/test_debate.py
- [[test_debate_compare_prefers_bucket_at_risk_of_going_unfilled()]] - code - tests/test_debate.py
- [[test_debate_compare_prefers_preferred_company_with_identical_dates()]] - code - tests/test_debate.py
- [[test_debate_compare_recency_is_final_tiebreak()]] - code - tests/test_debate.py
- [[test_debate_compare_skips_bucket_fill_need_for_same_bucket_pair()]] - code - tests/test_debate.py
- [[test_debate_compare_ties_between_two_preferred_companies_falls_through()]] - code - tests/test_debate.py
- [[test_debate_compare_without_bucket_urgency_skips_stage_2()]] - code - tests/test_debate.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/test_debatepy
SORT file.name ASC
```

## Connections to other communities
- 6 edges to [[_COMMUNITY_company_matches_preference]]
- 3 edges to [[_COMMUNITY_run_pipeline.py]]
- 2 edges to [[_COMMUNITY_matches]]
- 1 edge to [[_COMMUNITY_classify]]
- 1 edge to [[_COMMUNITY_filter.py]]
- 1 edge to [[_COMMUNITY_normalize.py]]

## Top bridge nodes
- [[test_debate.py]] - degree 16, connects to 5 communities
- [[debate_compare()]] - degree 15, connects to 3 communities
- [[_candidate()]] - degree 9, connects to 1 community
- [[test_debate_compare_prefers_bucket_at_risk_of_going_unfilled()]] - degree 5, connects to 1 community