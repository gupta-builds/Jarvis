---
type: system
status: sprout
created: 2026-06-01
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: project
tier: 1
maps_to:
  - "[[Project Status Note Template]]"
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
This is the Standard for the status page of one project in `20_Progress/`: an outcome, an honest present, one next move, and a dated log. It is not the plan or spec behind the project ([[Spec and Plan Standard]]), not a prompt ([[Agent Prompt Standard]]), and not a running build record, which is a log ([[Logs]]).
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

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/Projects/`, `20_Progress/Internship/`, or `20_Progress/Mentorship Program/`. |
| File name | The project's name. Unique in the vault; the title line equals it. |
| Kind | `type: project` with `project_kind: project`. A spec, plan, code mirror, or prompt has another `project_kind`. |
| Status | `active` while work continues, `paused` with a reason in Current State, `complete` when the Goal is met, `archived` when abandoned or superseded. |
## Headings
### Frontmatter
- **Write:** `project_kind: project`, `status`, and `next`, the single next move, mirrored in `## Next Action` and `none` when the project is complete or archived. `related_progress` links the plan or spec. `deadline` only if a real one exists.
- **Length:** one line per key.
- **Never:** an `active` project with an empty `next`. Eight active notes had none, and the dashboard could not surface them.
- **Right:** `next: Complete J0 by reconciling host ownership and evidence gaps in the current-state inventory.`
- **Wrong:** `status: sprout`
### Goal
- **Write:** what done looks like, as the `==highlight==` anchor.
- **Length:** one sentence.
- **Never:** a feature list instead of a finish line.
- **Right:** `==Build a source-grounded technical knowledge and execution system whose tools share current context and whose workflows work across the two laptops.==`
- **Wrong:** None seen.
### Current State
- **Write:** what is true now, dated, with the key blocker in bold. A claim about code or a live system cites a file and line, a commit hash, or a command's output, and says what is real, mocked, or blocked.
- **Length:** a short paragraph or a few bullets.
- **Never:** a "verified" claim older than the code it describes. Re-check it or date it.
- **Right:** `On October 17, Anant reports Syncthing working, internship research off, conversation syncing off, and no ingestion pipeline running on this laptop.`
- **Wrong:** None seen.
### Next Action
- **Write:** the single next step, the same text as `next`.
- **Length:** one sentence.
- **Never:** multi-step work. That belongs in the plan.
- **Right:** `Complete J0 by reconciling host ownership and evidence gaps in the current-state inventory.`
- **Wrong:** None seen.
### Open Questions
- **Write:** `- [ ]` tasks, with a date where a real one exists.
- **Length:** one sentence each; as many as are open.
- **Never:** a question the note already answers.
- **Right:** `- [ ] Which host owns each repo, capture source, scheduled task, and memory index?`
- **Wrong:** None seen.
### Log
- **Write:** dated entries, newest last: `- **YYYY-MM-DD:** what changed`. A correction is a new entry that names the entry it corrects; the original line stays.
- **Length:** one to three sentences per entry.
- **Never:** an edited or deleted old entry.
- **Right:** `- **2026-10-17:** Created a bounded build history, dated current-state inventory, dependency-ordered restoration plan, and AI infrastructure research reference.`
- **Wrong:** None seen.
### Corrections
- **Write:** optional. When a whole earlier section turned out wrong, keep it and add a dated correction here that says what was wrong and what replaced it.
- **Length:** one `###` per correction, a short paragraph each.
- **Never:** a silent rewrite of the original.
- **Right:** `### 2026-10-17: current status versus original vision`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The five headings appear in order and none is empty | The dashboard and `/startday` read sections by name | Lint, check 2 |
| `project_kind`, `status`, and `next` are set | A project with no `next` is invisible to the dashboard | Lint, check 1 |
| `next` equals the text under `## Next Action` | Two places for one step drift apart | Reader |
| Current State is dated and cites evidence for code claims | An undated claim cannot be re-checked | Reader |
| The Log is append-only | The history shows whether the project is drifting | Reader |
| An active project has a Log entry within the review cadence ([[Per Project Review]]) | A project nobody touches is stalled, not active | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `project_kind` (most of the 91 notes) | `project_kind: project`, or `spec`, `plan`, `code-mirror`, `prompt` by what the note is | Judgment |
| `status` of sprout (17 notes), seed, tree, static, current, in-progress, pending | `active` while work continues, else `paused` | Judgment |
| `status` of dead, stale, idle, Withdrawn, or a superseded note still `active` | `archived` (`paused` for idle) | Judgment |
| `status: completed` or a quoted `"archived"` | `complete` or `archived`, unquoted | Mechanical |
| `next:` missing or empty on an active note (Portfolio, Learning Tracker tool) | The next move, or `none` if complete | Judgment |
| What this is, Why this exists, Current State (date), Next Steps, Session blocks | Goal, Current State, Next Action, Log (Session blocks become Log entries) | Judgment |
| Hackathon retrospective: Elevator Pitch, What We Built, What Went Wrong, Continuation Plan | Pitch to Goal, build to Current State, lessons to one Log entry, Continuation Plan to Next Action | Judgment |
| A dated chronological build record (System - Build Log) | Not a project note: `type: system`, `system_kind: log`, per [[Logs]] | Judgment |
| Course-template keys (`course`, `mastery (1/10)`, `topics`) | Remove | Mechanical |
## Done Conditions
- `project_kind`, `status`, and `next` are set, and `next` equals `## Next Action`.
- Current State is dated, says what is real or blocked, and cites evidence for code claims.
- The plan or spec is linked in `related_progress`.
- The Log is append-only, and the note passes [[Vault Lint]] for the `project` family.
## Gold Standard Example
[[20_Progress/Projects/Jarvis & The Plan/Jarvis|Jarvis]] passes lint: a highlighted Goal, a dated Current State that names its evidence notes, one live `next` mirrored in Next Action, open questions as tasks, a Log, and dated Corrections that keep the April record.
Measured 2026-11-07 with `--family project`: 91 notes, 1 passes. Most failures are a missing `project_kind` (89) and missing headings (88).

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Jarvis (gold) | `20_Progress/Projects/Jarvis & The Plan/` | All five headings, Corrections | Nothing found |
| Conversation Layer | `20_Progress/Projects/AI Use/Conversations/` | Right shape | Blank line after the frontmatter |
| System Design Practice | `20_Progress/Internship/Preperation/System Design/` | Real content | `project_kind`, `#` in tags |
| adx | `20_Progress/Mentorship Program/Ahnaf/adx/` | Real content | `project_kind`, Current State, Open Questions |
