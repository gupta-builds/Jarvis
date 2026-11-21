---
type: community
members: 20
---

# extract_content

**Members:** 20 nodes

## Members
- [[A posting with no stated section names at all must not have section     boundari]] - rationale - tests/test_posting_page.py
- [[Real CTGT posting (jobs.ashbyhq.com), fetched 2026-07-26 — confirms the     full]] - rationale - tests/test_posting_page.py
- [[Real bug, confirmed 2026-07-26 on both Google dossiers sourced via     Freehire]] - rationale - tests/test_posting_page.py
- [[Real bug, confirmed 2026-09-06 against two live dossiers' stored content     (Li]] - rationale - tests/test_posting_page.py
- [[Real bug the Conagra Brands 'Demand Science Rotational Analyst'     fixture has]] - rationale - tests/test_posting_page.py
- [[Real fetched content, verbatim from three separate live Zipline     dossiers ('A]] - rationale - tests/test_posting_page.py
- [[Real shape from the AppianConagra fixtures a fully-bolded standalone     line]] - rationale - tests/test_posting_page.py
- [[Real the Manhattan Associates 'A.I. Developer Co-Op' fixture ends     with a 'R]] - rationale - tests/test_posting_page.py
- [[The posting's substantive text from the first real heading up to the     applic]] - rationale - ingestion/posting_page.py
- [[extract_content()]] - code - ingestion/posting_page.py
- [[test_extract_content_dedupes_repeated_paragraph_real_conagra_case()]] - code - tests/test_posting_page.py
- [[test_extract_content_from_real_ashby_page()]] - code - tests/test_posting_page.py
- [[test_extract_content_from_real_page()]] - code - tests/test_posting_page.py
- [[test_extract_content_renders_real_section_names_as_headings()]] - code - tests/test_posting_page.py
- [[test_extract_content_skips_google_careers_listing_shell()]] - code - tests/test_posting_page.py
- [[test_extract_content_skips_microsoft_careers_listing_shell()]] - code - tests/test_posting_page.py
- [[test_extract_content_splits_ats_chrome_run_ons_real_conagra_case()]] - code - tests/test_posting_page.py
- [[test_extract_content_strips_read_more_and_follow_us_chrome_real_manhattan_case()]] - code - tests/test_posting_page.py
- [[test_extract_content_treats_real_zipline_board_index_as_unconfirmed()]] - code - tests/test_posting_page.py
- [[test_extract_content_with_no_internal_structure_stays_one_block()]] - code - tests/test_posting_page.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/extract_content
SORT file.name ASC
```

## Connections to other communities
- 11 edges to [[_COMMUNITY_test_posting_page.py]]
- 3 edges to [[_COMMUNITY_posting_page.py]]
- 1 edge to [[_COMMUNITY_stage1_reject]]
- 1 edge to [[_COMMUNITY_run_pipeline.py]]
- 1 edge to [[_COMMUNITY_cross_source_key]]

## Top bridge nodes
- [[extract_content()]] - degree 17, connects to 4 communities
- [[test_extract_content_skips_microsoft_careers_listing_shell()]] - degree 4, connects to 2 communities
- [[test_extract_content_from_real_ashby_page()]] - degree 3, connects to 1 community
- [[test_extract_content_treats_real_zipline_board_index_as_unconfirmed()]] - degree 3, connects to 1 community
- [[test_extract_content_skips_google_careers_listing_shell()]] - degree 3, connects to 1 community