---
type: evergreen
status: tree
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - evergreen
  - review
  - template
  - internship
---
# Internship Loop Weekly Review — <% tp.date.now("YYYY") %>-W<% tp.date.now("ww") %>
## Period Covered
<% tp.date.now("YYYY-MM-DD", -6) %> through <% tp.date.now("YYYY-MM-DD") %>
## Sources Reviewed
- [ ] Sampled dossier files (list exact paths in Sample & Method below)
- [ ] [[10_Areas/Career/Internships/List/Dossiers MOC|Dossiers MOC]] capacity table
- [ ] `Excluded — Losing The Debate.md`
- [ ] `logs/runs.jsonl` / [[20_Progress/Internship/Building System/System - Build Log|System - Build Log]] (only if a code-level claim needs checking)
- [ ] Latest Deadline Sweep output ([[10_Areas/Career/Internships/Tracker/Deadline Tracker|Deadline Tracker]], check its header date)
## Sample & Method
- Sample size: ___
- Selection rule: ___
- Corpus size this period (full-corpus grep, not sampled): AI & ML ___ / Fullstack ___ / CyS & Finance ___ / Other ___ / Viewed ___
## Gate Conformance
_Against [[20_Progress/Internship/Building System/Source of Truth|Source of Truth]]'s four hard gates: timing, US location, OPT, CS/software relevance._
-
## Standard Conformance
_Against [[Internship Notes Standard|Internship Notes Standard]]: frontmatter fields, `notes:` interlink, `company/<slug>` tag, body dedup/structure, removal fields._
-
## Priority Classification Accuracy
-
## Resource-Limit Health
- Bucket counts vs. 50-per-bucket threshold: ___
- Global total vs. 150/170/190/200 thresholds: ___
- GitHub issues expected vs. actually filed: ___
- _Discovery-capacity health only — no separate cap on Programs in flight; that's reported, not gated, in the Monthly review's Health Check._
## Deadline Sweep Citation
_Cite the latest sweep's `Already Over`/`Soon` buckets directly — don't re-derive deadline status by hand here._
-
## Findings
-
## Immediate Actions
_Anything above that can't wait for next period — see [[Internship Loop Review Standard]]. Triggers same-day escalation to [[10_Areas/Career/Internships/Tracker/Main Log|Main Log]] per [[30_Order/Workflows/Internship/Internship Review System]]._
-
## Decided Fixes
_Only items with 100% clarity — see [[Internship Loop Review Standard]]._
-
## Open Questions
_Check last period's Open Questions against the Carryover Escalation rule before writing new ones — two consecutive sightings promote to Immediate Actions._
-
## Next Period's Watch List
-
