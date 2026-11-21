---
source_file: "tests/test_screen_report.py"
type: "code"
community: "scan_dossiers"
location: "L1"
tags:
  - graphify/code
  - graphify/EXTRACTED
  - community/scan_dossiers
---

# test_screen_report.py

## Connections
- [[_write_dossier()]] - `contains` [EXTRACTED]
- [[build_report is screen_report.py's whole decision surface which dossiers get gr]] - `rationale_for` [EXTRACTED]
- [[build_report()]] - `imports` [EXTRACTED]
- [[dump_frontmatter()]] - `imports` [EXTRACTED]
- [[pathlib]] - `imports_from` [EXTRACTED]
- [[scan_dossiers()]] - `imports` [EXTRACTED]
- [[screen_report.py]] - `imports_from` [EXTRACTED]
- [[test_build_report_caps_at_top_n_but_reports_real_total()]] - `contains` [EXTRACTED]
- [[test_build_report_ranks_preferred_first_then_recency_and_excludes_viewed()]] - `contains` [EXTRACTED]
- [[writer.py]] - `imports_from` [EXTRACTED]

#graphify/code #graphify/EXTRACTED #community/scan_dossiers