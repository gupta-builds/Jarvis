---
type: system
status: sprout
created: 2026-10-15
updated: 2026-11-07
tags:
  - system
  - standards
  - graphify
system_kind: standard
family: graphify-note
tier: 1
maps_to:
  - "[[Graphify Repo Map Template]]"
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
This Standard covers the one human-written entry note that wraps each graphify export, and the ownership rules around the folder. The generated files themselves are Tier 3 ([[Generated Output Standard]]). It does not teach Graphify: commands, the three-pass pipeline, and hook behavior are in [[Graphify Workflow]] and [[How to use Graphify]].
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

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/40_Project_Briefs/`, outside the generated mirror folder `60_Claude/40_Project_Briefs/<RepoName>/`. |
| File name | `Graphify` plus the repo's name. Unique in the vault. |
| Kind | `type: reference` with `reference_kind: repo`. |
| Status | `sprout` once the first health check is recorded, `tree` after two agreeing checks, `archived` when the mirror is dropped. |
## Headings
### Frontmatter
- **Write:** `reference_kind: repo`, `repo`, `mirror_folder`, `last_build` (a date), `notes`.
- **Length:** one line per key.
- **Never:** `type: evergreen`. The existing entry note is typed that way and fails the family.
- **Right:** None yet.
- **Wrong:** `type: evergreen`
### Source
- **Write:** the repo path, what it contains, and why it was mapped.
- **Length:** two or three sentences.
- **Never:** graphify's commands. They are in the procedure notes.
- **Right:** None yet.
- **Wrong:** None seen.
### Mirror
- **Write:** the folder path, marked graphify-owned, and a link to its `GRAPH_REPORT`. Other notes link to `GRAPH_REPORT.md` and the entry note, not to individual node files.
- **Length:** two lines.
- **Never:** a hand edit inside the folder: a rebuild may prune or overwrite it.
- **Right:** None yet.
- **Wrong:** None seen.
### Last Build
- **Write:** the date, the command used, and whether docs or PDFs changed since (those need a full update).
- **Length:** two or three lines.
- **Never:** a build date with no command.
- **Right:** None yet.
- **Wrong:** None seen.
### Health Check
- **Write:** a dated table with three counts: the folder's real `.md` count, the manifest's tracked-file count, and `graph.json`'s node count. A real gap means orphans accumulated. Add a row every time the check runs.
- **Length:** one row per check.
- **Never:** assuming lint and curator tools skip the folder; confirm it. The Internship mirror once held about 350 orphaned notes with junk names, found only by the manual check.
- **Right:** None yet.
- **Wrong:** None seen.
### Open Questions
- **Write:** count gaps or doubts, as `- [ ]` tasks.
- **Length:** one sentence each.
- **Never:** a root-cause story; that belongs in the entry note's body or a log.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Graphify owns the mirror folder; nobody hand-edits inside it | A rebuild overwrites the edit | Reader |
| The entry note is human-owned, one per mirror, outside the generated folder | A note inside the folder is pruned by a rebuild | Reader |
| The mirror folder is `60_Claude/40_Project_Briefs/<RepoName>/` and holds no hand-written notes | A hand-written note in a zone is mistaken for generated output | Reader |
| The entry note's counts are taken from a dated health check | The three counts disagree when orphans accumulate | Reader |
| The entry note links to `GRAPH_REPORT.md` | It is the one navigable summary | Lint, check 3 (when linked) |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| The Internship implementation note, written before the template | Add `type: reference`, `reference_kind: repo`, `repo`, `mirror_folder`, `last_build`; fold its root-cause story under Open Questions | Judgment |
| Generated nodes typed `code`, `rationale`, `document`, `community` | `type: generated` per [[Generated Output Standard]] | Mechanical, scripted |
| A hand-written note inside a generated folder | Move it out and give it its own family | Judgment |
## Done Conditions
- The folder sits at `60_Claude/40_Project_Briefs/<RepoName>/` and nothing in it was hand-edited.
- An entry note exists from the template, with a dated health check.
- The three counts agree, or the gap is recorded as an Open Question.
- The entry note links to `GRAPH_REPORT.md`.
- The note passes [[Vault Lint]] for `graphify-note`.
## Gold Standard Example
[[60_Claude/40_Project_Briefs/Graphify — Internship Research Loop Implementation]] records the root cause and cleanup of the Internship mirror. It does not pass lint and is not a model of the headings: it predates the template, is typed `evergreen`, and lacks `reference_kind`, `repo`, `mirror_folder`, `last_build`, and the five headings.
Measured 2026-11-07 with `--family graphify-note`: 1 note, 0 pass. No real note follows the five headings, so most Right lines above are "None yet".
