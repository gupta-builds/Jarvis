---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
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
Status of this draft: designed before P0 to P7 ran. Do not run it until P7 works by hand. Refresh the task list from Capture Registration's Schedule section, which is the source of truth for timings.
## Prompt - P8 Schedules and Review Nudge
````
<role>
You are making the owner's weekly review prepare itself on a schedule and appear in front of them when it is due, while keeping every scheduled process written down in one timetable.
</role>

<context>
A loop that depends on remembering to run a script dies in week three. The owner wants scheduled runs, and wants every scheduled process tracked with its timing. The review itself stays human: the schedule only prepares the digest and a review skeleton and tells the owner.

Read first: 20_Progress/Projects/AI Use/Conversations/Capture Registration.md, section "Schedule" (the timetable of all Acer tasks, written 2026-10-22 and maintained from now on), and the existing task pattern: scripts/register-weekly-review-task.ps1, weekly-review-silent.vbs and run-weekly-review.ps1, plus register-capture-backfill-windows-task.ps1 (dry run unless -Apply, refuses other hosts, logs under %LOCALAPPDATA%\claude-capture). The toast code to reuse is in 30_Order/System/sync-workflow/scripts/check-syncthing-status.ps1.

Verified 2026-10-22: the Acer already runs ConversationCapture-Backfill-Windows and Jarvis-GitAutoSync every 30 minutes at :03 and :33, Jarvis-Syncthing-Health every 5 minutes, Jarvis-Codex-Daemon-Guard every 15 minutes (:12, :27, :42, :57), ThePlan-GitSync every 15 minutes (:08, :23, :38, :53), and Jarvis-WeeklyReview on Sundays at 06:00 (it ran on 2026-10-18 at 13:15, late, because the laptop was off at 06:00; the task starts when available). That review covers concept mastery, not conversations. Review System says "nothing runs on its own"; a script that prepares input for a review is not a review, and P4 records the wording conflict.

Inputs from earlier phases (refresh): P7's digest command and output path; P5's weekly note naming; P4's decisions on scheduling; P3's hook settings.
</context>

<goal>
A scheduled task generates the week's digest and creates the AI weekly review skeleton (status seed) if it does not exist, shows a toast, and logs an honest result. /startday tells the owner when a skeleton is waiting. The Schedule section lists every scheduled process with machine, time, purpose, owner script, last verified result and slot rationale, and the new tasks fit into free minutes.
</goal>

<constraints>
- Acer only; the register script refuses other hosts and is a dry run unless -Apply. The scheduled task makes no model call and does not touch Jarvis-WeeklyReview, Jarvis-GitAutoSync or the backfill task.
- New tasks use free minutes (not :03, :33, :08, :23, :38, :53, :12, :27, :42, :57, nor the Syncthing grid). Default: the digest runs Sundays at 21:00 for the current week; the time is a parameter.
- The runner takes a lock, writes logs/conversation-digest.log (add ignore lines for it in .gitignore and .stignore and prove them with git check-ignore -v), and exits non-zero if the digest fails. Create the skeleton only if no note exists; never overwrite an edited note.
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
1. Re-read the live scheduled tasks (name, state, triggers, last result, next run) and compare with the Schedule section; correct the section where it differs.
2. Write scripts/run-conversation-digest.ps1: compute the ISO week (parameter -Week to override), call the P7 digest, then create the weekly skeleton from the AI Weekly Review Template with the template placeholders rendered by the script, status seed, Period Covered filled, and a link to the digest. Toast on success and on failure.
3. Write the silent VBS launcher and scripts/register-conversation-digest-task.ps1 on the weekly-review pair's pattern.
4. Test: run the runner for a past week; run it twice and confirm the skeleton is untouched the second time; register with -Apply; run Start-ScheduledTask; read LastTaskResult (must be 0), the log line, and the new files.
5. Add the /startday nudge: if the newest AI Tools Weekly Review note has status seed and today is Sunday through Tuesday, add "Do the weekly conversation review" to Today's Focus.
6. Update the Schedule section with the new row and a verified result, update the trigger table in 30_Order/System/claude-workflow/README.md, and add the Log line to Conversation Layer.md.
</steps>

<verification>
When you change code that can be run, built, or type-checked, run a real check that exercises the change before reporting it done: the project's tests, type-checker, or build, or the changed command itself. A syntax-only check, or a check command that failed to start, does not count; if all that is missing is the project's declared dependencies, install them with its own package manager and lockfile, never via sudo or the system package manager, unless told not to. Only if no real check can run here, say which one you did not run and why instead of reporting the change as done. Here the real checks are Start-ScheduledTask with LastTaskResult 0, the log line, the idempotent second run, and git check-ignore.
</verification>

<report>
Reply with: the corrected timetable; the registered task's trigger and LastTaskResult; the skeleton path and proof that a second run left it untouched; the startday diff and toast text; and anything the owner must decide, such as a different day or time. Under 300 words.
</report>
````
## Run Record
- Ran:
- Result:
- Reviewed by owner:
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]], [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]], [[30_Order/Standards/AI Loop/Review System|Review System]].
