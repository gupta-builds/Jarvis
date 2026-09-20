---
type: evergreen
status: sprout
created: 2026-09-04
updated: 2026-09-05
tags:
  - internship
  - workflow
  - review
notes:
  - "[[Internship Loop Review Standard]]"
  - "[[60_Claude/30_Reviews/Internship Loop/Internship Loop Reviews MOC]]"
  - "[[Internship Loop Weekly Review Template]]"
  - "[[Internship Loop Monthly Review Template]]"
  - "[[20_Progress/Internship/Building System/System - Build Log]]"
  - "[[Deadline and Intake Triage Standard]]"
  - "[[10_Areas/Career/Internships/Tracker/Main Log]]"
next: "The local crontab entries this note describes were installed 2026-09-05 (see System - Build Log's same-date entry for the exact commands). Re-verify they're still present after any machine restart or WSL reinstall — `crontab -l` — since nothing in this vault re-installs them automatically."
---
# Internship Review System
==The operational system that actually runs [[Internship Loop Review Standard]] — what triggers it, on what cadence, where the output lands, and what happens to what it finds.== That Standard states *what a review must contain, per heading*; this note states *how a review actually gets produced and closed out*, the same split [[Internship Tracking Workflow]] draws between a Standard's content rules and its own maintenance procedure.

