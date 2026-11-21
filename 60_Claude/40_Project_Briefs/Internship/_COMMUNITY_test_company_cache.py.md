---
type: community
members: 42
---

# test_company_cache.py

**Members:** 42 nodes

## Members
- [[Layer 3 — stable dedup keys for a Listing.  Both remaining sources carry a stabl]] - rationale - core/identity.py
- [[None on no cache file, corruptmalformed JSON, or an entry older than     `ttl_]] - rationale - core/company_cache.py
- [[On-demand company-enrichment cache — sits alongside enrich.py (Layer 5, manual-C]] - rationale - core/company_cache.py
- [[OptiverOPTIVER must share one file, not silently duplicate — same     normaliza]] - rationale - tests/test_company_cache.py
- [[Path_2]] - code
- [[Pins the 'don't re-tier the 11 preferred_companies' decision — only     one grad]] - rationale - tests/test_company_registry.py
- [[Pure — no filesystem. `checked_date` is an ISO date string (as `save()`     stam]] - rationale - core/company_cache.py
- [[Real dossiers store company as 'Optiver ' (trailing space); other     sources va]] - rationale - tests/test_company_registry.py
- [[Runnable self-check a real write - read - simulated-expiry cycle,     against]] - rationale - core/company_cache.py
- [[Single source of truth for company-level facts used by coreclassify.py, corede]] - rationale - core/company_registry.py
- [[Stamps `checked` to today and writes `company` as the given display     name (no]] - rationale - core/company_cache.py
- [[_cache_path()]] - code - core/company_cache.py
- [[_norm_company()]] - code - core/identity.py
- [[company_cache.py]] - code - core/company_cache.py
- [[company_registry.py]] - code - core/company_registry.py
- [[corecompany_cache.py — the per-company enrichment cache alongside enrich.py. Al]] - rationale - tests/test_company_cache.py
- [[corecompany_registry.py — the shared company-fact lookup used by coreclassify.]] - rationale - tests/test_company_registry.py
- [[demo()]] - code - core/company_cache.py
- [[identity.py]] - code - core/identity.py
- [[is_expired()]] - code - core/company_cache.py
- [[is_quant_finance_company()]] - code - core/company_registry.py
- [[load()]] - code - core/company_cache.py
- [[save()]] - code - core/company_cache.py
- [[test_adjacent_field_companies_unchanged_from_relevance_py_original()]] - code - tests/test_company_registry.py
- [[test_company_cache.py]] - code - tests/test_company_cache.py
- [[test_company_registry.py]] - code - tests/test_company_registry.py
- [[test_is_expired_false_exactly_at_ttl_boundary()]] - code - tests/test_company_cache.py
- [[test_is_expired_false_for_todays_date()]] - code - tests/test_company_cache.py
- [[test_is_expired_true_for_unparseable_date()]] - code - tests/test_company_cache.py
- [[test_is_expired_true_one_day_past_ttl_boundary()]] - code - tests/test_company_cache.py
- [[test_is_quant_finance_company_false_for_unrelated_company()]] - code - tests/test_company_registry.py
- [[test_is_quant_finance_company_punctuation_insensitive()]] - code - tests/test_company_registry.py
- [[test_is_quant_finance_company_true_for_all_8_confirmed_companies()]] - code - tests/test_company_registry.py
- [[test_load_corrupt_json_returns_none_not_raise()]] - code - tests/test_company_cache.py
- [[test_load_expired_entry_returns_none()]] - code - tests/test_company_cache.py
- [[test_load_missing_file_returns_none()]] - code - tests/test_company_cache.py
- [[test_load_non_dict_json_returns_none()]] - code - tests/test_company_cache.py
- [[test_load_within_ttl_still_returns_data()]] - code - tests/test_company_cache.py
- [[test_save_creates_cache_dir_if_missing()]] - code - tests/test_company_cache.py
- [[test_save_load_round_trip_preserves_every_field()]] - code - tests/test_company_cache.py
- [[test_save_uses_normalized_company_as_filename()]] - code - tests/test_company_cache.py
- [[test_tier_rank_not_re_tiered()]] - code - tests/test_company_registry.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/test_company_cachepy
SORT file.name ASC
```

## Connections to other communities
- 4 edges to [[_COMMUNITY_scan_dossiers]]
- 4 edges to [[_COMMUNITY_test_identity.py]]
- 3 edges to [[_COMMUNITY_test_classify.py]]
- 2 edges to [[_COMMUNITY_enrich.py]]
- 2 edges to [[_COMMUNITY_revalidate.py]]
- 2 edges to [[_COMMUNITY_validate]]
- 1 edge to [[_COMMUNITY_normalize_simplify]]
- 1 edge to [[_COMMUNITY_run_pipeline.py]]
- 1 edge to [[_COMMUNITY_test_debate_losses.py]]
- 1 edge to [[_COMMUNITY_linkedin_recruiter_snippet]]
- 1 edge to [[_COMMUNITY__fake_http_get]]

## Top bridge nodes
- [[identity.py]] - degree 17, connects to 10 communities
- [[company_registry.py]] - degree 9, connects to 4 communities
- [[company_cache.py]] - degree 11, connects to 1 community
- [[is_quant_finance_company()]] - degree 8, connects to 1 community
- [[_norm_company()]] - degree 6, connects to 1 community