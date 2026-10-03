---
type: project
status: active
created: 2026-10-03
updated: 2026-10-03
related_progress:
  - "[[Source of Truth]]"
  - "[[Internship Notes Standard]]"
  - "[[Deadline and Intake Triage Standard]]"
  - "[[20_Progress/Internship/Building System/V0/Dossier Corrections]]"
  - "[[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]"
tags:
  - internship
  - automation
  - prompts
  - codex
next: "Prompt 1 (below) is the first real content this file has ever carried. Same convention as its sibling: when it's run and reviewed, move the full text + result into an archive note (create [[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]] the same shape as [[Claude Code Prompts - Archive]]) and wipe this file back down to just the guide."
---
# Codex Prompts — Internship Dossier Freshness Sweep
This file holds the next prompt for a Codex (GPT-5.6 Sol) session to run **inside the Jarvis vault only** — it never touches the `internship-research-loop` codebase repo, that's [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]'s job, running the same day in a separate WSL session. Same rule as its sibling file: this note gets wiped and rewritten every build cycle, not accumulated — a finished prompt's text and result move to an archive note once reviewed.

## Prompting Guide In Use
[The builder's guide to GPT-5.6](https://openai.com/index/builders-pro-guide-to-gpt-5-6/) — re-apply on every prompt. (If that link 404s, it moved to `openai.com/index/builders-guide-to-gpt-5-6/` — the content below is what was read there 2026-10-03.)
- **Run at `reasoning effort: medium`, by direct instruction.** This model family is specifically good at knowing when a lead is dead rather than needing more thinking budget to reach that conclusion ("it knew when the data just wasn't there, didn't chase bad leads" — Hex, in the guide). Don't compensate for `medium` by over-specifying every judgment call in this prompt; state the goal and the hard rules below and trust the triage.
- **Move the deterministic part into code, keep the judgment part in the model** — the guide's own "programmatic tool calling" principle. This task is ~280 URL checks and one repeated frontmatter edit shape, with real judgment needed only at the margins (an ambiguous fetch, a missing deadline). Write a script that does the mechanical fetch-and-classify pass across every dossier in one batch; spend reasoning budget only on the script's own uncertain output, not on hand-reasoning over every file one at a time.
- **State your actual tool access before relying on it.** If outbound network access isn't available in this sandbox, say so immediately and stop — this is this vault's own rule as much as it is good practice: every hard gate in [[Source of Truth]] exists because this codebase refuses to guess at something it could check, and a fabricated "still open" or "closed" verdict for a real posting is exactly that kind of guess.

## Non-Negotiable Rules (apply to every task below)
1. **Confirm network access before trusting it for even one dossier.** Fetch one known URL as a connectivity test first. If it fails in a way that looks like "no network from this sandbox" rather than "this one posting is dead," stop and report that as a blocker — don't produce 278 fabricated statuses.
2. **Script the mechanical pass; reserve your own reasoning for the exceptions** (see the guide note above). Log the script's raw output — status code, final URL after any redirect, a short text snippet — to a scratch file as you go, so an interrupted run doesn't lose everything already checked.
3. **Permissive by default — the same asymmetry every hard gate in [[Source of Truth]] already runs on.** A false "still open" costs one wasted screening read later; a false "closed" silently kills a real, still-live opportunity. A blocked fetch, a timeout, a login wall, or a redirect to a generic careers-landing page with no explicit closed signal is **ambiguous, not confirmed-closed.** Only treat a dossier as closed on an affirmative signal: a genuine 404, an explicit "this position has been filled / is no longer accepting applications / has closed" string, or a redirect to a listings page that no longer contains this specific requisition. When genuinely unsure, leave the dossier exactly where it is, state it's still being treated as open, and say so in your report — don't guess either way.
4. **Cite the real evidence for every verdict** — the fetched status code/snippet or the exact closed-phrase you found — the same discipline [[20_Progress/Internship/Building System/V0/Dossier Corrections]] already modeled against this exact folder set. Never write "checked, looks closed" with nothing backing it.
5. **A session sharing a file with a parallel session only ever appends or fixes its own entries.** [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]] records a real incident (a session deleting another session's legitimate additions to a shared file out of unfamiliarity) as a standing lesson — it applies here too. If `Tracker/Deadline Tracker.md` or `_Today/No Deadline.md` already holds content that looks unfamiliar or out of this prompt's stated scope, leave it alone and mention it in your report.
6. **Preserve everything [[Internship Notes Standard]] §1 already requires** on a dossier's frontmatter — don't drop or reorder existing fields, don't touch `notes:` or `tags:` beyond what this prompt's own tasks call for.

---

# Vault
## Prompt 1 — Dossier Freshness, Deadline, and Removal Sweep (2026-10-03)
These dossiers were almost all written a month or more ago by the automated discovery loop and have never been re-checked since. The three things this prompt closes: (1) confirm each one's real posting is still live, (2) give every surviving dossier a real evidence-backed way of knowing when to apply by, (3) leave every dossier reflecting today's actual state, not whatever the pipeline wrote on first discovery.

### Scope
**In scope:** every dossier directly inside `10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/`, `2 - Fullstack/`, `3 - CyS & Finance/`, and `Other/` — 278 files as of 2026-10-03 (130 + 41 + 48 + 59, counted directly; recount yourself before starting, this drifts daily).

**Out of scope, explicitly, and why:**
- `10_Areas/Career/Internships/List/Dossiers/_Career Fair/` (11 files) — per direct instruction. A separate, recent 51-company career-fair pass already covers this folder on its own cadence; don't touch it this round.
- `10_Areas/Career/Internships/List/Dossiers/Viewed/` (67 files) — already resolved. Each one carries `status: removed` because `recheck.py` or a prior manual sweep already confirmed its posting is dead. [[Internship Notes Standard]] §4's "not retroactive" rule (new fields don't get backfilled onto notes that predate them) applies by the same logic: a dead dossier doesn't need a deadline field. If you happen to notice one that looks like it was wrongly moved — still genuinely open — name it in your report; don't restore it yourself, that's a full re-audit of a folder this prompt doesn't otherwise touch.
- The `internship-research-loop` codebase repo itself. A parallel Claude Code session is auditing that the same day — see [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]] and the `# Codebase` section below. You have vault filesystem access only; confirm that's actually true rather than assuming it.

