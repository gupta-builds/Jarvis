---
type: project
status: active
created: 2026-10-22
updated: 2026-10-30
tags:
  - project
  - ai
  - conversations
  - prompt
project_kind: prompt
task: schedules-and-review-nudge
model: claude-sonnet-5-5
---
# P8 - Schedules and Review Nudge
Run by Sonnet 5.5 inside the directory: `D:\_Anant\20_Progress\Documents\Jarvis`
Suggested effort: medium.
Follow this prompting guide to lay it out correctly: `https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5`
Status of this draft: refreshed on 2026-10-30 from the design postmortem and a re-read of Task Scheduler. Do not run it until P7 works by hand. Refresh the task list from Capture Registration's Schedule section, which is the source of truth for timings. It replaces the 2026-10-22 draft, which assumed a fixed 21:00 slot with no daylight-saving check and a nudge that appeared only on Sunday to Tuesday.
## Prompt - P8 Schedules and Review Nudge
````
<role>
You are making the owner's weekly review prepare itself on a schedule and appear in front of them when it is due, while keeping every scheduled process written down in one timetable.
</role>

<context>
A loop that depends on remembering to run a script dies in week three. The owner wants scheduled runs, and wants every scheduled process tracked with its timing. The review itself stays human: the schedule only prepares the digest and a review skeleton and tells the owner. A script that prepares input for a review is not a review; Review System's sentence "Nothing runs on its own" is reworded in P10, not here.

Read first: 20_Progress/Projects/AI Use/Conversations/Capture Registration.md, section "Schedule" and the 2026-10-30 re-read below it (the timetable of all Acer tasks, maintained from now on), and the existing task pattern: scripts/register-weekly-review-task.ps1, weekly-review-silent.vbs and run-weekly-review.ps1, plus register-capture-backfill-windows-task.ps1 (dry run unless -Apply, refuses other hosts, logs under %LOCALAPPDATA%\claude-capture). The toast code to reuse is in 30_Order/System/sync-workflow/scripts/check-syncthing-status.ps1.

Read from Task Scheduler on 2026-10-30 (re-read in step 1; the Acer may have changed):
- ConversationCapture-Backfill-Windows: every 30 minutes, last result 0 at 21:03.
- Jarvis-GitAutoSync: every 30 minutes, last result 1 at 21:03. Its log shows "Committed" and then "FAILED, local changes could not be committed"; 2 of its last 12 runs ended FAILED and the next run recovered. Record it; do not change this task.
- Jarvis-Syncthing-Health: every 5 minutes, last result 1 at 21:26. Record it; do not change it.
- Jarvis-Codex-Daemon-Guard: Disabled, last run 2026-10-26 18:57. Record it.
- ThePlan-GitSync: every 15 minutes, result 0.
- Jarvis-WeeklyReview: weekly, registered with a start boundary of 2026-09-28T06:00:00-05:00. Daylight saving ends on 2026-11-01 and its next run already reads 05:00 local. It ran at 13:15 on 2026-10-18 and 13:22 on 2026-10-25 (about seven hours late, because the laptop was off at 06:00 and the task starts when available). That review covers concept mastery, not conversations.
- Free minutes for new tasks: not :03, :33, :08, :23, :38, :53, :12, :27, :42, :57, nor the Syncthing grid.

Inputs from earlier phases (refresh): P7's digest command and output path (it rebuilds the current and the previous ISO week on every run and writes a separate key file); P5's weekly note naming ("AI Tools Weekly Review - <year>-W<week>" in 60_Claude/30_Reviews/AI/Scheduled/Weekly/); the owner's answers on nudge timing.
</context>

<goal>
A scheduled task generates the digest (current and previous week) and creates the AI weekly review skeleton (status seed) for the week that is ending if it does not exist, shows a toast, and logs an honest result. The task is registered in local time with no fixed UTC offset, so it does not move at daylight saving. /startday tells the owner every day while the newest weekly note is still a skeleton, and says how many days old it is once it passes 7. A missed week is written into the next digest as a gap with the streak count. The Schedule section lists every scheduled process with machine, time, purpose, owner script, last verified result and slot rationale, and the new task fits into a free minute.
</goal>

