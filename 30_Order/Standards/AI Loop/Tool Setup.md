---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
  - ai-tools
system_kind: standard
family: tool-setup
tier: 1
maps_to:
  - "[[AI Tool Profile Template]]"
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
This Standard covers `Setup.md`, the one note per project and tool (Claude Code, Cursor, Codex, Kiro) under `20_Progress/AI/<Tool>/<Project>/`. It is not the mirrored files themselves, the vendor docs inside them, or the sync mechanics, which are in [[Sync - Unison]] and the `second-brain-claudekit` docs.
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

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/AI/<Tool>/<Project>/Setup.md` |
| File name | Always `Setup.md`, one per project folder. |
| Kind | `type: reference` with `reference_kind: tool-profile`. |
| Status | `sprout` once verified against the folder, `tree` while its trigger runs and the counts still match, `archived` when the mirror is dropped. |
## Headings
### Frontmatter
- **Write:** `reference_kind: tool-profile`, `status`, dates, `tags`, `notes`, and `next`, one concrete step. A static dump adds `setup_status` (`static`, `current`, `stale`, or `draft`) to its files.
- **Length:** one line per key.
- **Never:** `type: input` or `type: project`. All 32 Setup notes miss `reference_kind`.
- **Right:** None yet.
- **Wrong:** `type: input`
### What this is
- **Write:** the project, its repo or folder, and why its tool config is mirrored here. One current description. When a fact turns out wrong, correct it in place and record the correction under Verification performed.
- **Length:** one paragraph.
- **Never:** a description of the mirror as if it were the repo.
- **Right:** `The live-synced mirror of this vault's own root`
- **Wrong:** None seen.
### Sync scope
- **Write:** direction (one way or bidirectional), the manifest entry, the paths that are synced, and the paths deliberately not synced with the reason.
- **Length:** short lists, one line per path group.
- **Never:** a sync claim with no manifest entry.
- **Right:** `Bidirectional, via`
- **Wrong:** None seen.
### What's actually here
- **Write:** counts per folder (agents, commands, skills, rules, context), verified by listing the folder, plus any file that is a stale or hand-copied snapshot. For a static dump no sync maintains, say so, with a Dataview inventory of the folder.
- **Length:** one line per folder.
- **Never:** counts copied from the last Setup note.
- **Right:** None yet.
- **Wrong:** None seen.
### Verification performed
- **Write:** what was opened and compared, on what date, against the live repo and not the mirror. Corrections found go here with their date.
- **Length:** a numbered list of checks.
- **Never:** describing the mirror as if it were the repo. The Windows copy once showed only part of what `~/projects/...` held.
- **Right:** `Extra care taken here specifically because the source is the live config of the very session that built this sync`
- **Wrong:** None seen.
### Trigger
- **Write:** what runs the sync or refresh: a schedule, a hook, or manual. A static dump says `none` and names the date it was taken.
- **Length:** one to three sentences.
- **Never:** a trigger that was not checked against the scheduled task.
- **Right:** `Manual only as of 2026-08-10`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The five headings appear in order and none is empty | Setup notes are compared by section | Lint, check 2 |
| `reference_kind: tool-profile` | Tool profiles are found by kind | Lint, check 1 |
| Counts in What's actually here were taken from the folder in this pass | A copied count is always right until the folder changes | Reader |
| Verification names a date and a source that is not the mirror | The mirror always agrees with itself | Reader |
| `Sync scope` and `Trigger` agree with the manifest and the scheduled task | Two descriptions of one mechanism diverge | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: input` or `type: project` (all 32) | `type: reference`, `reference_kind: tool-profile` | Mechanical |
| `status: static`, `current` | `tree` | Mechanical |
| `status: dead` | `archived` | Mechanical |
| `status: stale` | `sprout` | Mechanical |
| Static-dump headings: `Files`, `Inventory`, `Non-Markdown Files`, `Status & Gaps`, `Links` | `What's actually here` (Files, Inventory, Non-Markdown Files), `Verification performed` (Status & Gaps); add `What this is`, `Sync scope: none, static copy`, and `Trigger: none` | Judgment |
| Dated correction sections appended to the end | Fold the correction into its heading; keep the date under `Verification performed` | Judgment |
| `second-brain-claudekit/Setup.md` with `What's synced here` headings | Map to the five headings; it describes the source repo | Judgment |
## Done Conditions
- Counts in `What's actually here` were taken from the folder in this pass.
- `Verification performed` names a date and a source that is not the mirror.
- `Sync scope` and `Trigger` agree with the manifest and the scheduled task.
- `next:` is one concrete step.
- The note passes [[Vault Lint]] for `tool-setup`.
## Gold Standard Example
[[20_Progress/AI/Claude Code/Jarvis/Setup]]: all five headings, an explicit sync scope with what is not synced, counts per folder, and a verified trigger. It does not pass lint: it is typed `input` and has no `reference_kind`.
Measured 2026-11-07 with `--family tool-setup`: 32 notes, 0 pass. All 32 lack `reference_kind`; about 23 lack the five headings (static dumps); 22 carry an off-vocabulary status (15 `static`, 4 `dead`).
