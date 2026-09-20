---
type: community
members: 37
---

# commit_and_push_with_retry

**Members:** 37 nodes

## Members
- [[A bare 'remote' repo plus two independent clones (ourstheirs),     simulating o]] - rationale - tests/test_git_ops.py
- [[A dossier written before dossier_uids.json existed (or hand-edited into     the]] - rationale - tests/test_recheck.py
- [[A source missing from feeds_by_source means its fetch failed — its     dossiers]] - rationale - tests/test_recheck.py
- [[Both sides edit the same line of the same file — pull --rebase can     never cle]] - rationale - tests/test_git_ops.py
- [[Commit-and-push with a retry-once-on-rejected-push loop.  The Jarvis vault has i]] - rationale - core/git_ops.py
- [[Exception]] - code
- [[Exercises commit_and_push_with_retry against real local git repos (a bare 'remot]] - rationale - tests/test_git_ops.py
- [[GitPushError]] - code - core/git_ops.py
- [[Real, reproducible bug found 2026-08-23 scan_dossiers() globs Viewed     along]] - rationale - tests/test_recheck.py
- [[Stages everything under repo_dir, commits, and pushes. On a rejected     push (s]] - rationale - core/git_ops.py
- [[The actual scenario this module exists for 'theirs' (the vault's own     auto-c]] - rationale - tests/test_git_ops.py
- [[{uid, path, reason} for dossiers whose posting closed. A source that     faile]] - rationale - recheck.py
- [[_commit_log()]] - code - recheck.py
- [[_configure_identity()]] - code - tests/test_git_ops.py
- [[_fm()]] - code - tests/test_recheck.py
- [[_git()]] - code - core/git_ops.py
- [[_log_messages()]] - code - tests/test_git_ops.py
- [[_run()]] - code - tests/test_git_ops.py
- [[commit_and_push_with_retry()]] - code - core/git_ops.py
- [[datetime_1]] - code
- [[git_ops.py]] - code - core/git_ops.py
- [[main()_5]] - code - recheck.py
- [[plan_removals is the recheck's whole decision surface — pure, tested offline.]] - rationale - tests/test_recheck.py
- [[plan_removals()]] - code - recheck.py
- [[remote_and_clones()]] - code - tests/test_git_ops.py
- [[test_absent_from_feed_is_removed()]] - code - tests/test_recheck.py
- [[test_active_false_upstream_is_removed()]] - code - tests/test_recheck.py
- [[test_all_active_removes_nothing()]] - code - tests/test_recheck.py
- [[test_already_removed_dossier_is_not_re_swept()]] - code - tests/test_recheck.py
- [[test_dossier_with_no_manifest_entry_is_skipped_not_removed()]] - code - tests/test_recheck.py
- [[test_failed_fetch_skips_that_sources_dossiers_entirely()]] - code - tests/test_recheck.py
- [[test_git_ops.py]] - code - tests/test_git_ops.py
- [[test_nothing_to_commit_returns_false()]] - code - tests/test_git_ops.py
- [[test_raises_after_exhausting_retries_on_persistent_conflict()]] - code - tests/test_git_ops.py
- [[test_recheck.py]] - code - tests/test_recheck.py
- [[test_retries_once_on_rejected_push_and_succeeds()]] - code - tests/test_git_ops.py
- [[test_simple_push_succeeds_without_race()]] - code - tests/test_git_ops.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/commit_and_push_with_retry
SORT file.name ASC
```

## Connections to other communities
- 12 edges to [[_COMMUNITY_recheck.py]]
- 2 edges to [[_COMMUNITY_test_writer.py]]
- 2 edges to [[_COMMUNITY_build_frontmatter]]
- 1 edge to [[_COMMUNITY_plan_removals]]
- 1 edge to [[_COMMUNITY_test_schema_drift.py]]
- 1 edge to [[_COMMUNITY_commit_and_push_with_retry_1]]
- 1 edge to [[_COMMUNITY_vault_root_1]]

## Top bridge nodes
- [[main()_5]] - degree 8, connects to 4 communities
- [[GitPushError]] - degree 8, connects to 3 communities
- [[git_ops.py]] - degree 8, connects to 2 communities
- [[commit_and_push_with_retry()]] - degree 13, connects to 1 community
- [[plan_removals()]] - degree 10, connects to 1 community