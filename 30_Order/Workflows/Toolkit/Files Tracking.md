---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - workflow
  - ai-tools
system_kind: workflow
serves: "[[Tool Setup]]"
trigger: Files in a mirrored tool folder under 20_Progress/AI were added, removed, or changed, or a sync run reported changes.
notes:
  - "[[Sync - Unison]]"
  - "[[Tools Tracking]]"
  - "[[Logs]]"
---
# Files Tracking
Keep a project's Setup note true to the files in its mirrored tool folder. Tools Tracking updates the Tool Map; this updates the per-project inventory.
## Use when
A sync run changed a mirror, a project onboarded to the sync, a tool config was edited in a vault session, or a Setup note's counts are older than its last sync.
## Steps
1. Find the project's `Setup.md` at `20_Progress/AI/<Tool>/<Project>/Setup.md`.
2. Read the live source, not the mirror: for a WSL project the repo under `~/projects/`, for Jarvis the vault's own `.claude/`. List its agents, commands, skills, rules, context, and hooks with counts.
3. Compare with `What's actually here`. Update the counts and name each file that was added, removed, or found stale.
4. Check `Sync scope` against the manifest entry in `second-brain-claudekit` and `Trigger` against the scheduled task. Correct whichever disagrees.
5. Record what you opened, the date, and any correction under `Verification performed`.
6. Refresh `next:` and `updated:`.
7. Append a narrative line to the Claude Kit Log if the drift was real ([[Logs]]).
## Do not
Do not copy counts from the previous Setup note, or describe the mirror as if it were the repo.
## Done when
- Counts were taken from the live folder in this pass.
- `Verification performed` names a date and a source that is not the mirror.
- `Sync scope` and `Trigger` match the manifest and the scheduled task.
