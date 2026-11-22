---
type: community
members: 12
---

# company_registry.py

**Members:** 12 nodes

## Members
- [[Pins the 'don't re-tier the 11 preferred_companies' decision — only     one grad]] - rationale - tests/test_company_registry.py
- [[Real dossiers store company as 'Optiver ' (trailing space); other     sources va]] - rationale - tests/test_company_registry.py
- [[Single source of truth for company-level facts used by coreclassify.py, corede]] - rationale - core/company_registry.py
- [[company_registry.py]] - code - core/company_registry.py
- [[corecompany_registry.py — the shared company-fact lookup used by coreclassify.]] - rationale - tests/test_company_registry.py
- [[is_quant_finance_company()]] - code - core/company_registry.py
- [[test_adjacent_field_companies_unchanged_from_relevance_py_original()]] - code - tests/test_company_registry.py
- [[test_company_registry.py]] - code - tests/test_company_registry.py
- [[test_is_quant_finance_company_false_for_unrelated_company()]] - code - tests/test_company_registry.py
- [[test_is_quant_finance_company_punctuation_insensitive()]] - code - tests/test_company_registry.py
- [[test_is_quant_finance_company_true_for_all_8_confirmed_companies()]] - code - tests/test_company_registry.py
- [[test_tier_rank_not_re_tiered()]] - code - tests/test_company_registry.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/company_registrypy
SORT file.name ASC
```

## Connections to other communities
- 3 edges to [[_COMMUNITY_classify]]
- 3 edges to [[_COMMUNITY_test_company_cache.py]]
- 1 edge to [[_COMMUNITY_company_matches_preference]]
- 1 edge to [[_COMMUNITY_relevance.py]]
- 1 edge to [[_COMMUNITY_test_writer.py]]

## Top bridge nodes
- [[company_registry.py]] - degree 9, connects to 5 communities
- [[is_quant_finance_company()]] - degree 8, connects to 2 communities