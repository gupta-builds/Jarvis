---
type: community
members: 6
---

# test_sync_labels.py

**Members:** 6 nodes

## Members
- [[labels.yml is valid and defines every label that pr_gates.py or the issue forms]] - rationale - tests/test_sync_labels.py
- [[run.yml once failed silently ( true) on a label missing from a fresh repo (Cop]] - rationale - tests/test_sync_labels.py
- [[test_every_label_a_workflow_applies_is_defined()]] - code - tests/test_sync_labels.py
- [[test_gate_override_labels_and_form_labels_are_defined()]] - code - tests/test_sync_labels.py
- [[test_labels_valid_and_unique()]] - code - tests/test_sync_labels.py
- [[test_sync_labels.py]] - code - tests/test_sync_labels.py

## Live Query (requires Dataview plugin)

```dataview
TABLE source_file, type FROM #community/test_sync_labelspy
SORT file.name ASC
```
