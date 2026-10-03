---
type: project
status: active
created: 2026-07-26
updated: 2026-09-08
related_progress:
  - "[[Source of Truth]]"
  - "[[20_Progress/Internship/Building System/Research Loop - Improvement Plan]]"
  - "[[Internship Notes Standard]]"
  - "[[Claude Code Prompts - Archive]]"
  - "[[Prompt 1 Reboot - Building System Refresh Session (2026-09-04)]]"
tags:
  - internship
  - automation
  - prompts
next: Prompts 1-7 all done and archived (444→499 pytest across the run, 0 regressions; Prompts 6 and 7 both got fully clean independent reviews). 4 clean local commits exist on top of 96261d8, unpushed, diverged 5 ahead / 4 behind origin/master (4 daily recheck.yml auto-commits touching only logs/rechecks.jsonl and state/dossier_uids.json — zero file overlap with local commits, confirmed 2026-09-08). Prompt 8 (below) reconciles the divergence via rebase and re-verifies — still does NOT push, that stays a separate human decision.
---
# Claude Code Prompts — Internship Research Loop
This file holds the next prompt(s) to run, and only that — it gets wiped and rewritten every build cycle, not accumulated. When a prompt finishes and its result is reviewed, its full text and result move into [[Claude Code Prompts - Archive]] and get deleted from here.

## Prompting Guide In Use
[Prompting Claude Sonnet 5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5) — re-apply on every prompt.
- Front-load everything, literal scope, explicit Task Order/Files Touched, `high` effort, generous `max_tokens`.
- Hand over verified facts, instruct re-checking them.
- **A hypothesis this file itself wrote can turn out wrong — say so plainly when it does, don't quietly drop it.** Prompt 14 v2's own JGCL hypothesis (a `SOURCES`-tuple tie-break bug) was checked and found wrong; the real cause was three specific already-deleted scholarship postings. That's now the record, not the guess that preceded it — every doc touched below corrects to the real finding, not a hedge between the two.
- **An alarming-sounding fact ("46 deletions") is worth one direct check before treating it as a problem.** It resolved in one search — a real, already-tracked session (auto-captured, per this vault's own conversation-export layer), not an untracked gap. Cheap to verify, expensive to leave as a nagging unresolved worry across future prompts.
- **When a real source count changes, every doc that states a specific number becomes a small, precise lie until corrected.** Lever going live makes "eight sources" wrong wherever it's written — treat this the same as any other now-stale claim, not a footnote.

---

- **A local git checkout goes stale fast on this project — the pipeline auto-commits hourly.** Read state files via `git show origin/master:<path>`, or `git fetch` + confirm local `HEAD` matches `origin/master` (pull/rebase if not) before trusting any local working-tree read of anything `run_pipeline.py`/`recheck.py` touches. Caught live 2026-08-27: a local `git show`-free read of `state/debate_losses.json` showed 6 entries where `origin/master`'s real, current file had 271 — a local clone can sit dozens of commits behind within a single day.

- **A session sharing a file with a parallel session must only ever append or fix its own entries — never remove something it didn't write because it looks unfamiliar or out of scope.** Real incident, 2026-08-28: Prompt 21's session found 6 legitimate links Prompt 20's session had added to a shared `No Deadline.md` (companies with no existing dossier, correctly out of Prompt 21's own 320-dossier scope) and deleted them as presumed noise during its own cleanup pass. Caught and restored by the coordinating session, not by either prompt session itself. If something in a shared file looks wrong, say so in the report — don't unilaterally remove it.
- **When a follow-up genuinely needs the same deep context a session just built (e.g., re-checking its own just-completed work), tell the human to continue in the SAME session, not paste into a fresh one.** Re-deriving 320 already-read dossiers from scratch in a new session would re-burn the exact token cost being complained about — this project's usual "fresh session per prompt" default is a good default, not an absolute rule, when continuity itself is the point.
- **A plan that turns out to undercount real evidence should be corrected mid-plan, with human confirmation, not silently widened or silently left narrow.** Prompt 1 (2026-09-06)'s own citation named 3 quant-firm companies split across buckets; a direct `vault_list` check the plan itself performed found 8. The executing session flagged this explicitly and got a yes before fixing all 8 — the model to repeat, not an exception.
- **A reviewing session must check the actual commit, not just the reported diff.** Prompt 2's own report (2026-09-06) was accurate about every line it described — but the real commit also bundled in unrelated pre-existing uncommitted `.claude/` work and a stray new dependency it never mentioned. Still true of `96261d8` today — not fixed, just no longer repeated (Prompt 7's 4 commits kept `.claude/` completely untouched).
- **A resource-intensive, cost-real, or shared-state-risking build gets a plan before it gets code — always, no exception for "it's just a workflow file."** Prompt 4 (2026-09-06) is deliberately written as investigate-then-plan rather than pre-specified, because a manual burst-discovery GitHub Action has real Firecrawl/Actions-minutes cost and real risk of corrupting `run.yml`'s shared state files if built carelessly.
- **A plan's own reasoning, applied consistently, sometimes catches a gap the plan itself missed.** Prompt 4's approved plan argued `excluded_uids.json` should seed from the real file "to save real Firecrawl calls" — the identical logic applies to `opt_cache.json`, which the plan never mentioned and the build never seeded. A reviewer re-deriving a plan's own stated principle against every file it touches, not just the ones it named, is how this kind of gap gets caught before it costs real money twice.
- **A deliberate reversal of a documented design principle is still allowed — it just has to be named as one, not built as if the principle never existed.** Prompt 6 reverses `Source of Truth.md`'s explicit "notification, never a write refusal" capacity rule, on direct human instruction. It landed with a precise dated note explaining exactly what changed and what didn't.
- **A prompt-writer's own arithmetic isn't exempt from the "verify, don't trust" rule this whole file preaches to every executing session.** Prompt 6 asked for "2 AI/ML + 1 Fullstack + 1 CyS & Finance + 2 Other" under the title "Exact-5" — 2+1+1+2 is 6. The executing session caught it, used the real per-bucket values instead of the wrong label, and documented the correction rather than quietly fixing it.
- **Local and origin diverging is routine on this project (an hourly/daily automated pipeline pushes on its own schedule) — the fix is almost always a plain rebase, not a manual merge.** Confirmed 2026-09-08: origin's extra commits during this session's work were 4 daily `recheck.yml` auto-commits touching only `logs/rechecks.jsonl`/`state/dossier_uids.json` — files no interactive session's own commits were touching. Check file overlap before assuming a rebase will be messy; it usually isn't.

