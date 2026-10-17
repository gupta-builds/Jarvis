---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to:
  - "[[Standard Template]]"
  - "[[Workflow Template]]"
used_by:
  - "[[Building a Note Kit]]"
gold_standard: none
notes:
  - "[[Frontmatter Standard]]"
  - "[[Conformance Standard]]"
  - "[[Note Type Registry]]"
---
# Note Kit Standard
==A note kit is one Standard, one Template, and a Workflow only when the process repeats. It is written from real notes of that family, and it must be able to upgrade the old ones.==
This is the standard for the files in `30_Order` themselves. It exists because the first generation of Standards was written after the notes (39 of 46 in September), described only the newest notes, and left 74% of the vault without a Standard. A kit that cannot be measured, or cannot upgrade an old note, is not finished.
## The contract
- One family, one kit. The family id is kebab-case and has a row in [[Note Type Registry]] before any file is written.
- The Standard owns the rules, the Template owns the shape, the Workflow owns the process. No instruction prose in a Template. No steps in a Standard.
- Read at least two real notes of the family first. If none exist, the registry marks the kit `planned` and names the first note that will use it. No Standard for a family with no notes.
- Correct a rule by replacing it. A Standard never carries addenda, dated changelogs, or incident stories. History goes in the session log.
- A Standard stays under 700 words of prose, not counting the Spec block and tables. Over that, split the family.
## Standard anatomy
Frontmatter keys: `type: system`, `status`, `created`, `updated`, `tags`, `system_kind: standard`, `family`, `tier` (family Standards only), `maps_to`, `used_by`, `gold_standard`. `maps_to` and `used_by` are lists of wikilinks, empty if none. `gold_standard` is a wikilink to a note that exists, or `none`.
Body order for a family Standard: the title, one `==` anchor sentence, up to three sentences of scope, then these headings in order: `Spec`, `Headings`, `Legacy Shapes`, `Done Conditions`, `Gold Standard Example`. A policy Standard (`family: policy`) is free-form but ends with `Done Conditions` and `Gold Standard Example`.
Each entry under `Headings` says what the section holds and its density, then at most one `> [!WARNING]` naming a failure seen in a real note.
## Spec block
Under `## Spec`, one fenced `json` block per family. The linter reads it, so it must parse.
```json
{
  "family": "course-concept",
  "tier": 1,
  "match": {"type": "concept", "kind": null, "path": "^20_Progress/Degree/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["One-Line Answer", "Mechanism"],
  "optional_headings": ["Flashcards"]
}
```
`match.kind` is the value of the type's `*_kind` key. `where` and `where_not` compare other frontmatter keys. `match.path` is the allowed folder: a note of the right type in the wrong folder fails the placement check instead of vanishing as unmapped. `headings` are `##` titles, required and in order. Key types are `date`, `number`, `list`, `text`, `bool`, `wikilink`.
`legacy_match` is an optional list that recognizes older notes of the family, such as `{"type": "class", "path": "^20_Progress/Degree/", "where": {"input_kind": "lecture"}, "absent": ["class_kind"]}`. A note found this way is scored on every check except mapping, which it fails as `legacy-shape`. That shows how far it is from fit and which upgrade it needs.
## Template anatomy
- Every required key is present. Predictable values are filled (`status: sprout`). Dates use `<% tp.date.now("YYYY-MM-DD") %>`; `{{date}}` is not allowed. A value never lists choices (`a | b | c`).
- The title is `# <% tp.file.title %>`. Each spec heading follows in order with exactly one `<!-- -->` line of at most 140 characters saying what goes there.
- No example prose, no `== ==`, no `[[ ]]`, no empty list stubs, no gold-standard link. Examples belong in the Standard.
- File name `X Template.md` (or `X.md` inside a `Templates/` subfolder), paired with `X Standard.md`.
## Workflow anatomy
Frontmatter adds `serves` (wikilink to the Standard) and `trigger` (one line). Body headings: `Use when`, `Steps` (numbered, at most nine), optional `Do not`, `Done when`. Under 350 words. Name the skill, command, or agent that automates a step.
## Legacy Shapes
Every family Standard with existing notes carries a table: old shape, new shape, and whether the move is mechanical or needs judgment. Without it, [[Conformance on Touch]] has nothing to apply.
## Names
No two files in `30_Order` share a name, because wikilinks resolve by name. `X Standard`, `X Template`, `X Workflow` use the same X where practical.
## Spec
```json
{
  "family": "family-standard",
  "tier": 1,
  "match": {"type": "system", "kind": "standard", "path": "^30_Order/Standards/", "where": {}, "where_not": {"family": "policy"}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "system_kind", "family", "tier", "maps_to", "used_by", "gold_standard"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "maps_to": "list", "used_by": "list", "tier": "number"},
  "headings": ["Spec", "Headings", "Legacy Shapes", "Done Conditions", "Gold Standard Example"],
  "optional_headings": []
}
```
```json
{
  "family": "policy-standard",
  "tier": 1,
  "match": {"type": "system", "kind": "standard", "path": "^30_Order/Standards/", "where": {"family": "policy"}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "system_kind", "family", "maps_to", "used_by", "gold_standard"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "maps_to": "list", "used_by": "list"},
  "headings": ["Done Conditions", "Gold Standard Example"],
  "optional_headings": []
}
```
```json
{
  "family": "system-guide",
  "tier": 2,
  "match": {"type": "system", "kind": "guide", "path": "^30_Order/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "system_kind"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": [],
  "optional_headings": []
}
```
```json
{
  "family": "workflow",
  "tier": 1,
  "match": {"type": "system", "kind": "workflow", "path": "^30_Order/Workflows/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "system_kind", "serves", "trigger"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Use when", "Steps", "Done when"],
  "optional_headings": ["Do not"]
}
```
## Done Conditions
- The family has a registry row, and the row names a Template and Workflow or says `none`.
- The Standard parses (its Spec block is valid JSON), names a Gold Standard Example that exists, and has a Legacy Shapes table.
- The Template, filled with nothing, shows exactly the spec's keys and headings and no example prose.
- No file in `30_Order` is empty, and no two share a name.
## Gold Standard Example
None. A policy has no instance. The first family Standards written under it are the ones in [[Note Type Registry]] marked `built`.
