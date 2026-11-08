---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: generated-output
tier: 3
maps_to: []
used_by:
  - "[[Graphify Folders]]"
gold_standard: "[[60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/00 - Session Index|00 - Session Index]]"
notes:
  - "[[Frontmatter Standard]]"
  - "[[Conformance Standard]]"
  - "[[Graphify Notes]]"
---
# Generated Output Standard
==A tool writes it, a tool can rewrite it, and no person or agent edits it: so it is marked as generated, kept out of search and context, and never counted as knowledge.==
This is the standard for notes written wholesale by a tool: the session indexes of the conversation exporter and the graphify export of a codebase. It is not the one entry note a person writes about a graphify mirror ([[Graphify Notes]]), and it is not an AI conversation export, which is a record with its own Standard ([[Conversations]]). It exists because the graphify files carried types the schema did not know, flooded search and Dataview, and were mistaken for project briefs.
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

| Item | Rule |
|---|---|
| Allowed folders | One folder per generator. The zone path is not set yet, so the placement check is waived. |
| File name | Whatever the tool writes. Never renamed by hand. |
| Kind | `type: generated`, `gen_kind` one of `code`, `rationale`, `document`, `community`, `index`, `report`. |
| Status | None. `status` is omitted. `review_state` (`raw`, `unreviewed`, `reviewed`) is optional and defaults to `raw`. |
## Headings
The headings are not enforced. The body is whatever the tool emits, and nothing in it is structure to preserve.
### Frontmatter
- **Write:** `type: generated`, `generator` (the tool name), and `gen_kind`. Keep the tool's own keys (`source_file`, `location`, `community`).
- **Length:** three required keys; add no prose.
- **Never:** the tool's kind in `type`. A note with `type: code` is invisible to the schema and indistinguishable from a hand-written code note.
- **Right:** `generator: claude-session-exporter`
- **Wrong:** `type: "code"`
### Body
- **Write:** the tool's output unchanged. An index queries its own folder.
- **Length:** whatever the tool writes.
- **Never:** a hand edit. The next run overwrites it.
- **Right:** `FROM "60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis"`
- **Wrong:** None seen.
### Zone
- **Write:** the folder where one generator writes, excluded from search, graph view, Dataview, and default AI context. Until the zone is set in [[Note Type Registry]], the exclusion is done by `userIgnoreFilters`.
- **Length:** one path per generator.
- **Never:** a hand-written note inside a zone. A rebuild can prune it.
- **Right:** None seen.
- **Wrong:** None seen.
### Regeneration
- **Write:** the rule that a defect is fixed in the generator or its config, and the files are rebuilt.
- **Length:** one sentence.
- **Never:** a hand patch. A generator that creates duplicates (`_N` suffixes) or a nested `.obsidian` is a defect to fix at the source.
- **Right:** None seen.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Every generated note has `type: generated`, `generator`, and `gen_kind` | The schema cannot read a tool's kind from `type` | Lint, check 1 (`legacy-generated-type`) |
| No `status` on a generated note | It is not knowledge with a maturity | Reader |
| An index queries only its own folder | A dead `FROM` path returns nothing and shows no error | Lint, check 3 (`dead-dataview-from`) |
| One zone per generator, out of search, graph, Dataview, and AI context | Machine output floods retrieval | Reader |
| No hand-written note in a zone and no hand edit of a generated note | A rebuild overwrites both | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: code`, `rationale`, `document`, `community` (2,436 graphify nodes in `60_Claude/40_Project_Briefs/`) | `type: generated`, `gen_kind` set to the old value, `generator: graphify` | Mechanical, scriptable |
| `status: auto-generated` or `raw` | Remove `status`; set `review_state: raw` | Mechanical |
| `tags: [graphify/code, ...]` | Keep as is | None |
| A hand-written note inside the generated folder | Move it out and give it its own family | Judgment |
## Done Conditions
- Every note in a generator's zone has `type: generated`, `generator`, and `gen_kind`.
- The zone is excluded from search, graph, Dataview queries, and AI context.
- No generated note was edited by hand, and no hand-written note sits in a zone.
- The note passes [[Vault Lint]] for `generated-output`.
## Gold Standard Example
[[60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/00 - Session Index|00 - Session Index]] passes lint: three required keys, nothing else in the frontmatter, and one query on its own folder.
Measured 2026-11-07 with `--family generated-output`: 24 notes, all pass. They are the session indexes and tool rollups of the conversation exporter. The graphify nodes are not counted because they are still `unmapped`.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| 00 - Session Index (gold) | `60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/` | Three keys and a query on its own folder | Nothing found |
| base.py | `60_Claude/40_Project_Briefs/TradingView/Nodes/` | The tool's own keys (`source_file`, `location`) | `type: "code"`, no `generator`, no `gen_kind`; fails as `unmapped` |
