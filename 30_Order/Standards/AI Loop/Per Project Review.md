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
  - "[[30_Order/Standards/Project Standard|Project Standard]]"
  - "[[Internship Loop Review Standard]]"
  - "[[30_Order/Standards/AI Loop/Review System|Review System]]"
  - "[[Plan Review Cadence]]"
---
# Per Project Review
==A project review checks the note's claims against the real work and ends with one live next action, written into the project's own Log.==
This is the content standard for reviewing a single `type: project` note in `20_Progress/` (UROP, coursework builds, trading, personal builds). It borrows the proven skeleton from [[Internship Loop Review Standard]] but is not an internship review: no dossiers, no application counts. It does not replace [[30_Order/Standards/Project Standard|Project Standard]], which says what a project note must contain. This Standard says how to check that the note is still true.
## Maps To
- No new template. The output is a dated entry appended to the project note's own `## Log`, so the review lives next to the work it reviews. Stalls then show up when you open the note.
## Used By Workflow
- No dedicated Workflow yet. Nothing triggers this automatically: the owner or an agent runs it on request or during `/weekly-review`. If it becomes a repeated process, design the Workflow then (see [[30_Order/00_How This Folder Works|How This Folder Works]]).
## Cadence
Weekly for a project with an `active` status and a deadline inside the term. Monthly for an `active` project with no deadline. Never for `paused`, `complete`, or `archived`.
## Per-Heading Standard
Write the review as one Log entry: `- **YYYY-MM-DD review:**` followed by the checks below as short lines.
### Sources Reviewed
Name what was opened this pass: the project note, its brief in `40_Project_Briefs/`, its board (for example `Projects Board`, `BOOM Board`), and the tail of its own Log. An unopened source is listed as not reviewed.
> [!WARNING]
> Listing a source that was not opened. "Brief not reviewed" is honest; a claim about the brief without opening it is not.
### Current State check
Compare `## Current State` with the real work: the repo, the files, the last commit or edit date. Say what changed and what is now false. Label anything still partial as partial.
### Next Action check
Is `next:` live, single, and doable this week? Is it mirrored in `## Next Action`? If it is vague or done, replace it. One move only.
### Stall check
Days since the last Log entry before this one. Two review cycles with no new Log entry mean the project is stalled (the same bar [[Plan Review Cadence]] uses). A stalled project gets a decision, not a note: name the blocker, pause it, or archive it.
### Findings, Immediate Actions, Decided Fixes, Open Questions
Same meaning as in [[Review Standard]]. Decided Fixes holds only items with 100% clarity. Open Questions are `- [ ]` tasks and carry forward.
### Carryover Escalation
An Open Question or unresolved Finding that appears in two consecutive reviews of the same project is promoted to Immediate Actions in the next entry. Do not carry it a third time unremarked.
## Done Conditions
- The Log entry lists sources reviewed, including any not opened.
- Current State was compared with real files or commits, not with the previous Current State.
- `next:` is current and matches `## Next Action`.
- A stalled project has a decision recorded.
- Carryover items two reviews old were promoted.
## Gold Standard Example
None yet. The pattern is proven in the internship loop: [[60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/Internship Loop Weekly Review — 2026-W34|Weekly 2026-W34]]. The first project review written against this Standard should be named here.