## Trigger — Local Cron, Headless Claude Code, Human-Owned Content
**Changed 2026-09-05.** Through 2026-09-04 this section said reviews were deliberately manual/human-initiated, never a cron job — a considered decision, not a gap. That decision is reversed as of this rebuild, for a stated reason: two reviews in a row ran 12 days late against their own intended cadence, and the second of those two lateness incidents is what let a real, already-passed deadline (Castleton, 2026-09-01) sit undetected for 4 extra days. A review still needs a human's (or Claude's) judgment to write — that part doesn't change, and is exactly why this runs as a real Claude Code session, not a fixed script. What changes is *who presses go*.
**Mechanism:** a local crontab entry on this machine invokes the Claude Code CLI headlessly (`claude -p`) at each scheduled time, with the same local MCP access (`jarvis`/`jarvis-fs`) an interactive session has — this only works because Obsidian's Local REST API plugin has to actually be running for the fire to succeed; per [[jarvis]]'s own rule, a `vault_list` failure means "not connected," not "empty vault," and a scheduled run that hits this should say so in its output rather than guessing. **This was a deliberate trade-off, not an oversight:** a cloud-scheduled routine (the `schedule` skill's mechanism) was considered first and rejected — cloud routines cannot reach a local Obsidian vault at all, only git-clonable repos and a fixed connector list, and routing review-writes through a second git-based writer against this same personal vault (alongside your own local Obsidian edits) reintroduces exactly the two-writer collision problem [[jarvis]] already warns against for a different mechanism. Local cron's real cost, stated honestly: **a fire is silently skipped if the machine is off or asleep at that exact moment** — there is no catch-up mechanism. Check `crontab -l` after any extended time away from the machine, and treat a gap in the Reviews MOC's Status table as the visible symptom if a fire was missed.
## Cadence
- **Weekly Discovery Review — every Friday.** Chosen to match [[Internship Pipeline]]'s own pre-existing "Friday ritual" cadence (already used for `_This Week.md`) rather than invent a second weekly rhythm.
- **Monthly Promotion Review — the 1st of every calendar month.**
- **Deadline Sweep — every 3 days, standalone.** Per [[Internship Loop Review Standard]]'s "Why Two Review Types Plus A Standalone Sweep" section — this is not one of the two review types above, it's a fast, mechanical, corpus-wide check that feeds both of them (and the Main Log) as a citation, not a judgment-heavy review in its own right. Content spec: [[Deadline and Intake Triage Standard]].
- Per the general [[Review Standard|Review Standard]]'s rule (inherited unchanged), "nothing to report" is a valid finding for any of the three — a fire that finds nothing new still produces a dated record, never gets skipped because it seems redundant.
## Where Output Lands
- Weekly/Monthly reviews: `60_Claude/30_Reviews/Internship Loop/Scheduled/{Weekly,Monthly}/`, one file per period, from the matching template, linked into [[60_Claude/30_Reviews/Internship Loop/Internship Loop Reviews MOC]] before it's considered filed.
- Deadline Sweep: `10_Areas/Career/Internships/Tracker/Deadline Tracker.md`, re-anchored to the sweep's own run date each time, per [[Deadline and Intake Triage Standard]].
- All three: a one-line pointer added to [[10_Areas/Career/Internships/Tracker/Main Log|Main Log]] in the same run, so the Log stays the single place to check "when was this last verified" without opening the Reviews MOC or the Tracker folder separately.
## Escalation — What Happens To Immediate Actions
==New 2026-09-05, closing the exact gap that let two real deadline misses sit unescalated on the day they were found.== A review or sweep whose output has a non-empty **Immediate Actions** section (Weekly/Monthly reviews) or a non-empty `Already Over`/`Soon` bucket with no matching Applying-note activity (Deadline Sweep) does not just get filed and wait for someone to open it:
1. The run's own final message (in the headless session's output, captured by the cron invocation) states the Immediate Actions plainly, not buried under a general summary.
2. The same content gets appended to [[10_Areas/Career/Internships/Tracker/Main Log|Main Log]]'s own outstanding-actions section in the same run — this is the mechanism that makes the Log the one place to check, instead of relying on the human to have read the specific review file.
3. An Immediate Action is not closed by the review itself — per the general Review Standard's rule, a review surfacing a problem is not authorization to fix it. It stays open in the Main Log until a real, dated resolution lands (an application submitted, a Program moved to `Missed/` with a stated reason, a codebase Prompt filed) — the same discipline this note's "Closing Out A Review's Findings" section below already applies to Decided Fixes.
## Creating A New Period's File
1. Name the file consistently with the existing examples: `Internship Loop Weekly Review — YYYY-Www` / `Internship Loop Monthly Review — YYYY-MM`.
2. Link it into the Reviews MOC before writing the content, not after.
3. Write the review per [[Internship Loop Review Standard]]'s per-heading spec, citing real files/counts throughout.
4. Update [[10_Areas/Career/Internships/Tracker/Main Log|Main Log]] per the Escalation section above.
## Closing Out A Review's Findings
A review's own **Decided Fixes** section (only items at 100% clarity) is not itself authorization to patch code or rewrite a note — it's a handoff:
- **A codebase-side finding** (a filter/classify/relevance bug, a schema-drift gap, a resource-limit-code gap) becomes a new dated entry in [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]] — see that file's Prompt 2 entry (2026-09-05, the Microsoft `stage1_reject` sidebar-link regression) for the current shape this should take.
- **A vault-side finding** (a stale note, a broken cross-link, a template gap) gets fixed directly in the same session, and the fix gets a one-line mention in [[60_Claude/07_AI_Information/Session Logs/log.md]].
- **Open Questions** carry forward to the next period's review verbatim until resolved, subject to [[Internship Loop Review Standard]]'s Carryover Escalation rule — two consecutive sightings promote a question to the next period's Immediate Actions automatically, it doesn't get a third quiet carry-forward.
## The Codebase Half — `loop-verifier`
`internship-research-loop/.claude/agents/loop-verifier.md` already checks the test suite, scheduled-run history, vault-vs-log dossier counts, `seen_ids.json`/vault divergence, and auto-filed GitHub issues, producing a dated HEALTHY/DEGRADED/BROKEN verdict — real, existing overlap with the Weekly Discovery Review's **Gate Conformance** and **Resource-Limit Health** sections. **Still not formally wired together as of this rebuild** — the right integration remains citing `loop-verifier`'s dated report as one input to those sections, not merging the two (the Weekly review's content-quality sampling is work `loop-verifier`'s read-only, infra-focused checks can't do). Left as an open item, same as before this rebuild — see this note's own `next:` field for the concrete next step.
## Done When
- Every Friday, every 1st-of-month, and every 3rd day has a corresponding Weekly, Monthly, or Deadline Sweep record — even a short one stating "nothing to report."
- Every review file is linked from the Reviews MOC, and every run (review or sweep) is reflected in [[10_Areas/Career/Internships/Tracker/Main Log|Main Log]], before it's considered filed.
- Every Decided Fix has a real, findable downstream artifact.
- No Immediate Action sits unresolved in the Main Log without a dated reason it's still open.
- Open Questions are either resolved or explicitly carried forward — none silently dropped, and none silently carried past the Carryover Escalation bar.
