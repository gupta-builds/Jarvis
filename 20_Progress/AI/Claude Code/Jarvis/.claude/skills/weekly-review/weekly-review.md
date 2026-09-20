---
name: reviewing-weekly
description: Full weekly vault review aligned with the Jarvis Three-Month Research Engine Master Plan; tracks what was built, what's overdue, what needs linking, and what next week should prioritize.
---
# weekly-review

**Usage:** `/weekly-review` or invoked automatically by the Cowork weekly scheduled task.

---

## Pre-flight: Read These First

Before touching anything else, read these files in order:

1. `60_Claude/07_AI_Information/AI_CONTEXT.md`
2. `60_Claude/07_AI_Information/Session Logs/log.md` — tail: last 100 lines
3. `00_Dashboard.md`
4. `20_Progress/Projects/AI Second Brain/Jarvis Three-Month Research Engine Master Plan.md` — sections: "Three-Month Build Map" and "The Weekly Operating Rhythm" (moved out of `60_Claude/40_Project_Briefs/` once it became the live execution plan)
5. The most recent weekly synthesis: `60_Claude/30_Reviews/Weekly Synthesis/` — list directory, read the latest file

Determine the current ISO week number from today's date. Format: `YYYY-WXX`.

---

## Step 1: Find Recent Vault Activity

Calculate the date 7 days ago. Then search for recently modified notes:

- Use `mcp__jarvis-fs__search_files` or `mcp__jarvis__search_simple` to find notes modified in the past 7 days
- Search across: `10_Areas/`, `20_Progress/`, `40_Resources/`, `60_Claude/`
- Exclude: `50_Archive/`, `60_Claude/05_Clippings/`, `.obsidian/`, `.claude/`, `.kiro/`, `.cursor/`

Group what you find by area:

- **Coursework** (`10_Areas/`): course notes, concept notes, lab/project notes
- **Projects + Career** (`20_Progress/`): project notes, career notes, UROP progress
- **Resources** (`40_Resources/`): enriched concept notes, reference material
- **Claude layer** (`60_Claude/`): distillations, summaries, project briefs, reviews

For each group, note: what was created vs. what was updated, and whether the work has a clear `next:` or outcome.

---

## Step 2: Fall Execution Audit

Check execution tracks against the Systems table and Week-by-Week table in [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]. The frame that arbitrates priority is [[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing|Fall 2026 - The One Thing]]. The Summer 2026 plan folder is closed — do not read from it here.

Do not re-read all plan files — use these specific checks:

### Internship application floor (the one thing)
- Check `10_Areas/Career/Internships/Tracker/Each One/` — count `Current/` vs `Applied/` vs `Result/`, compare to last week's count
- Target: at least one company moves `Current/` → `Applied/` most days
- Flag if the Applied count didn't move this week

### Technical interview prep (CodePath + LeetCode) and System Design
- Check whether a Fall LeetCode/CodePath daily log exists yet (per Fall 2026 Plan's Systems table, this was an open task as of 2026-09-07) — if still missing, flag it every week until created
- If it exists, read its daily log for this week's solved count against the floor of 5/day
- Check for a logged System Design session (2x/week target, starting 2026-09-14)

### Classes
- Read [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]] — Grading Criteria section, and whether it's been filled in with real rubrics yet
- Any of the 6 Fall'26 courses (ENGL 1004, CSCI 4511W, CSCI 4061, CSCI 5304, MGMT 3015, CSCI 4521) with a deadline in the next 7 days? (ENGL 1004 replaced AMES 1201 and CSCI 4511W replaced CSCI 3081W, 2026-09-09 - both archived under their old names)

### Projects (TradingView, Portfolio v2, ClaudeKit)
- Check `20_Progress/` — any project notes modified in the past 7 days?
- Against the Fall 2026 Plan's Systems table done-definitions: did TradingView's `tasks.md` checkpoints move, did Portfolio v2 publish a real blog post, did the ClaudeKit sync permission-bit issue get worked?
- What shipped this week? (code pushed, document finalized, demo done — concrete artifacts only)

### Career Pipeline (broader)
- Any applications submitted, outreach sent, or interviews scheduled beyond the daily floor?
- AIIS, mentorship, scholarships, networking/hackathons, LinkedIn — check each Systems-table row's done-definition against what actually happened this week
- Check if `20_Progress/` has any career-related notes touched this week

For each track mark: ✅ on target, ⚠️ partial, ❌ missed. One line per track explaining the verdict.

---

## Step 3: Enrichment Queue Health

