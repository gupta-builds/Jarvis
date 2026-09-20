---
type: evergreen
status: sprout
created: 2026-09-04
updated: 2026-09-04
tags:
  - internship
  - standard
  - triage
notes:
  - "[[Internship Pipeline]]"
  - "[[Internship Notes Standard]]"
  - "[[Internship Loop Review Standard]]"
  - "[[20_Progress/Internship/Building System/V0/Dossier Corrections]]"
next: "Cadence question resolved 2026-09-05 — see the rewritten §4 below. Next
  actual gap: no sweep has run against this new cadence yet as of this writing;
  the first real one is the thing to check."
---
# Deadline and Intake Triage Standard
==Was ungoverned.== `10_Areas/Career/Internships/List/Dossiers/_Today/` and `10_Areas/Career/Internships/Tracker/Deadline Tracker.md` both exist and are both populated with real content, but no Standard or Workflow described what they're for or how they get maintained before this note. Written 2026-09-04 by reading both live, plus the one real sweep session that produced them — [[20_Progress/Internship/Building System/V0/Dossier Corrections]] (2026-08-28, "the deadline sweep") — rather than guessing intent from the folder name.

## Scope
Two related but distinct artifacts, both maintained by the same kind of session (a manual "deadline sweep," not automated code, not a step in [[Internship Pipeline]]):
- **`List/Dossiers/_Today/`** — pre-dossier intake triage. Holds raw candidate postings pulled from sources the automated `internship-research-loop` doesn't poll (InternDock's manually-browsed guides, `speedyapply`'s raw list dumps, and similar one-off feeds) — logged here *before* a decision is made on whether any of them becomes a real dossier or a manual-find Program note.
- **`Tracker/Deadline Tracker.md`** — a deadline-sorted view over dossiers that already exist in `List/Dossiers/` (any priority bucket), re-bucketed by urgency relative to the sweep date.
Neither is a substitute for [[Internship Notes Standard]] (which governs dossier content once written) or [[Internship Loop Review Standard]]'s Weekly Discovery Review (which grades gate/Standard conformance on a sample). This Standard governs intake and deadline currency only.

