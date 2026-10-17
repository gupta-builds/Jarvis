---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: reference-resource
tier: 1
maps_to:
  - "[[Reference Template]]"
used_by:
  - "[[Promotion]]"
gold_standard: "[[40_Resources/Obsidian/Plugins/Dataview and Dashboards|Dataview and Dashboards]]"
notes:
  - "[[Evergreen Standard]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
---
# Reference Standard
==A reference note is something you look up to do the work, and the hub stays useful only because each entry was added on purpose.==
This is the standard for `type: reference` notes in `40_Resources/` and the tool hubs in `10_Areas/`: plugin documentation, settings records, tool profiles, link lists, and guides. It is the file for the Reference Standard and keeps the name `Resources` until a link-aware rename. Machine rebuild runbooks and tool setup records are separate families.
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
## Headings
Reference notes have no shared heading set; Plugins docs, tool profiles, and link lists differ too much to force one. The rules are about frontmatter and entry.
### Frontmatter
`type: reference`, `reference_kind` from the table below, `area` a wikilink list naming the `10_Areas` domain it serves, `notes` linking related references, `status: seed` until it has been used, and `tree` once relied on. Add `reviewed` (date) when a fact in it was re-checked.
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
The first lines say what the note is for and when to read it. A reader should know within three lines whether to keep reading.
> [!WARNING]
> A tool page that lists features without saying what this vault uses it for.
### Placement and promotion
One entry at a time, with a backlink to its `10_Areas` domain. An agent may propose a promotion from `20_Distilled_Notes` and never batch-write distillations into the hub. When a note is not clearly lookup material, it stays in the workshop and is flagged for review ([[Promotion]]).
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` under `40_Resources/Obsidian/Plugins` (18 notes) | `type: reference`, `reference_kind: plugin-doc` | mechanical |
| `type: evergreen` under `Obsidian/Settings` (3) | `reference_kind: settings-doc` | mechanical |
| `type: evergreen`, `input`, `concept` under `CS/AI` (15) | `reference_kind: tool-profile` | judgment for the `concept` and `project` ones |
| `CS/Links`, `CS/Repos` | `reference_kind: link-hub` | mechanical |
| `Capability/*` guides and AI role notes | `reference_kind: resource` | mechanical |
| No `area` key | Add the domain link | mechanical |
| Build logs in `CS/Concepts` (72 notes) | Not reference; they belong to a project folder | judgment, needs a yes |
## Done Conditions
- One entry was added, backlinked to its domain, with a stated reason it is lookup material.
- `reference_kind` and `area` are set and every link resolves.
- Nothing from `60_Claude/` was bulk-promoted.
- The note passes [[Vault Lint]] for `reference-resource`.
## Gold Standard Example
[[40_Resources/Obsidian/Plugins/Dataview and Dashboards|Dataview and Dashboards]]: states what it covers, how it is configured here, recipes, and failure modes. It still carries `type: evergreen`, lacks `reference_kind` and `area`, and two of its example queries read folders that no longer exist; the Legacy Shapes table covers the first two.
