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
task: project-routing-and-acer-reexport
model: claude-sonnet-5-5
---
# P2 - Project Routing and Acer Re-export
Run by Sonnet 5.5 inside the directory: `D:\_Anant\20_Progress\Documents\Jarvis`
Suggested effort: high. This phase moves files and rewrites the whole Acer note tree, and it has an owner approval gate in the middle.
Follow this prompting guide to lay it out correctly: `https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5`
Run after P0 and P1 are reviewed. If the session runs low on room, finish the step in progress, stop, and write the exact next step in the report.
## Prompt - P2 Project Routing and Acer Re-export
````
<role>
You are a careful engineer making the Acer's conversation archive match the owner's project layout, then regenerating every note with the finished exporter. Some steps move files and one is dangerous if done carelessly, so you check before you act and prove after.
</role>

<context>
The owner works in several places with Claude Code on Windows and wants each place to have its own folder of session notes under 60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/. The Acer tree is a fresh test bed for the new design, so it may be reorganized. Read the code before describing it; line numbers below were read on 2026-10-22 and drift.

Owner decisions of 2026-10-22 on which directories become which project folder:
- Jarvis: the vault D:\_Anant\20_Progress\Documents\Jarvis and every folder inside it (the exporter already does this).
- The Plan: D:\_Anant\20_Progress\Documents\The Plan and everything inside it (already does this).
- Home: exactly C:\Users\anant (already does this).
- UMN Courses: every folder under D:\_Anant\10_Areas\UMN, for example ...\UMN\Classes\CSCI\CSCI 5304 and ...\CSCI 4061\csci4061-fa26. This is new. All course work lands in one project folder called UMN Courses.
- Any other directory in which Claude Code is used gets a folder named after the directory (the existing fallback), so new places are recorded automatically.
- One exception chosen by the assistant for the owner to confirm in the report: Claude Code's own scratch folders under %LOCALAPPDATA%\Temp\claude go to a folder called Scratch, so one-off test runs (the denytest session) do not each create a project.

What exists now (read on 2026-10-22, 23:30 to 23:45):
- Acer tree: about 113 notes in 11 project folders: Jarvis 70, The Plan 19, Home 16, Code 2 (cwd under UMN\Classes\CSCI\CSCI 4521 and CSCI 4511W), and one each of CSCI 5304, csci4061-fa26, Conversations, Jesse, Plans, sync-workflow, denytest. Conversations, Jesse, Plans and sync-workflow hold sessions whose cwd is inside the Jarvis vault, so they belong to Jarvis. Code, CSCI 5304 and csci4061-fa26 hold sessions whose cwd is under D:\_Anant\10_Areas\UMN, so they belong to UMN Courses. denytest's cwd is under %LOCALAPPDATA%\Temp\claude, so it belongs to Scratch.
- Get-ProjectName (near lines 61 to 75 of scripts/export-claude-session.ps1) knows only the vault, The Plan and Home. Find-ExistingSessionDir (near lines 81 to 95) keeps a session in whichever folder already holds its .exported marker. So adding rules alone will not move any existing note; the move is this phase's job.
- 4 sessions exist as two notes in two folders on the Acer (found by the Dell session), 3 inside Acer/Windows/Claude. Do not assume which; compute them.
- The hook passes the live cwd of the session, the scheduled backfill passes the first cwd found in the transcript's first 20 lines. A session that changes directory can disagree with itself; stickiness handles that after the first export.
- The backfill (-BackfillAll) walks C:\Users\anant\.claude\projects\*\*.jsonl, top level only. 124 top-level transcripts exist across six folders. Sessions with no assistant turn become a "junk" status and an empty marker, no note.
- Test-LegacyExported returns "legacy" for session ids whose marker sits in the old Windows\ trees or in Dell\Windows\Claude, and skips them. Keep that.
- DANGER, verified in the code (Export-Session near lines 469 to 474): each project folder contains _raw_jsonl, an NTFS junction that points at the LIVE C:\Users\anant\.claude\projects\<slug> transcript folder. Remove-Item -Recurse on a folder that contains the junction can delete the real transcripts on some Windows PowerShell versions. Only cmd /c rmdir "<junction path>" removes the link alone. Those transcripts are the data this whole project exists to protect.
- P0 saved a copy of the live transcripts to D:\_Anant\99_Archive\Claude Transcript Snapshot 2026-10-22 and set cleanupPeriodDays to 60. P1 finished the note format (status seed, review_state raw, created and updated, no BOM, fenced commands, deduplicated tokens, priced models) and added scripts/run-all-tests.ps1 and the JARVIS_CAPTURE_OUTROOT test override. Confirm both are done by reading the files and the P0 and P1 report lines in 20_Progress/Projects/AI Use/Conversations/Conversation Layer.md before you start; if either is missing, stop and say so.
- Old notes written before P1 lack review_state and carry token totals inflated 2 to 3 times. This phase regenerates every note whose transcript still exists. Notes whose transcript was already swept stay as they are, and they are recognizable by having no review_state.
</context>

