---
type: community
members: 30
---

# stage1_reject

**Members:** 30 nodes

## Members
- [[Layer 3 — stable dedup keys for a Listing.  Both remaining sources carry a stabl]] - rationale - core/identity.py
- [[None on no cache file, corruptmalformed JSON, or an entry older than     `ttl_]] - rationale - core/company_cache.py
- [[On-demand company-enrichment cache — sits alongside enrich.py (Layer 5, manual-C]] - rationale - core/company_cache.py
- [[OptiverOPTIVER must share one file, not silently duplicate — same     normaliza]] - rationale - tests/test_company_cache.py
- [[Path_1]] - code
- [[Pure — no filesystem. `checked_date` is an ISO date string (as `save()`     stam]] - rationale - core/company_cache.py
- [[Runnable self-check a real write - read - simulated-expiry cycle,     against]] - rationale - core/company_cache.py
- [[Stamps `checked` to today and writes `company` as the given display     name (no]] - rationale - core/company_cache.py
- [[_cache_path()]] - code - core/company_cache.py
- [[_norm_company()]] - code - core/identity.py
- [[company_cache.py]] - code - core/company_cache.py
- [[corecompany_cache.py — the per-company enrichment cache alongside enrich.py. Al]] - rationale - tests/test_company_cache.py
- [[demo()]] - code - core/company_cache.py
- [[identity.py]] - code - core/identity.py
- [[is_expired()]] - code - core/company_cache.py
- [[load()]] - code - core/company_cache.py
- [[save()]] - code - core/company_cache.py
- [[test_company_cache.py]] - code - tests/test_company_cache.py
- [[test_is_expired_false_exactly_at_ttl_boundary()]] - code - tests/test_company_cache.py
- [[test_is_expired_false_for_todays_date()]] - code - tests/test_company_cache.py
- [[test_is_expired_true_for_unparseable_date()]] - code - tests/test_company_cache.py
- [[test_is_expired_true_one_day_past_ttl_boundary()]] - code - tests/test_company_cache.py
- [[test_load_corrupt_json_returns_none_not_raise()]] - code - tests/test_company_cache.py
- [[test_load_expired_entry_returns_none()]] - code - tests/test_company_cache.py
- [[test_load_missing_file_returns_none()]] - code - tests/test_company_cache.py
- [[test_load_non_dict_json_returns_none()]] - code - tests/test_company_cache.py
- [[test_load_within_ttl_still_returns_data()]] - code - tests/test_company_cache.py
- [[test_save_creates_cache_dir_if_missing()]] - code - tests/test_company_cache.py
- [[test_save_load_round_trip_preserves_every_field()]] - code - tests/test_company_cache.py
- [[test_save_uses_normalized_company_as_filename()]] - code - tests/test_company_cache.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/stage1_reject
SORT file.name ASC
```

## Connections to other communities
- 4 edges to [[_COMMUNITY_test_write_dossier_creates_missing_dossiers_dir]]
- 4 edges to [[_COMMUNITY_test_render_dossier_shows_real_rendered_frontmatter_with_preference_match]]
- 2 edges to [[_COMMUNITY__fake_http_get_only_interndock]]
- 1 edge to [[_COMMUNITY_normalize_simplify]]
- 1 edge to [[_COMMUNITY_recheck.py]]
- 1 edge to [[_COMMUNITY_test_debate_losses.py]]
- 1 edge to [[_COMMUNITY_interndock.py]]
- 1 edge to [[_COMMUNITY_test_writer.py]]
- 1 edge to [[_COMMUNITY_writer.py_1]]

## Top bridge nodes
- [[identity.py]] - degree 16, connects to 9 communities
- [[_norm_company()]] - degree 6, connects to 2 communities