### Task Order
1. **Recount the live scope** (the four priority-bucket folders) and state the real number before starting.
2. **Connectivity test** (Non-Negotiable Rule 1). Report the result before proceeding to anything else.
3. **Scripted first pass.** For every in-scope dossier: read its `url:` frontmatter field, attempt a fetch, classify as `likely-open` / `likely-closed` / `ambiguous-or-blocked`, log the evidence (status code, final URL, snippet) to a scratch file. Report the raw counts in each bucket before acting on any of them.
4. **Resolve `likely-closed`.** For each one, re-read the actual fetched text/status yourself — don't trust the script's heuristic blind — then confirm it really does carry an affirmative closed signal (Non-Negotiable Rule 3). For every one you confirm: follow [[Internship Notes Standard]] §4's removal protocol by hand — move the file to `10_Areas/Career/Internships/List/Dossiers/Viewed/`, append `"[[10_Areas/Career/Internships/List/Dossiers/Viewed/Removed Dossiers MOC]]"` to its existing `notes:` list (keep the Dossiers MOC link already there), set `status: removed`, and add `removed_date` (today) + `removed_reason` (the specific signal — e.g. "live fetch returned 404 on 2026-10-03" or "posting states \"This position has been filled\" as of 2026-10-03"). **You cannot update `state/dossier_uids.json`** — that manifest lives in the codebase repo, not the vault. Instead, keep a running old-path → new-path manifest of every file you move, and put the complete list at the top of your final report so the parallel Claude Code session can reconcile it on the repo side. This is a real handoff, not an afterthought — flag it plainly.
5. **Resolve `ambiguous-or-blocked`.** Apply Non-Negotiable Rule 3: leave these dossiers exactly where they are. For each, record the specific reason it couldn't be confirmed either way (blocked/CAPTCHA, timeout, login wall, generic redirect with no closed signal) so a future sweep knows it still needs a real human/browser check rather than another automated fetch attempt.
6. **Set the deadline field for every dossier that stays in an active bucket** (the confirmed-open set plus the unresolved ambiguous set) — check the actual posting text (fresh fetch where you have one, the stored `## Posting` body otherwise) for a real stated deadline:
   - **`deadline_posted:`** — the posting's own real, explicitly stated deadline, ISO `YYYY-MM-DD`. Mirrors the field name already used on promoted Program notes ([[Deadline and Intake Triage Standard]] §4 cites `deadline_posted`/`deadline_real` as the live convention there) — use the same name here rather than inventing a parallel one. Only set this from text the posting itself states (a date, "applications close X," an explicit countdown) — never inferred, never defaulted.
   - **`own_deadline:`** — a self-imposed deadline, set only when `deadline_posted` has no real value. **For this one-time retroactive sweep, compute it as today's date (2026-10-03, or whatever day you actually run this) + 7 days — not `date_found` + 7 days.** This is a deliberate call, not a shortcut: most of these 278 dossiers have a `date_found` from weeks or months ago, and `date_found` + 7 days would hand a dossier you're confirming is live *right now* a deadline that already expired before you finished reading it — which defeats the entire point of the field (a real, future forcing-deadline to actually apply by). The **permanent, going-forward rule**, for every dossier the automated pipeline writes from here on, is different and is correct as specified: `own_deadline = date_found + 7 days`, because a freshly-discovered dossier's `date_found` genuinely is "now." That permanent rule is being built into `vault_writer/writer.py`'s `build_frontmatter()` by the parallel Claude Code session (see the `# Codebase` section below) — you are not building that code, you're doing the one-time hand backfill with the reconciled formula above. If you disagree with this reconciliation once you're looking at real dossiers, say so plainly in your report rather than silently picking one formula or the other.
   - Every dossier you leave in an active bucket ends this pass carrying exactly one of the two fields with a real value — never both, never neither.
