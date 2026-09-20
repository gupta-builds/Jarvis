---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-09-20
tags:
  - evergreen
  - system
  - obsidian
  - tasks
  - kanban
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
---
# Tasks Kanban and Project Tracking

Tasks is the atomic action layer. Kanban is the lane layer. Project notes are the context and decision layer.

Use all three deliberately:

- Tasks answer: what action exists?
- Kanban answers: what stage is this item in?
- Project notes answer: why does this work matter, what has been decided, and what is the current `next:` move?

## Current Tasks Settings
Re-verified directly against `.obsidian/plugins/obsidian-tasks-plugin/data.json` 2026-09-20 — accurate, no drift.

- Task format: `tasksPluginEmoji`.
- Done date: set automatically.
- Cancelled date: set automatically.
- Auto-suggest in editor: enabled.
- Global query: empty.
- Global filter: empty.

Configured statuses:

| Markdown | Name | Type | Toggle target |
|---|---|---|---|
| `[ ]` | Todo | TODO | `[x]` |
| `[x]` | Done | DONE | `[ ]` |
| `[/]` | In Progress | IN_PROGRESS | `[x]` |
| `[-]` | Cancelled | CANCELLED | `[ ]` |

Existing status report:

- [[40_Resources/Obsidian/Data View's/Tasks Plugin - Review and check your Statuses 2025-12-20 18-37-12]]

## Tasks Emoji Syntax

Use Tasks emoji metadata when the task itself needs dates, priority, recurrence, or audit trail.

Examples:

```markdown
- [ ] Draft the BOOM queue failure diagram 📅 2026-05-20
- [ ] Review CSCI 2041 closure notes ⏳ 2026-05-17
- [ ] Start internship application batch 🛫 2026-05-18 📅 2026-05-24
- [ ] Drill graph traversal mistakes 🔁 every week 📅 2026-05-22
- [ ] Fix project dashboard query 🔺 📅 2026-05-16
```

Use these meanings:

| Marker | Meaning |
|---|---|
| `📅` | Due date. |
| `⏳` | Scheduled date. |
| `🛫` | Start date. |
| `🔁` | Recurrence. |
| `🔺`, `⏫`, `🔼`, `🔽`, `⏬` | Priority levels, from highest-ish to lowest-ish. |
| `✅` | Done date, normally set by the plugin. |
| `❌` | Cancelled date, normally set by the plugin. |
| `➕` | Created date if manually needed. |

Needs verification: exact preferred priority scale for coursework vs projects.

## Writing Good Tasks

Good:

```markdown
- [ ] Verify whether Excalibrain is intentionally absent before documenting it as removed
- [/] Expand Dataview dashboard examples from `00_Dashboard`
- [-] Replace this manual checklist because the dashboard query covers it
```

Weak:

```markdown
- [ ] Learn plugins
- [ ] Improve Jarvis
- [ ] Do research
```

Those are intentions. A task should name a visible next action.

## `next:` vs Task Line

Use `next:` when the note itself has one current next move.

```yaml
next: "Choose QuickAdd capture choices for inbox and source clipping"
```

Use task lines when multiple actions need tracking:

```markdown
- [ ] Draft capture menu choices
- [ ] Decide whether source clipping creates raw or summary notes
- [ ] Test QuickAdd choice in a disposable note
```

Do not keep a different next action in prose, frontmatter, and a Kanban card. Pick one canonical current move and let dashboards surface it. This doesn't mean an active note should have `next:` *or* task lines, never both — a project routinely has one current move in `next:` and a queue of further trackable actions behind it as task lines. The rule is about not letting the *same* step be described three different, possibly-drifting ways, not about picking only one mechanism.

## Task Query Blocks

Use Tasks query blocks when task semantics matter:

````markdown
```tasks
not done
path includes 20_Progress
sort by due
sort by priority
short mode
```
````

Coursework due soon:

````markdown
```tasks
not done
path includes 10_Areas/UMN
due before in 14 days
sort by due
short mode
```
````
*Path corrected 2026-09-20 — was `10_UMN`, never a real vault folder. Note `10_Areas/UMN` itself doesn't exist in the vault yet either (real coursework material lives outside the vault) — this query is correctly written for when it does, not currently returning results.*

Recurring task, worked example:

```markdown
- [ ] Weekly review 🔁 every week 📅 2026-09-26
```

In-progress work:

````markdown
```tasks
status.name includes In Progress
sort by due
short mode
```
````

Use Dataview task queries when a dashboard is mostly about page metadata and only needs a simple open-task list.

**Decision (2026-09-19): `00_Dashboard`'s "Today's Priorities" block stays Dataview `TASK`, not a Tasks query — checked against the actual block, not just the tracker's abstract question.** Its filter is `FROM "10_Areas/Life/Enumerate/Daily" WHERE file.day = date(today) AND !completed` — `file.day` is a Dataview-computed property of the daily note itself (which day this page is), not a property of the task line. Tasks' query language filters on task-line emoji metadata (`📅`, `⏳`, recurrence, priority) and `path`/`heading` text matching; it has no equivalent to "the page this task lives on has `file.day` equal to today," so switching this block to a `tasks` query would mean approximating a page-metadata filter with a path-string match against today's daily-note filename — more fragile than the property comparison Dataview already does directly. Tasks queries are still the right tool for date/priority/recurrence-heavy views elsewhere in Jarvis (the two examples above); this specific block is metadata-driven, so it keeps the tool built for metadata.

## Kanban Boundaries

Current Kanban settings:

- Checkboxes shown.
- Card counts hidden.
- Full-list lane width disabled.
- Dates link to daily notes.

Use Kanban when lane movement is the point:

- habit boards
- source ingestion
- project pipelines
- study workflow boards
- review queues where drag-and-drop helps humans decide stage

Do not use Kanban as a second task database. If a card contains a real action, either make it a Tasks-compatible checkbox or link to the project note where tasks live.

## Recommended Lane Templates

Habit board:

```markdown
## Seed
## Active
## Stabilizing
## Review
## Paused
```

Project pipeline:

```markdown
## Ideas
## Next
## Doing
## Waiting
## Done
```

Source ingestion:

```markdown
## Captured
## Summarize
## Distill
## Link
## Archived
```

Study workflow:

```markdown
## To Learn
## Practicing
## Review
## Exam Ready
## Revisit
```

Needs verification: preferred canonical lane names for future project boards.

## Agent Rule

When adding work to Jarvis:

1. Put durable context in the note.
2. Put one current move in `next:` if the note is active.
3. Put trackable actions as Tasks-compatible task lines.
4. Use Kanban only if stage movement is useful.
5. Avoid duplicate task systems.

## Integration Map
- **Tasks → Dataview:** an open `- [ ]` line with `📅` is read both by Tasks queries (emoji-aware) and by Dataview `TASK` blocks (metadata-aware). Use Tasks queries when due/recurrence/priority matter; Dataview when the dashboard is mostly page metadata. See [[Dataview and Dashboards]].
- **Tasks vs `next:`:** `next:` frontmatter holds the *one* current move for a note; task lines hold the *many* trackable actions. Keeping a different next-step in prose, frontmatter, and a Kanban card is the drift this doc exists to prevent — pick one canonical move and let dashboards surface it.
- **Kanban → notes:** a Kanban card that represents durable work should link to the project note where the real tasks and context live (`[[BOOM Board]]`), not duplicate them. Kanban tracks *stage*; the note tracks *substance*.
- **Tasks → Open Questions:** source-summary and course notes put unresolved items under `## Open Questions` as `- [ ]`, not prose — so they become trackable and queryable. This is why Vault Rules Part 8 mandates Tasks format there.
## Gold-Standard Example
- *Tasks:* [[40_Resources/UMN/Previous Classes/Minor/MGMT 3001/Week - 9|Week - 9]] uses `- [ ]` under `## Takeaways (questions to resolve)` for real open questions rather than prose — the pattern the ingestion workflow requires.
- *Kanban:* [[10_Areas/Life/Habits/Habit Tracker Board|Habit Tracker Board]] is a real lane-based board (stage movement is the point), not a task dump.
- *next-driven project:* [[BOOM Board|BOOM Board]] keeps context in the note and surfaces one current move.
## Verified Open State
- **Preferred priority scale for coursework vs projects and canonical lane names for future project boards are both genuine open preferences, not settings gaps — deliberately not resolved here.** Both are the user's call, not something to guess at; the syntax and four candidate lane templates are documented above and ready whenever the choice is made.
- Kanban WIP/lane card-limits: checked the plugin's own README and Publish docs directly — neither confirms a per-lane card-limit feature exists, one way or the other. Don't assume it's there and plan around it; a live in-app settings check would resolve this, not more doc research.
- ~~Should `00_Dashboard`'s open-task block migrate from a Dataview `TASK` query to a native `tasks` query for emoji-date accuracy?~~ — *resolved 2026-09-19: no, see decision above. Its filter is page-metadata (`file.day`), which Dataview handles directly and Tasks cannot.*

## Sources

- [Tasks User Guide - Task formats](https://publish.obsidian.md/tasks/Reference/Task+Formats/About+Task+Formats)
- [Tasks User Guide](https://publish.obsidian.md/tasks/)
- [Kanban README](https://github.com/obsidian-community/obsidian-kanban)
- [Kanban Publish docs](https://publish.obsidian.md/kanban/) — checked directly for WIP/lane-limit support, not confirmed either way, fetched 2026-09-19
- Direct read of `.obsidian/plugins/obsidian-tasks-plugin/data.json` and `.obsidian/plugins/obsidian-kanban/data.json` — this session, 2026-09-20
- [[40_Resources/Obsidian/Data View's/Tasks Plugin - Review and check your Statuses 2025-12-20 18-37-12]]
