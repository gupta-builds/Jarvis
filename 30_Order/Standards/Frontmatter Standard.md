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
maps_to: []
used_by:
  - "[[Conformance on Touch]]"
gold_standard: none
notes:
  - "[[Note Kit Standard]]"
  - "[[Conformance Standard]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
---
# Frontmatter Standard
==One closed vocabulary decides every note's `type` and `status`. Anything finer is a `*_kind` key, anything pipeline-specific is a scoped key, and nothing else becomes a new value.==
This is the canonical schema for note properties in Jarvis. Before it, the type and status lists lived in CLAUDE.md, Vault Operating System, and the templates, and the three disagreed (8, 12, and about 20 types, against 40+ in the notes). Vault Operating System now points here. A property that matters to one family only is defined in that family's Standard, not in this file.
## type
Seventeen values. A note has exactly one.

| type | What it is | Kind key | Allowed kinds |
|---|---|---|---|
| `input` | Captured or source-derived: a clip, summary, transcript, brief | `input_kind` | clipping, source-summary, pdf-summary, web-summary, video-summary, repo-card, transcript, brief, ai-conversation, ai-conversation-summary, job-dossier |
| `evergreen` | Distilled claim you understand and reuse | `evergreen_kind` | distilled, synthesis, identity |
| `concept` | One course or technical concept with mechanism and contrast | none | none |
| `class` | A course workspace note (week, lab, board, textbook) | `class_kind` | week, textbook, textbook-map, lab, homework, exam, exam-material, board, subboard, discussion, preparation, project, syllabus, control, track, audit |
| `project` | Active work with an outcome and a `next:` | `project_kind` | project, spec, plan, code-mirror, prompt |
| `plan` | A standing plan with a review cadence | none | none |
| `thought` | Personal working notes: daily, weekly, reflection | `thought_kind` | daily, weekly, monthly, yearly, reflection, brainstorm |
| `index` | A MOC: prose map of a folder | none | none |
| `dashboard` | A live query surface or board | `dashboard_kind` | dashboard, board, habit-board, field-os, depth-ladder, question-bank |
| `review` | A periodic or one-off review of work | `review_kind` | weekly, monthly, capability, internship-loop, ops, audit, curator, project |
| `output` | A deliverable made from understanding | `output_kind` | story, bullet, one-pager, prompt, post, resume, cover-letter |
| `action` | A link-dense map of next steps | none | none |
| `tracker` | One application or item moving through stages | none | none |
| `contact` | A person | none | none |
| `reference` | Stable lookup material | `reference_kind` | tool-profile, resource, plugin-doc, settings-doc, runbook, research, repo, program, company, diagram, link-hub |
| `system` | The vault's own rules, logs, and operating docs | `system_kind` | standard, workflow, contract, spec, log, runbook, guide |
| `generated` | Written by a tool, not by a person or an agent | `gen_kind` | code, rationale, document, community, index, report |
If two types seem to fit, pick by what the reader does with the note: studies it (`concept`, `evergreen`), executes it (`project`, `plan`, `tracker`), looks it up (`reference`), or follows it (`system`).
## status
One axis only. Maturity for knowledge, lifecycle for work.

| type | Allowed status | Default |
|---|---|---|
| `input`, `concept`, `evergreen`, `index`, `output`, `reference` | seed, sprout, tree, archived | seed |
| `class` | seed, sprout, tree, archived | seed |
| `thought` | seed, sprout, active, complete | seed (`active` for daily) |
| `project`, `plan`, `tracker`, `action` | active, paused, complete, archived | active |
| `contact` | active, paused, archived | active |
| `dashboard` | active, archived | active |
| `review` | seed, sprout, tree, complete | sprout |
| `system` | seed, sprout, tree, archived | sprout |
| `generated` | no `status` | none |
`seed` is a rough capture, `sprout` a working draft, `tree` trusted and stable. A maturity value moves up only when the note earns it. Never invent a status such as `raw`, `unreviewed`, `Preparing`, or `stale`; the next two keys exist for those.
## Machine and pipeline states
- `review_state: raw | unreviewed | reviewed` records whether a human or agent has checked a captured or generated note. It replaces `raw`, `unreviewed`, and `auto-generated` in `status`.
- `stage` holds a pipeline position such as `applied` or `interview`. It is owned by the Standard of the pipeline that uses it (the internship Standards), and its values are listed there.
## Universal keys
Required on every Tier 1 and Tier 2 note. Tier rules are in [[Conformance Standard]].

