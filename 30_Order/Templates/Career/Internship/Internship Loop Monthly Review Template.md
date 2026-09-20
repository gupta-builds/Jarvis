---
type: evergreen
status: tree
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - evergreen
  - review
  - template
  - internship
---
# Internship Loop Monthly Review — <% tp.date.now("YYYY-MM") %>
## Period Covered
<% tp.date.now("YYYY-MM-01") %> through <% tp.date.now("YYYY-MM-DD") %>
## Sources Reviewed
- [ ] `Programs/{Serious,Considering,Job & Company}/` (including `Missed/` and `Ended/` subfolders)
- [ ] `Contacts/Each One/{Ongoing,Come Back,Ended}/`
- [ ] `Tracker/{Each One,Tracker.md,Internship - Dashboard.md}`
- [ ] `20_Progress/Internship/Applying/{Now.md,Applied/}`
- [ ] `Preperation/Interviews/`
- [ ] Latest Deadline Sweep output ([[10_Areas/Career/Internships/Tracker/Deadline Tracker|Deadline Tracker]], check its header date)
## Pipeline Checklist
_Direct against [[Internship Pipeline]]'s own `Done When` list._
- [ ] Every program actually pursued has a Program note, a Contacts note, and a Tracker note, all cross-linked
- [ ] No Applying note has gone more than a week without a Log entry while active
- [ ] The Dashboard and the Kanban agree on what's currently in motion
- [ ] No `Ended/` Program note sits without a matching Applying note (flag for discard if found)
## Per-Program Trace
| Program | Noted | Researched | Created | Applied | Result | Stalled? |
|---|---|---|---|---|---|---|
## Deadline Sweep Reconciliation
_Query every live Program note's `deadline_posted`/`deadline_real` directly — never build this from memory of which programs are already being traced. Cross-check against the latest sweep's `Already Over` bucket._
-
## Application Census
_Full categorized count, each cited to a real query — see [[Internship Loop Review Standard]] for the exact categories._
- Ended (applied): ___
- Missed (deadline passed, never applied): ___
- Serious, active: ___ (of which, has Contact note: ___ / has Tracker note: ___ / real outreach logged: ___)
- Considering, active: ___ (same breakdown)
- Not yet reached out (Contact note, zero real Conversation Log entries): ___
- Not yet researched into a Program (screened pass, no Program note): ___
## Health Check
_Against the stated end goal — see [[Internship Loop Review Standard]]._
- Cumulative applications submitted vs. target (500 by 2026-12-31): ___
- Days remaining to target date: ___
- Required rate from today to still hit target: ___
- Actual rate this period: ___
## Note-Shape Conformance — Provisional
_See [[Internship Loop Review Standard]]'s dependency warning — grade only against current templates/Pipeline prose, name what's blocked on the pending 30_Order note-definition session._
-
## Findings
-
## Immediate Actions
_Anything above that can't wait for next month — a Program with a deadline inside the next sweep's 3-day window and zero Contact-note activity belongs here. Triggers same-day escalation to [[10_Areas/Career/Internships/Tracker/Main Log|Main Log]] per [[30_Order/Workflows/Internship/Internship Review System]]._
-
## Decided Fixes
_Only items with 100% clarity._
-
## Open Questions
_Include anything genuinely blocked on the pending note-definition session. Check last period's Open Questions against the Carryover Escalation rule first._
-
## Next Period's Watch List
-