<goal>
Every Acer session with a live transcript has exactly one note, in the right project folder per the rules above, written in the finished format. No session has two notes. Stray single-note folders are gone from the vault (archived outside it, not deleted). Notes whose transcripts were swept are moved to the right folder if they are in the wrong one. A read-only coverage script proves it against the transcripts on disk. The routing rules live in one editable file, documented in the vault. The live transcripts are untouched: the count before and after is the same.
</goal>

<constraints>
- Before and after every step that moves or removes anything, count the top-level *.jsonl under C:\Users\anant\.claude\projects and confirm the number is unchanged. If it drops, stop immediately and report.
- Never use Remove-Item -Recurse (or rd /s) on any folder inside the vault's AI Conversations tree. To retire a folder that contains _raw_jsonl, first run cmd /c rmdir on each junction, check that the transcript count is unchanged, and only then move the folder out of the vault with Move-Item.
- Nothing is deleted. Retired folders, superseded duplicate notes and replaced notes move to D:\_Anant\99_Archive\Acer Conversation Reroute 2026-10-22 with a SHA-256 manifest of every moved file. Wait for the owner's approval of the dry-run plan (step 7) before moving anything.
- Write only to: scripts/export-claude-session.ps1, the new routing file and scripts named below, the Acer conversation tree, the archive folder, and the vault notes named in step 12.
- Do not touch Dell, WSL, Cowork, Cursor or Codex files, the legacy Windows\ trees, the _archive-pre-fix folders, or .obsidian.
- Never open .credentials.json, any .env file, or history.jsonl. Do not copy transcript text into your report; report counts and note paths.
- Run every test under pwsh and under powershell.exe -NoProfile -ExecutionPolicy Bypass -File.
- Do not run git commit or git push. Jarvis-GitAutoSync commits every 30 minutes. A move that Syncthing has already carried to the other laptop is fine; the Dell's git sync is disabled.
- Notes you patch: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update updated:.
- When the work the user asked for is done and checked, stop and report. Don't add features, tests, files, docs or refactors that weren't asked for. If you think one would help, mention it at the end instead of doing it.
- Keep working until everything the user asked for is done, and only stop to ask when you can't go on without the user or before a risky step. The approval gate in step 7 is the risky step.
</constraints>

<progress_updates>
Before your first tool call, say in one sentence what you are about to do. After each numbered step, write one line with the result and the transcript count. End with a short recap.
</progress_updates>

