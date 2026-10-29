---
type: system
status: sprout
created: 2026-08-07
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: moc
tier: 1
maps_to:
  - "[[MOC Template]]"
used_by: []
gold_standard: "[[Mentorship Board]]"
notes:
  - "[[Dashboard Standard]]"
  - "[[HUMAN_WRITING]]"
---
# MOC Standard
==A MOC earns its name by explaining a folder in prose; a note that is only a query is a dashboard, not a map.==
This is the Standard for `type: index` notes: the map of a folder or cluster, anywhere in the vault. Whoever creates or substantially changes a note inside a MOC-governed folder updates that MOC in the same session. A MOC has no Workflow for that reason. Query-only pages are [[Dashboard Standard]].
## Spec
```json
{
  "family": "moc",
  "tier": 1,
  "match": {"type": "index", "kind": null, "path": "^(?!20_Progress/Degree/|40_Resources/UMN/|10_Areas/Notes/)", "strict_path": true, "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["Purpose", "Map"],
  "optional_headings": ["Status", "Dataview", "Links"],
  "legacy_match": [
    {"path": "^10_Areas/Life/Plans/Plans Board\\.md$"},
    {"path": "MOC\\.md$", "where": {"type": "evergreen"}}
  ]
}
```
## Headings
### Frontmatter
`type: index`, `status` (`seed`, `sprout`, or `tree`), dates, `tags` including `moc`, `notes` listing the folder's real key notes, `next` for the one thing the cluster needs. A MOC with `notes: []` for good is an empty map.
> [!WARNING]
> `notes:` left empty while the folder has notes worth mapping.
### Purpose
One to three sentences: why the folder exists and who reads this first.
*Density:* short. If it takes more than three sentences, split the folder.
> [!WARNING]
> "This is the MOC for X". That restates the title; say why X exists.
### Map
The bulk of the note. Prose that explains the key notes and how they relate, with each link inside a sentence. Every note worth surfacing gets a sentence, not just a link.
> [!WARNING]
> A bullet list of bare `[[Note]]` links. That is an index, not a map.
### Status (optional)
A short table of current live state, only for a folder that tracks ongoing work. Update it in the same session as the folder's changes, or delete it.
### Dataview (optional)
Live queries only, below the prose, never above it. Skip a query that repeats what the Map says. Every `FROM` folder must exist ([[Dashboard Standard]]).

```dataview
TABLE status, updated
FROM "20_Progress/Mentorship Program"
SORT updated DESC
```
### Links (optional)
Relevant links that did not fit the Map's sentences, kept short.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Course Weekly Boards with only Map, Status, Dataview | Add a `## Purpose` sentence | judgment |
| `status: active` | `tree` if the MOC is current, else `sprout` | mechanical |
| `type: index` that is only queries (`Vault Health Dashboard`, `Claude Layer Index`) | `dashboard`, per [[Dashboard Standard]] | mechanical |
| `type: index` Session Index or Tool Usage Rollup in `05_Clippings` | `type: generated`, `gen_kind: index` | mechanical |
| Long reference docs typed `index` (`Tool Map`, `Every Week`) | The type that fits what the reader does with them | judgment |
| `type: evergreen`, `tags: [moc]` | `index` | mechanical |
## Done Conditions
- The Map is prose with inline links, and Dataview blocks sit below it.
- `notes:` lists real notes, and every link resolves.
- The MOC was updated in the same session as the change that triggered it.
## Gold Standard Example
[[Mentorship Board]]: a Purpose paragraph, a Map of sentences that each carry a link, a Status table, a Dataview block below the prose, and a short Links section.
