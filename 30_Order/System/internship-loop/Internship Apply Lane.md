---
type: system
status: seed
created: 2026-11-21
updated: 2026-11-21
tags:
  - system
  - tooling
  - internship
system_kind: spec
trigger: None yet. Not built. Planned parts run locally on Anant's machine or when Anant runs them, never in GitHub Actions, because they read private folders.
owner: Anant, who does every step of this lane by hand until a part exists.
notes:
  - "[[Internship Pipeline]]"
  - "[[Internship Tracker Standard]]"
  - "[[Application Documents Standard]]"
  - "[[Loop Contract Change]]"
---
# Internship Apply Lane
## Purpose
This lane is not built. Nothing below exists in the loop repo or the vault today: the Apply Queue, Follow-ups, Deadline Map and Loop Status notes; `mark_applied`; the daily mover that archives dossiers whose deadline lapsed; the record of a dossier's duplicate key before it leaves the tracked tree; `companies.yml` and the `tier`, `resume_variant` and `letter_mode` keys; the resume variant builder; the cover letter bank; and a daily token-expiry check. Until each part exists, Anant does its step by hand as [[Internship Pipeline]] says. Checked 2026-11-21: `20_Progress/Internship/Applying/` holds four notes and no generated note, `20_Progress/Internship/Sent/` does not exist, the dossiers folder has no `Applied/` or `Archived/`, `companies.yml` is absent, and no `mark_applied` is defined in the loop repo.
## Trigger
None. When a part is built, this section names its command and where it runs.
## Inputs and Outputs
The contracts for each part are in the System Rebuild Plan under Contracts: the dossier keys, the eight dossier folders, the Tracker created in `Applied/`, the packet in `Sent/<dossier file name>/`, and four generated notes written under `20_Progress/Internship/Applying/`, a private path, with `type: generated`. This record is updated through [[Loop Contract Change]] when a part is built.
## State
None yet. A built part names every file it writes here.
## Failure Behavior
None yet. Planned: a daily token-expiry check. The response header that carries a token's expiry date has not been verified, so no check is described here.
## Verify
```bash
ls 20_Progress/Internship/Applying 20_Progress/Internship/Sent
```
Expected while not built: four notes in `Applying/` and no `Sent/` folder. Run 2026-11-21: exactly that.
## Retire
Delete this record in one commit that states the reason. Nothing runs, so nothing is turned off.
