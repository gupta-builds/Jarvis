---
type: system
status: sprout
created: 2026-10-15
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: reference-resource
tier: 1
maps_to:
  - "[[Reference Guide Template]]"
used_by:
  - "[[Promotion]]"
gold_standard: "[[10_Areas/Career/VISAs & Work Auth/CPT Program|CPT Program]]"
notes:
  - "[[Evergreen Standard]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
---
# Reference Standard
==A reference note is something you look up to do the work, and the hub stays useful only because each entry was added on purpose.==
This is the Standard for `type: reference` notes in `40_Resources/` and the tool hubs and domain guides in `10_Areas/`: plugin documentation, settings records, tool profiles, link lists, and guides. It is not a distilled note ([[Evergreen Standard]]), not a machine rebuild runbook ([[Machine Runbook Standard]]), and not a tool setup record ([[Tool Setup]]).
## Spec
```json
{
  "family": "reference-resource",
  "tier": 1,
  "match": {"type": "reference", "kind": null, "path": "^(40_Resources|10_Areas)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "reference_kind", "area", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list", "notes": "list"},
  "headings": [],
  "optional_headings": ["Sources"],
  "legacy_match": [{"path": "^40_Resources/(Obsidian|Capability)/"}, {"type": "evergreen", "path": "^40_Resources/CS/(AI|Links|Repos)"}, {"path": "^10_Areas/(AI|Trading)/"}]
}
```

| Item | Rule |
|---|---|
| Allowed folders | `40_Resources/` or `10_Areas/`, with a backlink to the `10_Areas` domain it serves. |
| File name | What the note is about (`CPT Program`, `Dataview and Dashboards`). Unique in the vault. |
| Kind | `type: reference` with `reference_kind` from the table below. |
| Status | `seed` until it has been used. `sprout` once relied on in work. `tree` once a fact in it was re-checked (`reviewed` holds the date). |
## Headings
Reference notes have no shared heading set; plugin docs, tool profiles, and guides differ too much to force one. The rules are about frontmatter and the opening.
### Frontmatter
- **Write:** `type: reference`, `reference_kind` from the table, `area` as a list naming the domain it serves, `notes` linking related references. Add `reviewed` (date) when a fact was re-checked.
- **Length:** one line per key.
- **Never:** `type: evergreen` on a lookup note. It then sorts with the notes you study, not the ones you look up.
- **Right:** `reference_kind: resource`
- **Wrong:** `type: evergreen`

| `reference_kind` | Holds |
|---|---|
| `plugin-doc` | How a plugin is configured and used in this vault |
| `settings-doc` | A record of Obsidian or tool settings and why |
| `tool-profile` | What a tool is, installed state, how this vault uses it |
| `link-hub` | A curated list of links or repos |
| `resource` | A guide, definition set, or cheat sheet |
| `research` | A dossier with sources |
| `diagram` | An Excalidraw or canvas explainer |
### Opening
- **Write:** the first lines say what the note is for and when to read it, so a reader knows within three lines whether to keep reading.
- **Length:** one to three sentences.
- **Never:** a tool page that lists features without saying what this vault uses it for.
- **Right:** `Curricular practical training is the work permission that used to make a summer internship simple for an F-1 student, and in 2026 it is the one most disrupted.`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `reference_kind` and `area` are set and every link resolves | A reference is found by kind and domain | Lint, checks 1 and 3 |
| One entry is added at a time, with a backlink to its `10_Areas` domain and a stated reason it is lookup material | The hub stays useful only if each entry was chosen | Reader |
| An agent may propose a promotion from `20_Distilled_Notes` and never batch-writes distillations into the hub | Bulk promotion floods a curated hub | Reader |
| When a note is not clearly lookup material it stays in the workshop and is flagged ([[Promotion]]) | Reference is for stable material | Reader |
| Every `FROM` path in a Dataview example exists | A dead path looks like an empty answer | Lint, check 3 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` under `40_Resources/Obsidian/Plugins` (16 notes) | `type: reference`, `reference_kind: plugin-doc` | Mechanical |
| `type: evergreen` under `Obsidian/Settings` | `reference_kind: settings-doc` | Mechanical |
| `type: evergreen`, `input`, `concept` under `CS/AI` | `reference_kind: tool-profile` | Judgment for the `concept` and `project` ones |
| `CS/Links`, `CS/Repos` | `reference_kind: link-hub` | Mechanical |
| `Capability/*` guides and AI role notes | `reference_kind: resource` | Mechanical |
| No `area` key | Add the domain | Mechanical |
| Build logs in `CS/Concepts` | Not reference; they belong to a project folder | Judgment, needs a yes |
## Done Conditions
- One entry was added, backlinked to its domain, with a stated reason it is lookup material.
- `reference_kind` and `area` are set and every link resolves.
- Nothing from `60_Claude/` was bulk-promoted.
- The note passes [[Vault Lint]] for `reference-resource`.
## Gold Standard Example
[[10_Areas/Career/VISAs & Work Auth/CPT Program|CPT Program]] passes lint: `reference_kind: resource`, `area`, a `reviewed` date, ten related notes, and an opening that says what the note holds and what changed.
Measured 2026-11-07 with `--family reference-resource`: 118 notes, 35 pass. The 25 notes in `VISAs & Work Auth/` are the largest group.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| CPT Program (gold) | `10_Areas/Career/VISAs & Work Auth/` | Kind, area, reviewed, plain opening | Nothing found |
| Dataview and Dashboards | `40_Resources/Obsidian/Plugins/` | What it covers, how it is configured here, recipes | `type: evergreen`, no `reference_kind` or `area`, one dead link, two dead `FROM` paths, 54 extra blank lines |