Check the enrichment pipeline status:

1. Count notes where `enrichment_status` is missing or not `"enriched"` — these are candidates
2. Check for notes where `next_drill < today` — these are overdue drills
3. Identify which tracks (ai, systems, algorithms, career, trading) are most behind
4. Note how many notes were enriched this week vs. the target of 10/week

Key enrichment locations:
- `40_Resources/CS/AI/` — AI track
- `40_Resources/CS/` — algorithms/systems track
- `60_Claude/20_Distilled_Notes/` — distilled knowledge layer
- `20_Progress/UROP/` — UROP/BOOM/systems track

---

## Step 4: Structural Health Check

Check four things:

**Orphans:** Notes in `40_Resources/` or `60_Claude/20_Distilled_Notes/` with zero backlinks (`length(file.inlinks) = 0`). These are knowledge islands. List the top 5 by age.

**Missing next actions:** Project notes in `20_Progress/` where `type = "project"`, `status != "archived"`, and `next` is missing. A project without a next action is stalled.

**Metadata gaps:** Notes in active areas missing `type` or `status`. These break Dataview queries.

**New notes without outbound links:** Notes created this week with no wikilinks in their content. New notes should connect to at least one existing note.

---

## Step 4.5: Promotion Scan

Simplified replacement for the old 6-check promotion gate — manual-promote-on-request plus this weekly safety net.

1. Search Jarvis for notes with `status: tree` that were created or modified in the past 7 days (reuse Step 1's activity scan; filter by frontmatter status).
2. For each candidate, apply a short 3-line bar: (a) source-grounded — points at real evidence, not invented claims; (b) stable — not a raw transcript, clipping, or dashboard/index file; (c) useful outside Jarvis — would change a decision or preserve reusable knowledge in The Plan.
3. List survivors under a new "Promotion Candidates" section in this week's synthesis note (Step 6) — one line each: note path, one-sentence reason.
4. Do not write into The Plan automatically. Promotion means Anant (or a session with `the-plan` MCP access) reviews the list, writes a grounded summary into The Plan, and logs a row in `60_Jarvis/40_Promoted_Notes/Promoted From Jarvis Index.md`. This step only surfaces candidates.

---

## Step 5: Session Log Summary

Extract from `60_Claude/07_AI_Information/Session Logs/log.md` all entries from the past 7 days.

Summarize:
- Sessions run: how many, what types (build/enrich/distill/review/setup/audit)
- Notes created this week: count
- Notes enriched: count
- Conversations captured or distilled: count (0 is worth flagging)
- Whether any session lacked a clear `next:` action

---

## Step 6: Write the Review Note

Create `60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — YYYY-WXX.md` using this template.

After creating it, also patch the weekly periodic note at `10_Areas/Life/Enumerate/Weekly/YYYY-Www.md` (where `YYYY-Www` matches the ISO week, e.g. `2026-W24`). If the note doesn't exist, create it using `30_Order/Templates/Enumerate/Better Weekly.md`. Patch its `> [!NOTE] Summary:` callout with a one-sentence summary of the week, and fill the Goals and Fixes sections with the top items from the synthesis note. Keep it brief — the weekly periodic note is a quick-glance record, not a duplicate of the full synthesis.

```markdown
---
type: review
status: complete
created: YYYY-MM-DD
week: YYYY-WXX
tags:
  - review
  - weekly
notes:
  - "[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index]]"
---

# Weekly Synthesis — YYYY-WXX

[One sentence: the defining theme of this week. Not a list — a statement.]

## What Was Built

[Describe actual completed work. Be specific: file names, note counts, which skill/agent/command now works. Skip anything that was just planned but not done.]

## Three-Month Plan Status

[Current month and week in the plan. Table of this month's milestones with ✅ / ⚠️ / ❌ status. One sentence on whether the plan is on track, ahead, or behind, and what the main blocker is.]

## Enrichment and Drills

[How many notes enriched this week. Overdue drills if any. Which track needs the most attention next week. Total enriched-to-date vs. the 100-note end-of-three-months target.]

## Vault Health

[Orphaned notes count. Projects missing next actions (list them). Metadata gaps. Any new notes created this week that have zero links.]

## Suggested Links

[3–5 concrete link suggestions: "[[Note A]] should link to [[Note B]] because..." Only suggest links that don't already exist and that would add genuine navigational value.]

## Cleanup Candidates

[2–4 notes that should be deleted, merged, or archived. Must state the specific reason — duplicate, stale, superseded, orphan that nobody will ever read.]

## Promotion Candidates

[From Step 4.5 — status:tree notes from this week that pass the 3-line bar (grounded, stable, useful outside Jarvis). One line each: note path + one-sentence reason. "None this week" is a valid, honest answer.]

## Next Week Priorities

[Exactly 3 priorities, tied to the master plan. Each one is a specific action, not a vague theme. Format: "Priority: [what]. Why now: [reason tied to plan]. Output: [what file or command exists when it's done]."]

## Open Questions

[2–3 genuine unresolved questions this week surfaced — about the build plan, the vault, or Anant's direction. Not rhetorical. Things that need a decision or more information before proceeding.]
```

**Writing rules:** Follow `HUMAN_WRITING.md`. Every sentence in this note must carry information. No filler. If a section has nothing meaningful to say, write one honest sentence saying so ("No conversations were captured this week. The capture folders still don't exist.") rather than padding.

---

## Step 7: Update the Weekly Synthesis Index

Read `60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index.md`. Add the new review to the index table.

---

## Step 7.5: Log Maintenance

Read `60_Claude/30_Reviews/Weekly Synthesis/Logs/Log Review.md` in full — it holds the managed-logs registry (which logs, their line/file caps, and the trim rule for each) and the exact entry format. For every log in that registry:

1. Check its current size against its cap (line count for line-based logs, file count/age for the dated-file logs like `cursor-workflow/logs/sweep-*.log`).
2. If under the cap, do nothing — no entry, no action. A quiet log this week is not worth logging.
3. If over the cap: read the portion beyond the cap, write a real aggregate summary (success/failure/conflict counts, date range, any genuine anomaly — not a restated line count) as a new dated entry in `Log Review.md`, then actually delete the excess from the source log. Never move it to a second file — that recreates the exact bloat this step exists to remove.
4. The 10 `Sync-Log-Archive-2026-09-19.md` files are a one-time cleanup, not a recurring check: if any still exist, summarize each in full into `Log Review.md` and delete the archive file entirely, then remove that file's row from the registry table in `Log Review.md` since it no longer exists to manage.
5. Logs marked "Curated" or "Monitor only" in the registry never get trimmed by this step, even if they cross their cap — flag it as a line in this week's synthesis note instead (Step 6's "Vault Health" section) so a human decides, rather than auto-deleting dense, hand-quality content.

