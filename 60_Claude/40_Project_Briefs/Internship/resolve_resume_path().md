---
source_file: "grade_resume.py"
type: "code"
community: "pytest"
location: "L65"
tags:
  - graphify/code
  - graphify/EXTRACTED
  - community/pytest
---

# resolve_resume_path()

## Connections
- [[--resume wins; otherwise $JARVIS_DIRRESUME_RELPATH. Exits with a     clear me]] - `rationale_for` [EXTRACTED]
- [[grade_resume.py]] - `contains` [EXTRACTED]
- [[main()_7]] - `calls` [EXTRACTED]
- [[test_grade_resume.py]] - `imports` [EXTRACTED]
- [[test_resolve_resume_path_defaults_under_jarvis_dir()]] - `calls` [EXTRACTED]
- [[test_resolve_resume_path_exits_with_message_when_nothing_configured()]] - `calls` [EXTRACTED]
- [[test_resolve_resume_path_explicit_arg_wins_over_env()]] - `calls` [EXTRACTED]

#graphify/code #graphify/EXTRACTED #community/pytest