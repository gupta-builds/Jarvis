---
type: reference
status: tree
created: 2026-10-03
updated: 2026-10-03
related_progress:
  - "[[Source of Truth]]"
  - "[[Internship Notes Standard]]"
  - "[[20_Progress/Internship/Building System/Runs/Codex Prompts]]"
tags:
  - internship
  - automation
  - prompts
  - codex
  - archive
next:
---
# Codex Prompts — Archive
Every prompt ever run against the Jarvis vault via a Codex (GPT-5.6) session, in order, verbatim, with what actually happened when it ran. [[20_Progress/Internship/Building System/Runs/Codex Prompts]] is the live counterpart — it holds only the guide plus whatever prompt runs next, and gets overwritten every build cycle; this note is where that content lands once a prompt is done (or definitively blocked), so nothing is lost. Mirrors [[Claude Code Prompts - Archive]]'s own convention exactly.

## Prompt 1 — Dossier Freshness, Deadline, and Removal Sweep (written 2026-10-03, attempted 2026-10-03, blocked — not executed)

```
[Full text: see Codex Prompts.md's git history for this date, or the live Prompt 2 below, which restates every rule and task this prompt defined and still applies. Condensed here rather than reproduced in full a second time: scope was the 278 live dossiers across the four priority buckets (excluding _Career Fair and Viewed/); non-negotiable rules required a connectivity test before any fetch-based verdict, a scripted fetch-and-classify first pass, permissive-by-default handling of ambiguous fetches, citation of real evidence for every verdict, and the standing shared-file-editing discipline; the task order ran connectivity test → scripted pass → resolve closed → resolve ambiguous → set deadline_posted/own_deadline → update Deadline Tracker.md/No Deadline.md → patch Internship Notes Standard → write the final report into this same file.]
```

### Result — Blocked, Not Executed
The session reported, verbatim:

> I could not safely complete this audit.
> - Scope recount: AI & ML 130, Fullstack 41, CyS & Finance 48, Other 59 — total 278.
> - Required connectivity test: failed locally, including after escalation (`Unable to connect to the remote server`; `curl` also failed).
> - The web reader could reach some pages, but could not provide a reliable, complete 278-page fetch/status pass.
> - No dossiers were moved or modified.
> - No deadline fields, tracker, `No Deadline.md`, standard, session log, or prompt report were changed.
> - `dossier_uids.json` was not touched.
> - The workspace is read-only, so I also could not replace this prompt with a completed report.
> Proceeding would risk incorrectly marking live postings closed or assigning deadlines without current evidence.

**Two separate blockers, not one:**
1. **No raw shell/HTTP network egress from this sandbox** — `curl` and a direct connection attempt both failed, even after the session escalated for permission. A secondary tool (the session's own words: "the web reader") could reach *some* pages, meaning fetch capability exists in this environment, just not as reliable raw network access, and not yet proven at 278-page scale.
2. **The workspace itself was read-only** — no file could be written at all, which is a harder blocker than the network one: even frontmatter edits sourced entirely from already-stored content (no fetch required) couldn't have been written either. This is almost certainly a Codex CLI launch/approval-mode setting (e.g. a "suggest only" / read-only sandbox), not something a prompt's own text can work around — it needs the session relaunched with write access to this vault directory before any retry can do anything at all.

**Correctly handled:** the session followed its own non-negotiable rule exactly — stopped rather than fabricate 278 statuses it couldn't actually check, moved nothing, invented no deadlines. This is the intended failure mode, not a session error.

Follow-up: [[20_Progress/Internship/Building System/Runs/Codex Prompts]]'s next prompt (Prompt 2) opens with an explicit go/no-go environment check before attempting any real work, and separates the deadline-backfill task (which doesn't require live fetch) from the freshness-recheck task (which does and must now be treated as partial/best-effort given the sandbox's real network constraints).
