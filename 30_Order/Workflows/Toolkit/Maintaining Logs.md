---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - workflow
  - logs
notes:
  - "[[00_Workflows Index]]"
  - "[[30_Order/Standards/AI Loop/Logs|Logs]]"
  - "[[Log Standard]]"
---
# Maintaining Logs
Keep the AI-toolkit logs fed, rotated, and honest.
**Use when:** a session ends, a review is due, or a log looks silent.
**Serves Standard:** [[30_Order/Standards/AI Loop/Logs|Logs]]. **Policy:** [[Log Standard]]. **Template:** [[30_Order/Templates/AI Toolkit/Tool Logs|Tool Logs]] (row logs).
## Steps
1. **Narrative logs:** at session end, append one entry ([[Memory Management]]).
2. **Row logs:** run `/export-ai-session` for any session that used skills or commands. It asks for confirmation, so it needs a person present.
3. **Machine logs:** do nothing by hand. Rotate with `30_Order/System/sync-workflow/scripts/rotate-sync-logs.ps1`; old lines move to `Sync-Log-Archive-<date>.md`.
4. **Silence check:** during each AI-tools review ([[Review Standard]]), open every log and compare its last entry with its stated cadence. A silent log is a finding. Find the cause (broken feeder or lapsed habit) before fixing or retiring it.
5. **Retire, do not delete:** a log that cannot name a feeder or owner is folded into an existing log, as `Write Log.md` was on 2026-08-20.
## Done when
- Each log's last entry matches its cadence, or the silence is recorded as a finding.
- No log was edited after the fact.
