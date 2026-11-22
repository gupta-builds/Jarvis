---
type: community
members: 67
---

# run_pipeline.py

**Members:** 67 nodes

## Members
- [[All-or-nothing counterpart to _prioritize_and_cap (2026-09-07     decision) — re]] - rationale - run_pipeline.py
- [[New InternDock Listings from any not-yet-processed drop-shaped guide     URL. in]] - rationale - run_pipeline.py
- [[Not a Dossier (doesn't go through validate.validate()'s dossier-specific     fro]] - rationale - tests/test_run_log.py
- [[Phase 3 orchestration schema-drift check - fetch - filter - dedup - validat]] - rationale - run_pipeline.py
- [[Real per-bucket file counts in the vault checkout — Viewed isn't one     of BUC]] - rationale - run_pipeline.py
- [[Renders + validates each new listing; writes the ones that pass into     the Jar]] - rationale - run_pipeline.py
- [[Returns ((uid, listing), ... for genuinely new items, already_seen_count).]] - rationale - run_pipeline.py
- [[Returns (updated_failures, newly_excluded (uid, check, reason), ...).     Tra]] - rationale - run_pipeline.py
- [[Returns (updated_losses, newly_excluded (uid, listing), ...).     Increments]] - rationale - run_pipeline.py
- [[Returns (updated_streaks, newly_alerting source_name, ...).      Per source]] - rationale - run_pipeline.py
- [[Returns {source_name {fetch_count int, matched Listing, ...}}.     excl]] - rationale - run_pipeline.py
- [[Same injection shape as file_github_issue — real `gh workflow     disable` call]] - rationale - run_pipeline.py
- [[Task (Prompt 20) — same append-only pattern as append_excluded_log,     for a di]] - rationale - core/run_log.py
- [[Task N (Prompt 5) — one line per uid the first time it's excluded,     same appe]] - rationale - core/run_log.py
- [[Two-tier run log per the plan raw per-run JSONL in this repo, a weekly markdown]] - rationale - core/run_log.py
- [[_append_markdown_line()]] - code - core/run_log.py
- [[_select_exact_quota()]] - code - run_pipeline.py
- [[_ts()]] - code - tests/test_run_log.py
- [[append_excluded_log()]] - code - core/run_log.py
- [[append_run_log()]] - code - core/run_log.py
- [[append_weekly_rollup()]] - code - core/run_log.py
- [[append_write_gate_excluded_log()]] - code - core/run_log.py
- [[build_matched_reason()]] - code - run_pipeline.py
- [[count_dossiers_by_bucket()]] - code - run_pipeline.py
- [[datetime]] - code
- [[datetime_3]] - code
- [[dedup_new()]] - code - run_pipeline.py
- [[disable_workflow()]] - code - run_pipeline.py
- [[discover_interndock()]] - code - run_pipeline.py
- [[fetch_and_filter()]] - code - run_pipeline.py
- [[format_weekly_rollup()]] - code - core/run_log.py
- [[load_capacity_notified()]] - code - run_pipeline.py
- [[load_debate_losses()]] - code - run_pipeline.py
- [[load_excluded_uids()]] - code - run_pipeline.py
- [[load_interndock_seen_guides()]] - code - run_pipeline.py
- [[load_profile()]] - code - core/filter.py
- [[load_recent_runs()]] - code - core/run_log.py
- [[load_seen_ids()]] - code - run_pipeline.py
- [[load_write_gate_failures()]] - code - run_pipeline.py
- [[load_zero_match_streaks()]] - code - run_pipeline.py
- [[normalize_interndock()]] - code - ingestion/interndock.py
- [[run_log.py]] - code - core/run_log.py
- [[run_once()]] - code - run_pipeline.py
- [[run_pipeline.py]] - code - run_pipeline.py
- [[save_capacity_notified()]] - code - run_pipeline.py
- [[save_debate_losses()]] - code - run_pipeline.py
- [[save_excluded_uids()]] - code - run_pipeline.py
- [[save_interndock_seen_guides()]] - code - run_pipeline.py
- [[save_seen_ids()]] - code - run_pipeline.py
- [[save_write_gate_failures()]] - code - run_pipeline.py
- [[save_zero_match_streaks()]] - code - run_pipeline.py
- [[should_alert_on_exclusion_spike()]] - code - run_pipeline.py
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
- [[update_debate_losses()]] - code - run_pipeline.py
- [[update_write_gate_failures()]] - code - run_pipeline.py
- [[update_zero_match_streaks()]] - code - run_pipeline.py
- [[validate_and_write()]] - code - run_pipeline.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/run_pipelinepy
SORT file.name ASC
```

## Connections to other communities
- 12 edges to [[_COMMUNITY_normalize.py]]
- 6 edges to [[_COMMUNITY_classify]]
- 6 edges to [[_COMMUNITY_company_matches_preference]]
- 5 edges to [[_COMMUNITY_interndock.py]]
- 5 edges to [[_COMMUNITY_test_posting_page.py]]
- 5 edges to [[_COMMUNITY_test_writer.py]]
- 4 edges to [[_COMMUNITY_filter.py]]
- 4 edges to [[_COMMUNITY_matches]]
- 4 edges to [[_COMMUNITY_commit_and_push_with_retry]]
- 4 edges to [[_COMMUNITY_normalize_simplify]]
- 4 edges to [[_COMMUNITY_test_schema_drift.py]]
- 4 edges to [[_COMMUNITY_test_validate.py]]
- 3 edges to [[_COMMUNITY_test_debate.py]]
- 3 edges to [[_COMMUNITY_test_freehire.py]]
- 3 edges to [[_COMMUNITY_stage1_reject]]
- 3 edges to [[_COMMUNITY_posting_page.py]]
- 3 edges to [[_COMMUNITY_validate.py]]
- 2 edges to [[_COMMUNITY_test_run_pipeline.py]]
- 2 edges to [[_COMMUNITY_cross_source_key]]
- 2 edges to [[_COMMUNITY_test_relevance.py]]
- 2 edges to [[_COMMUNITY_extract_content]]
- 2 edges to [[_COMMUNITY_test_reseed.py]]
- 2 edges to [[_COMMUNITY_revalidate.py]]
- 1 edge to [[_COMMUNITY_test_filter.py]]
- 1 edge to [[_COMMUNITY_test_identity.py]]
- 1 edge to [[_COMMUNITY_test_company_cache.py]]
- 1 edge to [[_COMMUNITY_relevance.py]]
- 1 edge to [[_COMMUNITY_normalize_applyguy]]
- 1 edge to [[_COMMUNITY_test_debate_losses.py]]
- 1 edge to [[_COMMUNITY_test_write_gate_failures.py]]
- 1 edge to [[_COMMUNITY_test_zero_match_alert.py]]

## Top bridge nodes
- [[run_pipeline.py]] - degree 99, connects to 29 communities
- [[validate_and_write()]] - degree 17, connects to 9 communities
- [[load_profile()]] - degree 8, connects to 6 communities
- [[run_once()]] - degree 37, connects to 5 communities
- [[_select_exact_quota()]] - degree 6, connects to 3 communities