---
type: project
status: complete
created: 2026-10-03
updated: 2026-10-04
related_progress:
  - "[[Source of Truth]]"
  - "[[Internship Notes Standard]]"
  - "[[Deadline and Intake Triage Standard]]"
  - "[[20_Progress/Internship/Building System/V0/Dossier Corrections]]"
  - "[[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]"
  - "[[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]]"
tags:
  - internship
  - automation
  - prompts
  - codex
next: "Archive this completed sweep after review; the freshness recheck remains pending until a reliable batch-capable fetch path exists."
---

# Codex Prompts — Internship Dossier Freshness Sweep

## Prompt 2 result — 2026-10-04

### Scope and Task 0

- Recounted the live scope before work: **278 dossiers** — AI & ML **130**, Fullstack **41**, CyS & Finance **48**, Other **59**.
- Write access: **confirmed**. A timestamped scratch file landed inside the vault and was deleted after confirmation.
- Fetch tool: **web__run direct URL reader**.
- Five-URL viability test: **3/5 returned distinguishable posting content** (AbbVie, Virtu Financial, Audax Group). The Trade Desk returned a generic openings page with an error redirect, and Chevron returned an empty/internal-error response. The reader was therefore unreliable for a 278-page freshness pass.

### Deadline backfill

Freshness verification was skipped as required by Prompt 2's partial-capability rule. The backfill used each dossier's stored ## Posting body only. A full-year date was treated as deadline_posted only when the stored text explicitly presented it as an application cutoff/end date; yearless dates and generic internship end dates fell back to own_deadline.

All **278/278** in-scope dossiers now carry exactly one real deadline field. For every fallback dossier, own_deadline: 2026-10-11 was used: today's date plus seven days.

| Bucket | Total | deadline_posted | own_deadline |
| --- | ---: | ---: | ---: |
| 1 - AI & ML | 130 | 8 | 122 |
| 2 - Fullstack | 41 | 1 | 40 |
| 3 - CyS & Finance | 48 | 0 | 48 |
| Other | 59 | 2 | 57 |
| **Total** | **278** | **11** | **267** |

The 11 stored posting deadlines were: AI & ML — 2026-09-30, 2026-10-09, 2026-10-31, 2026-11-24 (two dossiers), 2026-11-25, and 2026-11-26 (two dossiers); Fullstack — 2026-10-16; Other — 2026-07-29 and 2026-09-25.

### Freshness recheck and handoff

- Freshness coverage: **0/278**. No remaining dossier was fetched after the five-URL viability test.
- Reason: the identified reader was blocked, empty, or generic on 2/5 probes, so the prompt explicitly says not to attempt the remaining 273.
- Closed-signal manifest: **empty**. No dossier was moved to Viewed/; no status: removed, removed_date, or removed_reason changes were made.
- Ambiguous/blocked dossier list: **not generated**, because the 278-page freshness task was skipped rather than partially run. The five probe failures above are the complete capability evidence.
- state/dossier_uids.json was not touched.
- Viewed/ was not re-audited; no possibly-wrongly-moved dossier was encountered because that folder was out of scope and no freshness pass ran.

### Tracking artifacts

- Updated 10_Areas/Career/Internships/Tracker/Deadline Tracker.md with a current 2026-10-04 section, today's cutoffs, and all 278 dossiers re-bucketed by their new field. The prior historical tracker material was preserved below the new section.
- Replaced 10_Areas/Career/Internships/List/Dossiers/_Today/No Deadline.md with an explicit retirement note. This changes its meaning going forward: every live dossier now carries some deadline value, so the note should eventually be renamed or redefined rather than silently treated as an active queue.

### Field contract

Updated [[Internship Notes Standard]]:

- §1's required-field list now includes deadline_posted and own_deadline.
- §8 documents the two-field contract, the posting-only rule, the permanent date_found + 7 days pipeline rule, and this sweep's one-time 2026-10-11 reconciliation.
- No dossier fields other than the requested deadline fields were changed.

### Continuity

The session log records the recount, Task 0 result, skipped freshness coverage, deadline counts, and artifact updates. This file is now the completed report for Prompt 2; the next step is a later sweep using a reliable batch-capable fetch path to confirm live/closed state.

