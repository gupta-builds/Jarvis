---
type: evergreen
status: sprout
created: 2026-08-23
updated: 2026-09-05
tags:
  - system
  - standards
  - internship
  - review
notes:
  - "[[Review Standard]]"
  - "[[Internship Notes Standard]]"
  - "[[Internship Pipeline]]"
  - "[[20_Progress/Internship/Building System/Source of Truth]]"
  - "[[20_Progress/Internship/Building System/System - Build Log]]"
  - "[[60_Claude/30_Reviews/Internship Loop/Internship Loop Reviews MOC]]"
  - "[[Deadline and Intake Triage Standard]]"
  - "[[30_Order/Workflows/Internship/Internship Review System]]"
  - "[[10_Areas/Career/Internships/Tracker/Main Log]]"
next: First rebuild pass 2026-09-05, triggered by the 2026-09 Monthly Review missing 3 of 5 real passed-deadline programs and neither review ever escalating the 2 it did catch same-day. Re-derive Health Check's actual-rate number and the Application Census counts fresh every run — never copy last period's numbers forward.
---
# Internship Loop Review Standard
==A review here checks the internship-research-loop's actual output against what it was designed to do — [[20_Progress/Internship/Building System/Source of Truth|Source of Truth]]'s gates and [[Internship Notes Standard|Internship Notes Standard]]'s content rules — never a summary of dossier counts alone.== This is the content standard for `60_Claude/30_Reviews/Internship Loop/Scheduled/{Weekly,Monthly}/`. It is a sibling of [[Review Standard|Review Standard]], not a replacement — that note's shared rigor rules (cite the actual rows/files read, "nothing to report" is a valid finding, `Decided Fixes` only at 100% clarity, no `---` in the body, zero blank lines except after a callout) apply here unchanged. This note states only what's different for the internship loop: two review types plus a standalone deadline sweep, split by which half of [[Internship Pipeline|the pipeline]] they cover, because the two halves fail in completely different ways — Step 1 (Find) is automated code that breaks in reproducible, bug-shaped ways; Steps 2-9 are human judgment calls that stall in note-hygiene-shaped ways; and a passed deadline is neither — it's a clock that doesn't wait for either review's cadence, which is why it gets its own.
## Why Two Review Types Plus A Standalone Sweep
[[20_Progress/Internship/Building System/Source of Truth|Source of Truth]] itself splits the system this way: "Discovery is a GitHub Actions workflow... mechanical, unattended, cheap by design. Promotion onward is entirely manual, human-judgment-driven." A single review covering both would either drown the rare, high-stakes promotion decisions in weekly dossier noise, or let the automated half's real, recurring bugs (see [[20_Progress/Internship/Building System/System - Build Log|Build Log]]'s 2026-07-26 and 2026-07-29 entries — Databricks PM misclassification, Mosaic "threat" false-positive, Aquatic/Google cross-source dedup misses, the Google-careers-page extraction bug, all confirmed *recurring* three days after "fixed") go unchecked for a month at a time.
- **Weekly — Discovery Review.** Covers Step 1 (Find) only: `List/Dossiers/`, the hourly loop. Runs weekly because the loop writes hourly and the historical bug list above was only ever found by someone actually reading real dossiers, not by trusting the commit log.
- **Monthly — Promotion Review.** Covers Steps 2-9 (Screen through Close): `Programs/`, `Contacts/`, `Tracker/`, `20_Progress/Internship/Applying/`, `Preperation/`. Runs monthly because this half is still lightly exercised — a weekly cadence here would mostly report "nothing new," which the general Review Standard already treats as padding to avoid.
- **Deadline Sweep — every 3 days, standalone.** Added 2026-09-05, resolving [[Deadline and Intake Triage Standard]]'s own open question in favor of a separate cadence rather than folding into the Weekly review. **Reason, cited to a real incident, not theoretical:** the 2026-09 Monthly Review built its deadline table by hand from the 3 Program notes it happened to already be tracing, and missed 3 of 5 Program notes that had a real, already-passed `deadline_posted` at the time it ran — found only by a corpus-wide grep the next day. A deadline doesn't wait for whichever review's cadence comes next; it needs its own fast, mechanical, corpus-wide check. See [[Deadline and Intake Triage Standard]] for the sweep's own content spec — this Standard only states how its output feeds the two reviews (below) and the Main Log.
## A Known Dependency — Read Before Running The Monthly Review
> [!WARNING]
> The Monthly review's **Note-Shape Conformance** section (below) grades Program/Contact/Tracker/Applying/Job & Company notes against what [[Program Template|Program Template]], `Contact Template`, `Tracking Template`, and `Applying Template` plus [[Internship Pipeline|Internship Pipeline]]'s prose already specify — not against a fixed, field-level standard, because none exists yet for these note types (only dossiers have one, [[Internship Notes Standard|Internship Notes Standard]]). Treat this section's findings as provisional until a real field-level standard lands for these note types.
## Maps To
- Templates: [[Internship Loop Weekly Review Template|Internship Loop Weekly Review Template]], [[Internship Loop Monthly Review Template|Internship Loop Monthly Review Template]]
- Hub: [[10_Areas/Career/Internships/Tracker/Main Log|Main Log]] — every review's Immediate Actions and Health Check numbers get reflected there in the same sitting the review is written, per that note's own maintenance rule.
## Used By Workflow
- Cadence and trigger mechanism (local cron, headless Claude Code, what happens on a missed fire) live in [[30_Order/Workflows/Internship/Internship Review System]] — this Standard states content only, not how a review actually gets produced.
## Per-Heading Standard — Weekly Discovery Review
### Period Covered
The exact date range actually covered, stated honestly even when it isn't a clean 7 days (see the 2026-W36 precedent — 12 days, stated as 12, not padded to look like a normal week).
### Sources Reviewed
Name what was actually opened: the sampled dossier files (exact paths, not "a sample of dossiers"), [[10_Areas/Career/Internships/List/Dossiers MOC|Dossiers MOC]]'s live capacity table, `Excluded — Losing The Debate.md`, `logs/runs.jsonl`/`gh issue list` where a code-level claim needs checking, and the current Deadline Sweep's output (`Tracker/Deadline Tracker.md`, checked against its own header date). **Every one of these four goes in the checklist even when a given pass reprioritizes its read budget elsewhere (per the 2026-W36 precedent, which reused issue #9's targeted list instead of a fresh sample) — the source gets an unchecked box and a one-line reason, never silent omission.** The 2026-W36 review dropping `Excluded — Losing The Debate.md` from its list without a word is the exact failure this rule exists to stop.
### Sample & Method
State the sample size and how it was chosen (e.g., N most-recently-written per bucket, N random per bucket, or a targeted list from a real upstream signal like a `revalidate.py` issue) — the corpus cannot all be read every week, and a review that doesn't say how it sampled can't be checked for selection bias. Anything countable exactly by a script (frontmatter-field compliance, matched-reason coverage) gets grepped across the whole corpus, never estimated from the sample.
### Gate Conformance
Check the sample against [[20_Progress/Internship/Building System/Source of Truth|Source of Truth]]'s four hard gates (timing, US location, OPT, CS/software relevance). A dossier that shouldn't have cleared a gate is a Finding, cited by exact file and which gate it should have failed.
### Standard Conformance
Check the sample (or, where countable, the whole corpus) against [[Internship Notes Standard|Internship Notes Standard]]: required frontmatter fields present, `notes:` interlink present and resolving, `company/<slug>` tag present, body free of duplicated paragraphs and jammed ATS-chrome run-ons, and — for anything in `Viewed/` — `removed_date`/`removed_reason`/`status: removed` actually set.
> [!WARNING]
> Reporting Standard Conformance from the sample alone when a script can answer it exactly across the whole corpus — run the grep, report the real fraction.
### Priority Classification Accuracy
Spot-check whether the sampled dossier's actual posting content matches the bucket it landed in — the exact bug class (an incidental keyword match, not genuine relevance) [[20_Progress/Internship/Building System/System - Build Log|Build Log]] and prior reviews have recorded repeatedly.
### Resource-Limit Health
Cite the real current bucket counts against the 50-per-bucket notification threshold and the 150/170/190/200 global thresholds ([[20_Progress/Internship/Building System/Source of Truth|Source of Truth]]). Confirm any GitHub issue that should have fired on a crossing actually did. **This is discovery-capacity health only — there is no separate cap on how many Programs can be actively in flight; that count is reported in the Monthly review's Health Check, never gated (decided 2026-09-05, see that section below).**
### Deadline Sweep Citation
Cite the most recent Deadline Sweep's output directly (`Tracker/Deadline Tracker.md`'s header date and its `Already Over`/`Soon` buckets) rather than re-deriving deadline status by hand — the sweep runs every 3 days specifically so this review never has to build its own partial deadline table again.
### Findings
Named, specific, cited by exact file. "Nothing to report" is valid; a missing citation for a claim is not.
### Immediate Actions
==New 2026-09-05.== Anything from the sections above that cannot wait for the next scheduled review without a real cost — a confirmed regression actively producing bad output right now, a Resource-Limit or Deadline Sweep citation showing something already over a hard threshold. Distinct from `Findings` by urgency, not by confidence: an Immediate Action can be less than 100% certain and still belong here if waiting is itself the risk. Per [[30_Order/Workflows/Internship/Internship Review System]], a non-empty Immediate Actions section triggers same-day notification to the human running or receiving this review — it does not just sit in the file until someone happens to read it.
### Decided Fixes
Only items with 100% clarity, per the general [[Review Standard|Review Standard]]'s rule. A review surfacing a bug is not itself authorization to patch the loop's code — that's a separate build session.
### Open Questions
Anything short of 100% clarity. Carries forward until resolved.
> [!WARNING]
> **Carryover Escalation, new 2026-09-05.** An Open Question or an unresolved Finding that appears in this same slot two consecutive Weekly reviews auto-promotes to next period's Immediate Actions — per the 2026-09 Monthly review's own stated bar ("a second consecutive sighting is stronger evidence this is a discipline gap, not a one-time oversight"), now made mechanical instead of optional. Whoever writes the next review checks the prior period's Open Questions against this rule before writing a new Findings section.
### Next Period's Watch List
What this review specifically expects to check again next week, including anything just promoted by the Carryover Escalation rule above.
## Per-Heading Standard — Monthly Promotion Review
### Period Covered
The calendar month, or the real range covered if a review runs late (state it honestly, per the Weekly review's same rule).
### Sources Reviewed
Name every folder actually opened: `Programs/{Serious,Considering,Job & Company}/` (including their `Missed/` and `Ended/` subfolders), `Contacts/Each One/{Ongoing,Come Back,Ended}/`, `Tracker/{Each One,Tracker.md,Internship - Dashboard.md}`, `20_Progress/Internship/Applying/{Now.md,Applied/}`, `Preperation/Interviews/`, and the most recent Deadline Sweep output.
### Pipeline Checklist
Grade the month directly against [[Internship Pipeline|Internship Pipeline]]'s own `Done When` list.
### Per-Program Trace
For every note trio that exists, walk noted → researched → created → applied → result and flag anything stalled beyond what its own `Next Action` field assumed.
### Deadline Sweep Reconciliation
==New 2026-09-05.== Query every live Program note's `deadline_posted`/`deadline_real` directly (a real query, not a hand-built table from whichever programs are already being traced) and cross-check against the most recent Deadline Sweep's `Already Over` bucket. This is the section that would have caught the 2026-09 review's miss (2 of 5 real passed deadlines found, 3 missed) — never build this list by memory of which programs seem relevant.
### Application Census
==New 2026-09-05.== A full, categorized count of every Program note against [[Internship Pipeline|Internship Pipeline]]'s stages, cited to a real query, not estimated:
- **Ended** (applied) — count, and confirm each still has a matching Applying note per the Pipeline's own discard rule.
- **Missed** (deadline passed, never applied) — count, and for each, confirm it was actually moved here rather than left in `Serious/`/`Considering/`.
- **Serious, active** — has a Program note; state how many of those also have a Contact note, a Tracker note, and any real outreach logged (a Conversation Log entry beyond the creation-day placeholder).
- **Considering, active** — same breakdown as Serious.
- **Not yet reached out** — has a Contact note with zero real Conversation Log entries beyond note-creation.
- **Not yet researched into a Program** — a dossier or manual find that passed Screen but was never promoted (cross-check against `screened_decision: pass` dossiers with no matching Program note).
This section is what answers "how many ended, deferred, not written, not researched, not reached out" as an actual count, not a narrative impression — every number here should be reproducible by a stated query or folder listing, cited inline.
### Health Check
==New 2026-09-05.== Progress against the stated end goal, cited to real counts, never estimated:
- **Cumulative applications submitted** (real count of `Applying/Applied/` notes with `date_applied` set) vs. the target: **500 applications by 2026-12-31.**
- **Days remaining** to the target date, computed from the review's own run date.
- **Required rate from today** to still hit the target (remaining applications ÷ remaining weeks), stated plainly even when — as of this Standard's rebuild, at 0 applications submitted — the honest answer is that the current rate makes the target implausible on the pipeline's own documented design (`Application Document Preparation`'s human-approved, Humanizer-passed per-application Tailor sequence is the bottleneck this number will hit first, not dossier discovery). **State this tension every time it's still true — do not quietly stop reporting the gap once it becomes uncomfortable.**
- **Actual rate this period** (applications submitted in the period covered ÷ weeks in that period).
### Note-Shape Conformance — Provisional
See the dependency warning above. Grade only against what the current templates and Pipeline prose actually say; name explicitly which checks are blocked on pending note-definition work rather than skipping them silently.
### Findings
Named, specific, cited by exact file.
### Immediate Actions
==New 2026-09-05.== Same rule as the Weekly review's Immediate Actions section — anything from Deadline Sweep Reconciliation, Application Census, or Health Check that cannot wait for next month. A Program with a deadline inside the next Deadline Sweep's 3-day window that still has zero Contact-note activity belongs here, not in ordinary Findings.
### Decided Fixes
Only items with 100% clarity.
### Open Questions
Anything short of 100% clarity, including anything genuinely blocked on pending note-definition work.
> [!WARNING]
> **Carryover Escalation** — same rule as the Weekly review's: an Open Question or unresolved Finding appearing in the same slot two consecutive Monthly reviews auto-promotes to next period's Immediate Actions. Already demonstrated live: Deepgram/Nuro/Uber/Western Digital's missing trio and Appian's stale "no rush" claim both hit this bar in the 2026-09 review and were resolved the same day this rule was written (2026-09-05) rather than carried to a third sighting.
### Next Period's Watch List
What this review specifically expects to check again next month, including anything just promoted by Carryover Escalation.
## Done Conditions
- Every claim in Gate Conformance, Standard Conformance, Resource-Limit Health, Deadline Sweep Reconciliation, Application Census, and Health Check traces to a real file, count, or log row — a fraction or count stated only when actually counted, not estimated.
- The Weekly review states its sample size and selection method explicitly; every one of its four named sources gets a checked or unchecked box with a reason, never silent omission.
- The Monthly review's Note-Shape Conformance section names what it could not check because note-definition work is still pending, rather than silently skipping it.
- Decided Fixes contains only items with 100% clarity; anything less stays in Open Questions.
- A finding that meets the Carryover Escalation bar (two consecutive sightings) is promoted to Immediate Actions, not left to carry forward a third time unremarked.
- No `---` in the body; zero blank lines except after a callout; no duplicate frontmatter keys; every `notes:` wikilink resolves.
## Gold Standard Examples
[[60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/Internship Loop Weekly Review — 2026-W34|Weekly — 2026-W34]] — the first real review, notable for what a full-corpus grep turned up that a sample alone would have missed. [[60_Claude/30_Reviews/Internship Loop/Scheduled/Monthly/Internship Loop Monthly Review — 2026-09|Monthly — 2026-09]] — the review that motivated this rebuild: found 2 real passed deadlines with zero downstream Applying-note activity, the sharpest finding either review type had produced, but also missed 3 more of the same shape and never escalated the 2 it did find same-day. Its own dated correction (2026-09-05) is worth reading alongside it as the concrete before/after this rebuild is meant to produce.
