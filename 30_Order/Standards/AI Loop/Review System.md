---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
  - review
notes:
  - "[[Review Standard]]"
  - "[[Per Project Review]]"
  - "[[Internship Loop Review Standard]]"
  - "[[Plan Review Cadence]]"
  - "[[Daily Workflow Standard]]"
  - "[[Memory Management]]"
---
# Review System
==Every review layer cites the real rows it read, fixes only what it is certain about, and hands anything unresolved to the layer above it.==
This is the map and shared contract for how reviews nest in this vault. It does not say what any single review contains. Each layer below has its own Standard for that. Read this when you need to know which review applies, where its output goes, and how a finding escalates.
## Review layers
| Layer | Cadence | What it reviews | Standard or skill | Output goes to |
|---|---|---|---|---|
| Daily | each working day | the day's plan and scorecard | `/startday`, `/closeday`, [[Daily Workflow Standard]] | the daily note in `10_Areas/Life/Enumerate/Daily/` |
| Project | weekly or monthly per project | one project note's truth and stall state | [[Per Project Review]] | the project note's own `## Log` |
| Plan | each review cycle | a `type: plan` note's progress | [[Plan Review Cadence]] | the plan's Current Progress section |
| Internship loop | weekly and monthly | the internship pipeline's output | [[Internship Loop Review Standard]] | `60_Claude/30_Reviews/Internship Loop/` |
| AI tools | weekly and monthly | how Claude Code, Cowork, and sync are used | [[Review Standard]] | `60_Claude/30_Reviews/AI/Scheduled/` |
| Vault | weekly | build, enrichment, and structural health | `/weekly-review` | `60_Claude/30_Reviews/Weekly Synthesis/` |
| Ops | on demand | link, frontmatter, and orphan health | `/ops health-check`, agent `vault-curator` | `60_Claude/30_Reviews/Ops Reports/` |
## Rules every layer shares
- **Cite real rows.** Every claim traces to a file, count, or log row opened this pass. A source not opened is listed as not reviewed.
- **Reviews do not fix.** A review that surfaces a problem is not authorization to auto-fix it. Decided Fixes holds only items with 100% clarity, applied by hand or flagged for the next build session.
- **Open Questions carry.** They are never deleted without being resolved.
- **Carryover Escalation.** A finding or open question that shows up in the same slot twice in a row is promoted to Immediate Actions in the next review. Do not carry it a third time unremarked.
- **Honest emptiness.** "Nothing to report" is a valid finding. Do not invent one to fill a heading.
- **Nothing runs on its own.** Every review is triggered by the owner or an agent asked to run it. A review not run is a gap to record, not to hide.
## How findings escalate
A project review's unresolved items surface in the vault's weekly review. A weekly item still open at month end is carried by the monthly review of its own layer. An item that reaches a second monthly sighting is a discipline gap, and goes to the owner as a decision, not another note.
> [!WARNING]
> Adding a new review layer because a topic feels important. Check this table first. If an existing layer covers the subject, extend its Standard. A new layer needs a named trigger and a named owner, the same test [[Log Standard]] applies to logs.
## Known gaps
- `Review Standard`, `AI Weekly Review Template`, and `AI Monthly Review Template` cite `_All-Projects-Sync-Log`, which no longer exists. The live sync logs are `Sync-Log.md` inside `20_Progress/AI/Claude Code/.claude_windows/` and `.claude_wsl/`. Fix the citations when those files are next edited.
- `Review Standard` cites `Weekly Synthesis Template` and `Monthly Synthesis Template` under `Templates/Capability/`; no files by those names exist there now.
- The log tail of each layer is the only record that a review ran. See [[Memory Management]].
## Done Conditions
- The review run was matched to a row in the table above.
- Its output landed where the table says.
- Anything two reviews old was escalated.
## Gold Standard Example
None for the system as a whole. For one layer, see the Gold Standard Example in [[Review Standard]].
