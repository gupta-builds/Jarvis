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
next:
---
# <% tp.file.title %>
<!-- One sentence wrapped in ==highlight==: the rule this Standard exists to enforce. -->
<!-- Up to three sentences: what the note is, what it is not (link the neighbor family), and why it exists. No process steps. -->
## Spec
<!-- Valid JSON for the linter, then a table of Allowed folders, File name, Kind and Status in words. -->
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
<!-- Entries in order: Frontmatter, one per spec heading, then Rules. Each entry is at most 180 words, table rows excluded. -->
### Frontmatter
<!-- Five bullets: Write, Length (a number), Never (with the reason), Right and Wrong, both quoted from real notes. -->
### Section
<!-- Repeat for every spec heading. If no real note of the family exists yet, say so instead of inventing a quote. -->
### Rules
<!-- A table: Rule, Why, Enforced by (Lint with the check number, or Reader). Steps and triggers belong in the Workflow. -->
## Legacy Shapes
<!-- A table: old shape, new shape, Mechanical or Judgment. Name the real notes that carry each old shape. -->
## Done Conditions
<!-- Checkable bullets a script or a reader can verify, ending with the Vault Lint line for the family. -->
## Gold Standard Example
<!-- A link to a note that exists and passes lint, or what is missing. Then a table: Note, Folder, Strength, Lacks. -->
