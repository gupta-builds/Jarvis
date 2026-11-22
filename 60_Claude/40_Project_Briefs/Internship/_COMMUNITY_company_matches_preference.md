---
type: community
members: 14
---

# company_matches_preference

**Members:** 14 nodes

## Members
- [[Layer 3.5 — the debate a deterministic pairwise comparator that decides which]] - rationale - core/debate.py
- [[Real profile.yaml entry 'D.E. Shaw' must match the real vault dossier     compan]] - rationale - tests/test_identity.py
- [[Scoped per-bucket per the tunable budget dict — each bucket fills only     from]] - rationale - run_pipeline.py
- [[The matched preference tier (e.g. 'high'), or None if company isn't in     prefe]] - rationale - core/identity.py
- [[_preference_rank()]] - code - core/debate.py
- [[_prioritize_and_cap()]] - code - run_pipeline.py
- [[company_matches_preference()]] - code - core/identity.py
- [[compute_bucket_urgency()]] - code - core/debate.py
- [[debate.py]] - code - core/debate.py
- [[test_company_matches_preference_case_insensitive()]] - code - tests/test_identity.py
- [[test_company_matches_preference_none_for_empty_preferred_dict()]] - code - tests/test_identity.py
- [[test_company_matches_preference_none_for_unlisted_company()]] - code - tests/test_identity.py
- [[test_company_matches_preference_punctuation_insensitive_real_de_shaw_case()]] - code - tests/test_identity.py
- [[{bucket max(0, budgetbucket - candidate_countbucket)} for every     bucket]] - rationale - core/debate.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/company_matches_preference
SORT file.name ASC
```

## Connections to other communities
- 6 edges to [[_COMMUNITY_test_debate.py]]
- 6 edges to [[_COMMUNITY_run_pipeline.py]]
- 5 edges to [[_COMMUNITY_test_identity.py]]
- 4 edges to [[_COMMUNITY_classify]]
- 3 edges to [[_COMMUNITY_test_company_cache.py]]
- 2 edges to [[_COMMUNITY_test_writer.py]]
- 1 edge to [[_COMMUNITY_company_registry.py]]

## Top bridge nodes
- [[debate.py]] - degree 11, connects to 5 communities
- [[company_matches_preference()]] - degree 14, connects to 4 communities
- [[compute_bucket_urgency()]] - degree 8, connects to 3 communities
- [[_prioritize_and_cap()]] - degree 7, connects to 3 communities
- [[_preference_rank()]] - degree 3, connects to 1 community