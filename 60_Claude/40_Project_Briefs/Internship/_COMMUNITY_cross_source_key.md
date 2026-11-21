---
type: community
members: 24
---

# cross_source_key

**Members:** 24 nodes

## Members
- [[Layer 4 — the five-check write gate. Fail any check - item is rejected and neve]] - rationale - vault_writer/validate.py
- [[Like SafeLoader, but raises on duplicate mapping keys instead of     silently ke]] - rationale - vault_writer/validate.py
- [[Real dup from the 2026-07-18 audit same Workday req via two routes,     titled]] - rationale - tests/test_run_pipeline.py
- [[Renders + validates each new listing; writes the ones that pass into     the Jar]] - rationale - run_pipeline.py
- [[Runs all checks in the plan's order, fail-closed on the first failure.     Short]] - rationale - vault_writer/validate.py
- [[Same program via two sources = two different uids but one normalized     company]] - rationale - vault_writer/validate.py
- [[ValidationResult]] - code - vault_writer/validate.py
- [[_DupeKeyLoader]] - code - vault_writer/validate.py
- [[_construct_mapping_no_dupes()]] - code - vault_writer/validate.py
- [[check_cross_source_duplicate()]] - code - vault_writer/validate.py
- [[check_not_duplicate()]] - code - vault_writer/validate.py
- [[check_required_fields()_2]] - code - vault_writer/validate.py
- [[check_url_live()]] - code - vault_writer/validate.py
- [[cross_source_key()]] - code - core/identity.py
- [[test_cross_source_key_punctuation_insensitive_marmon_case()]] - code - tests/test_run_pipeline.py
- [[test_not_duplicate_passes_when_uid_unseen()]] - code - tests/test_validate.py
- [[test_not_duplicate_rejects_seen_uid()]] - code - tests/test_validate.py
- [[test_required_fields_pass()]] - code - tests/test_validate.py
- [[test_required_fields_rejects_missing_company()]] - code - tests/test_validate.py
- [[test_required_fields_rejects_missing_uid()]] - code - tests/test_validate.py
- [[test_url_live_rejects_on_request_exception()]] - code - tests/test_validate.py
- [[validate()]] - code - vault_writer/validate.py
- [[validate.py]] - code - vault_writer/validate.py
- [[validate_and_write()]] - code - run_pipeline.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/cross_source_key
SORT file.name ASC
```

## Connections to other communities
- 23 edges to [[_COMMUNITY_test_validate.py]]
- 11 edges to [[_COMMUNITY_test_identity.py]]
- 5 edges to [[_COMMUNITY_run_pipeline.py]]
- 2 edges to [[_COMMUNITY_classify]]
- 2 edges to [[_COMMUNITY_test_run_pipeline.py]]
- 1 edge to [[_COMMUNITY_test_relevance.py]]
- 1 edge to [[_COMMUNITY_test_posting_page.py]]
- 1 edge to [[_COMMUNITY_posting_page.py]]
- 1 edge to [[_COMMUNITY_extract_content]]
- 1 edge to [[_COMMUNITY_filter.py]]
- 1 edge to [[_COMMUNITY_scan_dossiers]]
- 1 edge to [[_COMMUNITY_test_writer.py]]

## Top bridge nodes
- [[validate_and_write()]] - degree 16, connects to 10 communities
- [[cross_source_key()]] - degree 16, connects to 3 communities
- [[validate.py]] - degree 14, connects to 3 communities
- [[validate()]] - degree 14, connects to 2 communities
- [[check_url_live()]] - degree 8, connects to 1 community