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
next: "Prompt 2 finished the deadline-field half (278/278, confirmed) and correctly skipped the freshness recheck rather than guessing — both archived in [[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]]. Prompt 3 (below) fixes one small cosmetic defect Prompt 2 left in Deadline Tracker.md, then finishes the one piece of the original three-part ask still outstanding: confirming which postings are actually still live. It corrects Prompt 2's own too-binary gating rule — don't abort a 278-item batch because a 5-URL sample wasn't perfect, attempt every item and accept honest partial coverage."
---
# Codex Prompts — Internship Dossier Freshness Sweep
This file holds the next prompt for a Codex (GPT-5.6 Sol) session to run **inside the Jarvis vault only**. Same convention as its sibling: this note gets wiped and rewritten every build cycle, not accumulated — a finished prompt's text and result move to [[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]] once reviewed.

## Prompting Guide In Use
[The builder's guide to GPT-5.6](https://openai.com/index/builders-guide-to-gpt-5-6/) — re-apply on every prompt.
- **Run at `reasoning effort: medium`**, by direct instruction, unchanged from Prompts 1-2.
- **A fetch tool that's unreliable at 100% is not the same as a fetch tool that's useless.** Prompt 2's own go/no-go test (3/5 real, 2/5 unusable) was treated as a binary fail, which correctly avoided fabricating 273 statuses but also meant 0/278 real freshness information came out of the attempt — a worse outcome than it needed to be. The guide's own framing (GPT-5.6 "knew when the data just wasn't there, didn't chase bad leads") is about *not forcing an answer on an individual item that has none* — it was never meant to justify discarding the ~60% of items a flaky tool genuinely can answer. Prompt 3 corrects this: attempt every item, let individual failures land in the ambiguous/blocked bucket (exactly like the Non-Negotiable Rules already define), and report real, partial coverage as a good outcome, not a shortfall.
- Keep the "move deterministic work into code" habit from Prompt 1/2: script the per-item fetch-and-classify loop, don't hand-reason item by item.

## Environment Notes (carried forward from Prompt 1/2, still true)
- **No raw shell/HTTP network egress exists in this sandbox** — confirmed twice now (Prompt 1's `curl`/direct-connection failures, Prompt 2's explicit instruction not to retry them). Don't attempt this a third time.
- **The one working fetch path is `web__run`** (Prompt 2's own identification) — real but imperfect: 3/5 on its small sample. Use it as the sole fetch mechanism; expect a meaningful failure rate per item and handle that at the per-item level (Non-Negotiable Rule 3 below), not as a reason to abstain from the whole task.
- **Write access is confirmed working** (Prompt 2's Task 0) — no need to re-test it from scratch, but do a quick sanity check (e.g. confirm you can still write to the vault) before starting, since environment state can change between sessions.

## Non-Negotiable Rules (apply to every task below)
1. **Per-item attempts, not a batch-level gate.** Fetch every in-scope dossier's `url:` individually. A failure on one dossier (blocked, timeout, empty response, generic redirect) means *that dossier* goes in the ambiguous/blocked bucket — it says nothing about whether to attempt the next one. Do not re-run a 5-sample viability test and do not abort the task based on an aggregate failure rate; Prompt 2 already established the tool's real-world behavior, that's enough basis to proceed per-item.
2. **Permissive by default — unchanged since Prompt 1.** A false "still open" costs one wasted screening read later; a false "closed" silently kills a real opportunity. Only treat a dossier as closed on an affirmative signal (a genuine 404, an explicit "this position has been filled / closed / no longer accepting applications" string, or a redirect to a listings page that no longer contains this specific requisition). A blocked fetch, a timeout, a login wall, or a generic careers-landing redirect with no explicit closed signal is ambiguous, not confirmed-closed — leave that dossier exactly where it is and say so.
3. **Cite the real evidence for every verdict** — the fetched status/snippet or the exact closed-phrase found. Never "checked, looks closed" with nothing backing it.
4. **A session sharing a file with a parallel session only ever appends or fixes its own entries.** If `Tracker/Deadline Tracker.md` or `_Today/No Deadline.md` holds content that looks unfamiliar or out of this prompt's stated scope, leave it and mention it in your report.
5. **Do not re-touch `deadline_posted`/`own_deadline` on any dossier.** That field contract is already complete (Prompt 2, confirmed in [[Internship Notes Standard]] §8) — this prompt only adds or confirms open/closed status, never revisits the deadline fields.
6. **Do not touch [[Internship Notes Standard]] §8 or §1 at all.** Both are already patched and already confirmed coherent by direct inspection (see [[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]]'s Prompt 2 entry) — a second write to the same heading from this side risks exactly the collision both prior sessions flagged as a risk and narrowly avoided. If you find a real, new problem in either section, report it; don't edit it yourself this round.
7. **Preserve everything [[Internship Notes Standard]] §1 already requires** on a dossier's frontmatter beyond what this prompt's own tasks call for.

---

# Vault
## Prompt 3 — Freshness Recheck, Per-Item, Prioritized By Urgency (written 2026-10-04)
The deadline half of the original three-part ask is done (Prompt 2: 278/278). This prompt closes the remaining piece: confirming which of those 278 postings are actually still open, using the one fetch path Prompt 2 proved works some of the time, attempted honestly on every item rather than gated by a small sample.

### Scope
Unchanged from Prompts 1-2: the 278 dossiers across the four priority buckets (recount yourself before starting — it was 130/41/48/59 as of 2026-10-04). `_Career Fair/`, `Viewed/`, and the codebase repo remain out of scope, for the same reasons stated in Prompt 1.

### Task Order
1. **Recount the live scope** and state the real number before starting.
2. **Fix the stray `+` in `10_Areas/Career/Internships/Tracker/Deadline Tracker.md`.** Prompt 2's own new "Current sweep — 2026-10-04" section opens with a stray leading `+` on its first heading line (a leaked diff-hunk marker) — read the file, confirm the defect is still there, remove the stray character, change nothing else in the file.
3. **Prioritize the 3 `Already Over` dossiers first** (per `Deadline Tracker.md`'s own current "Already Over" bucket: the Moog, Regions Bank, and Manhattan Associates dossiers, each with a posting-stated deadline already in the past as of today). These are the smallest, highest-value set to resolve — a posting past its own stated deadline is the single most likely real-world case to actually be closed. Attempt a live fetch on all 3 individually, per Non-Negotiable Rule 1. For any confirmed closed (Rule 2's affirmative-signal bar): apply [[Internship Notes Standard]] §4's removal protocol by hand exactly as Prompt 1 specified — move to `Viewed/`, append the Removed Dossiers MOC link to `notes:`, set `status: removed` + `removed_date` + `removed_reason`, and record the move in a running old-path → new-path manifest. **You still cannot touch `state/dossier_uids.json`** — that manifest is the handoff to [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]].
4. **Attempt the remaining 275 dossiers individually**, in batches of 25-30, logging status/evidence per dossier to a scratch file as you go. For each: closed (Rule 2) → apply the same §4 removal protocol and manifest entry; ambiguous/blocked → leave in place, record the specific reason (blocked, timeout, empty response, generic redirect); open → leave in place, no action needed. Report running coverage as you go rather than only at the end, so an interrupted run still leaves honest, usable partial progress.
5. **Update `Tracker/Deadline Tracker.md`** to reflect any dossier actually moved to `Viewed/` this pass (remove it from the active buckets it's currently listed under) — this is a small, targeted edit on top of Prompt 2's existing section, not a rewrite of it.
6. **Write the final report directly into this file**, replacing this prompt's own body, same convention as Prompts 1-2.

### Report Back
- The real recounted scope before starting.
- Confirmation the stray `+` is fixed.
- The `Already Over` 3-dossier result, each with its cited evidence and verdict.
- Running/final coverage across the remaining 275: how many attempted, how many succeeded in returning a real verdict (open or closed), how many landed ambiguous/blocked and why.
- The complete old-path → new-path manifest for every dossier moved to `Viewed/` this pass (likely small, possibly empty — report honestly either way), each with its cited closed-signal.
- Confirmation `Deadline Tracker.md` reflects any moves.

### Grading Rubric
Scored out of 10 against:
- Every one of the 278 dossiers was actually attempted — no batch-level abstention based on an aggregate failure rate.
- Every closed verdict cites a real, affirmative signal — zero guesses.
- The stray `+` is fixed and nothing else in `Deadline Tracker.md` was disturbed.
- The `Already Over` 3 were resolved first and specifically, not buried in a generic batch pass.
- Coverage numbers (attempted/succeeded/ambiguous) are reported honestly, including if the real-world success rate turns out close to Prompt 2's 60% sample.
- The handoff manifest, however large or small, is complete and directly usable by the Claude Code session.
- [[Internship Notes Standard]] §§1/8 were not touched.

---

# Codebase
A parallel high-effort Claude Code (Sonnet 5) session is on Session 2 in the `internship-research-loop` WSL repo — see [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]. It is committing Session 1's verified work (the `deadline_posted`/`own_deadline` write-time rule, among other fixes) and patching two safety-relevant findings; it is explicitly not touching dossier files or `state/dossier_uids.json` this round. If this prompt moves any dossier to `Viewed/`, that session's *next* prompt (not Session 2) is where the manifest handoff actually gets reconciled — don't expect an immediate reaction from the current codebase session.
