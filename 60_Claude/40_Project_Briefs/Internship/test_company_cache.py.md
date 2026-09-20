---
source_file: "tests/test_company_cache.py"
type: "code"
community: "stage1_reject"
location: "L1"
tags:
  - graphify/code
  - graphify/EXTRACTED
  - community/stage1_reject
---

# test_company_cache.py

## Connections
- [[company_cache.py]] - `imports_from` [EXTRACTED]
- [[corecompany_cache.py — the per-company enrichment cache alongside enrich.py. Al]] - `rationale_for` [EXTRACTED]
- [[is_expired()]] - `imports` [EXTRACTED]
- [[load()]] - `imports` [EXTRACTED]
- [[save()]] - `imports` [EXTRACTED]
- [[test_is_expired_false_exactly_at_ttl_boundary()]] - `contains` [EXTRACTED]
- [[test_is_expired_false_for_todays_date()]] - `contains` [EXTRACTED]
- [[test_is_expired_true_for_unparseable_date()]] - `contains` [EXTRACTED]
- [[test_is_expired_true_one_day_past_ttl_boundary()]] - `contains` [EXTRACTED]
- [[test_load_corrupt_json_returns_none_not_raise()]] - `contains` [EXTRACTED]
- [[test_load_expired_entry_returns_none()]] - `contains` [EXTRACTED]
- [[test_load_missing_file_returns_none()]] - `contains` [EXTRACTED]
- [[test_load_non_dict_json_returns_none()]] - `contains` [EXTRACTED]
- [[test_load_within_ttl_still_returns_data()]] - `contains` [EXTRACTED]
- [[test_save_creates_cache_dir_if_missing()]] - `contains` [EXTRACTED]
- [[test_save_load_round_trip_preserves_every_field()]] - `contains` [EXTRACTED]
- [[test_save_uses_normalized_company_as_filename()]] - `contains` [EXTRACTED]

#graphify/code #graphify/EXTRACTED #community/stage1_reject