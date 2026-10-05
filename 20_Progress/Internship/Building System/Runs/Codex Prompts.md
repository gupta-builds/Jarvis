---
type: project
status: idle
created: 2026-10-03
updated: 2026-10-04
related_progress:
  - "[[Source of Truth]]"
  - "[[Internship Notes Standard]]"
  - "[[Deadline and Intake Triage Standard]]"
  - "[[20_Progress/Internship/Building System/V0/Dossier Corrections]]"
  - "[[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]"
  - "[[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]]"
  - "[[10_Areas/Career/Internships/List/Ready to Screen]]"
tags:
  - internship
  - automation
  - prompts
  - codex
next: "Prompt 4 built [[10_Areas/Career/Internships/List/Ready to Screen]] and is archived in [[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]]. The original three-part ask (freshness, deadlines, current-as-of-today) is done to this environment's real limits — deliberately left empty below rather than padded with invented work. Two real triggers for the next prompt: (1) the next standalone 3-day deadline sweep, due ~2026-10-07 per [[Deadline and Intake Triage Standard]] §4 — re-anchor Deadline Tracker.md, regenerate Ready to Screen.md; (2) [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]'s pilot script confirming any of the 184/185 still-ambiguous dossiers actually closed — whichever lands first, write that prompt then, not before."
---
# Codex Prompts — Internship Dossier Freshness Sweep
This file holds the next prompt for a Codex (GPT-5.6 Sol) session to run **inside the Jarvis vault only**. Same convention as its sibling: this note gets wiped and rewritten every build cycle, not accumulated — a finished prompt's text and result move to [[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]] once reviewed.

## Prompting Guide In Use
[The builder's guide to GPT-5.6](https://openai.com/index/builders-guide-to-gpt-5-6/) — re-apply on every prompt.
- **Run at `reasoning effort: medium`**, by direct instruction, unchanged since Prompt 1.
- **A fetch tool that's unreliable at 100% is not the same as a fetch tool that's useless.** Prompt 2's small-sample test was treated as a binary fail, costing real coverage for no reason. Prompt 3 corrected this at full scale: 278/278 attempted individually, 94 real verdicts recovered. The lesson generalizes to any future fetch-shaped prompt in this file: a flaky tool's small-sample failure rate tells you it's imperfect, never that it's useless — attempt every item, bucket the individual failures, don't abort the batch.
- **A synthesis task (reorganizing data that already exists) is a different shape than a fetch task, even for the same model** — Prompt 4 proved this: zero new fetching, real counts recomputed from scratch rather than carried over blindly, and a real self-caught discrepancy in a prior prompt's own numbers (85 claimed vs. 84 itemized) resolved by recomputing rather than guessing which number was right. Keep that instinct for any future prompt that touches aggregated counts from an earlier prompt — recount, don't inherit.
- **Three straight prompts (2, 3, 4) have now written their full report into this file themselves, unprompted beyond the rule being stated once.** Whatever made this click — stating it as a literal task item rather than a general expectation — keep doing exactly that for every future prompt here.

## Standing Environment Facts (settled, not hypotheses — carry forward without re-verifying)
- No raw shell/HTTP network egress exists in this sandbox (confirmed, Prompts 1-2).
- `web__run` is the one real fetch path, with a ~34% real-world hit rate against actual dossier URLs in this environment (94/278, confirmed at full scale by Prompt 3) — a structural ceiling from bot-detection-class failures, not a transient issue. Don't re-attempt freshness checking with this tool; that question is now owned by the codebase side.
- Write access to the vault is reliable (confirmed across four straight prompts).
- [[Internship Notes Standard]] §§1/8 are complete and stable — don't write to either from this side without a new, specific reason tied to a real new field, not a repeat of the deadline-contract work.

## Status
**Idle by design, not by oversight.** All three parts of the original ask — confirm postings are still live, give every dossier a real deadline, leave every dossier reflecting today's actual state — are done to the real limits of this environment, and the data they produced now has an actual consumer ([[10_Areas/Career/Internships/List/Ready to Screen]]). Writing a new prompt here without a real new trigger would be exactly the kind of busywork this project's own `next:` field above is deliberately refusing to manufacture. See `next:` for the two things that would legitimately justify Prompt 5.
