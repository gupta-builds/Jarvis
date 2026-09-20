---
type: community
members: 6
---

# test_run_once_all_or_nothing_short_bucket_writes_nothing

**Members:** 6 nodes

## Members
- [[2 real AIML candidates, 0 Other — Other's quota of 1 can't be filled,     so NO]] - rationale - tests/test_run_pipeline.py
- [[Bypasses real per-source HTTP-shaped fixtures entirely — feeds     run_once a co]] - rationale - tests/test_run_pipeline.py
- [[Every bucket supplied exactly (or more, for Other) — writes exactly     6 (2 AI]] - rationale - tests/test_run_pipeline.py
- [[_stub_fetch_and_filter()]] - code - tests/test_run_pipeline.py
- [[test_run_once_all_or_nothing_short_bucket_writes_nothing()]] - code - tests/test_run_pipeline.py
- [[test_run_once_full_quota_writes_exactly_and_in_debate_order()]] - code - tests/test_run_pipeline.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/test_run_once_all_or_nothing_short_bucket_writes_nothing
SORT file.name ASC
```

## Connections to other communities
- 3 edges to [[_COMMUNITY_test_writer.py]]
- 2 edges to [[_COMMUNITY_normalize_simplify]]
- 2 edges to [[_COMMUNITY_plan_removals]]

## Top bridge nodes
- [[test_run_once_all_or_nothing_short_bucket_writes_nothing()]] - degree 5, connects to 3 communities
- [[test_run_once_full_quota_writes_exactly_and_in_debate_order()]] - degree 5, connects to 3 communities
- [[_stub_fetch_and_filter()]] - degree 4, connects to 1 community