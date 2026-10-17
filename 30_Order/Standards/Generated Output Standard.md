---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: generated-output
tier: 3
maps_to: []
used_by:
  - "[[Graphify Folders]]"
gold_standard: "[[60_Claude/40_Project_Briefs/TradingView/Nodes/base.py]]"
notes:
  - "[[Frontmatter Standard]]"
  - "[[Conformance Standard]]"
  - "[[Graphify Notes]]"
---
# Generated Output Standard
==A tool writes it, a tool can rewrite it, and no person or agent edits it: so it is marked as generated, kept out of search and context, and never counted as knowledge.==
This is the standard for notes written wholesale by a tool, today the graphify export of a codebase (about 2,400 files in `40_Project_Briefs/Internship` and `TradingView`). It exists because those files carried types the schema did not know (`code`, `rationale`, `document`, `community`), flooded search and Dataview, and were mistaken for project briefs. [[Graphify Notes]] covers the one graphify note a person writes; this Standard covers the machine output.
## Spec
```json
{
  "family": "generated-output",
  "tier": 3,
  "match": {"type": "generated", "kind": null, "path": "", "where": {}, "where_not": {}},
  "status": [],
  "required_keys": ["type", "generator", "gen_kind"],
  "key_types": {"tags": "list"},
  "headings": [],
  "optional_headings": []
}
```
## Headings
The body is whatever the tool emits. A person never edits it, and nothing here is structure to preserve.
### Frontmatter
`type: generated`, `generator` (the tool name, for example `graphify`), `gen_kind` (`code`, `rationale`, `document`, `community`, `index`, or `report`). Keep the tool's own keys (`source_file`, `location`, `community`). `status` is omitted. `review_state` is optional and defaults to `raw`.
*Density:* three required keys. Do not add prose.
> [!WARNING]
> Putting the tool's kind in `type`. A note with `type: code` is invisible to the schema and indistinguishable from a hand-written code note.
### Zone
Generated notes live in one folder per generator, and that folder is excluded from search, graph view, Dataview, and AI default context. The zone path is not yet decided. Until it is set in [[Note Type Registry]], the placement check is waived and the exclusion is done by `userIgnoreFilters`.
*Density:* one path per generator.
### Regeneration
Fix the generator or its config, then regenerate. Never hand-patch a generated note. A generator that creates duplicates (`_N` suffixes) or a nested `.obsidian` is a defect to fix at the source.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: code`, `rationale`, `document`, `community` | `type: generated`, `gen_kind` set to the old value, `generator: graphify` | mechanical, scriptable |
| `status: auto-generated` or `raw` | remove `status`; set `review_state: raw` | mechanical |
| `tags: [graphify/code, ...]` | keep as is | none |
| A hand-written note inside the generated folder | move it out and give it its own family | judgment |
## Done Conditions
- Every note in a generator's zone has `type: generated`, `generator`, and `gen_kind`.
- The zone is excluded from search, graph, Dataview queries, and AI context.
- No generated note was edited by hand, and no hand-written note sits in a zone.
## Gold Standard Example
[[60_Claude/40_Project_Briefs/TradingView/Nodes/base.py]]: a graphify node with the tool's own keys. It still carries the old `type: code` and shows what the Legacy Shapes table rewrites.
