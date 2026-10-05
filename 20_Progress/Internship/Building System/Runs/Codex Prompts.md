---
type: project
status: active
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
next: "Prompt 4 built [[10_Areas/Career/Internships/List/Ready to Screen]] from the live deadline and Prompt 3 freshness evidence. Regenerate that view after the next standalone 3-day deadline sweep."
---
# Codex Prompts — Internship Dossier Freshness Sweep
This file holds the next prompt for a Codex (GPT-5.6 Sol) session to run **inside the Jarvis vault only**. Same convention as its sibling: this note gets wiped and rewritten every build cycle, not accumulated — a finished prompt's text and result move to [[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]] once reviewed.

## Prompting Guide In Use
[The builder's guide to GPT-5.6](https://openai.com/index/builders-guide-to-gpt-5-6/) — re-apply on every prompt.
- **Run at `reasoning effort: medium`**, by direct instruction, unchanged from Prompts 1-2.
- **A fetch tool that's unreliable at 100% is not the same as a fetch tool that's useless.** Prompt 2's own go/no-go test (3/5 real, 2/5 unusable) was treated as a binary fail, which correctly avoided fabricating 273 statuses but also meant 0/278 real freshness information came out of the attempt — a worse outcome than it needed to be. The guide's own framing (GPT-5.6 "knew when the data just wasn't there, didn't chase bad leads") is about *not forcing an answer on an individual item that has none* — it was never meant to justify discarding the ~60% of items a flaky tool genuinely can answer. Prompt 3 corrects this: attempt every item, let individual failures land in the ambiguous/blocked bucket (exactly like the Non-Negotiable Rules already define), and report real, partial coverage as a good outcome, not a shortfall.
- Keep the "move deterministic work into code" habit from Prompt 1/2: script the per-item fetch-and-classify loop, don't hand-reason item by item.
- **Per-item attempts over batch-level gates, confirmed as the right call, not just a hypothesis.** Prompt 3 ran this correction for real: 278/278 attempted individually, 94 real verdicts recovered that a batch-level gate would have thrown away entirely. The lesson generalizes — a small-sample viability test tells you a tool is imperfect, never tells you it's useless; let individual failures land in their own bucket instead of aborting the whole task on an aggregate rate.
- **This prompt is now a synthesis task, not a fetch task — different skill, same model.** Prompt 4 reorganizes data that already exists (deadlines, freshness verdicts, buckets) into something immediately useful, with no new fetching at all. Nothing in the guide changes for this shape of task, but don't import fetch-task habits (batching, per-item evidence citation for every single row) where they don't apply — cite evidence once per claim, not once per dossier in a 269-row table.

## Environment Notes (carried forward from Prompts 1-3; the fetch-tool limit is now a settled finding, not a hypothesis)
- **This prompt does no fetching at all** — it only reads already-written dossier frontmatter and `Tracker/Deadline Tracker.md`. The network/fetch-tool notes below are kept for continuity, not because they're relevant to Prompt 4's own tasks.
- **`web__run` resolves roughly a third of real dossier URLs in this sandbox (94/278, confirmed at full scale by Prompt 3)** — a real, structural ceiling from bot-detection-class failures (403/406/503, JS-only empty responses), not a transient or retry-able issue. Do not re-attempt freshness checking on the 184 still-ambiguous dossiers from this session; that's being investigated separately, from the codebase side, in [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]].
- **Write access is confirmed working** across three straight prompts now — no need to re-test.

## Non-Negotiable Rules (apply to every task below)
1. **Do not touch any dossier's `deadline_posted`, `own_deadline`, `status`, `removed_date`, `removed_reason`, or `notes:` fields.** All of that is complete and correct as of Prompt 3 — this prompt only reads those fields to build a view, never edits them.
2. **Do not attempt to fetch or re-verify any URL.** The freshness question is closed for this environment (see Environment Notes above) — treat Prompt 3's 85/9/184 split as final input data, not a thing to improve on this round.
3. **Do not touch [[Internship Notes Standard]] §§1/8** — unchanged reason as Prompt 3: already patched, already confirmed coherent, no second write from this side.
4. **Cite real counts, not impressions.** Every number in the view you build (how many dossiers in each tier, each bucket) should be a number you actually counted this session, not carried over from a prior prompt's report without re-checking it still holds (a dossier could have been touched by something else since).
5. **A session sharing a file with a parallel session only ever appends or fixes its own entries** — unchanged standing rule; if `Deadline Tracker.md` has anything unfamiliar, leave it and mention it.

# Vault
## Prompt 4 — Result — Ready-To-Screen View Built (run 2026-10-04)
### Scope recount
The live scope is **269 active dossiers**: `1 - AI & ML` 128, `2 - Fullstack` 38, `3 - CyS & Finance` 45, and `Other` 58. `Viewed/`, `_Career Fair/`, and `_Today/` were excluded. The current section of [[10_Areas/Career/Internships/Tracker/Deadline Tracker|Deadline Tracker]] contains the same 269 dossiers exactly once.
### Tier totals and cutoff
- **Tier 1 — confirmed open, urgent: 84 itemized; 9 shown.** [[10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/2027 Business Technology Solutions Intern - Data & Software Engineering (Undergraduate) - AbbVie|AbbVie — 2027 Business Technology Solutions Intern]], [[10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/2027 Internship - Quant Research (Undergrad) - Virtu Financial|Virtu Financial — 2027 Quant Research Internship]], [[10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/2027 Internship- FPGA - Virtu Financial|Virtu Financial — 2027 FPGA Internship]], [[10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/AI Engineer Co-op - Audax Group|Audax Group — AI Engineer Co-op]], [[10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/AIML Research Intern - DRW|DRW — AIML Research Intern]], [[10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Backend Software Engineering Intern 2027 - Verkada|Verkada — Backend Software Engineering Intern 2027]], [[10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Business Technology Solutions Intern - Data & Software Engineering - Undergraduate - AbbVie|AbbVie — Business Technology Solutions Intern]], [[10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/Cybersecurity Analyst Intern - Jane Street|Jane Street — Cybersecurity Analyst Intern]], and [[10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/Data Engineer Intern - Jane Street|Jane Street — Data Engineer Intern]].
- **Tier 2 — confirmed open, further out: 0 total; 0 shown.** The one `Next Month` and five `Later` dossiers are all freshness-unconfirmed.
- **Tier 3 — unconfirmed but still live, urgent: 176 total; 9 shown.** [[10_Areas/Career/Internships/List/Dossiers/Other/AI Software Engineering Intern - Edge - Microsoft|Microsoft — AI Software Engineering Intern - Edge]], [[10_Areas/Career/Internships/List/Dossiers/Other/AI Software Engineering Intern - Microsoft|Microsoft — AI Software Engineering Intern]], [[10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Software Engineer Intern, AIML & LLM - Microsoft|Microsoft — Software Engineer Intern, AIML & LLM]], [[10_Areas/Career/Internships/List/Dossiers/2 - Fullstack/Software Engineer Intern, Cloud & Distributed Backend - Microsoft|Microsoft — Software Engineer Intern, Cloud & Distributed Backend]], [[10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Software Engineer Intern, CoreAI - Microsoft|Microsoft — Software Engineer Intern, CoreAI]], [[10_Areas/Career/Internships/List/Dossiers/Other/Software Engineer Intern, Data PlatformAnalytics - Microsoft|Microsoft — Software Engineer Intern, Data PlatformAnalytics]], [[10_Areas/Career/Internships/List/Dossiers/2 - Fullstack/Software Engineer Intern, Fullstack Product (Web + Services) - Microsoft|Microsoft — Software Engineer Intern, Fullstack Product]], [[10_Areas/Career/Internships/List/Dossiers/Other/Software Engineer Intern, Security & Identity - Microsoft|Microsoft — Software Engineer Intern, Security & Identity]], and [[10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Software Engineer Co-Op - Enterprise Finance Applications - Summer 2027 - Fifth Third Bank|Fifth Third Bank — Software Engineer Co-Op]].
The primary list is capped at **18**, split 9/9 across the two non-empty tiers so the confirmed-open queue and the human-verification queue both remain visible. Populated `preference_tier: high` values sort first; blank or missing values sort afterward without exclusion. Prompt 3's headline says 85 open / 184 ambiguous, but its item-level evidence names only 84 open dossiers and marks both Microsoft AI SWE pages generic; the conservative recoverable split is therefore `84 Tier 1 + 0 Tier 2 + 176 Tier 3 + 6 unconfirmed after Next Week + 3 Already Over/unconfirmed = 269`. No missing verdict was guessed into Tier 1.
### Already Over and unconfirmed
- **Moog — Intern, Software Engineering:** deadline 2026-07-29.
- **Regions Bank — Technology, Operations, Digital, and Data Analytics Intern:** deadline 2026-09-25.
- **Manhattan Associates — A.I. Developer Co-Op (Boston, MA):** deadline 2026-09-30.
These three remain active and outside the tiers because Prompt 3 could not confirm their freshness; a passed deadline is not itself a closed verdict.
### Artifact written
[[10_Areas/Career/Internships/List/Ready to Screen|Ready to Screen]] was written with this full frontmatter:
```yaml
---
type: index
status: sprout
created: 2026-10-04
updated: 2026-10-04
tags:
  - moc
  - internship
  - career
notes:
  - "[[10_Areas/Career/Internships/Tracker/Deadline Tracker]]"
  - "[[20_Progress/Internship/Building System/Runs/Codex Prompts]]"
  - "[[30_Order/Standards/Internship/Deadline and Intake Triage Standard]]"
next: "Regenerate after the next 3-day deadline sweep."
---
```
Its cadence note reads: “Regenerate it with the standalone 3-day deadline sweep defined in [[30_Order/Standards/Internship/Deadline and Intake Triage Standard|Deadline and Intake Triage Standard §4]].” No dossier deadline, freshness, status, removal, or notes field was edited.
# Codebase
A parallel high-effort Claude Code (Sonnet 5) session is on Session 3 in the `internship-research-loop` WSL repo — see [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]. It's doing git-branch hygiene, reconciling `state/dossier_uids.json` for the 9 dossiers this prompt's own Prompt 3 moved to `Viewed/`, and investigating (not yet building) whether the repo's own Firecrawl-backed fetch path can resolve some of the 184 dossiers still ambiguous here. Nothing from that session touches `Ready to Screen.md` or any dossier frontmatter this round — no coordination needed for this prompt's own task.
