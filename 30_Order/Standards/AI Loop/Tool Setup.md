---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
  - ai-tools
system_kind: standard
family: tool-setup
tier: 1
maps_to:
  - "[[30_Order/Templates/AI Toolkit/Tool Setup Template|Tool Setup Template]]"
used_by:
  - "[[Files Tracking]]"
gold_standard: "[[20_Progress/AI/Claude Code/Jarvis/Setup]]"
notes:
  - "[[Sync - Unison]]"
  - "[[Per Project Review]]"
  - "[[Logs]]"
---
# Tool Setup
==A Setup note says what is really in one project's mirrored tool folder, how it got there, and what runs it. It is checked against the folder, never against the last Setup note.==
This Standard covers `Setup.md`, the one note per project and tool (Claude Code, Cursor, Codex, Kiro) under `20_Progress/AI/<Tool>/<Project>/`. There are 32 today. It does not cover the mirrored files themselves, the vendor docs inside them, or the sync mechanics, which are in [[Sync - Unison]] and the `second-brain-claudekit` docs.
## Spec
```json
{
  "family": "tool-setup",
  "tier": 1,
  "match": {"type": "reference", "kind": "tool-profile", "path": "^20_Progress/AI/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "reference_kind", "notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["What this is", "Sync scope", "What's actually here", "Verification performed", "Trigger"],
  "optional_headings": [],
  "legacy_match": [
    {"path": "^20_Progress/AI/[^/]+/(.+/)?Setup\\.md$"}
  ]
}
```
## Headings
### What this is
The project, its repo or folder, and why its tool config is mirrored here. One current description. When a fact turns out wrong, correct it in place and record the correction under Verification performed.
### Sync scope
Direction (one way or bidirectional), the manifest entry, the paths that are synced, and the paths deliberately not synced with the reason.
*Density:* short lists, one line per path group.
### What's actually here
Counts per folder (agents, commands, skills, rules, context), verified by listing the folder, plus any file that is a stale or hand-copied snapshot. For static dumps that no sync maintains, say the dump is static and show the files' `setup_status` (`static`, `current`, `stale`, or `draft`) with a Dataview inventory of the folder.
### Verification performed
What was opened and compared, on what date, against the live repo and not the mirror. Corrections found go here with their date.
> [!WARNING]
> Describing the mirror as if it were the repo. The Windows copy once showed only part of what `~/projects/...` really held; verify against the live location.
### Trigger
What runs the sync or refresh: a schedule, a hook, or manual. A static dump says `none` and names the date it was taken.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: input` or `type: project` | `type: reference`, `reference_kind: tool-profile` | mechanical |
| `status: static`, `current` | `tree` | mechanical |
| `status: dead` | `archived` | mechanical |
| `status: stale` | `sprout` | mechanical |
| Static-dump headings: `Files`, `Inventory`, `Non-Markdown Files`, `Status & Gaps`, `Links` | `What's actually here` (Files, Inventory, Non-Markdown Files), `Verification performed` (Status & Gaps); add `What this is`, `Sync scope: none, static copy`, and `Trigger: none` | judgment |
| Dated correction sections appended to the end | Fold the correction into its heading; keep the date under `Verification performed` | judgment |
| `second-brain-claudekit/Setup.md` with `What's synced here` headings | Map to the five headings; it describes the source repo | judgment |
## Done Conditions
- Counts in `What's actually here` were taken from the folder in this pass.
- `Verification performed` names a date and a source that is not the mirror.
- `Sync scope` and `Trigger` agree with the manifest and the scheduled task.
- `next:` is one concrete step.
## Gold Standard Example
[[20_Progress/AI/Claude Code/Jarvis/Setup]]: all five headings, an explicit sync scope with what is not synced, counts per folder, and a verified trigger.