7. **Update the existing deadline-tracking artifacts this sweep directly feeds** — per [[Deadline and Intake Triage Standard]], don't build a parallel system:
   - `10_Areas/Career/Internships/Tracker/Deadline Tracker.md` — re-anchor its bucket cutoffs to today's date, re-bucket every dossier you touched by its new `deadline_posted`/`own_deadline` value.
   - `10_Areas/Career/Internships/List/Dossiers/_Today/No Deadline.md` — remove any dossier that now carries a real `own_deadline` (it no longer has "no deadline," it has a self-imposed one). State explicitly in your report that this changes what the note means going forward — every live dossier now carries *some* deadline value, so "No Deadline.md" may need renaming or redefining once this lands. Flag it; don't silently redefine the note's stated purpose without saying so.
8. **Document the new field contract.** Patch [[Internship Notes Standard]] by heading — add a new numbered section after its existing §7 defining `deadline_posted`/`own_deadline` exactly as specified in Task 6, citing this sweep by date as the origin, and add both fields to §1's required-field list. Don't touch any other section of that note.
9. **Write the final report directly into this file**, replacing this prompt's own body — same convention [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]] already uses for a finished prompt, before it gets moved to an archive note.

### Report Back
- The real recounted scope (per-bucket numbers) before you started.
- The connectivity test result.
- The script's first-pass raw counts (`likely-open` / `likely-closed` / `ambiguous-or-blocked`).
- The full old-path → new-path manifest for every dossier moved to `Viewed/`, each with its cited closed-signal.
- A per-bucket breakdown of final `deadline_posted` vs. `own_deadline` counts.
- The ambiguous/blocked list, with the specific reason for each entry.
- Confirmation that `Deadline Tracker.md` and `No Deadline.md` are both updated, plus your flag on what `No Deadline.md` should mean going forward.
- Confirmation that [[Internship Notes Standard]] carries the new section.
- Anything in `Viewed/` you noticed in passing that looks wrongly moved (not a full re-audit — just don't ignore something you trip over).

### Grading Rubric
Scored out of 10 against:
- Every dossier moved to `Viewed/` cites a real, affirmative closed signal — zero guesses, zero "probably closed."
- Zero dossiers left carrying both `deadline_posted` and `own_deadline`, or neither.
- The `own_deadline` reconciliation (today + 7, not `date_found` + 7, for this retroactive pass) applied consistently across all 278 — an inconsistent mix is a real defect, not a style note.
- `Deadline Tracker.md` and `No Deadline.md` actually updated, not just the dossiers themselves.
- [[Internship Notes Standard]] patched by heading, nothing else in that note disturbed.
- The `dossier_uids.json` handoff manifest is complete and directly usable by the Claude Code session — this is the one piece of information only this session has that the other side needs.
- No unfamiliar content in a shared file removed without being flagged first.

---

# Codebase
A parallel high-effort Claude Code (Sonnet 5) session is running the same day in the `internship-research-loop` WSL repo doing a full truth-up and deep codebase audit — full prompt in [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]. Relevant to this sweep: that session is writing the permanent `deadline_posted`/`own_deadline` rule into `vault_writer/writer.py`'s `build_frontmatter()`, based directly on the field contract this prompt defines in Task 6/8 above — don't duplicate that code change here, and don't block on it either. This sweep's hand-written frontmatter edits are the one-time backfill; that session's code change is the going-forward rule for every dossier discovered from now on. If anything you find while actually doing Task 6 changes how the `own_deadline` formula should work, say so explicitly in your report so that session can adjust before it ships the permanent version.
