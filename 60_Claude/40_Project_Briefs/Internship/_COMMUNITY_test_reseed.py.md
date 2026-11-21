---
type: community
members: 19
---

# test_reseed.py

**Members:** 19 nodes

## Members
- [[Firecrawl-fetches one candidate URL and parses it. Returns  both on     fetch]] - rationale - ingestion/interndock.py
- [[InternDock (interndock.com) — periodic drop guide posts, not a JSON feed.  Che]] - rationale - ingestion/interndock.py
- [[Real case, confirmed live 2026-08-24 'summer-2027-internship-programs-open-now']] - rationale - tests/test_interndock.py
- [[Real verbatim content (WebFetch, 2026-08-24) — the first 15 entries of     inter]] - rationale - tests/test_interndock.py
- [[Real, live guide URLs from the sitemap whose slug loosely looks     drop-shaped.]] - rationale - ingestion/interndock.py
- [[Real, live-verified InternDock fixtures (2026-08-24, Task 3) — no live network c]] - rationale - tests/test_interndock.py
- [[{title, url, company, location}, ... from a fetched drop page's     markdown.]] - rationale - ingestion/interndock.py
- [[fetch_interndock_drop()]] - code - ingestion/interndock.py
- [[fetch_interndock_drop_candidates()]] - code - ingestion/interndock.py
- [[interndock.py]] - code - ingestion/interndock.py
- [[parse_interndock_postings()]] - code - ingestion/interndock.py
- [[requests]] - concept
- [[test_fetch_interndock_drop_candidates_loosely_filters_sitemap()]] - code - tests/test_interndock.py
- [[test_fetch_interndock_drop_fails_open_on_firecrawl_error()]] - code - tests/test_interndock.py
- [[test_fetch_interndock_drop_returns_empty_when_below_threshold()]] - code - tests/test_interndock.py
- [[test_fetch_interndock_drop_returns_postings_above_threshold()]] - code - tests/test_interndock.py
- [[test_interndock.py]] - code - tests/test_interndock.py
- [[test_parse_interndock_postings_ignores_non_matching_lines()]] - code - tests/test_interndock.py
- [[test_parse_interndock_postings_real_fixture()]] - code - tests/test_interndock.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/test_reseedpy
SORT file.name ASC
```

## Connections to other communities
- 6 edges to [[_COMMUNITY_run_pipeline.py]]
- 4 edges to [[_COMMUNITY_extract_content]]
- 3 edges to [[_COMMUNITY_test_schema_drift.py]]
- 3 edges to [[_COMMUNITY_linkedin_recruiter_snippet]]
- 2 edges to [[_COMMUNITY_normalize.py]]
- 1 edge to [[_COMMUNITY_test_enrich.py]]
- 1 edge to [[_COMMUNITY_test_freehire.py]]
- 1 edge to [[_COMMUNITY_matches]]
- 1 edge to [[_COMMUNITY_revalidate.py]]
- 1 edge to [[_COMMUNITY_scan_dossiers]]
- 1 edge to [[_COMMUNITY_test_sources.py]]
- 1 edge to [[_COMMUNITY_validate]]

## Top bridge nodes
- [[requests]] - degree 10, connects to 8 communities
- [[interndock.py]] - degree 16, connects to 7 communities
- [[fetch_interndock_drop()]] - degree 10, connects to 3 communities
- [[test_interndock.py]] - degree 14, connects to 2 communities
- [[fetch_interndock_drop_candidates()]] - degree 6, connects to 1 community