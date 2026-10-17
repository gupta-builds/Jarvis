---
type: system
status: sprout
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - system
  - standards
system_kind: standard
family:
tier:
maps_to: []
used_by: []
gold_standard:
notes: []
---
# <% tp.file.title %>
<!-- One sentence wrapped in ==highlight==: the rule this Standard exists to enforce. -->
<!-- Up to three sentences: what it governs, what it does not, and why it exists. -->
## Spec
```json
{
  "family": "",
  "tier": 1,
  "match": {"type": "", "kind": null, "path": "", "where": {}, "where_not": {}},
  "status": [],
  "required_keys": ["type", "status", "created", "updated", "tags"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": [],
  "optional_headings": []
}
```
## Headings
<!-- One ### per spec heading: what it holds, a *Density:* line, and at most one WARNING from a real note. -->
## Legacy Shapes
<!-- A table: old shape, new shape, and whether the move is mechanical or judgment. -->
## Done Conditions
<!-- Checkable bullets a script or a reader can verify. -->
## Gold Standard Example
<!-- A wikilink to an existing note and one sentence on why it qualifies. -->
