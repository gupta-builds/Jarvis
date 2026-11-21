---
type: community
members: 19
---

# writer.py

**Members:** 19 nodes

## Members
- [[Real rendered frontmatter (not just the dict) — confirms preference_tier     act]] - rationale - tests/test_writer.py
- [[Same slugification as dossier_filename() lowercase, spaces to     hyphens, ille]] - rationale - vault_writer/writer.py
- [[Two dossiers for the same company (varying casingwhitespace) must     produce t]] - rationale - tests/test_writer.py
- [[_iso_date()]] - code - vault_writer/writer.py
- [[_yaml_list()]] - code - vault_writer/writer.py
- [[build_frontmatter()]] - code - vault_writer/writer.py
- [[company_slug()]] - code - vault_writer/writer.py
- [[listing's real company is 'Palantir' (testsfixturessimplifyjobs.json)     — no]] - rationale - tests/test_writer.py
- [[test_build_frontmatter_deadline_fields_sit_right_after_date_found()]] - code - tests/test_writer.py
- [[test_build_frontmatter_includes_moc_link_and_company_tag()]] - code - tests/test_writer.py
- [[test_build_frontmatter_own_deadline_crosses_a_month_boundary()]] - code - tests/test_writer.py
- [[test_build_frontmatter_preference_tier_matches_real_preferred_company()]] - code - tests/test_writer.py
- [[test_build_frontmatter_preference_tier_null_when_no_preferred_companies_given()]] - code - tests/test_writer.py
- [[test_build_frontmatter_sets_own_deadline_seven_days_after_date_found_when_no_posted_deadline()]] - code - tests/test_writer.py
- [[test_build_frontmatter_stated_deadline_wins_and_leaves_own_deadline_null()]] - code - tests/test_writer.py
- [[test_company_slug_matches_real_standard_examples()]] - code - tests/test_writer.py
- [[test_company_slug_normalizes_case_and_whitespace_for_same_company_clustering()]] - code - tests/test_writer.py
- [[test_render_dossier_shows_real_rendered_frontmatter_with_preference_match()]] - code - tests/test_writer.py
- [[uid and category are deliberately not rendered — uid stays available     interna]] - rationale - vault_writer/writer.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/writerpy
SORT file.name ASC
```

## Connections to other communities
- 12 edges to [[_COMMUNITY_test_writer.py]]
- 4 edges to [[_COMMUNITY_scan_dossiers]]
- 2 edges to [[_COMMUNITY_test_validate.py]]
- 1 edge to [[_COMMUNITY_test_identity.py]]

## Top bridge nodes
- [[build_frontmatter()]] - degree 15, connects to 4 communities
- [[company_slug()]] - degree 8, connects to 2 communities
- [[test_render_dossier_shows_real_rendered_frontmatter_with_preference_match()]] - degree 4, connects to 2 communities
- [[test_build_frontmatter_includes_moc_link_and_company_tag()]] - degree 3, connects to 1 community
- [[test_company_slug_normalizes_case_and_whitespace_for_same_company_clustering()]] - degree 3, connects to 1 community