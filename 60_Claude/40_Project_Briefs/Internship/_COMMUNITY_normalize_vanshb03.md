---
type: community
members: 6
---

# normalize_vanshb03

**Members:** 6 nodes

## Members
- [[Does Not Offer Sponsorship' means no H-1B, not no OPT — same rule as     everywh]] - rationale - tests/test_filter.py
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
- 5 edges to [[_COMMUNITY_matches]]
- 5 edges to [[_COMMUNITY_test_filter.py]]
- 3 edges to [[_COMMUNITY_normalize.py]]
- 3 edges to [[_COMMUNITY_test_run_pipeline.py]]
- 2 edges to [[_COMMUNITY_classify]]
- 2 edges to [[_COMMUNITY_normalize_josegael]]

## Top bridge nodes
- [[normalize_vanshb03()]] - degree 14, connects to 5 communities
- [[test_vanshb03_no_sponsorship_is_not_an_exclusion()]] - degree 5, connects to 3 communities
- [[test_vanshb03_bare_spring_still_rejects()]] - degree 4, connects to 3 communities
- [[test_vanshb03_should_match()]] - degree 3, connects to 2 communities
- [[test_vanshb03_should_reject()]] - degree 3, connects to 2 communities