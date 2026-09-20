---
type: index
status: active
created: 2026-09-05
updated: 2026-09-05
tags:
  - internship
  - moc
  - review
notes:
  - "[[60_Claude/30_Reviews/Internship Loop/Internship Loop Reviews MOC]]"
  - "[[30_Order/Standards/Internship/Internship Loop Review Standard]]"
  - "[[30_Order/Workflows/Internship/Internship Review System]]"
  - "[[10_Areas/Career/Internships/Tracker/Internship - Dashboard]]"
  - "[[20_Progress/Internship/Building System/System - Build Log]]"
next: "First real Deadline Sweep and first Weekly/Monthly review on the new cron cadence should both update this file's Outstanding Actions and Health Check sections in the same run they produce — see Internship Review System's Escalation section. Application Census's 'not yet researched into a Program' count was not run this pass (MCP query timeouts) — the next Monthly review owes this number."
---
# Main Log
==The single place to check "where does everything actually stand" for the whole internship system — not a duplicate of any one log, an index over all of them plus the few numbers worth keeping current here directly.== Built 2026-09-05 as the missing piece the review-system rebuild needed: every review before this found real problems but had nowhere central to leave an unresolved urgent item, so urgent items sat unescalated until the next review happened to re-find them (see the Castleton/KeyBank deadline misses below). This file exists to stop that pattern, not to re-host content that already lives somewhere else — per this vault's own anti-duplication principle, if a number is true in both this file and another log, one copy is wrong; the fix is a link, not a second copy.

