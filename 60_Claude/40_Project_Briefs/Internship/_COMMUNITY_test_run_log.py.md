---
type: community
members: 25
---

# test_run_log.py

**Members:** 25 nodes

## Members
- [[Not a Dossier (doesn't go through validate.validate()'s dossier-specific     fro]] - rationale - tests/test_run_log.py
- [[Task (Prompt 20) — same append-only pattern as append_excluded_log,     for a di]] - rationale - core/run_log.py
- [[Task N (Prompt 5) — one line per uid the first time it's excluded,     same appe]] - rationale - core/run_log.py
- [[Two-tier run log per the plan raw per-run JSONL in this repo, a weekly markdown]] - rationale - core/run_log.py
- [[_append_markdown_line()]] - code - core/run_log.py
- [[_ts()]] - code - tests/test_run_log.py
- [[append_excluded_log()]] - code - core/run_log.py
- [[append_run_log()]] - code - core/run_log.py
- [[append_weekly_rollup()]] - code - core/run_log.py
- [[append_write_gate_excluded_log()]] - code - core/run_log.py
- [[datetime]] - code
- [[format_weekly_rollup()]] - code - core/run_log.py
- [[load_recent_runs()]] - code - core/run_log.py
- [[run_log.py]] - code - core/run_log.py
- [[should_run_weekly_rollup()]] - code - core/run_log.py
- [[test_append_run_log_writes_one_json_line_per_call()]] - code - tests/test_run_log.py
- [[test_append_weekly_rollup_appends_without_rewriting()]] - code - tests/test_run_log.py
- [[test_append_weekly_rollup_creates_file_with_header()]] - code - tests/test_run_log.py
- [[test_appended_run_log_note_has_no_blank_lines_or_stray_dashes()]] - code - tests/test_run_log.py
- [[test_format_weekly_rollup_aggregates_written_and_rejections()]] - code - tests/test_run_log.py
- [[test_format_weekly_rollup_handles_zero_activity()]] - code - tests/test_run_log.py
- [[test_load_recent_runs_filters_by_timestamp()]] - code - tests/test_run_log.py
- [[test_load_recent_runs_on_missing_file_returns_empty()]] - code - tests/test_run_log.py
- [[test_run_log.py]] - code - tests/test_run_log.py
- [[test_should_run_weekly_rollup_only_fires_sunday_2300_utc()]] - code - tests/test_run_log.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/test_run_logpy
SORT file.name ASC
```

## Connections to other communities
- 15 edges to [[_COMMUNITY_run_pipeline.py]]
- 3 edges to [[_COMMUNITY_normalize.py]]
- 2 edges to [[_COMMUNITY_scan_dossiers]]
- 1 edge to [[_COMMUNITY_pytest]]

## Top bridge nodes
- [[run_log.py]] - degree 16, connects to 4 communities
- [[append_run_log()]] - degree 8, connects to 2 communities
- [[append_weekly_rollup()]] - degree 8, connects to 1 community
- [[load_recent_runs()]] - degree 7, connects to 1 community
- [[format_weekly_rollup()]] - degree 7, connects to 1 community