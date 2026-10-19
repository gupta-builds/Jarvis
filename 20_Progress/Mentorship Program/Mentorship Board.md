---
type: index
status: sprout
created: 2025-12-25
updated: 2026-10-19
tags:
  - moc
  - mentorship
notes:
  - "[[Mentor Details'25]]"
  - "[[Plan - Ahnaf]]"
  - "[[Mentor Details'26]]"
  - "[[Plan - Jesse]]"
  - "[[Mentor Meeting Playbook]]"
  - "[[adx]]"
next: Send Ahnaf a re-engagement message (see [[Plan]]) and the Jesse outreach email (see [[Initial Outreach]])
---
# Mentorship Board
## Purpose
This is the control surface for the whole mentorship program, every mentor, every meeting, plan, and open thread lives under this folder. Read this before opening any individual note inside it. Each mentor gets its own subfolder for first-contact and goal detail (for example `Jesse/`) and its own plan file in `Plans/`; the program is never assumed to be one relationship.
## Program Reference (CSE Mentor Program, shared across every mentor)
The program is open to current CSE sophomores, juniors, and seniors. As a student, the role is to set the groundwork for a lasting professional network while gaining access to an insider's perspective on navigating a career path. The program matches a student with an industry professional in their area of interest.
- Take the lead in the relationship: identify goals for the program and stay in contact with the mentor, face to face, by phone, or by email, at least twice a month.
- A mentor may provide career advice, guidance, and networking opportunities. They are not expected to provide jobs or internships.

Reference links: [CSE Mentor Program How to Guide for Students](https://cse.umn.edu/college/alumni/mentor-program-how-to-guide-students?j=13644821&sfmc_sub=621816736&l=591_HTML&u=278673031&mid=6325307&jb=2#reachout), [CSE Mentor Program materials and information](https://cse.umn.edu/college/alumni/cse-mentor-program-materials-and-information?j=13644821&sfmc_sub=621816736&l=591_HTML&u=278673035&mid=6325307&jb=2), [Mentorship Guideline](https://cse.umn.edu/college/cse-mentor-program-guidelines).

**UMN Break Guide:** ![[Making Break Meaningful 1.pdf]]
## Map
[[Mentor Details'25]] holds who Ahnaf is, Senior Engineering Manager at Best Buy, matched through the CSE Mentor Program, and how to reach him. [[Plan - Ahnaf]] is now the honest record of that relationship: it is `status: paused`, Ahnaf is currently unavailable, and the plan's Sequence is a re-engagement path, not a continuation of the original 4-Goals framework as though nothing had changed.

[[Mentor Details'26]] holds who Jesse is, Director of Industry Solutions at SymphonyAI, matched for the 2026-2027 cycle. [[Plan - Jesse]] is the live plan for that relationship: an 80/20 goal split (3 committed goals, 5 stretch goals), built directly from the Ahnaf relationship's actual failure points so they are not repeated. [[Initial Outreach]], [[Smart Goals]], and [[Systems for Goals]] hold the first-contact detail, goal detail, and execution-tracking detail respectively.

[[Mentor Meeting Playbook]] is the meeting format Ahnaf's relationship followed, Demo, Shipped/Blocked/Deciding, Ask, and its Session Log is the append-only record of what was actually said. The most recent entry, 2026-07-14, is where **adx**, [[adx|Ahnaf's own Agent Development Kit]], became the real center of gravity of that relationship, and where the feedback debt now driving [[Plan - Ahnaf]]'s re-engagement sequence comes from.

Each meeting moves through three folders under `Meetings/`: the raw call lands untouched in `Transcripts/`, `/transcript-to-brief` turns it into a dated brief in `Briefs/`, [[Project Briefings - 2026-07-13]] is the current real example, and `/note-to-actions` turns that brief into a link-dense action note in `Action/` once one exists for a given meeting. [[Mentor Meeting - One-Pager]] is superseded, kept for history; the hackathon-prep note it used to point to has been folded into [[Plan - Jesse#Current State|Plan - Jesse]] and removed.
## Status
| Thread | State |
|---|---|
| Ahnaf, cadence | Agreed 2026-07-14 (alternate Mondays), never actually resumed; re-engagement is [[Plan - Ahnaf]]'s Sequence step 1 |
| Ahnaf, adx contribution | Feedback was due 2026-07-19, never delivered; stalled pending re-engagement, see [[Plan - Ahnaf]] |
| Ahnaf, Fall 2026 content | Never materialized, no fall meeting happened; folded into [[Plan - Ahnaf#Fall 2026\|Plan]] as a closed historical record |
| Jesse, outreach | Not yet sent; drafted in [[Initial Outreach]], targeting a first meeting before 2026-11-02 |
| Jesse, goals | Drafted as 80/20 in [[Plan - Jesse]]; not yet reviewed with Jesse directly |
| Future mentors | Each gets its own subfolder and its own plan file in `Plans/`, never assumed to inherit the others' knowledge automatically |
## Dataview
```dataview
TABLE status, deadline, related_progress, next
FROM "20_Progress/Mentorship Program"
WHERE (type = "project" OR type = "brainstorm")
SORT deadline ASC
```
## Links
[[adx]], Ahnaf's Agent Development Kit, [ahnafyy/adx](https://github.com/ahnafyy/adx); the codebase-review notes live under `20_Progress/Mentorship Program/Ahnaf/adx/`.
