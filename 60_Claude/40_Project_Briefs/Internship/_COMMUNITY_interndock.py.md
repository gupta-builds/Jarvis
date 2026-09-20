---
type: community
members: 36
---

# interndock.py

**Members:** 36 nodes

## Members
- [[Explicit-args orchestration function — mirrors run_pipeline.py's own     split b]] - rationale - reseed.py
- [[Firecrawl-fetches one candidate URL and parses it. Returns  both on     fetch]] - rationale - ingestion/interndock.py
- [[InternDock (interndock.com) — periodic drop guide posts, not a JSON feed.  Che]] - rationale - ingestion/interndock.py
- [[Path_2]] - code
- [[Real case, confirmed live 2026-08-24 'summer-2027-internship-programs-open-now']] - rationale - tests/test_interndock.py
- [[Real verbatim content (WebFetch, 2026-08-24) — the first 15 entries of     inter]] - rationale - tests/test_interndock.py
- [[Real, live guide URLs from the sitemap whose slug loosely looks     drop-shaped.]] - rationale - ingestion/interndock.py
- [[Real, live-verified InternDock fixtures (2026-08-24, Task 3) — no live network c]] - rationale - tests/test_interndock.py
- [[Seeds a real state dir with a pre-existing excluded_uids.json entry     and a p]] - rationale - tests/test_reseed.py
- [[{title, url, company, location}, ... from a fetched drop page's     markdown.]] - rationale - ingestion/interndock.py
- [[_merge_dict_json()]] - code - reseed.py
- [[_page_with()]] - code - tests/test_reseed.py
- [[_union_json_list and _merge_dict_json are reseed.py's whole merge-back decision]] - rationale - tests/test_reseed.py
- [[_union_json_list()]] - code - reseed.py
- [[datetime_2]] - code
- [[fetch_interndock_drop()]] - code - ingestion/interndock.py
- [[fetch_interndock_drop_candidates()]] - code - ingestion/interndock.py
- [[interndock.py]] - code - ingestion/interndock.py
- [[opt_cache.json is a dict keyed by uid ({uid {verdict, signal,     checked}}), n]] - rationale - reseed.py
- [[parse_interndock_postings()]] - code - ingestion/interndock.py
- [[reseed.py]] - code - reseed.py
- [[run_reseed()]] - code - reseed.py
- [[test_fetch_interndock_drop_candidates_loosely_filters_sitemap()]] - code - tests/test_interndock.py
- [[test_fetch_interndock_drop_fails_open_on_firecrawl_error()]] - code - tests/test_interndock.py
- [[test_fetch_interndock_drop_returns_empty_when_below_threshold()]] - code - tests/test_interndock.py
- [[test_fetch_interndock_drop_returns_postings_above_threshold()]] - code - tests/test_interndock.py
- [[test_interndock.py]] - code - tests/test_interndock.py
- [[test_merge_dict_json_missing_scratch_leaves_real_untouched()]] - code - tests/test_reseed.py
- [[test_merge_dict_json_scratch_wins_on_collision()]] - code - tests/test_reseed.py
- [[test_missing_real_file_is_created_from_scratch()]] - code - tests/test_reseed.py
- [[test_missing_scratch_file_leaves_real_ids_untouched()]] - code - tests/test_reseed.py
- [[test_parse_interndock_postings_ignores_non_matching_lines()]] - code - tests/test_interndock.py
- [[test_parse_interndock_postings_real_fixture()]] - code - tests/test_interndock.py
- [[test_reseed.py]] - code - tests/test_reseed.py
- [[test_run_reseed_end_to_end_merges_state_and_respects_seeded_opt_cache()]] - code - tests/test_reseed.py
- [[test_unions_scratch_and_real_ids()]] - code - tests/test_reseed.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/interndockpy
SORT file.name ASC
```

## Connections to other communities
- 7 edges to [[_COMMUNITY_recheck.py]]
- 5 edges to [[_COMMUNITY_normalize_simplify]]
- 5 edges to [[_COMMUNITY_writer.py]]
- 3 edges to [[_COMMUNITY_write_dossier]]
- 2 edges to [[_COMMUNITY_test_schema_drift.py]]
- 1 edge to [[_COMMUNITY_stage1_reject]]
- 1 edge to [[_COMMUNITY_test_writer.py]]

## Top bridge nodes
- [[test_reseed.py]] - degree 18, connects to 5 communities
- [[interndock.py]] - degree 14, connects to 4 communities
- [[fetch_interndock_drop()]] - degree 10, connects to 2 communities
- [[reseed.py]] - degree 10, connects to 2 communities
- [[fetch_interndock_drop_candidates()]] - degree 6, connects to 1 community