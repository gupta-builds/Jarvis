---
type: system
status: sprout
created: 2026-10-15
updated: 2026-11-07
tags:
  - system
  - standards
  - review
system_kind: standard
family: policy
maps_to: []
used_by: []
gold_standard: none
notes:
  - "[[Review Standard]]"
  - "[[Capability Review Standard]]"
  - "[[Audit Report Standard]]"
  - "[[Per Project Review]]"
  - "[[Internship Loop Review Standard]]"
  - "[[Plan Review Cadence]]"
  - "[[Plan Standard]]"
  - "[[Memory Management]]"
---
# Review System
==Every review layer cites the real rows it read, fixes only what it is certain about, and hands anything unresolved to the layer above it.==
This is the map and shared contract for how reviews nest in this vault. It does not say what any single review contains; each layer has its own Standard for that. Read it to learn which review applies, where its output goes, and how a finding escalates.
## Review layers
| Layer | Cadence | What it reviews | Standard or skill | Output goes to |
|---|---|---|---|---|
| Daily | each working day | the day's plan and scorecard | `/startday`, `/closeday`, [[Daily Note Standard]] | the daily note in `10_Areas/Life/Enumerate/Daily/` |
| Project | weekly or monthly per project | one project note's truth and stall state | [[Per Project Review]] | the project note's own `## Log` |
| Plan | each review cycle | a `type: plan` note's progress | [[Plan Review Cadence]], [[Plan Standard]] | the plan's Current Progress section |
| Internship loop | weekly and monthly | the internship pipeline's output | [[Internship Loop Review Standard]] | `60_Claude/30_Reviews/Internship Loop/` |
| AI tools | weekly and monthly | how Claude Code, Cowork, and sync are used | [[Review Standard]] | `60_Claude/30_Reviews/AI/Scheduled/` |
| Vault | weekly | build, enrichment, and structural health | `/weekly-review`, [[Capability Review Standard]] | `60_Claude/30_Reviews/Weekly Synthesis/` |
| Audit | on demand | one system or pipeline, or a change set | [[Audit Report Standard]] | `60_Claude/30_Reviews/` |
| Ops | on demand | link, frontmatter, and orphan health | `/ops health-check`, agent `vault-curator` | `60_Claude/30_Reviews/Ops Reports/` |
## Rules
| Rule | Why | Enforced by |
|---|---|---|
| Cite real rows: every claim traces to a file, count, or log row opened this pass. A source not opened is listed as not reviewed | An unchecked claim repeats a stale one | Reader |
| Reviews do not fix. A review that surfaces a problem is not authorization to auto-fix it. Decided Fixes holds only items with 100% clarity, applied by hand or flagged for the next build session | A review that patches what it reviews cannot be trusted next time | Reader |
| Open Questions carry. They are never deleted without being resolved | A deleted question hides a gap | Reader |
| Carryover Escalation: a finding or open question that shows up in the same slot twice in a row is promoted to Immediate Actions in the next review. Do not carry it a third time unremarked | A third carry is a decision nobody made | Reader |
| Honest emptiness: "Nothing to report" is a valid finding. Do not invent one to fill a heading | A filler finding is noise | Reader |
| Nothing runs on its own. Every review is triggered by the owner or an agent asked to run it. A review not run is a gap to record, not to hide | A scheduled-sounding review that never fires gives false comfort | Reader |
| A project review's unresolved items surface in the vault's weekly review. A weekly item still open at month end is carried by the monthly review of its own layer. An item at a second monthly sighting is a discipline gap and goes to the owner as a decision, not another note | Escalation needs a destination | Reader |
| Do not add a review layer because a topic feels important. Check this table first; if an existing layer covers the subject, extend its Standard. A new layer needs a named trigger and a named owner, the test [[Logs]] applies to logs | Layers multiply faster than anyone reviews them | Reader |
## Done Conditions
- The review run was matched to a row in the table above.
- Its output landed where the table says.
- Anything two reviews old was escalated.
## Gold Standard Example
None for the system as a whole. For one layer, see the Gold Standard Example in [[Review Standard]].