This step is independent of Steps 1-6's narrative synthesis — run it regardless of whether the rest of the review found anything notable.

---

## Step 8: Log the Session

Append to `60_Claude/07_AI_Information/Session Logs/log.md`:

```
## [YYYY-MM-DD] review | Weekly Synthesis YYYY-WXX

[2–3 sentences: what the review surfaced, what's most behind, what next week's top priority is.]
```

---

## Execution Notes for Future Claude

- **Trigger, corrected 2026-09-20:** the previously-documented "Cowork scheduled task every Monday morning" was never actually verified and had been silently dead for 13 weeks (last real run: 2026-W22, per the Weekly Synthesis Index and zero matching entries in the Session Log since). Replaced with a real Windows Scheduled Task (`Jarvis-WeeklyReview`) invoking Claude Code headlessly (`claude -p`), registered independently on each laptop per [[Cross-Laptop Sync - Build Roadmap]]'s pattern for cross-laptop automation. Because both laptops may have this registered, **check `60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index.md` for this week's ISO week number before doing any real work** — if this week's entry already exists, stop, this is a duplicate fire from the other laptop, not an error.
- You start cold with no prior context. The pre-flight reads are not optional.
- The three-month plan started April 24, 2026. Use that anchor to calculate which phase and week you're in.
- The master plan's "Weekly Operating Rhythm" section defines the expected weekly cadence. Compare actual vault activity against it honestly.
- Fall 2026 Plan's own cadence rule: two consecutive missed `/weekly-review` runs means a full re-scope conversation before that plan continues, per [[30_Order/Standards/Daily Workflow Standard|Daily Workflow Standard]] — flag this explicitly if it applies.
- If conversation capture folders (`60_Claude/05_Clippings/AI Conversations/` and `60_Claude/10_Source_Summaries/AI Conversations/`) don't exist yet, flag this every week until they're created. This is the most critical missing piece of the build spine.
- If it's the last week of a month, also check whether a monthly review note belongs in `60_Claude/30_Reviews/Monthly/`.
- Do not modify raw clippings, archive notes, `.obsidian/`, `.claude/`, `.kiro/`, or `.cursor/` directories.
- Prefer patching existing notes (vault_patch by heading) over full rewrites.
