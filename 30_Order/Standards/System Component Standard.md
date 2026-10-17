---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: system-component
tier: 2
maps_to: []
used_by: []
gold_standard: none
notes:
  - "[[Note Kit Standard]]"
  - "[[Conformance Standard]]"
  - "[[Orchestration]]"
---
# System Component Standard
==A script, hook, scheduled task, or server earns a place in `30_Order/System/` only with a record that says when it runs, what it touches, how to tell it ran, and how it is retired.==
This is the standard for the documentation of tooling that runs the vault: sync, capture, export, memory, and CLI components under `30_Order/System/`. It exists because six subsystems grew with READMEs of no fixed shape, runtime state (logs, a SQLite registry, exported session JSON) sat beside source in the rules layer, and a hook path hardcoded to one machine broke 14 files twice (Build 12). Which agent or tool to call for a task is [[Orchestration]]; this Standard covers how a component is documented.
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
## Headings
### Purpose
What the component does, in two sentences, and what breaks if it stops.
### Trigger
The schedule, hook event, or command that runs it, and on which machine. Frontmatter `trigger` repeats it in one line; `owner` is the person or agent responsible for noticing when it stops.
### Inputs and Outputs
Paths read and written, as vault-relative or environment-variable paths. Never a path that only exists on one machine.
> [!WARNING]
> A drive letter or user-profile path in a hook or script. It worked on one laptop and broke on the other, twice.
### State
Every file the component writes at runtime: logs, databases, markers, caches. Runtime state stays out of tracked source: it is ignored by git and sync, or lives outside `30_Order`. Name the ignore rule.
### Failure Behavior
Fail open or fail closed, where the failure is logged, and who sees it. A component never fails silently.
### Verify
One command or one query that proves the last run happened and worked. Compare against ground truth, not the component's own success message.
### Retire
How to turn it off: unregister the task, remove the hook, delete the files in one commit that states the reason. Git is the archive; do not leave `_retired-<date>` folders.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| A `README.md` with no frontmatter | Rename to the component's name, add the frontmatter, reorder under the seven headings | judgment |
| Logs and exports beside source | Add an ignore rule or move out of `30_Order` | mechanical plus a check |
| `_retired-<date>/` folder | Delete in one commit after confirming nothing reads it | judgment, needs a yes |
## Done Conditions
- Each component under `30_Order/System/` has one record with all seven headings.
- No tracked file under it is runtime state.
- `Verify` was run once against real output when the record was written.
## Gold Standard Example
None yet. The first component record written to this Standard should be named here.
