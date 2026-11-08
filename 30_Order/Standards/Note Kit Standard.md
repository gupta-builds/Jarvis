---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
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
==A note kit is one Standard, one Template, and a Workflow only when the process repeats. The Standard is the one note an AI follows to write that note type correctly, and it must be able to upgrade the old notes.==
This is the standard for the files in `30_Order` themselves. The first generation of Standards was written after the notes, described only the newest ones, and left most of the vault without a Standard. A kit that cannot be measured, or cannot upgrade an old note, is not finished.
## The contract
| Rule | Why | Enforced by |
|---|---|---|
| One family, one kit. The family id is kebab-case and has a row in [[Note Type Registry]] before any file is written | The Registry is the one index of what the vault holds | Kit |
| The Standard says what the note is and every rule. The Template owns the shape. The Workflow owns when to make it, where it goes, and how it closes. No instruction prose in a Template, no steps or triggers in a Standard | An AI that follows only the Standard and its Template should produce a note that passes lint; steps change faster than rules | Reader |
| Read at least two real notes of the family first. If none exist the Registry marks the kit `planned` and names the first note that will use it | A Standard written from imagination describes nothing | Reader |
| Correct a rule by replacing it. No addenda, dated changelogs, or incident stories; history goes in the session log | A Standard with layers cannot be followed | Reader |
| At most 180 words per `###` entry (table rows not counted) and 2000 words per Standard (tables counted; the Spec block and comments are not) | An entry must fit five bullets, and tables must not become a place to hide content | Kit |
| One term for one thing: Spec, Headings, Legacy Shapes, Done Conditions, Gold Standard Example, family, kit | An AI treats two words as two things | Reader |
## Standard anatomy
Frontmatter keys: `type: system`, `status`, `created`, `updated`, `tags`, `system_kind: standard`, `family`, `tier` (family Standards only), `maps_to`, `used_by`, `gold_standard`. `maps_to` and `used_by` are lists of wikilinks, empty if none. `gold_standard` is a wikilink to a note that exists, or `none`.
Body order for a family Standard: the title, one `==` anchor sentence, up to three sentences of scope that say what the note is and what it is not, then exactly these headings in order: `Spec`, `Headings`, `Legacy Shapes`, `Done Conditions`, `Gold Standard Example`. No other `##` heading, because the Template and the linter expect these five. A policy Standard (`family: policy`) is free-form but states its rules in a Rules table, gives an example for every rule that needs judgment, and ends with `Done Conditions` and `Gold Standard Example`.
### Identity table
Under the Spec block, a table with four rows: Allowed folders, File name, Kind, Status. It says in words what the linter cannot see (naming and the status lifecycle) and what it reads (folder and kind), so the reader does not decode a regular expression.
### Entry contract
Under `Headings`, the first entry is `Frontmatter`, then one entry per spec heading in order, then `Rules`. Sections that follow one pattern, such as seven query sections on one page, may share one entry that names them. Every entry except Rules has five bullets in this order:
- **Write:** what the section holds.
- **Length:** a number of sentences, bullets, or words, never "short".
- **Never:** what stays out, with the reason and the real note where the failure was seen. It replaces the `> [!WARNING]` callout.
- **Right** and **Wrong:** one line each, in backticks, quoted word for word from a real note. The Wrong line is a real failure. If no real note has shown that failure, write "None seen" for Wrong; if the family has no real note yet, write "None yet" for both and say so under Gold Standard Example.
### Rules entry
A table with three columns. Rule. Why (one clause). Enforced by: `Lint, check N` (numbers from [[Conformance Standard]]), `Kit` (`node vault-lint.js --kit`), or `Reader`. A rule only a reader can check is still a rule; the column says so.
### Gold Standard Example
A link to one note that exists and passes lint, and one sentence on why it qualifies. When no note passes, say what is missing and never edit a note to make it pass. Then a table of the family's notes with Folder, Strength, and Lacks, and the date and command of the count, because counts drift.
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
| Field | Meaning |
|---|---|
| `match.kind` | Value of the type's `*_kind` key |
| `match.where`, `match.where_not` | Equality tests on other frontmatter keys |
| `match.path` | Allowed folder (regex). A note of the right type in the wrong folder fails placement instead of vanishing as unmapped |
| `match.strict_path` | `true` means the Spec matches only inside `match.path`, so a stray note of the same type is not claimed |
| `headings` | `##` titles, required and in order. An empty list means the family's headings are not enforced on notes |
| `optional_headings` | `##` titles a note may carry. They keep the Template check clean and are not enforced on notes |
| `key_types` | `date`, `number`, `list`, `text`, `bool`, `wikilink`; a `?` suffix (`"date?"`) means the key must exist but may be blank |
| `legacy_match` | Optional list recognizing older notes, such as `{"type": "class", "path": "^20_Progress/Degree/", "where": {"input_kind": "lecture"}, "absent": ["class_kind"]}`. A note found this way is scored on every check except mapping, which it fails as `legacy-shape` |
| `skip_checks` | Check numbers from [[Conformance Standard]] that do not apply, such as `[5]` for raw machine exports. Machine-written families only; say why in the Standard |
| `template` | The Template file a Spec belongs to, when a Standard holds several Specs |
## Template anatomy
- Every required key is present, plus the base keys of [[For Everything]] (`notes`, `next`) when the Spec does not require them. Predictable values are filled (`status: sprout`). Dates use `<% tp.date.now("YYYY-MM-DD") %>`; `{{date}}` is not allowed. A value never lists choices (`a | b | c`).
- The title is `# <% tp.file.title %>`. Each spec heading follows in order with exactly one `<!-- -->` line of at most 140 characters saying what goes there.
- No example prose, no `== ==`, no `[[ ]]`, no empty list stubs other than `notes: []`, no gold-standard link. Examples belong in the Standard.
- File name `X Template.md` (or `X.md` inside a `Templates/` subfolder), paired with `X Standard.md`.
## Workflow anatomy
Frontmatter adds `serves` (wikilink to the Standard) and `trigger` (one line). Body headings: `Use when`, `Steps` (numbered, at most nine), optional `Do not`, `Done when`. Under 350 words. Name the skill, command, or agent that automates a step. A Workflow does not repeat a Standard rule and does not add its own session-log line: [[Memory Management]] owns that.
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
- The family has a Registry row, and the row names a Template and Workflow or says `none`.
- The Standard parses (its Spec block is valid JSON), names a Gold Standard Example that exists, and has a Legacy Shapes table.
- Every entry under Headings has the five bullets, each Right and Wrong line is found word for word in a real note, and no entry or Standard passes the word limits.
- Every rule in the Rules table has a reason and an Enforced by value.
- The Template, filled with nothing, shows exactly the spec's keys and headings and no example prose.
- No file in `30_Order` is empty, and no two share a name.
## Gold Standard Example
None. A policy has no instance. [[Brief Standard]] is the reference implementation of a family Standard written to this anatomy.