## Outstanding Actions
==The one section every review, sweep, and skill checks and updates — see [[30_Order/Workflows/Internship/Internship Review System]]'s Escalation section. Nothing gets removed from here except by a dated resolution line; nothing sits here past two review cycles without a stated reason.==
- **[2026-09-05, RESOLVED]** Castleton Commodities Intl (Data Science/ML) and KeyBank (Data Intern) deadlines passed with zero Applying-note activity — confirmed missed, no action taken, per direct human decision. A corpus-wide sweep the same day found 3 more Program notes in the identical state (Castleton Full-Stack, Castleton Data Engineering, KeyBank Analytics & Quantitative Modeling) that neither review had caught. All 5 moved to `Programs/{Serious,Considering}/Missed/` with a dated Outcome section on each note.
- **[2026-09-05, OPEN]** Uber's original application req (jobs.uber.com/en/jobs/300697/) returned "Not found" on a live check — confirm whether it's genuinely expired before further outreach prep (see that Program note's Contact note).
- **[2026-09-05, OPEN]** The Microsoft `stage1_reject` sidebar-link regression (6 genuine dossiers) still needs its codebase fix — filed as [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]'s Prompt 2, not yet run.
- **[2026-09-05, OPEN]** `run.yml` (hourly discovery) has been `disabled_manually` since 2026-08-29 — re-enabling is explicitly reserved for a direct human decision, not this file. Every dossier/discovery number below is a snapshot of a paused system.

## Health Check — Progress Against The End Goal
Cited to real counts as of 2026-09-05, re-derived by the next Weekly/Monthly review or Deadline Sweep, never carried forward unchanged:
- **Cumulative applications submitted: 0** (`20_Progress/Internship/Applying/Applied/` is empty — confirmed by direct folder listing, not estimated).
- **Target: 500 applications by 2026-12-31** (stated target, confirmed 2026-09-05).
- **Days remaining from today: ~117 (≈16.7 weeks).**
- **Required rate from today to still hit target: ≈30 applications/week.**
> [!WARNING]
> **State this plainly, don't smooth it over:** a ≈30/week rate is not achievable under this pipeline's own documented design — [[30_Order/Workflows/Internship/Application Document Preparation]]'s Tailor sequence requires a human-approved, Humanizer-passed resume and cover letter *per application*, and zero applications have gone through that sequence yet at any rate. The bottleneck the target will hit first is that human-review step, not dossier discovery or promotion volume. This tension gets re-stated in every Health Check until either the target or the process changes — see [[Internship Loop Review Standard]]'s Health Check section for the rule.
- **Actual rate, most recent period:** 0/week (no applications submitted since tracking began).

## Application Census
Real counts as of 2026-09-05, by direct folder listing:
- **Ended (applied):** 0.
- **Missed (deadline passed, never applied):** 5 — see Outstanding Actions above.
- **Serious, active:** 12 (Deepgram, Nuro, Uber, Western Digital, Manhattan Associates, Deloitte, GE Vernova, DTCC, Genentech, Fifth Third Bank, LPL Financial [SWE], Regions Bank).
- **Considering, active:** 3 (Appian, American Express, LPL Financial [Data Engineer]).
- **Contact notes with zero real outreach logged (`last_contact_date: null`): 15 of 15 active programs.** Every single active program is still pre-outreach — this is the concrete, current version of the "0 Applying notes" finding every prior review has stated in the abstract.
- **Not yet researched into a Program (screened pass, no Program note):** not counted this pass — MCP query timeouts blocked the corpus-wide check; owed by the next Monthly review.
- **Dossier corpus:** last confirmed count 287 live + 58 Viewed (2026-09-04, per [[20_Progress/Internship/Building System/Runs/Prompt 1 Reboot — Building System Refresh Session (2026-09-04)]]), now 286 live + 59 Viewed after this session's Virtu removal — not re-counted exhaustively this pass; the first real Deadline Sweep owes a fresh corpus-wide count.

## Cadence Log
The three recurring processes and when they last actually ran — update this table every run, don't let it silently go stale (the exact failure mode that let two reviews land 12 days late before this rebuild):

| Process | Cadence | Last Run | Next Expected |
|---|---|---|---|
| Weekly Discovery Review | Every Friday | [[60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/Internship Loop Weekly Review — 2026-W36\|2026-W36]] (2026-09-04) | Next Friday |
| Monthly Promotion Review | 1st of month | [[60_Claude/30_Reviews/Internship Loop/Scheduled/Monthly/Internship Loop Monthly Review — 2026-09\|2026-09]] (2026-09-04, corrected 2026-09-05) | 2026-10-01 |
| Deadline Sweep | Every 3 days | 2026-09-05 (this rebuild's comprehensive sweep — first real run under the new cadence; not yet written to `Deadline Tracker.md` in its full format) | 2026-09-08 |

Full detail and status-per-period: [[60_Claude/30_Reviews/Internship Loop/Internship Loop Reviews MOC]] (reviews), [[10_Areas/Career/Internships/Tracker/Deadline Tracker]] (sweep).

## Map — Everything This Log Indexes
- [[60_Claude/30_Reviews/Internship Loop/Internship Loop Reviews MOC]] — every Weekly/Monthly review ever written, with status.
- [[30_Order/Standards/Internship/Internship Loop Review Standard]] — what a review must contain.
- [[30_Order/Workflows/Internship/Internship Review System]] — how a review actually gets triggered, escalated, and closed out.
- [[30_Order/Standards/Internship/Deadline and Intake Triage Standard]] — the Deadline Sweep's own content spec.
- [[10_Areas/Career/Internships/Tracker/Deadline Tracker]] — the sweep's live output.
- [[10_Areas/Career/Internships/Tracker/Internship - Dashboard]] — the live Dataview views over current vault state (Programs, Contacts, Applying funnel) — this log states point-in-time numbers as of a review; the Dashboard is always current.
- [[20_Progress/Internship/Building System/System - Build Log]] — the full dated build history of the loop itself (code-side).
- [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]] — the live queue of codebase-fix handoffs from reviews (see Prompt 2, the Microsoft regression).
- [[60_Claude/07_AI_Information/Session Logs/log.md]] — one-line mentions of vault-side fixes made during a review.
- [[30_Order/Workflows/Internship/Internship Pipeline]] — the actual step-by-step process this whole system is reviewing against.

## Done When
- Every Outstanding Action has a dated resolution or a stated reason it's still open — none silently dropped, none silently carried past two review cycles.
- Health Check and Application Census are re-derived, not copied forward, every time this file is touched by a review or sweep.
- The Cadence Log's "Last Run" column is never more than one cadence period stale without an explicit note why.
