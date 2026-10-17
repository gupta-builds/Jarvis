---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - standards
  - graphify
system_kind: standard
family: graphify-note
tier: 1
maps_to:
  - "[[Graphify Notes Template|Graphify Notes Template]]"
used_by:
  - "[[Graphify Folders]]"
gold_standard: "[[60_Claude/40_Project_Briefs/Graphify — Internship Research Loop Implementation]]"
notes:
  - "[[Generated Output Standard]]"
  - "[[How to use Graphify]]"
  - "[[Graphify Workflow]]"
---
# Graphify Notes
==A graphify folder is a generated mirror that graphify owns: read it, link to it, never hand-write inside it. Everything a person writes about it goes in one entry note outside it.==
This Standard covers the one human-written entry note that wraps each graphify export, and the ownership rules around the folder. The generated files themselves are Tier 3 under [[Generated Output Standard]]. It does not teach Graphify: commands, the three-pass pipeline, and hook behavior are in [[Graphify Workflow]] and [[How to use Graphify]].
## Spec
```json
{
  "family": "graphify-note",
  "tier": 1,
  "match": {"type": "reference", "kind": "repo", "path": "^60_Claude/40_Project_Briefs/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "reference_kind", "repo", "mirror_folder", "last_build", "notes"],
  "key_types": {"created": "date", "updated": "date", "last_build": "date", "tags": "list", "notes": "list"},
  "headings": ["Source", "Mirror", "Last Build", "Health Check", "Open Questions"],
  "optional_headings": [],
  "legacy_match": [
    {"path": "^60_Claude/40_Project_Briefs/Graphify . Internship Research Loop Implementation\\.md$"}
  ]
}
```
## Headings
### Where the mirror lives
By convention `60_Claude/40_Project_Briefs/<RepoName>/`, created with `/graphify . --obsidian --obsidian-dir "<that folder>"`. It holds `00 Overview.md`, `GRAPH_REPORT.md`, `graph.html`, `Communities/`, `Nodes/`, and `.graphify_obsidian_manifest.json`. It exists today for `TradingView/` and `Internship/`.
### Ownership rules
Graphify owns the folder, and a rebuild may prune or overwrite it, so nobody hand-edits inside it. The entry note is human-owned, one per mirror, kept outside the generated folder, and holds the repo, last build date, health result, and links in. Other notes link to `GRAPH_REPORT.md` and the entry note, not to individual node files.
> [!WARNING]
> Assuming lint and curator tools skip the folder. That is a rule here, not a verified fact; confirm `vault-curator` and `/ops` skip it before trusting a clean report. The Internship mirror once held about 350 orphaned notes with junk names such as `.increase_indent().md`, found only by the manual health check.
### Source
The repo path, what it contains, and why it was mapped.
### Mirror
The folder path, marked graphify-owned, and a link to its `GRAPH_REPORT`.
### Last Build
The date, the command used, and whether docs or PDFs changed since (those need a full `/graphify --update`).
### Health Check
A dated table with three counts: the folder's real `.md` count, the manifest's tracked-file count, and `graph.json`'s node count. A real gap means orphans accumulated. Commands are in [[How to use Graphify]]. Add a row every time the check runs.
### Open Questions
Count gaps or doubts, as `- [ ]` tasks.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| The Internship implementation note, written before the template | Add `type: reference`, `reference_kind: repo`, `repo`, `mirror_folder`, `last_build`; fold its root-cause story under Open Questions | judgment |
| Generated nodes typed `code`, `rationale`, `document`, `community` | `type: generated` per [[Generated Output Standard]] | mechanical, scripted |
| A hand-written note inside a generated folder | Move it out and give it its own family | judgment |
## Done Conditions
- The folder sits at `60_Claude/40_Project_Briefs/<RepoName>/` and nothing in it was hand-edited.
- An entry note exists from the template, with a dated health check.
- The three counts agree, or the gap is recorded as an Open Question.
- The entry note links to `GRAPH_REPORT.md`.
## Gold Standard Example
[[60_Claude/40_Project_Briefs/Graphify — Internship Research Loop Implementation]] records the root cause and cleanup of the Internship mirror. It predates the template, so it is the closest example, not a model of the headings.
