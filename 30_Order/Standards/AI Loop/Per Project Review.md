---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
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
  - "[[30_Order/Standards/Project Standard|Project Standard]]"
  - "[[Internship Loop Review Standard]]"
  - "[[Review System]]"
  - "[[Plan Review Cadence]]"
---
# Per Project Review
==A project review checks the note's claims against the real work and ends with one live next action, written into the project's own Log.==
This is the policy for reviewing a single `type: project` note in `20_Progress/` (UROP, coursework builds, trading, personal builds). The output is a dated entry in the project note's own `## Log`, so it has no Template or Workflow of its own and stalls show up when the note is opened. It borrows the skeleton of [[Internship Loop Review Standard]] but has no dossiers or application counts. What a project note must contain is [[30_Order/Standards/Project Standard|Project Standard]]; this policy says how to check that it is still true.
## Cadence
Weekly for a project with an `active` status and a deadline inside the term. Monthly for an `active` project with no deadline. Never for `paused`, `complete`, or `archived`. Nothing triggers it automatically; the owner or an agent runs it on request or during `/weekly-review`.
## The review entry
Write one Log entry: `- **YYYY-MM-DD review:**` followed by the checks below as short lines.
### Sources Reviewed
Name what was opened: the project note, its brief in `40_Project_Briefs/`, its board, and the tail of its own Log. An unopened source is listed as not reviewed.
> [!WARNING]
> Listing a source that was not opened. "Brief not reviewed" is honest; a claim about the brief without opening it is not.
### Current State check
Compare `## Current State` with the real work: the repo, the files, the last commit or edit date. Say what changed and what is now false. Label anything still partial as partial.
### Next Action check
Is `next:` live, single, and doable this week, and mirrored in `## Next Action`? If it is vague or done, replace it with one move.
### Stall check
Count days since the last Log entry before this one. Two review cycles with no new entry mean the project is stalled, the bar [[Plan Review Cadence]] uses. A stalled project gets a decision: name the blocker, pause it, or archive it.
### Findings, Immediate Actions, Decided Fixes, Open Questions
These mean what they mean in [[Review Standard]]. Decided Fixes holds only items with 100% clarity. Open Questions are `- [ ]` tasks and carry forward.
### Carryover Escalation
An Open Question or unresolved Finding that appears in two consecutive reviews of the same project is promoted to Immediate Actions in the next entry. Do not carry it a third time unremarked.
## Done Conditions
- The entry lists sources reviewed, including any not opened.
- Current State was compared with real files or commits, not with the previous Current State.
- `next:` is current and matches `## Next Action`.
- A stalled project has a decision recorded.
- Carryover items two reviews old were promoted.
## Gold Standard Example
None yet. The pattern is proven in the internship loop, for example Internship Loop Weekly Review 2026-W34 under `60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/`. The first project review written to this policy should be named here.
