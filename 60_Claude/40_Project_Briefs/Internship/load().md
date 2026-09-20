---
source_file: "core/company_cache.py"
type: "code"
community: "stage1_reject"
location: "L55"
tags:
  - graphify/code
  - graphify/EXTRACTED
  - community/stage1_reject
---

# load()

## Connections
- [[None on no cache file, corruptmalformed JSON, or an entry older than     `ttl_]] - `rationale_for` [EXTRACTED]
- [[_cache_path()]] - `calls` [EXTRACTED]
- [[company_cache.py]] - `contains` [EXTRACTED]
- [[demo()]] - `calls` [EXTRACTED]
- [[is_expired()]] - `calls` [EXTRACTED]
- [[test_company_cache.py]] - `imports` [EXTRACTED]
- [[test_load_corrupt_json_returns_none_not_raise()]] - `calls` [EXTRACTED]
- [[test_load_expired_entry_returns_none()]] - `calls` [EXTRACTED]
- [[test_load_missing_file_returns_none()]] - `calls` [EXTRACTED]
- [[test_load_non_dict_json_returns_none()]] - `calls` [EXTRACTED]
- [[test_load_within_ttl_still_returns_data()]] - `calls` [EXTRACTED]
- [[test_save_creates_cache_dir_if_missing()]] - `calls` [EXTRACTED]
- [[test_save_load_round_trip_preserves_every_field()]] - `calls` [EXTRACTED]
- [[test_save_uses_normalized_company_as_filename()]] - `calls` [EXTRACTED]

#graphify/code #graphify/EXTRACTED #community/stage1_reject