---
type: community
members: 22
---

# _run_once_kwargs

**Members:** 22 nodes

## Members
- [[150170 stay informational-only (logged via dossier_total, no issue);     19020]] - rationale - tests/test_run_pipeline.py
- [[A source going offline (DNS failure, deleted repo, 5xx) must produce a     logge]] - rationale - tests/test_run_pipeline.py
- [[Atover the 300-dossier hard-pause threshold run.yml gets disabled,     nothing]] - rationale - tests/test_run_pipeline.py
- [[End-to-end via run_once pre-seed write_gate_failures.json with the     real cit]] - rationale - tests/test_write_gate_failures.py
- [[One dossier under the threshold no pause, no disable call, normal     fetchsel]] - rationale - tests/test_run_pipeline.py
- [[Real fixture set writes exactly 1 'Other'-bucket item per run under the     defa]] - rationale - tests/test_run_pipeline.py
- [[The critical ordering guarantee a validated, written dossier whose     push fai]] - rationale - tests/test_run_pipeline.py
- [[_run_once_kwargs()]] - code - tests/test_run_pipeline.py
- [[_seed_bucket()]] - code - tests/test_run_pipeline.py
- [[test_count_dossiers_by_bucket_counts_real_files()]] - code - tests/test_run_pipeline.py
- [[test_run_once_does_not_mark_seen_when_push_fails()]] - code - tests/test_run_pipeline.py
- [[test_run_once_excludes_and_never_refetches_real_dead_link_after_threshold()]] - code - tests/test_write_gate_failures.py
- [[test_run_once_files_issue_on_systemic_rejection_not_routine_one()]] - code - tests/test_run_pipeline.py
- [[test_run_once_files_issue_once_per_bucket_crossing_capacity()]] - code - tests/test_run_pipeline.py
- [[test_run_once_global_total_thresholds()]] - code - tests/test_run_pipeline.py
- [[test_run_once_halts_and_files_issue_on_fetch_network_failure()]] - code - tests/test_run_pipeline.py
- [[test_run_once_halts_on_schema_drift_and_writes_nothing()]] - code - tests/test_run_pipeline.py
- [[test_run_once_happy_path_marks_seen_and_writes_dossiers()]] - code - tests/test_run_pipeline.py
- [[test_run_once_hard_pause_disables_workflow_and_writes_nothing()]] - code - tests/test_run_pipeline.py
- [[test_run_once_reports_bucket_at_capacity_without_refusing_writes()]] - code - tests/test_run_pipeline.py
- [[test_run_once_second_run_does_not_rewrite_already_seen_items()]] - code - tests/test_run_pipeline.py
- [[test_run_once_under_hard_pause_threshold_runs_normally()]] - code - tests/test_run_pipeline.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/_run_once_kwargs
SORT file.name ASC
```

## Connections to other communities
- 17 edges to [[_COMMUNITY_test_run_pipeline.py]]
- 3 edges to [[_COMMUNITY_normalize_simplify]]
- 2 edges to [[_COMMUNITY_test_run_once_all_or_nothing_short_bucket_writes_nothing]]
- 2 edges to [[_COMMUNITY_test_zero_match_alert.py]]
- 2 edges to [[_COMMUNITY_test_write_gate_failures.py]]
- 1 edge to [[_COMMUNITY_commit_and_push_with_retry]]
- 1 edge to [[_COMMUNITY_test_schema_drift.py]]
- 1 edge to [[_COMMUNITY_test_debate_losses.py]]

## Top bridge nodes
- [[_run_once_kwargs()]] - degree 23, connects to 5 communities
- [[test_run_once_excludes_and_never_refetches_real_dead_link_after_threshold()]] - degree 5, connects to 2 communities
- [[test_run_once_does_not_mark_seen_when_push_fails()]] - degree 4, connects to 2 communities
- [[test_run_once_halts_on_schema_drift_and_writes_nothing()]] - degree 3, connects to 2 communities
- [[_seed_bucket()]] - degree 7, connects to 1 community