# Vault
## Second Reset, 2026-09-06
Prompts 1-7 are done and archived (444→499 `pytest` across all seven, 0 regressions) — see [[Claude Code Prompts - Archive]] for full plans/reports. Prompts 6 and 7 both got fully clean independent reviews — the session has stabilized. 4 clean local commits sit on top of `96261d8`, unpushed, now diverged from `origin/master`.

### Prompt 8 — Reconcile The Divergence With `origin/master` (Still No Push)
**Run at `effort: high`.** Low risk, mechanical — the file-overlap check is already done (see ground truth), this is confirmation and execution, not a design decision.

**Ground truth, confirmed directly 2026-09-08 — re-verify before trusting, this can change if anything else touches the tree in the meantime (it already has once, mid-session, see below):**
- `git status -sb` shows `master...origin/master [ahead 5, behind 4]`. The 5 ahead are `96261d8` (pre-existing) plus the 4 commits Prompt 7 made (`8186ea7`, `193d5a5`, `775dbd2`, `bee5146`). The 4 behind are `origin/master`'s own `5bdc7c7`/`401ad53`/`334cc62`/`6b174d8` — daily `recheck.yml` auto-commits.
- `git diff --name-only 24ce10a origin/master` shows those 4 origin commits touch **only** `logs/rechecks.jsonl` and `state/dossier_uids.json`.
- `git diff --name-only 24ce10a HEAD` shows the local commits touch a completely disjoint file set — **zero overlap** with origin's 4 commits, so a rebase should apply cleanly with no manual conflict resolution needed.
- **New since Prompt 7's commits landed:** `.github/workflows/run.yml` now has a fresh, real, uncommitted change on top of what `bee5146` already committed — a "Notify if new dossiers are ready to promote" step (`git diff .github/workflows/run.yml` to see it yourself), added by other work happening in this same repo, not by any prompt in this session. It looks sound on inspection (best-effort `|| true`, reuses the already-granted `issues: write` permission, well-commented) — this prompt does not revert or question it, only commits it, since `run.yml` is a pipeline file (not `.claude/`) and this is exactly the kind of real, uncommitted work Prompt 7's whole point was to stop leaving lying around.
- **This matters mechanically, not just tidily: `git rebase` needs a clean working tree.** `run.yml` is touched by `bee5146`, one of the commits being replayed — an uncommitted change sitting on top of it will very likely block the rebase outright (`error: cannot rebase: You have unstaged changes`). Commit it first, per Task 1 below, before attempting the rebase.

**Non-negotiable rules:**
- Full `pytest` green before starting (confirm yourself, don't trust any number in this file).
- Read the actual current `git diff .github/workflows/run.yml` yourself before committing it — the summary above is what was true when this prompt was written; if it's changed again, or if anything looks actually wrong (not just new), stop and report rather than committing on the strength of this file's own description.
- `git fetch origin` first, then `git rebase origin/master` (not a merge) — only after the working tree is clean.
- If the rebase reports any conflict at all, **stop immediately, do not resolve it, report exactly which file(s) and what the conflict markers show.**
- Full `pytest` green again after the rebase completes.
- **Still do not push.** This prompt only gets the local branch clean and fast-forward-able — the actual push remains a separate, explicit human decision.
- Don't touch, stage, or comment on the `.claude/` files beyond confirming their set is unchanged.

**Task:**
1. Confirm the `run.yml` diff still looks like the notify-step addition described above (re-read it, don't assume). If so, commit it on its own, with a message describing what it does and why — cite the change's own inline comment rather than re-deriving. If the diff looks like something else entirely, stop and report instead of committing blind.
2. `git fetch origin`.
3. `git rebase origin/master`.
4. Confirm `git status -sb` now shows `ahead N, behind 0` (N should be 6 — `96261d8` + Prompt 7's 4 + this prompt's new run.yml commit — if the count differs, explain why before reporting success).
5. Re-run the full `pytest` suite; report the count.
6. Confirm `.claude/`'s file set is still exactly unchanged (3 modified + 5 untracked, same as every prior prompt) — and confirm `run.yml` no longer shows as modified (it's committed now, not just untouched).

---
**Report back:** the `run.yml` diff you committed and the commit message you used, `git status -sb` before and after the rebase, `git log --oneline -10` showing the new linear history, the post-rebase `pytest` count, and confirmation the `.claude/` file set is untouched. If a conflict occurred, that's the entire report — stop there.
