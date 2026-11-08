---
type: system
status: sprout
created: 2026-08-07
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: moc
tier: 1
maps_to:
  - "[[Folder MOC Template]]"
used_by: []
gold_standard: "[[10_Areas/AI/Setup/Conversation Map|Conversation Map]]"
notes:
  - "[[Dashboard Standard]]"
  - "[[HUMAN_WRITING]]"
---
# MOC Standard
==A MOC earns its name by explaining a folder in prose; a note that is only a query is a dashboard, not a map.==
This is the Standard for `type: index` notes: the map of a folder or cluster, anywhere in the vault except the course folders. It is not a dashboard ([[Dashboard Standard]]), and it is not a list of links. Whoever creates or substantially changes a note inside a MOC-governed folder updates that MOC in the same session, which is why a MOC has no Workflow.
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

| Item | Rule |
|---|---|
| Allowed folders | Any folder except `20_Progress/Degree/`, `40_Resources/UMN/`, and `10_Areas/Notes/`, where the course Boards live. |
| File name | The folder's subject plus `Map`, `MOC`, or `Board` (`Conversation Map`, `Contacts MOC`). Unique in the vault. |
| Kind | `type: index`, with `moc` in `tags`. |
| Status | `sprout` from the first save; `tree` once the Map covers every key note and the Status table is current. `active` is not a status. |
## Headings
### Frontmatter
- **Write:** `type: index`, `status`, dates, `tags` including `moc`, `notes` listing the folder's real key notes, and `next` for the one thing the cluster needs.
- **Length:** one line per key; `notes` lists every key note, not every note.
- **Never:** `notes: []` while the folder has notes worth mapping. An empty list leaves the MOC out of every backlink.
- **Right:** `next: Update this map after the pre-implementation postmortem and again when build B10 rewrites the conversation standards.`
- **Wrong:** None seen.
### Purpose
- **Write:** why the folder exists and who reads this first.
- **Length:** one to three sentences. If it takes more, split the folder.
- **Never:** "This is the MOC for X". That restates the title.
- **Right:** `Where everything about AI conversations lives: the raw archive, the scripts that fill it, the summaries meant to come out of it, and the reviews meant to check it.`
- **Wrong:** None seen.
### Map
- **Write:** prose that explains the key notes and how they relate, each link inside a sentence. Every note worth surfacing gets a sentence.
- **Length:** the bulk of the note; two to five paragraphs.
- **Never:** a bullet list of bare links. That is an index, not a map.
- **Right:** `[[Mentor Details'25]] holds who Ahnaf is, Senior Engineering Manager at Best Buy, matched through the CSE Mentor Program, and how to reach him.`
- **Wrong:** `- [[communities/community-04-lab-ui|Community 4: Lab UI]]`
### Status
- **Write:** optional. A table of current live state, only for a folder that tracks ongoing work, with the date it describes in the header.
- **Length:** two to eight rows.
- **Never:** a Status table that is not updated with the folder's changes. Delete it instead.
- **Right:** `| Capture, Acer Windows | Live; all 92 recent sessions captured |`
- **Wrong:** None seen.
### Dataview
- **Write:** optional. Live queries only, below the prose, never above it. Every `FROM` folder exists.
- **Length:** one query per question the Map does not already answer.
- **Never:** a `FROM` path to a folder that no longer exists. It shows an empty table and no error.
- **Right:** `FROM "10_Areas/Career/Internships/Contacts/Each One/Ongoing"`
- **Wrong:** `FROM "10_Areas/Career/Internships/Contacts/Each One/Come Back"`
### Links
- **Write:** optional. Links that did not fit the Map's sentences, kept short.
- **Length:** one to three sentences.
- **Never:** the place to introduce a key note; that note belongs in the Map.
- **Right:** `[[Notes Map]] lists what each individual note in these folders actually does.`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Purpose and Map appear in order and are not empty | A skill or query finds a section by name | Lint, check 2 |
| `notes` is a list of real notes, and every link resolves | A MOC with a dead link maps nothing | Lint, checks 1 and 3 |
| Every `FROM` folder in a Dataview block exists | Dataview shows a dead path as an empty table | Lint, check 3 (`dead-dataview-from`) |
| Dataview blocks sit below the prose | A query above the prose turns a map into a dashboard | Reader |
| The MOC is updated in the same session as the change that triggered it | A stale map is worse than none | Reader |
| A note that is only queries is typed `dashboard` | Query pages and prose maps are found by different questions | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Course Weekly Boards with only Map, Status, Dataview | Add a `## Purpose` sentence | Judgment |
| `status: active` (13 notes) | `tree` if the MOC is current, else `sprout` | Mechanical |
| No frontmatter (14 notes) | Add the keys above | Mechanical |
| `type: index` that is only queries (`Vault Health Dashboard`, `Claude Layer Index`) | `dashboard`, per [[Dashboard Standard]] | Mechanical |
| `type: index` Session Index or Tool Usage Rollup in `05_Clippings` | `type: generated`, `gen_kind: index` | Mechanical |
| Long reference docs typed `index` (`Tool Map`, `Every Week`) | The type that fits what the reader does with them | Judgment |
| `type: evergreen`, `tags: [moc]` | `index` | Mechanical |
## Done Conditions
- The Map is prose with inline links, and Dataview blocks sit below it.
- `notes:` lists real notes, and every link resolves.
- The MOC was updated in the same session as the change that triggered it.
- The note passes [[Vault Lint]] for the `moc` family.
## Gold Standard Example
[[10_Areas/AI/Setup/Conversation Map|Conversation Map]] passes lint: a three-sentence Purpose that says when to read it, a Map of paragraphs where every link sits inside a sentence, and a dated Status table.
Measured 2026-11-07 with `--family moc`: 42 notes, 7 pass. The failures are 27 with extra blank lines, 14 with no frontmatter, 13 with `status: active`, and 31 without a Purpose heading.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Conversation Map (gold) | `10_Areas/AI/Setup/` | Purpose, prose Map, dated Status | Nothing found |
| Notes Map | `10_Areas/AI/Setup/` | Passes lint | Not read for prose quality |
| Mentorship Board | `20_Progress/Mentorship Program/` | Purpose and a Map that explains each note | Blank lines inside the Program Reference section fail the hygiene check |
| Contacts MOC | `10_Areas/Career/Internships/Contacts/` | Queries per state | Two `FROM` folders that do not exist |
