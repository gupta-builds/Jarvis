---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-09-20
tags:
  - evergreen
  - system
  - obsidian
  - dataview
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Cross-Laptop Sync - Build 3 Findings]]"
---
# Dataview and Dashboards

Use Dataview when the list should be rebuilt from frontmatter, tags, links, or task lines instead of maintained by hand. In Jarvis, that means project queues, stale notes, metadata cleanup, flashcard queues, source-summary indexes, and enrichment dashboards.

## Current Settings
Re-verified directly against `.obsidian/plugins/dataview/data.json` 2026-09-20 — all values below confirmed accurate, no drift found.

- Inline Dataview: enabled.
- Inline DataviewJS: enabled.
- DataviewJS blocks: enabled.
- HTML rendering: enabled.
- Refresh: enabled every `2500ms`.
- Empty-result warnings: enabled.
- Result counts: shown.
- Task completion tracking: disabled.

Because DataviewJS and HTML rendering are enabled, agents should prefer plain Dataview and treat scripts as code, not decoration.

## DataviewJS/HTML Risk — actually assessed, 2026-09-20
The Risk Register has carried "DataviewJS and HTML enabled" as a flag since this note's creation without anyone checking what the vault's real DataviewJS blocks actually do. They exist and are load-bearing: [[00_Dashboard]] uses four separate `dataviewjs` blocks (stat tiles for LeetCode/wins/study counts, a weekly rollup, a habit progress bar, a clippings-remaining count), and `10_Areas/Career/Internships/List/Dossiers MOC.md` uses one for live per-bucket capacity counts against a 50-item cap. Read every one directly. The verdict:

- **All of them are pure read-and-render.** Each reads numeric/count fields from frontmatter (`lc_today`, `study_today`, `habits_done`, folder page counts) or computes an aggregate (a weekly sum, a percentage), then writes the result into the page via `dv.el`/`dv.table`/`dv.paragraph`. None calls `app.vault.modify`, writes a file, or makes a network request.
- **The real risk is narrower than "JS execution" and specifically about `innerHTML`.** Several blocks build HTML strings with template literals and set them via `.innerHTML = \`...\`` (the stat-tile and progress-bar blocks in [[00_Dashboard]]). Today every interpolated value is a number (`?? 0` defaults, `Math.round` percentages), so there's nothing to inject. But this *is* the exact pattern that becomes a real injection risk the moment someone interpolates a string-typed frontmatter field into `innerHTML` without escaping it — a note title or a free-text property value containing `<img onerror=...>` would render, not just display as text.
- **Practical rule, not a ban:** DataviewJS blocks that render computed numbers/counts into `innerHTML` are fine as-is. A new DataviewJS block that interpolates any string-typed frontmatter field into `innerHTML` needs `dv.el`'s text-content form (or manual escaping) instead — flag it in review if you see one.

This replaces the old unexamined flag; the Risk Register entry below reflects it.

## Why This Is Central

[[00_Dashboard]] already uses Dataview for:

- knowledge enrichment candidates
- active projects
- projects missing `next`
- AI staging queue
- raw clippings to distill
- active classes
- recent Claude outputs
- open tasks
- flashcard review queue
- orphan durable notes
- metadata cleanup
- recent reviews

The same pattern should hold in [[60_Claude/60_Indexes]]. A dashboard is trustworthy only when the fields it reads are consistent.

## Canonical Fields To Query

From [[40_Resources/Obsidian/Vault Operating System]]:

| Field | Query use |
|---|---|
| `type` | Separates project, concept, input, review, dashboard, index, output. |
| `status` | Separates active, paused, complete, archived, seed, sprout, tree. |
| `created` / `updated` | Finds stale or newly created notes. |
| `next` | Shows current action at note level. |
| `deadline` | Sorts active projects and coursework. |
| `reviewed` | Finds review candidates. |
| `enrichment_status` / `enrichment_level` | Drives enrichment queues. |
| `source_status` / `source_url` | Separates vault-grounded and externally sourced notes. |
| `track` / `tracks` | Routes capability notes into field dashboards. |
| `mastery_level`, `next_drill`, `last_drilled` | Supports capability and review loops. |

If a query returns nonsense, check metadata before editing the query.

## Query Recipes

Active projects:

```dataview
TABLE status, deadline, next, file.mtime AS "Updated"
FROM "20_Progress"
WHERE type = "project" AND status != "archived"
SORT deadline ASC, file.mtime DESC
LIMIT 12
```

Projects missing a current move:

```dataview
TABLE status, deadline, file.mtime AS "Updated"
FROM "20_Progress"
WHERE type = "project" AND status != "archived" AND !next
SORT file.mtime DESC
LIMIT 10
```

Stale durable notes:

```dataview
TABLE status, updated, reviewed, file.mtime AS "Modified"
FROM "40_Resources" OR "60_Claude/20_Distilled_Notes"
WHERE type AND status != "archived"
AND file.mtime < date(today) - dur(60 days)
SORT file.mtime ASC
LIMIT 20
```

Raw clippings waiting for distillation:

