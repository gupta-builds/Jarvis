---
type: project
status: active
created: 2026-10-19
updated: 2026-10-19
related_progress:
  - "[[Mentor Details'26]]"
  - "[[Plan - Jesse]]"
  - "[[Smart Goals]]"
tags:
  - mentorship
next: Create the real Jesse/Meetings folder once the first meeting actually happens.
---
# Systems for Goals
This note defines the execution system for Jesse's mentorship, not just the rules of the relationship. Each layer below is written as a rule for how that layer actually operates, so the goals in [[Smart Goals]] turn into things that really happen instead of staying intentions. Per instruction, this writes the rules down; it does not create the actual tracker, log, or checklist files yet, those get created only once the system is needed for a real meeting.
## Why This System Exists
The Ahnaf relationship stated intentions (4 goals, a 5-month roadmap, success metrics) but never built anything to verify whether they happened, see [[Plan - Ahnaf#Current State|Plan - Ahnaf]]. Nothing here is allowed to repeat that: every goal in [[Smart Goals]] must have a layer below that can prove, on a given date, whether it moved or not.
## Layer 1, Daily Workflow (already exists, reused, not duplicated)
The base layer is the daily note and `/startday` and `/closeday` workflow already running inside Jarvis under `10_Areas/Life/Enumerate/Daily/`.
**Rule:** any single mentorship action item (send the outreach email, submit the Mentoring Agreement, write a post, log a decision) becomes an ordinary task line in that day's note, exactly like any other task. It is completed and verified through the same `/closeday` pass as everything else.
**Rule:** mentorship work never gets a separate, parallel task list. Fragmenting it into its own system is exactly how the Ahnaf-era goals went untracked, routing it through the daily workflow is what keeps it visible.
## Layer 2, Per-Meeting Checklist
**What it is:** a fixed four-part structure applied to every Jesse meeting, before, during, and after. Not a new file format, it is the same Transcript to Brief to Action chain already standardized for Ahnaf, applied here under a future `Jesse/Meetings/` folder once meetings actually start.
**Rule, before the meeting:** the agenda comes from [[Initial Outreach]]'s starter agenda for the first meeting, or from [[Plan - Jesse]]'s Sequence for every meeting after, and is shared with Jesse ahead of time, not kept only on Anant's side.
**Rule, during the meeting:** note what is demoed or updated, what shipped, what is blocked, and what is being decided, the same shape Ahnaf's Playbook used.
**Rule, after the meeting, same day:** four fixed fields get filled, what was actually said, what got decided, the concrete next step, and the next meeting's date and time, already booked before the call ended. This directly counters Ahnaf lesson 1 (after-meeting checklists that never got filled in) and lesson 4 (next meetings that kept slipping because they weren't booked on the spot).
## Layer 3, Running Decision Log
**What it is:** every concrete decision made with Jesse, a goal adjustment, a cadence agreed, a specific ask granted or declined, gets one dated, append-only line.
**Rule on where it lives:** inside [[Plan - Jesse]]'s own `## Decisions` section, not a separate decision-log file. One source of truth for decisions, not a second place to maintain.
**Rule on corrections:** if a later decision reverses an earlier one, the earlier line stays untouched and a new dated line explains the change, the same pattern [[Plan - Ahnaf]] already uses under `## Corrections`. History is never quietly edited away.
## Layer 4, Goal-Progress Tracker
**What it tracks:** for each of the three 80-goals and five 20-goals in [[Smart Goals]], a status (not started, in progress, done), the date it was last touched, and one line of evidence.
**Rule on where it lives:** appended as a dated entry to [[Plan - Jesse]]'s `## Current State` at every alternate-week check-in, which is Sequence step 5, "review progress against the 80." Not a separate spreadsheet or dashboard file, the goal state stays inside the same plan note everything else already points to.
**Rule on evidence:** "in progress" requires a dated line of real evidence, a sent message, a logged decision, a published post, not a verbal sense that something is moving.
## Verification Mechanism, Meetings Confirm Actions
**Rule:** a goal only moves to "in progress" or "done" if a dated meeting log or decision entry backs it up. Nothing gets marked done from memory alone. This is the direct fix for Ahnaf lesson 1, the Resq-versus-Opspilot decision that was "never resolved on record."
## Escalation Rule, When the System Stops Being Used
**Rule:** if two consecutive scheduled check-ins pass with no Current State update in [[Plan - Jesse]], that becomes its own flagged line under that note's `## Open Questions`, not something left to quietly slide. This is the direct fix for the Ahnaf-era pattern where planning kept getting deferred past the point it still helped.
## How the Layers Connect
1. A goal exists in [[Smart Goals]].
2. Work toward it becomes a task inside the daily workflow (Layer 1).
3. A meeting happens, following the per-meeting checklist (Layer 2).
4. Anything decided in that meeting becomes a dated line in [[Plan - Jesse]]'s Decisions (Layer 3).
5. The goal's status gets updated in [[Plan - Jesse]]'s Current State at the next alternate-week check-in (Layer 4).
6. If that update does not happen on schedule, the Escalation Rule fires.
## Open Questions
- [ ] Once the first meeting actually happens, create the real `Jesse/Meetings/` folder (Transcripts, Briefs, Action) rather than leaving this as a rule with nothing underneath it yet.
- [ ] Decide whether the alternate-week check-in should be fixed to a specific weekday once Jesse confirms the cadence proposed in the Google Doc.
