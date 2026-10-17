---
type: system
status: sprout
created: 2026-06-01
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-week
tier: 1
maps_to:
  - "[[Week Template]]"
used_by:
  - "[[Weekly Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week - 4]]"
notes:
  - "[[Weekly Board Standard]]"
  - "[[Textbook Standard]]"
  - "[[Concept Standard]]"
---
# Weekly Standard
==A week note fuses the lecture and the textbook into one synthesis that resolves what each source leaves ambiguous. The synthesis section is the point, not an afterthought.==
This is the standard for a course week note: one note per week at `<Course>/Weekly/Week - N.md` (older courses keep it flat at the course root; the content rule is the same). The lecture gives the scenario and the application, the textbook gives the named frameworks and tests, and the synthesis states how they fit. The index that lists every week is the sub-board, covered by [[Weekly Board Standard]].
## Spec
```json
{
  "family": "course-week",
  "tier": 1,
  "match": {"type": "class", "kind": "week", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list"},
  "headings": ["What you must be able to do", "Key ideas (short)", "Concepts created today", "Examples worth keeping", "Lecture", "Textbook integration", "Takeaways (questions to resolve)", "Lecture-to-textbook synthesis", "Flashcards"],
  "optional_headings": [],
  "legacy_match": [
    {"type": "class", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"input_kind": "lecture"}, "absent": ["class_kind"]},
    {"type": "input", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"input_kind": "lecture"}}
  ]
}
```
## Headings
### Frontmatter
`class_kind: week`, `status: seed` to start, `area` linking the course Board and the matching textbook chapter, `tags: [class, lecture]`, and `next` pointing to the following week. Path-qualify ambiguous links, because every course has a `Week - 9`.
### What you must be able to do
Four to eight learning objectives as verbs the student must perform ("Distinguish...", "Apply..."), with the textbook chapter linked first.
> [!WARNING]
> Restating the topic title instead of listing testable abilities.
### Key ideas (short)
Three to six compressed claims, one line each, with the named concept and the key contrast word in bold. This is the short version of the Lecture section, not a second copy of it.
### Concepts created today
One to four wikilinks to concept notes this week produced. Each link resolves or is marked `(to create)`.
### Examples worth keeping
Three to six real lecture cases, with the entity in bold. Never invented examples.
### Lecture
The lecture's own structure as numbered `###` sections, with nested content indented by tab and `$...$` for notation. Reproduce it, do not compress it.
The user's live capture is protected source material. Organize around it and add links, but never delete, overwrite, or paraphrase away its uncertainty, and never replace it with an imagined transcript. Label `Pre-lecture source notes` and `Live lecture capture` so they stay distinguishable.
> [!WARNING]
> Collapsing ten lecture sections into one paragraph.
### Textbook integration
What the chapter adds beyond lecture, with the chapter linked. When the chapter is dense, use `###` sub-headings; optional sub-links to the course's applied tracks appear only where a real transfer exists.
*Density:* the delta, not a repeat of the lecture.
### Takeaways (questions to resolve)
Two to five genuine open questions as `- [ ]` tasks, never prose.
### Lecture-to-textbook synthesis
==The section that makes a week note good.== One `==definition anchor==` highlight, then `*Mechanism:*`, the lecture example, the textbook connection, the concept links, a `> [!WARNING]` with the common confusion, and a `> [!SUMMARY]` of what the week is about in one sentence.
> [!WARNING]
> Skipping the section, or using more than one highlight in it.
### Flashcards
Three to five or more cards on `#cards/<course-slug>` that test distinctions and mechanisms. In the card section, bold only the term meant to be hidden.
### Sources and strictness
Every example, number, and claim has a source anchor or an `Inferred` or `Unresolved` label. When live capture disagrees with the textbook, keep both as source-attributed conflicts until verified.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `Key ideas (textbook)`, `Key ideas (readings)`, `Key ideas` | `Key ideas (short)`; textbook-sourced items go to Textbook integration | Judgment |
| `Concepts created / updated today`, `Concept notes` | `Concepts created today` | Mechanical rename |
| `Labs / Projects`, domain-link headings | `###` under Textbook integration or Examples worth keeping | Judgment |
| `Self-check`, `Midterm Check`, `Closed-note understanding check` | Takeaways as `- [ ]` tasks | Judgment |
| No synthesis section (about 47 of 78 notes) | Add `Lecture-to-textbook synthesis` from the note's own lecture and chapter | Judgment |
| `input_kind: lecture` | `class_kind: week` | Mechanical |
| `tags: ["#class", "#Lecture"]` | `tags: [class, lecture]` | Mechanical |
| Template body left unfilled, a `Gold standard:` line, or a second copy of the template appended | Delete the unfilled copy; keep only written content | Mechanical |
| `type: concept` with `input_kind: lecture` (BIOL Theme notes) | `type: class`, `class_kind: week` | Judgment |
## Done Conditions
- The lecture is captured section by section, and the textbook integration states only the delta.
- The synthesis section has one highlight, a WARNING, and a SUMMARY.
- Objectives, ideas, examples, and concept links are real and verified.
- Takeaways are `- [ ]` tasks and the cards are on the right deck.
- No unfilled template text or appended template copy remains.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week - 4]]: all nine headings filled in the current shape, including the synthesis section.