## 1. `_Today/New Internships Listings.md` — raw intake log
One dated pass-header per sweep (e.g. `## InternDock Guide 1 (summer-2027-internship-drop-august-2026) — 2026-08-28 pass, "Software Engineering" section, entries 1-125 of 136`), naming the exact source guide/list and exactly which slice of it was covered — never "some entries," always a real count (the real 2026-08-28/08-29 passes cite `1-125 of 136`, `126-136`, `5 previously-unchecked entries`, `full pass (259 rows scanned)`). Under each header, one line per candidate posting: a markdown link (title → URL), then a short clause naming location/work-authorization signal, deadline if stated, and any timing ambiguity worth flagging rather than silently resolving (the real Whiterabbit.ai entry is a confirmed example — its title says "(2026)" not "(2027)," flagged inline rather than dropped or guessed).
**This is intake, not a gate.** Nothing here has been screened against [[Internship Pipeline]] Step 2's fit test or the four hard gates a real dossier would need to clear — a line on this list is a candidate worth a human look, not a vetted match. A candidate that survives a look either becomes a real dossier (written by hand into the correct priority folder, same frontmatter contract as an automated one — see [[Internship Notes Standard]] §1) or a direct manual-find Program note (skipping the dossier stage entirely, per [[Internship Pipeline]] Step 1's manual-web-clip rule) or is discarded with the reason left implicit (this list doesn't currently record rejections — only what passed a first read as worth listing at all).

## 2. `_Today/No Deadline.md` — confirmed-absent deadlines
Real dossiers, already written, checked directly (stored posting text, or a live fetch of the posting URL where the stored text didn't say) and confirmed to state no deadline as of the sweep date. Grouped by the same priority-bucket headings the dossiers themselves live under (`1 - AI & ML`, `2 - Fullstack`, etc.) — a plain flat list, one wikilink per dossier, no annotation needed since "no deadline" is the entire finding. States explicitly what's *out of scope* for the pass (a real deadline that exists but falls outside the sweep's stated window is deliberately not listed here — see the sweep's own report for those) — carry that same explicit-scope discipline forward in any future sweep rather than letting "confirmed no deadline" quietly drift into "didn't check."

## 3. `Tracker/Deadline Tracker.md` — urgency-bucketed view
Five buckets, re-anchored to the sweep's own stated "today" each time it's re-run (the real 2026-08-28 pass defined *Soon* = within 7 days, *Next Week* = 8–14 days, *Next Month* = 15–45 days, *Later* = beyond 45 days, plus a standing *Already Over* bucket for confirmed-lapsed deadlines) — state the cutoff dates explicitly at the top of the note, as the real version does, since "Soon" is meaningless without the anchor date next to it. One line per dossier: wikilink, then the deadline itself, distinguishing a confirmed stated deadline from an inferred/anticipated one (the real Western Digital entries mark two as `(anticipated)` and one as `(anticipated, live-verified)` — keep that distinction, don't collapse it to a bare date). **Already Over is not the same claim as closed** — a lapsed posted deadline doesn't mean the posting stopped accepting applications; per the real note's own caveat, none of the Already Over entries were re-fetched live to confirm the posting is actually gone versus just past its stated date, and that check stays a human task, not an assumption either way.

## 4. Refresh cadence — not scheduled, real gaps acknowledged
### 4. Refresh cadence — every 3 days, standalone (decided 2026-09-05)
**Resolved, closing this section's own prior open question.** This sweep runs on its own fixed 3-day cadence, independent of the Weekly Discovery Review and Monthly Promotion Review, via the local-cron mechanism [[30_Order/Workflows/Internship/Internship Review System]] now describes — chosen over folding into the Weekly review for a reason cited to a real incident, not a preference: the 2026-09 Monthly Review built its deadline table by hand from 3 Program notes it happened to already be tracing and missed 3 of 5 real, already-passed deadlines that a corpus-wide `deadline_posted` query caught the next day. A deadline doesn't wait for whichever review's cadence comes next.
Each sweep: re-anchors `Deadline Tracker.md`'s bucket cutoffs to its own run date, re-runs `_Today/New Internships Listings.md` intake conversion for anything still sitting unconverted past one cycle (flag, don't silently carry forward per the Done When rule below), and queries every live Program note's `deadline_posted`/`deadline_real` directly rather than relying on whichever programs a human happens to be tracking that week. Its output feeds both reviews as a citation (see [[Internship Loop Review Standard]]'s Deadline Sweep Citation / Deadline Sweep Reconciliation sections) and gets a one-line pointer added to [[10_Areas/Career/Internships/Tracker/Main Log|Main Log]] every run, per that note's own maintenance rule.

## Relationship To The Loop Review
**Resolved 2026-09-05, against the recommendation this section used to make.** This stays a separate, standalone sweep on its own 3-day cadence rather than folding into the Weekly Discovery Review — decided the opposite way from this section's original "recommend folding it in" note, because the real incident that forced the decision (the 2026-09 Monthly Review missing 3 of 5 passed deadlines) showed a 7-day-or-longer cadence is itself too slow for something as time-sensitive as a deadline, regardless of which review it rides alongside. [[Internship Loop Review Standard]]'s Weekly and Monthly reviews both cite this sweep's latest output rather than re-deriving deadline status themselves — see that Standard's Deadline Sweep Citation and Deadline Sweep Reconciliation sections.

## Done When
- Every `_Today/New Internships Listings.md` pass-header names its exact source and exact entry range covered — no "a sample of" phrasing.
- Every `No Deadline.md` entry was checked directly (stored text or live fetch), not inferred from the dossier's classification alone.
- `Deadline Tracker.md`'s bucket cutoff dates are stated in the note itself and match the date of the sweep that last touched it.
- A `_Today/` intake candidate that's been sitting more than one sweep cycle without converting to a dossier or being discarded is a flagged gap, not silently carried forward forever.