```dataview
TABLE file.ctime AS "Captured"
FROM "60_Claude/05_Clippings"
SORT file.ctime DESC
LIMIT 12
```

Source summaries needing links or synthesis:

```dataview
TABLE source_status, source_url, notes, file.mtime AS "Updated"
FROM "60_Claude/10_Source_Summaries"
WHERE type = "input"
SORT file.mtime DESC
LIMIT 20
```
*Path corrected 2026-09-20 — was `60_Claude/30_Source_Summaries`, a dead folder. Note `source_status` will return empty for every row: confirmed 2026-09-20, `0` of 139 real `type: input` notes have `source_status` set at all. It is not "inconsistently set," it has never been adopted — `source_url` is the field that's actually in use (confirmed populated on multiple notes). Drop `source_status` from this query or treat every result as unset until the field is either adopted or removed from the schema.*

Flashcard queue:

```dataview
LIST
FROM #cards
WHERE !contains(file.folder, "30_Order/Templates")
SORT file.mtime DESC
LIMIT 10
```

Enrichment candidates:

```dataview
TABLE type, status, track, enrichment_status, file.mtime AS "Updated"
FROM "10_Areas/UMN" OR "20_Progress" OR "40_Resources" OR "60_Claude/20_Distilled_Notes"
WHERE (type = "concept" OR type = "evergreen" OR type = "project")
AND (!enrichment_status OR enrichment_status != "enriched")
SORT file.mtime ASC
LIMIT 10
```

Course boards:

```dataview
TABLE WITHOUT ID file.link AS "Board", length(file.inlinks) AS "Linked Notes"
FROM "10_Areas/UMN"
WHERE contains(file.name, "Board")
SORT file.name ASC
```
*Path corrected 2026-09-20 (both recipes above) — was `10_UMN`, which has never existed as a vault folder. **This query currently returns nothing regardless of the path fix**: `10_Areas/UMN` itself doesn't exist in this vault yet either — real UMN coursework material lives outside the vault. This recipe is correctly written for when that folder exists, not a currently-working query.*

Recent reviews:

```dataview
TABLE file.folder AS "Folder", file.ctime AS "Created"
FROM "60_Claude/30_Reviews"
WHERE file.name != "50_Reviews Board"
SORT file.ctime DESC
LIMIT 8
```
*Path corrected 2026-09-20 — was `60_Claude/50_Reviews`, a folder that doesn't exist. The real folder is `60_Claude/30_Reviews`, confirmed to exist and to actually contain a `50_Reviews Board.md` file (a naming leftover from before the folder was renumbered), so the `WHERE` filter was already correct — only the `FROM` path was wrong. This is a different folder from Periodic Notes' `10_Areas/Life/Enumerate/` — see [[Templates Capture and Periodic Notes]] for that distinction.*

## Dataview vs Tasks

Use Dataview when the question is about notes:

- Which projects are active?
- Which concepts lack enrichment metadata?
- Which source summaries are recent?
- Which notes are orphaned?

Use Tasks when the question is about actions:

- What is due?
- What is scheduled?
- Which task is in progress?
- Which task has high priority?

Dataview can render `TASK` queries, but Tasks understands Tasks-specific emoji metadata and recurrence semantics better. Do not build a second task system with ad hoc inline fields unless there is a clear reason.

## Bases vs Dataview
**Resolved 2026-09-19: not a pending choice.** `60_Claude/44_Indexes/Bases/` holds five real `.base` files (Capability Registry, Knowledge Enrichment Registry, Ops Reports, Output Pipeline, Question Triage), and `core-plugins.json` has `bases: true`. Both are live today. Bases gives filterable, sortable, view-switchable tables over frontmatter with no query language; Dataview gives programmable queries (`FROM`, `WHERE`, grouping, DataviewJS) over the same frontmatter. Use Bases for a fixed registry someone will browse and filter by eye; use Dataview when the view needs logic — computed fields, multi-source joins, or conditional grouping a Bases filter can't express.

## Meta Bind
Meta Bind turns frontmatter fields into interactive widgets inside a note: text/number/toggle inputs, dropdowns bound to a property, progress bars, and buttons that run a command or JS snippet on click ([Meta Bind docs](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/)).

**Piloted for real, 2026-09-20.** Installed and lazy-loaded (`short`) since 2026-09-19, but a vault-wide search for its actual binding syntax (`INPUT[`, `VIEW[`, `BUTTON[`) found zero real uses anywhere — confirmed genuinely unused, not just under-documented. Piloting it now on exactly the `status` dropdown this note already recommended:

```markdown
INPUT[inlineSelect(option(seed), option(sprout), option(tree)):status]
```

Live below, bound to this note's own `status:` frontmatter field — changing it here rewrites the frontmatter directly, no Properties panel needed:

Status: `INPUT[inlineSelect(option(seed), option(sprout), option(tree)):status]`