<constraints>
- Acer only; the register script refuses other hosts and is a dry run unless -Apply. The scheduled task makes no model call and does not touch Jarvis-WeeklyReview, Jarvis-GitAutoSync, Jarvis-Syncthing-Health, Jarvis-Codex-Daemon-Guard or the backfill task.
- Default: the digest runs Sundays at 21:00 and starts when available, so a closed laptop catches up on the next boot; the time is a parameter. The task must use a start time without a UTC offset. After registering, read the task's XML and report the start boundary, and report what Task Scheduler shows as the next run for the Sunday after 2026-11-01.
- The runner takes a lock, writes logs/conversation-digest.log (add ignore lines for it in .gitignore and .stignore and prove them with git check-ignore -v), and exits non-zero if the digest fails. Create the skeleton only if no note exists; never overwrite an edited note. The skeleton and the toast never name a The Plan prompt.
- The /startday nudge edits .claude/skills/starting-day/SKILL.md (confirm the path and the Unison sync direction first: read register-jarvis-sync-task.ps1 and sync-jarvis-silent.vbs; if Unison could overwrite the skill, stop and ask).
- Do not edit Standards, Templates or Workflows, or 00_Dashboard.md. Never open .credentials.json or .env files. Do not run git commit or git push.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks.
- When the work the user asked for is done and checked, stop and report. Don't add features, tests, files, docs or refactors that weren't asked for. If you think one would help, mention it at the end instead of doing it.
- Keep working until everything the user asked for is done, and only stop to ask when you can't go on without the user or before a risky step.
</constraints>

<progress_updates>
Before your first tool call, say in one sentence what you are about to do. After each numbered step, write one line with the result. End with a short recap.
</progress_updates>

<steps>
1. Re-read the live scheduled tasks (name, state, triggers, start boundary, last result, next run) and compare with the Schedule section and the list above; correct the section where it differs, and record the three observations (GitAutoSync FAILED runs, Syncthing-Health result 1, Codex guard Disabled) without changing those tasks.
2. Write scripts/run-conversation-digest.ps1: compute the current ISO week (parameter -Week to override), call the P7 digest for it and the previous week, then create the weekly skeleton for the week that is ending from the AI Weekly Review Template with the template placeholders rendered by the script, status seed, Period Covered filled, and a link to the digest. If the previous week has no review note and no skeleton, add a gap line to the digest and keep the streak count. Toast on success and on failure.
3. Write the silent VBS launcher and scripts/register-conversation-digest-task.ps1 on the weekly-review pair's pattern, with a local start time and start-when-available.
4. Test: run the runner for a past week; run it twice and confirm the skeleton is untouched the second time; register with -Apply; run Start-ScheduledTask; read LastTaskResult (must be 0), the log line, and the new files; read the task XML and the next-run time as described in the constraints.
5. Add the /startday nudge: while the newest AI Tools Weekly Review note has status seed, add "Do the weekly conversation review" to Today's Focus every day, with its age in days once it is over 7, and mention a skipped week.
6. Update the Schedule section with the new row and a verified result, update the trigger table in 30_Order/System/claude-workflow/README.md, and add the Log line to Conversation Layer.md.
</steps>

<verification>
When you change code that can be run, built, or type-checked, run a real check that exercises the change before reporting it done: the project's tests, type-checker, or build, or the changed command itself. A syntax-only check, or a check command that failed to start, does not count; if all that is missing is the project's declared dependencies, install them with its own package manager and lockfile, never via sudo or the system package manager, unless told not to. Only if no real check can run here, say which one you did not run and why instead of reporting the change as done. Here the real checks are Start-ScheduledTask with LastTaskResult 0, the log line, the idempotent second run, the task XML start boundary and next-run time, and git check-ignore.
</verification>

<report>
Reply with: the corrected timetable; the registered task's trigger, start boundary and LastTaskResult; the skeleton path and proof that a second run left it untouched; the startday diff and toast text; the three observations; and anything the owner must decide, such as a different day or time. Under 300 words.
</report>
````
## Run Record
- Ran:
- Result:
- Reviewed by owner:
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]], [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]], [[30_Order/Standards/AI Loop/Review System|Review System]].
