---
type: community
members: 8
---

# normalize_applyguy

**Members:** 8 nodes

## Members
- [[ApplyGuy's own literal placeholder on real entries with no season data     (782]] - rationale - tests/test_filter.py
- [[fetch_applyguy()]] - code - ingestion/sources.py
- [[normalize_applyguy()]] - code - ingestion/normalize.py
- [[test_applyguy_not_specified_season_maps_to_no_term_data()]] - code - tests/test_filter.py
- [[test_applyguy_prefers_listing_url_over_tracking_url()]] - code - tests/test_filter.py
- [[test_applyguy_should_match()]] - code - tests/test_filter.py
- [[test_applyguy_should_reject()]] - code - tests/test_filter.py
- [[url is applyguy.ai's own utm-tagged redirect page; listingUrl is the     real em]] - rationale - tests/test_filter.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/normalize_applyguy
SORT file.name ASC
```

## Connections to other communities
- 5 edges to [[_COMMUNITY_test_filter.py]]
- 4 edges to [[_COMMUNITY_normalize.py]]
- 3 edges to [[_COMMUNITY_matches]]
- 3 edges to [[_COMMUNITY_test_run_pipeline.py]]
- 2 edges to [[_COMMUNITY_normalize_josegael]]
- 1 edge to [[_COMMUNITY_run_pipeline.py]]

## Top bridge nodes
- [[normalize_applyguy()]] - degree 13, connects to 4 communities
- [[test_applyguy_not_specified_season_maps_to_no_term_data()]] - degree 4, connects to 2 communities
- [[test_applyguy_prefers_listing_url_over_tracking_url()]] - degree 4, connects to 2 communities
- [[fetch_applyguy()]] - degree 3, connects to 2 communities
- [[test_applyguy_should_match()]] - degree 3, connects to 2 communities