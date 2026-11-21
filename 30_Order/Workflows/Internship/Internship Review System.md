---
type: system
status: sprout
created: 2026-09-04
updated: 2026-11-21
tags:
  - system
  - workflow
  - internship
  - review
system_kind: workflow
serves: "[[Internship Loop Review Standard]]"
trigger: Anant runs the Weekly review on Fridays and the Monthly review on the 1st, by hand. No schedule runs either.
notes:
  - "[[Internship Loop Weekly Review Template]]"
  - "[[Internship Loop Monthly Review Template]]"
---
# Internship Review System
Produce each review when it is due, file it, and make sure what it finds is not left sitting unread.
## Use when
A Friday or the 1st arrives, or a missed review is noticed in the Reviews MOC. A review that needs the vault tools says "not connected" in its output if they fail, instead of guessing.
## Steps
1. Rebuild the Loop Status note with the Apply Queue builder when it exists; until then run `gh run list` on the run workflow by hand and read the last run's time and result.
2. Create the period file from the matching Template: `Internship Loop Weekly Review` for a week, `Internship Loop Monthly Review` for a month. Link it from [[60_Claude/30_Reviews/Internship Loop/Internship Loop Reviews MOC|the Reviews MOC]] before writing.
3. Write it to [[Internship Loop Review Standard]], citing real files and counts. Read quotas and limits from Source of Truth and the loop's config the same day. "Nothing to report" is a valid record.
4. State a non-empty Immediate Actions section plainly in the review's last message, so Anant sees it that day.
5. Hand off Decided Fixes. A code finding becomes a dated entry in the Claude Code Prompts note; a vault finding is fixed now.
6. Carry Open Questions forward verbatim. A second consecutive sighting becomes an Immediate Action.
## Do not
Do not treat a Decided Fix as permission to patch code. Do not skip a review because it looks redundant. Do not merge the loop-verifier agent's report into the review; cite it as an input. Do not claim a schedule that no task provides.
## Done when
- Every Friday and every 1st has a record, even a short one.
- Each review is in the Reviews MOC.
- Every Decided Fix has a findable downstream artifact.
