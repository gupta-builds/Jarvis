---
type: community
members: 17
---

# vault_root

**Members:** 17 nodes

## Members
- [[.increase_indent()]] - code - vault_writer/writer.py
- [[Dumps None as a blank scalar (matching the plan's `field` empty style     inste]] - rationale - vault_writer/writer.py
- [[Frontmatter dicts of every dossier file actually present in the vault     checko]] - rationale - vault_writer/writer.py
- [[Shared YAML rendering (None as blank scalar, indented list items) so     every d]] - rationale - vault_writer/writer.py
- [[_FrontmatterDumper]] - code - vault_writer/writer.py
- [[_tier_rank()]] - code - screen_report.py
- [[_write_dossier()]] - code - tests/test_screen_report.py
- [[build_report is screen_report.py's whole decision surface which dossiers get gr]] - rationale - tests/test_screen_report.py
- [[build_report()]] - code - screen_report.py
- [[dossiers scan_dossiers()'s own return shape (frontmatter dicts with a     _path]] - rationale - screen_report.py
- [[dump_frontmatter()]] - code - vault_writer/writer.py
- [[main()_7]] - code - screen_report.py
- [[scan_dossiers()]] - code - vault_writer/writer.py
- [[screen_report.py]] - code - screen_report.py
- [[test_build_report_caps_at_top_n_but_reports_real_total()]] - code - tests/test_screen_report.py
- [[test_build_report_ranks_preferred_first_then_recency_and_excludes_viewed()]] - code - tests/test_screen_report.py
- [[test_screen_report.py]] - code - tests/test_screen_report.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/vault_root
SORT file.name ASC
```

## Connections to other communities
- 5 edges to [[_COMMUNITY_writer.py_1]]
- 2 edges to [[_COMMUNITY_test_write_dossier_creates_missing_dossiers_dir]]
- 2 edges to [[_COMMUNITY_recheck.py]]
- 2 edges to [[_COMMUNITY_commit_and_push_with_retry_1]]
- 2 edges to [[_COMMUNITY_build_frontmatter]]
- 1 edge to [[_COMMUNITY_commit_and_push_with_retry]]
- 1 edge to [[_COMMUNITY__fake_http_get_only_interndock]]
- 1 edge to [[_COMMUNITY_render_dossier]]

## Top bridge nodes
- [[scan_dossiers()]] - degree 14, connects to 6 communities
- [[dump_frontmatter()]] - degree 7, connects to 3 communities
- [[screen_report.py]] - degree 8, connects to 2 communities
- [[test_screen_report.py]] - degree 9, connects to 1 community
- [[_FrontmatterDumper]] - degree 4, connects to 1 community