<steps>
1. Baseline. Run scripts/run-all-tests.ps1 and record the result. Count top-level transcripts per project slug. Count notes per Acer project folder (exclude files starting with "00 -"). Record all three.
2. Routing file. Create 30_Order/System/claude-workflow/capture-projects.json with a version number and an ordered rules list, first match wins. Each rule has a project name, a match kind (under or exact), and a path with tokens: {vault}, {root} (the folder three levels above the vault, which is D:\_Anant), {home} (USERPROFILE) and {localappdata}. Rules, in order: Jarvis under {vault}; The Plan under the sibling folder "The Plan" of the vault's parent; UMN Courses under {root}\10_Areas\UMN; Home exact {home}; Scratch under {localappdata}\Temp\claude. Add a fallback field saying "leaf" for unmatched directories. Add a short comment field explaining how to add a project. Resolve tokens relative to the script's own location so the Dell can reuse the file later.
3. Router code. Replace the hard-coded vault list in Get-ProjectName with a loader for that file. Cache it per run. Compare paths case-insensitively and require a path separator after the prefix so a sibling like Jarvis-old does not match Jarvis. If the file is missing or invalid, fall back to the built-in vault, The Plan and Home behavior and write one line to %LOCALAPPDATA%\claude-capture\routing.log; never throw, because the hook must not fail.
4. Re-export switch. Add a -Force switch to the exporter that makes Export-Session re-render a session even when its marker is newer than the transcript. Keep reusing the file name stored in the marker so a title change cannot create a second note. Keep Find-ExistingSessionDir as it is. Document -Force in the script header.
5. Routing tests. Extend scripts/test-project-routing.ps1 or add scripts/test-capture-projects.ps1. Cover each rule with a path inside it and one outside, the order of rules (a Jarvis path never becomes UMN), case differences, a trailing slash, a sibling-prefix path, the Scratch rule using a real %LOCALAPPDATA%\Temp\claude\... path, the leaf fallback, an empty cwd giving "Unknown", and a missing or corrupt routing file giving the built-in behavior. Run under both shells.
6. Coverage script. Write scripts/check-capture-coverage.ps1, read-only, with parameters for the transcripts root, the notes root and the routing file so tests can use synthetic folders. For every top-level transcript it reports: session id, whether it has any assistant turn (use a fast text search for the assistant type marker; do not parse whole files), whether exactly one note exists for that id in the notes root (match the session_id line in the note head), and whether that note sits in the folder the routing rules give for the transcript's first cwd. It prints a summary table and the list of sessions with no note, two notes, or a wrong folder, and exits non-zero if any exist. It also counts notes whose transcript is gone and that lack review_state. Add a synthetic-folder test for each case.
7. Dry-run plan. Write scripts/reroute-acer-notes.ps1, dry-run by default, apply only with -Apply. For every note in the Acer tree it computes the target folder from the note's cwd frontmatter and the rules. It plans: (a) moves for notes in the wrong folder with no live transcript (the file, its .exported marker, and the project: line in the note's frontmatter updated to the target name); (b) for sessions with a live transcript, no move at all, because step 10 regenerates them in the right folder and the old note is archived after the new one is verified; (c) for a session with two notes, keeping the one with the later exported_at and archiving the other; (d) retirement of any folder that ends up with no notes. Run it as a dry run and print the plan as a table: session id, from, to, action, reason. Then STOP. Show the plan to the owner with AskUserQuestion, say how many files move and how many are archived, and wait for approval. Do not continue without it.
8. Apply. After approval, run the script with -Apply. Archive, never delete. Follow the junction rule in the constraints exactly. Write the SHA-256 manifest. Recount the transcripts and confirm the number is unchanged.
9. Re-export. Run the exporter with -BackfillAll -Force. Afterward archive each pre-existing note that was superseded by a regenerated note in a different folder, using the same archive folder and manifest.
10. Prove it. Run check-capture-coverage.ps1 on the real tree. Every transcript that has an assistant turn must have exactly one note in the right folder; report any that do not and why. Recount transcripts. Open three regenerated notes by reading only their frontmatter and fence lines: one from UMN Courses, one from The Plan, one from Jarvis. Confirm status: seed, review_state: raw, no BOM (check bytes), the right project: value, and that the note file's session_id matches. Check that project folder names are exactly Jarvis, The Plan, Home, UMN Courses, Scratch, plus any other directory the owner really used.
11. Hook check. Without editing the hook, confirm by reading jarvis-session-continuity.ps1 that it passes cwd to the exporter and that a new Stop in a UMN course directory would route to UMN Courses (a test with Export-Session and a synthetic transcript is enough). Note in your report that _raw_jsonl in UMN Courses can point at only one transcript folder, so it is a partial view there; do not change it.
12. Documentation. In 20_Progress/Projects/AI Use/Conversations/Capture Registration.md add a "Project routing (Acer Windows)" section with the rule table and the path of capture-projects.json. In 20_Progress/Projects/AI Use/Conversations/Capture Scripts.md add cards for check-capture-coverage.ps1, reroute-acer-notes.ps1 and the routing file, and note -Force. In 20_Progress/Projects/AI Use/Conversations/Legacy Layout and Archives.md add a dated Corrections entry describing the new Acer tree and the archive folder. Append one line to the Log of 20_Progress/Projects/AI Use/Conversations/Conversation Layer.md with the counts.
</steps>

<verification>
When you change code that can be run, built, or type-checked, run a real check that exercises the change before reporting it done: the project's tests, type-checker, or build, or the changed command itself. A syntax-only check, or a check command that failed to start, does not count; if all that is missing is the project's declared dependencies, install them with its own package manager and lockfile, never via sudo or the system package manager, unless told not to. Only if no real check can run here, say which one you did not run and why instead of reporting the change as done. Here the real checks are run-all-tests.ps1 under both shells, the dry-run plan, the transcript counts before and after every move, and the coverage script on the real tree.
</verification>

<report>
Reply with: the baseline counts; the routing rules as written; the test results under both shells; the approved plan summary (files moved, archived, folders retired) and the archive path with the manifest file count; the coverage script's final table; the transcript counts before and after (they must be equal); the three note spot-checks; every session that still lacks a note or a correct folder and why; the Scratch decision for the owner to confirm; and anything you did not do. Use exact numbers and keep it under 450 words.
</report>
````
## Run Record
- Ran: 2026-10-28, Sonnet 5.5, in the Jarvis directory on the Acer. The owner approved the dry-run plan at the step 7 gate.
- Result: all twelve steps done. Routing now comes from `capture-projects.json`; the exporter has `-Force`; `check-capture-coverage.ps1` and `reroute-acer-notes.ps1` exist. `run-all-tests.ps1` passes 12 of 12 (six test files, both shells). Of 129 transcripts, 103 have an assistant turn and each has one note in the right folder; the other 26 have none, as designed. The tree holds Jarvis 83, The Plan 20, Home 17, UMN Courses 5, Scratch 1. 8 files moved and 28 archived to `D:\_Anant\99_Archive\Acer Conversation Reroute 2026-10-22` (36-row SHA-256 manifest); 8 folders retired. Transcripts were 129 before and after every step. One departure from step 7(b): the two live Code sessions had their `.exported` markers archived so the exporter would regenerate them in UMN Courses. After the run the 22:03 backfill task returned 0 and the coverage script still passed. Report line is in [[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]].
- Reviewed by owner: pending. To confirm: the `Scratch` folder (holds the `denytest` note only).
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Legacy Layout and Archives|Legacy Layout and Archives]], [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]], [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]], [[20_Progress/Projects/AI Use/Conversations/Platform Coverage|Platform Coverage]].
