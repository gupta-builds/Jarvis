---
type: system
status: sprout
created: 2026-06-01
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: project
tier: 1
maps_to:
  - "[[Project Note Template]]"
used_by:
  - "[[Brief to Progress]]"
gold_standard: "[[20_Progress/Projects/Jarvis & The Plan/Jarvis|Jarvis]]"
notes:
  - "[[Spec and Plan Standard]]"
  - "[[Per Project Review]]"
  - "[[HUMAN_WRITING]]"
---
# Project Standard
==A project note says what is true now, the one next move, and what already happened, so the dashboard and the next session can pick it up without asking.==
This is the standard for the status page of a project in `20_Progress/`: an outcome, an honest present, one next move, and a dated log. A plan or spec for the project is a [[Spec and Plan Standard]] note, a prompt is an [[Agent Prompt Standard]] note, and a running build record is a log under [[Log Standard]].
## Spec
```json
{
  "family": "project",
  "tier": 1,
  "match": {"type": "project", "kind": "project", "path": "^20_Progress/(Projects|Internship|Mentorship Program)/", "where": {}, "where_not": {}},
  "legacy_match": [{"type": "project", "path": "^20_Progress/(Projects|Internship|Mentorship Program)/", "absent": ["project_kind"]}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Goal", "Current State", "Next Action", "Open Questions", "Log"],
  "optional_headings": ["Corrections", "Related Notes"]
}
```
## Headings
### Frontmatter
`project_kind: project`. `status` is `active`, `paused`, `complete`, or `archived`. `next` is the single next move, mirrored in `## Next Action`, and is `none` when the project is complete or archived. `related_progress` links the plan or spec. `deadline` is set only if a real one exists.
> [!WARNING]
> An `active` project with an empty `next`. Eight active notes had none, and the dashboard cannot surface them.
### Goal
One sentence: what done looks like, as the `==highlight==` anchor.
> [!WARNING]
> A feature list instead of a finish line.
### Current State
What is true now, dated, with the key blocker bold. Claims about code or a live system cite a file and line, a commit hash, or a command's output, and say what is real, mocked, or blocked.
*Density:* the honest present, a short paragraph or a few bullets.
> [!WARNING]
> A "verified" claim older than the code it describes. Re-check it or date it.
### Next Action
The single next step, the same text as `next`. Multi-step work belongs in the plan.
### Open Questions
`- [ ]` tasks, with a date where a real one exists.
### Log
Dated entries, newest last: `- **YYYY-MM-DD:** what changed`. Append only. A correction is a new entry that names the entry it corrects; the original line stays.
### Corrections
Optional. When a whole earlier section turned out wrong, keep it and add a dated correction here that says what was wrong and what replaced it.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `project_kind` | `project_kind: project`, or `spec`, `plan`, `code-mirror`, `prompt` by what the note is | Judgment |
| `status` of sprout, seed, tree, static, current, in-progress, pending | `active` while work continues, else `paused` | Judgment |
| `status` of dead, stale, idle, Withdrawn, or a superseded note still `active` | `archived` (`paused` for idle) | Judgment |
| `status: completed` or a quoted `"archived"` | `complete` or `archived`, unquoted | Mechanical |
| `next:` missing or empty on an active note | The next move, or `none` if complete | Judgment |
| What this is, Why this exists, Current State (date), Next Steps, Session blocks | Goal, Current State, Next Action, Log (Session blocks become Log entries) | Judgment |
| Hackathon retrospective: Elevator Pitch, What We Built, What Went Wrong, Continuation Plan | Pitch to Goal, build and architecture to Current State, lessons to one Log entry, Continuation Plan to Next Action | Judgment |
| A dated chronological build record (System - Build Log) | Not a project note: `type: system`, `system_kind: log`, per [[Log Standard]] | Judgment |
| Course-template keys (`course`, `mastery (1/10)`, `topics`) | Remove | Mechanical |
## Done Conditions
- `project_kind`, `status`, and `next` are set, and `next` equals `## Next Action`.
- Current State is dated, says what is real or blocked, and cites evidence for code claims.
- The plan or spec is linked in `related_progress`.
- The Log is append-only, and the note passes [[Vault Lint]] for the `project` family.
## Gold Standard Example
[[20_Progress/Projects/Jarvis & The Plan/Jarvis|Jarvis]]: a one-line north star, a canonical plan link, and a live `next` mirrored in the body. It still lacks `project_kind` and the five headings, which Legacy Shapes adds.
