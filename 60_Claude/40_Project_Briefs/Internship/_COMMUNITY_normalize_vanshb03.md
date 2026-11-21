---
type: community
members: 7
---

# normalize_vanshb03

**Members:** 7 nodes

## Members
- [[Does Not Offer Sponsorship' means no H-1B, not no OPT — same rule as     everywh]] - rationale - tests/test_filter.py
- [[fetch_vanshb03()]] - code - ingestion/sources.py
- [[normalize_vanshb03()]] - code - ingestion/normalize.py
- [[test_vanshb03_bare_spring_still_rejects()]] - code - tests/test_filter.py
- [[test_vanshb03_no_sponsorship_is_not_an_exclusion()]] - code - tests/test_filter.py
- [[test_vanshb03_should_match()]] - code - tests/test_filter.py
- [[test_vanshb03_should_reject()]] - code - tests/test_filter.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/normalize_vanshb03
SORT file.name ASC
```

## Connections to other communities
- 7 edges to [[_COMMUNITY_normalize_josegael]]
- 5 edges to [[_COMMUNITY_matches]]
- 4 edges to [[_COMMUNITY_normalize.py]]
- 2 edges to [[_COMMUNITY_test_classify.py]]
- 2 edges to [[_COMMUNITY_test_run_pipeline.py]]
- 1 edge to [[_COMMUNITY__fake_http_get]]
- 1 edge to [[_COMMUNITY_run_pipeline.py]]

## Top bridge nodes
- [[normalize_vanshb03()]] - degree 14, connects to 6 communities
- [[test_vanshb03_no_sponsorship_is_not_an_exclusion()]] - degree 5, connects to 2 communities
- [[fetch_vanshb03()]] - degree 4, connects to 2 communities
- [[test_vanshb03_bare_spring_still_rejects()]] - degree 4, connects to 2 communities
- [[test_vanshb03_should_match()]] - degree 3, connects to 2 communities