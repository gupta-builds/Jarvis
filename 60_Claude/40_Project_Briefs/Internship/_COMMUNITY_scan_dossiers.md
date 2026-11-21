---
type: community
members: 23
---

# scan_dossiers

**Members:** 23 nodes

## Members
- [[.increase_indent()]] - code - vault_writer/writer.py
- [[Dumps None as a blank scalar (matching the plan's `field` empty style     inste]] - rationale - vault_writer/writer.py
- [[Frontmatter dicts of every dossier file actually present in the vault     checko]] - rationale - vault_writer/writer.py
- [[Renders the fixed dossier template and writes it into a vault checkout.  Renderi]] - rationale - vault_writer/writer.py
- [[Shared YAML rendering (None as blank scalar, indented list items) so     every d]] - rationale - vault_writer/writer.py
- [[_FrontmatterDumper]] - code - vault_writer/writer.py
- [[_represent_none()]] - code - vault_writer/writer.py
- [[_tier_rank()]] - code - screen_report.py
- [[_write_dossier()]] - code - tests/test_screen_report.py
- [[build_report is screen_report.py's whole decision surface which dossiers get gr]] - rationale - tests/test_screen_report.py
- [[build_report()]] - code - screen_report.py
- [[dossiers scan_dossiers()'s own return shape (frontmatter dicts with a     _path]] - rationale - screen_report.py
- [[dump_frontmatter()]] - code - vault_writer/writer.py
- [[jinja2]] - concept
- [[json]] - concept
- [[main()_10]] - code - screen_report.py
- [[pathlib]] - concept
- [[scan_dossiers()]] - code - vault_writer/writer.py
- [[screen_report.py]] - code - screen_report.py
- [[test_build_report_caps_at_top_n_but_reports_real_total()]] - code - tests/test_screen_report.py
- [[test_build_report_ranks_preferred_first_then_recency_and_excludes_viewed()]] - code - tests/test_screen_report.py
- [[test_screen_report.py]] - code - tests/test_screen_report.py
- [[writer.py]] - code - vault_writer/writer.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/scan_dossiers
SORT file.name ASC
```

## Connections to other communities
- 10 edges to [[_COMMUNITY_test_writer.py]]
- 9 edges to [[_COMMUNITY_revalidate.py]]
- 5 edges to [[_COMMUNITY_sys]]
- 5 edges to [[_COMMUNITY_test_validate.py]]
- 4 edges to [[_COMMUNITY_test_company_cache.py]]
- 4 edges to [[_COMMUNITY_normalize.py]]
- 4 edges to [[_COMMUNITY_run_pipeline.py]]
- 4 edges to [[_COMMUNITY_writer.py]]
- 3 edges to [[_COMMUNITY_test_classify.py]]
- 3 edges to [[_COMMUNITY_test_identity.py]]
- 3 edges to [[_COMMUNITY_linkedin_recruiter_snippet]]
- 2 edges to [[_COMMUNITY_test_run_log.py]]
- 2 edges to [[_COMMUNITY_pytest]]
- 2 edges to [[_COMMUNITY_normalize_josegael]]
- 2 edges to [[_COMMUNITY_test_freehire.py]]
- 2 edges to [[_COMMUNITY_test_relevance.py]]
- 2 edges to [[_COMMUNITY__fake_http_get]]
- 2 edges to [[_COMMUNITY_test_schema_drift.py]]
- 2 edges to [[_COMMUNITY_test_sources.py]]
- 1 edge to [[_COMMUNITY_filter.py]]
- 1 edge to [[_COMMUNITY_test_git_ops.py]]
- 1 edge to [[_COMMUNITY_validate]]
- 1 edge to [[_COMMUNITY_test_debate_losses.py]]
- 1 edge to [[_COMMUNITY_test_reseed.py]]
- 1 edge to [[_COMMUNITY_extract_content]]
- 1 edge to [[_COMMUNITY_test_recheck.py]]
- 1 edge to [[_COMMUNITY_test_write_gate_failures.py]]
- 1 edge to [[_COMMUNITY_extract_deadline]]

## Top bridge nodes
- [[pathlib]] - degree 30, connects to 23 communities
- [[json]] - degree 21, connects to 18 communities
- [[writer.py]] - degree 29, connects to 8 communities
- [[scan_dossiers()]] - degree 14, connects to 5 communities
- [[screen_report.py]] - degree 11, connects to 4 communities