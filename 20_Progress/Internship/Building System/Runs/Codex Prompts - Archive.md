---
type: reference
status: tree
created: 2026-10-03
updated: 2026-10-04

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

## Prompt 2 — Environment-Constrained Retry (written 2026-10-03, run 2026-10-04, archived 2026-10-04)

```
[Full text: see this file's own Prompt 1 entry above for the unchanged rules/scope, plus the restructuring Prompt 2 added — Task 0's go/no-go environment check (write-access scratch test, then a 5-URL viability test of whatever fetch tool is actually available, with no further raw-network retries since Prompt 1 already confirmed those fail), a deadline-backfill task explicitly decoupled from fetch viability (stored ## Posting text only), and a freshness-recheck task explicitly gated on Task 0's own viability verdict rather than attempted blind.]
```

### Result — Deadline Backfill Complete, Freshness Recheck Correctly Skipped
Written directly into [[20_Progress/Internship/Building System/Runs/Codex Prompts]] by the session itself — first full-compliance report in this file's short history, unlike both of [[Claude Code Prompts - Archive]]'s own chat-only-report gaps.

- **Scope recount:** 278 dossiers (130 AI/ML, 41 Fullstack, 48 CyS & Finance, 59 Other), matching Prompt 1's count exactly.
- **Task 0:** write access confirmed (scratch file written and removed). Fetch tool identified as `web__run`; its 5-URL viability test came back 3/5 real (AbbVie, Virtu, Audax) and 2/5 unusable (The Trade Desk generically redirected, Chevron returned empty/error) — correctly judged not reliable enough for a 278-page pass, and correctly **not** attempted further, per Prompt 2's own rule.
- **Deadline backfill: 278/278 complete**, using only each dossier's stored `## Posting` text, independent of the fetch-tool verdict. 11 real `deadline_posted` values extracted (8 AI/ML, 1 Fullstack, 0 CyS & Finance, 2 Other); the remaining 267 got `own_deadline: 2026-10-11` (today + 7, the one-time retroactive formula, exactly as specified — not `date_found` + 7).
- **Freshness recheck: 0/278, by design** — the session reported this plainly as a skip, not a failure, with the exact two-probe evidence behind the call. No dossier moved; `state/dossier_uids.json` untouched; the handoff manifest to [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]] is honestly empty.
- **Tracking artifacts updated:** `Tracker/Deadline Tracker.md` re-anchored to 2026-10-04 with all 278 re-bucketed (prior historical material preserved below the new section — though see the correction below, a stray diff artifact leaked into the new section's own first line). `_Today/No Deadline.md` replaced with an explicit retirement note, flagging correctly that the note's own meaning needs redefining now that every live dossier carries some deadline value.
- **[[Internship Notes Standard]] patched:** §1's required-field list and a new §8 (later found, on direct inspection 2026-10-04, to be a single coherent section incorporating both this session's retroactive-sweep framing and the parallel Claude Code session's code-level `extract_deadline()` detail — the "expect a collision" risk both sessions flagged did not become real damage).

### Correction, 2026-10-04 — a formatting defect in the session's own tracking-artifact edit
Direct inspection of `Tracker/Deadline Tracker.md` after this prompt found a stray leading `+` character on the new section's own first heading line (`+# Current sweep — 2026-10-04`) — almost certainly a unified-diff hunk marker that leaked into the written content rather than being stripped. Cosmetic, not a data-integrity issue (every dossier entry beneath it reads correctly), but real and uncorrected as of this archiving pass. Queued as a one-line fix in [[20_Progress/Internship/Building System/Runs/Codex Prompts]]'s next prompt.

Follow-up: [[20_Progress/Internship/Building System/Runs/Codex Prompts]]'s next prompt (Prompt 3) fixes the stray `+`, then finishes the one piece of the original three-part ask still outstanding — the freshness recheck — using a corrected, non-binary methodology: attempt every dossier individually rather than gating the whole batch on a 5-sample pass/fail verdict, prioritizing the 3 already-`Already Over` dossiers first since they're the smallest, highest-value set to resolve.

## Prompt 3 — Freshness Recheck, Per-Item, Prioritized By Urgency (written and run 2026-10-04, archived 2026-10-04)

```
[Full text: see this file's own Prompt 1/2 entries above for the unchanged scope/rules — the one real addition was Non-Negotiable Rule 1 (attempt every dossier individually, no 5-sample batch-level gate) and the explicit priority order: fix the stray '+' in Deadline Tracker.md first, then the 3 Already Over dossiers, then the remaining 275 in batches of 25-30 with running coverage reported as the pass went, not only at the end.]
```

### Result — 278/278 Attempted, Real Partial Coverage Delivered
Written directly into [[20_Progress/Internship/Building System/Runs/Codex Prompts]] by the session itself — second file-written report in a row.

- **Recount confirmed:** 278 (130/41/48/59), matching Prompts 1-2 exactly.
- **Stray `+` fixed** in `Tracker/Deadline Tracker.md`'s "Current sweep" heading; nothing else in that file touched beyond removing the 9 dossiers this pass confirmed closed.
- **Already Over trio (Moog, Regions Bank, Manhattan Associates): all 3 attempted first, all 3 came back ambiguous** (one empty-HTML response, two reported inaccessible) — correctly left active rather than guessed closed, exactly per the permissive-by-default rule, even though all 3 have a real passed posting-stated deadline.
- **Full-corpus result: 85 open, 9 confirmed closed, 184 ambiguous/blocked** — a real ~34% confirmed-verdict rate (94/278), consistent with Prompt 2's small-sample 60% estimate landing closer to a true rate once run at scale. The session logged 11 batches of real per-item attempts (scratch record: [[20_Progress/Internship/Building System/Runs/Prompt 3 Freshness Sweep Scratch]]), with a deliberate, disclosed 2-item catch-up pass after a directory-offset slip mid-run — handled transparently rather than silently absorbed into a later batch's count.
- **9 dossiers moved to `Viewed/`**, each citing a real affirmative signal (a genuine 404, or a redirect to an `?error=true`/`?not_found=true` listings page with the specific requisition absent) — no guesses. Full old-path → new-path manifest with per-dossier evidence written into the report. All 9 carry `status: removed`, `removed_date`, a signal-specific `removed_reason`, and both MOC links. `state/dossier_uids.json` confirmed untouched (correctly, per standing rule — that's the codebase session's job). [[Internship Notes Standard]] §§1/8 confirmed untouched, per this prompt's own explicit instruction not to re-collide with them.
- **Active dossier count now 269** (278 − 9).

### What The ~66% Ambiguous Rate Actually Means
Not a process failure — a real, now well-characterized structural limit of this sandbox's one working fetch path (`web__run`). The ambiguous reasons cited are systematic, not transient: HTTP 403/406/503 (bot detection), zero-line/empty HTML (JS-only rendering this tool can't execute), and generic blocked/inaccessible responses. A same-tool retry on the same 184 URLs would very likely reproduce the same result, not improve it — this is the ceiling of what this environment can resolve, not a gap to close with more attempts. The real remaining 184 need either a genuinely different fetch capability (the codebase repo's own production Firecrawl access, which the pipeline already depends on and which plainly handles cases this tool can't) or a human eyeball pass; re-running this same sweep a third time is not the right next move.

Follow-up: [[20_Progress/Internship/Building System/Runs/Codex Prompts]]'s next prompt (Prompt 4) does not repeat the freshness attempt. It builds the "ready to screen" prioritized view ([[20_Progress/Internship/Building System/Research Loop - Improvement Plan]] §4(b) — scoped back on 2026-09-04, never built), using the real data now on hand: 85 confirmed-open + 184 still-live-but-unconfirmed dossiers, each with a real deadline-urgency bucket from `Deadline Tracker.md`. [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]'s next session separately investigates whether the codebase's own Firecrawl-backed tooling can resolve some of the 184 — that's an investigate-then-plan task there, not repeated here.