| Key | YAML type | Rule |
|---|---|---|
| `type` | text | One of the seventeen above |
| `status` | text | Allowed value for the type |
| `created` | date | `YYYY-MM-DD`, set once |
| `updated` | date | `YYYY-MM-DD`, set on a meaningful change only |
| `tags` | list | No `#`, no folder replicas; `[]` is allowed |
Optional everywhere: `notes` (list of wikilinks), `next` (text), `area`, `source_url`, `deadline` (date), `reviewed` (date), `track` (list), `source_status`, `related_progress`. The capability keys (`prerequisites`, `used_in`, `evidence`, `mastery_level`, `next_drill`, `drill_interval`, `question_status`, `source_concepts`) apply to the families that define them.
## YAML typing rules
- Numbers are bare: `mastery_level: 0`, never `"0"`. A quoted number turns into text in Properties and sorts as text in Dataview.
- Dates are bare ISO: `created: 2026-10-16`. A quoted date breaks date sorting the same way.
- Wikilinks are quoted strings: `"[[Note]]"`. Lists of them use one quoted item per line.
- Empty relational fields are `[]`. Empty scalars are left blank, never `""`.
- Keys are `snake_case` with no spaces or parentheses. No duplicate keys. `---` appears only twice in a file, to open and close the frontmatter.
- Files are UTF-8, LF, with no byte-order mark.
- Every wikilink in frontmatter points at a file that exists. A stub belongs in the body, labeled `(to create)`.
## Scoped keys
A key defined by one family stays in that family. Examples: `deadline_posted`, `matched_reason`, `result` (internship notes), `decision_count` (conversation summaries), `tools_used` (Claude Code exports), `generator` and `source` (generated notes). Dormant today: `enrichment_status` and `enrichment_level` are defined by the Enrichment workflow and no note uses them. Add them only while running that workflow.
## Legacy values
When a session touches an old note it replaces these. See [[Conformance on Touch]].

| Old | New |
|---|---|
| `type: code`, `rationale`, `document`, `community` | `type: generated` with `gen_kind` set to the old value and a `generator` |
| `type: note`, `research`, `paper`, `research-dossier`, `project-brief` | `reference` or `input` with a kind |
| `type: ai`, `brainstorm` | `thought` with `thought_kind`, or `reference` for tool profiles |
| `type: session`, `session-recap`, `decision-log`, `log` | `system` with `system_kind: log` |
| `type: runbook`, `subsystem`, `subagent`, `codebase-map`, `prompt` | `system` or `reference` or `project`, chosen by what the reader does |
| `type: template` or a 30_Order note typed `evergreen` | `system` with `system_kind` |
| `status: raw`, `unreviewed`, `auto-generated` | remove; set `review_state` |
| `status: seedling` | `seed` |
| `status: mature`, `evergreen`, `promoted`, `static`, `living`, `current` | `tree` |
| `status: removed`, `dead`, `retired`, `stale` | `archived` |
| `status: completed` | `complete` |
| `status: idle` | `paused` |
| `status: draft` | `sprout` |
| `status: Preparing`, `Applied`, `Withdrawn`, `in-progress`, `pending` | a lifecycle status plus `stage` |
| `input_kind` on a course note | `class_kind` (lecture to week, book to textbook, board to board) |
| `tags: ["#x"]` | `tags: [x]` |
| `mastery (1/10)` | `mastery_level` (bare 0 to 10) |
## Done Conditions
- Every value of `type`, `status`, and each `*_kind` in a template or note is in the tables above.
- No template carries a quoted number, a quoted date, a `#` in tags, or an unresolved date placeholder.
- A new type, status, or kind is added to this file first, with the reason, before any template uses it.
## Gold Standard Example
None. A policy has no instance. Applied in [[Note Kit Standard]] and checked by [[Conformance Standard]].
