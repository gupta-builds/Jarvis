---
type: system
status: sprout
created: 2026-09-04
updated: 2026-10-16
tags:
  - system
  - workflow
  - internship
  - review
system_kind: workflow
serves: "[[Internship Loop Review Standard]]"
trigger: Every Friday for the Weekly review, the 1st of each month for the Monthly review, and every third day for the Deadline Sweep.
notes:
  - "[[Deadline and Intake Triage Standard]]"
  - "[[Internship Loop Weekly Review Template]]"
  - "[[Internship Loop Monthly Review Template]]"
  - "[[10_Areas/Career/Internships/Tracker/Main Log|Main Log]]"
---
# Internship Review System
Produce each review on its cadence, file it, and make sure what it finds is not left sitting unread.
## Use when
A scheduled fire arrives, or a missed one is noticed in the Reviews MOC.
## Steps
1. A local cron entry starts Claude Code headlessly with the local vault tools. It needs Obsidian running; if `vault_list` fails, say "not connected" in the output instead of guessing. A fire is skipped if the machine is asleep, so run `crontab -l` after time away.
2. Create the period file from the matching Template: `Internship Loop Weekly Review` for a week, `Internship Loop Monthly Review` for a month. Link it from [[60_Claude/30_Reviews/Internship Loop/Internship Loop Reviews MOC|the Reviews MOC]] before writing.
3. Write it to [[Internship Loop Review Standard]], citing real files and counts. "Nothing to report" is a valid record.
4. Re-anchor `Tracker/Deadline Tracker.md` to the run date on every third day ([[Deadline and Intake Triage Standard]]).
5. Add a one-line pointer to the Main Log in the same run.
6. Escalate a non-empty Immediate Actions section: state it plainly in the run's final message and append it to the Main Log's outstanding actions. It stays open there until a dated resolution lands.
7. Hand off Decided Fixes. A codebase finding becomes a dated entry in the Claude Code Prompts note; a vault finding is fixed now and gets one line in the session log.
8. Carry Open Questions forward verbatim. A second consecutive sighting becomes an Immediate Action.
## Do not
Do not treat a Decided Fix as permission to patch code. Do not skip a fire because it looks redundant. Do not merge the loop-verifier agent's report into the review; cite it as an input.
## Done when
- Every Friday, first of the month, and third day has a record, even a short one.
- Each review is in the Reviews MOC and the Main Log.
- Every Decided Fix has a findable downstream artifact.