Syntax confirmed against Meta Bind's own reference docs ([Select input field](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/reference/inputfields/select/), [Inline Select input field](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/reference/inputfields/inlineselect/)): `inlineSelect` is the compact dropdown variant meant for inline body use (versus the block-level `select`), `option(...)` defines each fixed choice, and the text after the colon is the bind target — the frontmatter property name it reads from and writes to. This is a plain bound dropdown, not a button running arbitrary JS, so it stays in the low-risk category already established for this plugin (a button wired to a command or script is the risk class that still needs explicit approval, not a value-selection input).

This is a genuine second write path into frontmatter alongside hand-editing and Properties — Dataview *reads* frontmatter to build a view; Meta Bind lets a note *write* its own frontmatter through a UI control. The same pattern (`INPUT[inlineSelect(option(...), option(...)):fieldname]`) generalizes to any note with a small fixed-choice field — `type`, `track`, or a habit board's daily checkboxes as bound toggles instead of raw Tasks lines — once this pilot proves the mechanism out on one real note.

## DataviewJS Rule

Use DataviewJS only when plain Dataview cannot express the transformation.

Good reasons:

- complex grouping that Dataview cannot express readably
- computed summaries over multiple fields
- small generated tables with clear code comments

Bad reasons:

- decorative charts
- hidden business logic
- queries that only one agent can maintain
- HTML-heavy output that breaks plain Markdown readability

When DataviewJS is used, add a one-sentence explanation above the block.

## Failure Modes

- Inconsistent frontmatter: a note with `Type` or `type:` missing will vanish from queries.
- Missing `next:`: active projects look idle even if prose contains next steps.
- Stale manual lists: a hand-written index can disagree with a dashboard.
- Folder drift: moving a note can remove it from a path-based query.
- HTML/JS risk: enabled HTML and DataviewJS can make dashboards execute more than a reader expects.
- Over-broad `FROM`: vault-wide queries can become slow. Restrict by folder when possible.

## Agent Workflow

Before changing a dashboard:

1. Read the existing query and the fields it depends on.
2. Check several matching notes to verify the field is real.
3. Prefer tightening metadata over adding complicated query workarounds.
4. Keep examples in this doc and live dashboards aligned.
5. Link the dashboard to this note if the pattern becomes canonical.

## Integration Map
- **Templater/QuickAdd → Dataview:** Dataview only sees fields that were written at note creation. Templater folder templates and (once configured) QuickAdd choices are what guarantee `type:`/`status:`/`track:` exist. A note created outside Obsidian without that frontmatter is invisible to every query here. See [[Templates Capture and Periodic Notes]] and [[QuickAdd Capture Menu]].
- **Dataview vs Tasks:** Dataview answers questions about *notes* (which projects are active, which concepts lack enrichment); Tasks answers questions about *actions* (what is due, what is in progress). Dataview can render `TASK` blocks, but Tasks understands emoji dates and recurrence — do not build a second action system in inline fields. See [[Tasks Kanban and Project Tracking]].
- **SR → Dataview:** the flashcard-queue recipe reads the `#cards` tag; capability dashboards read `last_drilled`/`next_drill`/`mastery_level`. Cards or capability notes with missing fields drop out of the queue. See [[Spaced Repetition and Learning Loops]].
## Gold-Standard Example
[[00_Dashboard]] is the canonical live example: it drives enrichment candidates, active projects, projects missing `next`, the AI staging queue, clippings-to-distill, the flashcard queue, orphan notes, and metadata cleanup entirely from frontmatter. It is the proof that the field schema is worth keeping consistent — every block there breaks the moment a note's metadata drifts.
## Verified Open State
- `source_status` is confirmed unadopted (`0`/139), not just under-used — either start setting it or drop it from the schema and this note's recipe. Not decided here; a human content-workflow choice.
- ~~Should Meta Bind be wired into any existing dashboard or board (e.g. `status:` as a dropdown)?~~ — *resolved 2026-09-20: piloted on this note's own `status:` field, see the Meta Bind section above. Extending the pattern to more notes is now a copy-paste exercise, not a research question.*

## Sources

- [Dataview docs](https://blacksmithgu.github.io/obsidian-dataview/)
- [Dataview query structure](https://blacksmithgu.github.io/obsidian-dataview/queries/structure/)
- [Dataview metadata docs](https://blacksmithgu.github.io/obsidian-dataview/annotation/metadata-pages/)
- [Meta Bind docs](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/)
- [Obsidian Help - Bases syntax](https://obsidian.md/help/bases/syntax)
- Direct check of `60_Claude/44_Indexes/Bases/` (five `.base` files) and `.obsidian/core-plugins.json` — this session, 2026-09-19
- Direct read of `.obsidian/plugins/dataview/data.json`, every real `dataviewjs` block in [[00_Dashboard]] and `Dossiers MOC.md`, and a vault-wide `source_status`/`source_url` field audit (139 `type: input` notes checked) — this session, 2026-09-20
- [Meta Bind — Select input field](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/reference/inputfields/select/) and [Inline Select input field](https://www.moritzjung.dev/obsidian-meta-bind-plugin-docs/reference/inputfields/inlineselect/) — bind-target and `inlineSelect` syntax, fetched 2026-09-20
- [[00_Dashboard]]
- [[40_Resources/Obsidian/Vault Operating System]]
