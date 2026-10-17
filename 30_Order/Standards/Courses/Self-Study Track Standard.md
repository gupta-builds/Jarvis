---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-track
tier: 1
maps_to:
  - "[[Track Template]]"
used_by: []
gold_standard: "[[20_Progress/Degree/_Courses/ML Engineer/ML Engineer|ML Engineer]]"
notes:
  - "[[Degree Control Standard]]"
  - "[[Technical Interview Workflow]]"
  - "[[Preparation Standard]]"
---
# Self-Study Track Standard
==A track note is the hub of a study path outside the degree: it says what the path is, why it was chosen, what resources it uses, and what has been checked.==
This is the standard for the hub note of one non-degree study track in `20_Progress/Degree/_Courses/` (`class_kind: track`): AI Associate Engineer, ML Engineer, System Design, Cloud Architect, Technical Interview, and the GitHub course. The folders under a track hold its own notes (course maps, preparation, concept and problem notes), which follow their own families. The track's course-specific production plan is [[Technical Interview Workflow]] for that track.
## Spec
```json
{
  "family": "course-track",
  "tier": 1,
  "match": {"type": "class", "kind": "track", "path": "^20_Progress/Degree/_Courses/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list", "deadline": "date"},
  "headings": ["What This Is", "Resources", "Verification Notes"],
  "optional_headings": ["Why This One", "Study Plan", "Relation to _Courses Board"],
  "legacy_match": [
    {"type": "class", "path": "^20_Progress/Degree/_Courses/([^/]+)/\\1\\.md$"}
  ]
}
```
## Headings
### Frontmatter
`class_kind: track`, `status: seed` while the path is being scoped, `sprout` once the plan has dates. `notes` links the `_Courses Board` and the plan it serves. `deadline` only when a source or a self-set exam date exists. `tags: [class, track]`.
### What This Is
The path in a paragraph: the provider, the curriculum or exam it leads to, and the size of the work. Chapter-level curriculum can follow under `###` headings.
### Resources
The course pages, videos, repos, and practice sets the track actually uses, as links.
### Verification Notes
What was checked against the provider's own pages, and when. Dates, costs, and exam objectives are claims about an outside source, so they carry a check date.
> [!WARNING]
> Exam objectives copied from memory. Read them from the provider's page and date the check.
### Optional headings
`Why This One` states the choice against alternatives. `Study Plan` gives dated weeks. `Relation to _Courses Board` says where the track sits among the others.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: class` with no `class_kind` | `class_kind: track` | Mechanical |
| `What This Is (So Far)` | `What This Is` | Mechanical |
| Technical Interview hub (`Governing syllabus`, `Course goals and prerequisites`, `Standard delivery and topic sequence`) | Add `What This Is` over those sections, `Resources` over `Course and preparation files`, and `Verification Notes` over its source checks | Judgment |
| Sibling notes (`Course Map`, `DSA`, `Problems Solver`, `Preparation & Sources`, `CSCI 4041 Relation`) | Not track hubs; they follow their own families | None |
| GitHub course note with no frontmatter | Add the frontmatter above | Mechanical |
## Done Conditions
- The note answers what the path is, which resources it uses, and what was verified and when.
- Dated claims about outside providers carry a check date.
- `next` names the single next action for the track.
- The note passes [[Vault Lint]] for `course-track`.
## Gold Standard Example
[[20_Progress/Degree/_Courses/ML Engineer/ML Engineer|ML Engineer]]: What This Is, Why This Combo, Resources, and Verification Notes. It has no `class_kind` yet, which the Legacy Shapes table adds.
