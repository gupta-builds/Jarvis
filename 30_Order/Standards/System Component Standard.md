---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: system-component
tier: 2
maps_to: []
used_by: []
gold_standard: "[[30_Order/System/jarvis-memory/Jarvis Memory|Jarvis Memory]]"
notes:
  - "[[Note Kit Standard]]"
  - "[[Conformance Standard]]"
  - "[[Orchestration]]"
---
# System Component Standard
==A script, hook, scheduled task, or server earns a place in `30_Order/System/` only with a record that says when it runs, what it touches, how to tell it ran, and how it is retired.==
This is the Standard for the documentation of tooling that runs the vault: sync, capture, export, memory, and CLI components under `30_Order/System/`. It is not the choice of which agent or tool to call for a task ([[Orchestration]]), and it is not the tool's own README or source. It exists because six subsystems grew READMEs of no fixed shape, runtime state sat beside source in the rules layer, and a hook path hardcoded to one machine broke 14 files twice.
## Spec
```json
{
  "family": "system-component",
  "tier": 2,
  "match": {"type": "system", "kind": "spec", "path": "^30_Order/System/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "system_kind", "trigger", "owner"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Purpose", "Trigger", "Inputs and Outputs", "State", "Failure Behavior", "Verify", "Retire"],
  "optional_headings": []
}
```

| Item | Rule |
|---|---|
| Allowed folders | `30_Order/System/<component>/`, one record per component. |
| File name | The component's name (`Jarvis Memory`), never `README.md`: wikilinks resolve by name, and six identical READMEs hid each other. |
| Kind | `type: system` with `system_kind: spec`. |
| Status | `sprout` from the first save. `tree` once Verify has been run and its result written in the record. `archived` after Retire. |
## Headings
### Frontmatter
- **Write:** `system_kind: spec`, `trigger` (the schedule, hook event, or command, in one line) and `owner` (the person or agent who notices when it stops).
- **Length:** one line per key.
- **Never:** an `owner` that names nobody. A component with no owner fails silently.
- **Right:** `trigger: On demand with registry.py, and as the jarvis-memory MCP server when Claude Code starts it`
- **Wrong:** None seen.
### Purpose
- **Write:** what the component does and what breaks if it stops.
- **Length:** two sentences, plus what exists today with its check date.
- **Never:** a roadmap of what could be built.
- **Right:** `A local SQLite registry of every vault note, with an MCP server file that can expose it to AI tools, so an agent could find the few right notes by metadata instead of loading the vault.`
- **Wrong:** None seen.
### Trigger
- **Write:** the schedule, hook event, or command that runs it, and on which machine.
- **Length:** one to three sentences, with the commands in a code block.
- **Never:** the history of how the trigger was added or missed. That goes in the session log.
- **Right:** None seen.
- **Wrong:** `Until 2026-11-04 nothing recorded the fit percentage on a schedule`
### Inputs and Outputs
- **Write:** paths read and written, as vault-relative or environment-variable paths.
- **Length:** one paragraph.
- **Never:** a path that only exists on one machine. A hook with a drive letter worked on one laptop and broke on the other, twice.
- **Right:** None seen.
- **Wrong:** `the exporter's WSL branch and its Windows fallbacks named the old machine`
### State
- **Write:** every file the component writes at runtime: logs, databases, markers, caches. Runtime state stays out of tracked source, so name the ignore rule.
- **Length:** one paragraph.
- **Never:** runtime state beside source in `30_Order`.
- **Right:** `is derived state, 3.0 MB after the 2026-11-05 rebuild`
- **Wrong:** None seen.
### Failure Behavior
- **Write:** fail open or fail closed, where the failure is logged, and who sees it.
- **Length:** two to four sentences.
- **Never:** a silent failure.
- **Right:** `A stale index returns old paths rather than an error, so a search result that points to a missing note means reindex.`
- **Wrong:** None seen.
### Verify
- **Write:** one command or query that proves the last run happened and worked, compared against ground truth and not the component's own success message.
- **Length:** one command and one expected result.
- **Never:** a check that reads only the component's own log.
- **Right:** `prints a note count that matches the number of`
- **Wrong:** None seen.
### Retire
- **Write:** how to turn it off: unregister the task, remove the hook, delete the files in one commit that states the reason.
- **Length:** one to three sentences.
- **Never:** a `_retired-<date>` folder. Git is the archive.
- **Right:** `The database is regenerable, so nothing needs backing up.`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| All seven headings appear in order | An operator finds Verify or Retire without reading the whole record | Reader (the linter skips headings on Tier 2) |
| `trigger` and `owner` are filled | A component nobody owns stops unnoticed | Lint, check 1 |
| No tracked file under `30_Order/System/` is runtime state | Logs and databases in source break sync | Reader |
| Verify was run once against real output when the record was written | A Verify never run is a guess | Reader |
| No two records share a file name | Wikilinks resolve by name | Kit |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| A `README.md` with no frontmatter | Rename to the component's name, add the frontmatter, reorder under the seven headings | Judgment |
| Logs and exports beside source | Add an ignore rule or move out of `30_Order` | Mechanical, plus a check |
| `_retired-<date>/` folder | Delete in one commit after confirming nothing reads it | Judgment, needs a yes |
## Done Conditions
- Each component under `30_Order/System/` has one record with all seven headings.
- No tracked file under it is runtime state.
- `Verify` was run once against real output when the record was written.
- The note passes [[Vault Lint]] for the `system-component` family.
## Gold Standard Example
[[30_Order/System/jarvis-memory/Jarvis Memory|Jarvis Memory]] passes lint: all seven headings, a state section that names the ignore rule, a Verify that names the check date, and a Retire that says the database can be rebuilt.
Measured 2026-11-07 with `--family system-component`: 7 notes, all pass. The Tier 2 check does not enforce headings, so a record can pass lint and still skip one.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Jarvis Memory (gold) | `30_Order/System/jarvis-memory/` | All seven headings, dated checks | Nothing found |
| Vault Lint | `30_Order/System/vault-lint/` | A real Verify with counts | Trigger holds the history of when the schedule was wired |
| Cursor Workflow | `30_Order/System/cursor-workflow/` | Passes lint | Carries a callout on the old hardcoded path |
| Claude Workflow | `30_Order/System/claude-workflow/` | Passes lint | Not read in full |
