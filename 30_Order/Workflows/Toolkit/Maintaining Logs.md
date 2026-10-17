---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - workflow
  - logs
system_kind: workflow
serves: "[[Logs]]"
trigger: A session ends, a review is due, or a log looks silent.
notes:
  - "[[Log Standard]]"
  - "[[Memory Management]]"
  - "[[Review Standard]]"
---
# Maintaining Logs
Keep the AI-toolkit logs fed, rotated, and honest.
## Use when
A session ends, an AI tools review is due, or a log has gone quiet.
## Steps
1. **Narrative logs:** at session end, append one entry in the format of [[Logs]] ([[Memory Management]]).
2. **Row logs:** run `/export-ai-session` for any session that used skills or commands. It asks for confirmation, so a person must be present.
3. **Machine logs:** do nothing by hand. `rotate-sync-logs.ps1` in `30_Order/System/sync-workflow/scripts/` moves old lines to `Sync-Log-Archive-<date>.md`.
4. **Silence check:** during each AI tools review, open every log and compare its last entry with the cadence in its frontmatter. A silent log is a finding. Find the cause, a broken feeder or a lapsed habit, before fixing or retiring it.
5. **Size check:** a narrative log over about 100 KB rotates per [[Log Standard]]: older months move unchanged to `Archive/YYYY-MM.md` beside it.
6. **Retire, do not delete:** a log that cannot name a feeder or owner is folded into an existing log, as `Write Log.md` was on 2026-08-20.
## Do not
Do not hand-edit an entry or a row after it is written, and do not start a new log without the scope check in [[Log Standard]].
## Done when
- Each log's last entry matches its cadence, or the silence is recorded as a finding.
- No entry was edited after the fact.
