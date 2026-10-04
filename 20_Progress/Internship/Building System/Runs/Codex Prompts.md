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
  - "[[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]]"
tags:
  - internship
  - automation
  - prompts
  - codex
next: "Prompt 1 was attempted 2026-10-03 and blocked before doing any real work — no network egress from the sandbox and a read-only workspace, both confirmed, nothing fabricated. Archived in [[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]]. Prompt 2 (below) opens with an explicit go/no-go environment check before attempting anything else — if the workspace is still read-only, the human needs to relaunch this session with write access to the vault before a retry can do anything at all; that's not something this prompt's text can fix on its own."
---
# Codex Prompts — Internship Dossier Freshness Sweep
This file holds the next prompt for a Codex (GPT-5.6 Sol) session to run **inside the Jarvis vault only** — it never touches the `internship-research-loop` codebase repo, that's [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]'s job, running the same day in a separate WSL session. Same rule as its sibling file: this note gets wiped and rewritten every build cycle, not accumulated — a finished prompt's text and result move to an archive note once reviewed.

## Prompting Guide In Use
[The builder's guide to GPT-5.6](https://openai.com/index/builders-pro-guide-to-gpt-5-6/) — re-apply on every prompt. (If that link 404s, it moved to `openai.com/index/builders-guide-to-gpt-5-6/` — the content below is what was read there 2026-10-03.)
- **Run at `reasoning effort: medium`, by direct instruction.** This model family is specifically good at knowing when a lead is dead rather than needing more thinking budget to reach that conclusion ("it knew when the data just wasn't there, didn't chase bad leads" — Hex, in the guide). Don't compensate for `medium` by over-specifying every judgment call in this prompt; state the goal and the hard rules below and trust the triage.
- **Move the deterministic part into code, keep the judgment part in the model** — the guide's own "programmatic tool calling" principle. This task is ~280 URL checks and one repeated frontmatter edit shape, with real judgment needed only at the margins (an ambiguous fetch, a missing deadline). Write a script that does the mechanical fetch-and-classify pass across every dossier in one batch; spend reasoning budget only on the script's own uncertain output, not on hand-reasoning over every file one at a time.
- **State your actual tool access before relying on it.** If outbound network access isn't available in this sandbox, say so immediately and stop — this is this vault's own rule as much as it is good practice: every hard gate in [[Source of Truth]] exists because this codebase refuses to guess at something it could check, and a fabricated "still open" or "closed" verdict for a real posting is exactly that kind of guess.

## Environment Notes (added after Prompt 1's blocked attempt, 2026-10-03)
Prompt 1 was attempted and self-reported blocked before doing any real work — correctly, per its own rules, rather than fabricating results. Full detail in [[20_Progress/Internship/Building System/Runs/Codex Prompts - Archive]]. Two separate things were actually true, not one:
- **No raw shell/HTTP network egress from this sandbox** — direct connection attempts and `curl` both failed, even after escalating for permission. A separate tool the session called "the web reader" could reach *some* pages — meaning some fetch path exists in this environment, it just isn't raw network access, and wasn't proven reliable at full (278-page) scale. Prompt 2 below leans on whatever that tool is as the only fetch mechanism, validated small before committing to the full batch, and treats partial coverage as an acceptable, clearly-reported outcome rather than a blocking failure.
- **The workspace was read-only** — no file could be written at all. This is the harder blocker: it would have stopped even the parts of this task that need no network (a frontmatter edit sourced from already-stored posting text). This is almost certainly a session launch/approval-mode setting, not something fixable by rewriting the prompt's own text. **If this is still true on the next attempt, the fix is on the human's side — relaunch this Codex session with write access to the Jarvis vault directory before retrying** — and Prompt 2 below checks for exactly this, first, before anything else.

## Non-Negotiable Rules (apply to every task below)
1. **Confirm network access before trusting it for even one dossier.** Fetch one known URL as a connectivity test first. If it fails in a way that looks like "no network from this sandbox" rather than "this one posting is dead," stop and report that as a blocker — don't produce 278 fabricated statuses.
2. **Script the mechanical pass; reserve your own reasoning for the exceptions** (see the guide note above). Log the script's raw output — status code, final URL after any redirect, a short text snippet — to a scratch file as you go, so an interrupted run doesn't lose everything already checked.
3. **Permissive by default — the same asymmetry every hard gate in [[Source of Truth]] already runs on.** A false "still open" costs one wasted screening read later; a false "closed" silently kills a real, still-live opportunity. A blocked fetch, a timeout, a login wall, or a redirect to a generic careers-landing page with no explicit closed signal is **ambiguous, not confirmed-closed.** Only treat a dossier as closed on an affirmative signal: a genuine 404, an explicit "this position has been filled / is no longer accepting applications / has closed" string, or a redirect to a listings page that no longer contains this specific requisition. When genuinely unsure, leave the dossier exactly where it is, state it's still being treated as open, and say so in your report — don't guess either way.
4. **Cite the real evidence for every verdict** — the fetched status code/snippet or the exact closed-phrase you found — the same discipline [[20_Progress/Internship/Building System/V0/Dossier Corrections]] already modeled against this exact folder set. Never write "checked, looks closed" with nothing backing it.
5. **A session sharing a file with a parallel session only ever appends or fixes its own entries.** [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]] records a real incident (a session deleting another session's legitimate additions to a shared file out of unfamiliarity) as a standing lesson — it applies here too. If `Tracker/Deadline Tracker.md` or `_Today/No Deadline.md` already holds content that looks unfamiliar or out of this prompt's stated scope, leave it alone and mention it in your report.
6. **Preserve everything [[Internship Notes Standard]] §1 already requires** on a dossier's frontmatter — don't drop or reorder existing fields, don't touch `notes:` or `tags:` beyond what this prompt's own tasks call for.

---

# Vault
## Prompt 2 — Environment-Constrained Retry (written 2026-10-03, following Prompt 1's blocked attempt)
Same three goals as Prompt 1 (confirm each dossier's posting is still live, give every survivor a real deadline field, leave every dossier reflecting today's actual state) — restructured so a partial-capability environment can still make real progress instead of stopping entirely the moment one sub-task can't be done perfectly. **Read the Environment Notes section above first; this prompt assumes it.**

### Scope
Unchanged from Prompt 1. **In scope:** every dossier directly inside `10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/`, `2 - Fullstack/`, `3 - CyS & Finance/`, and `Other/` — 278 files as of 2026-10-03, recount yourself before starting. **Out of scope:** `_Career Fair/` (separate recent pass covers it), `Viewed/` (already resolved, not retroactive per [[Internship Notes Standard]] §4), and the codebase repo itself (a parallel Claude Code session owns that — see `# Codebase` below).

### Task 0 — Go/No-Go Environment Check (do this before anything else, and stop here if it fails)
1. **Write access.** Create a small scratch file somewhere harmless inside the vault (e.g. append one line to a scratch note, or create `10_Areas/Career/Internships/List/Dossiers/_Today/.codex-write-test.md` with a single timestamp line) and confirm the write actually lands. **If this fails, stop immediately and report exactly that** — don't attempt any of the tasks below, don't try to route around it by printing a report only into chat. A read-only workspace means nothing in this prompt can complete regardless of network, and that's a session-launch setting only the human can fix (relaunch with write access to this vault directory), not something this prompt's text can work around. Delete the scratch file once confirmed.
2. **Fetch capability.** Identify, by name, whatever tool reached "some pages" in Prompt 1's attempt (the session's own words were "the web reader" — find out what that actually is in this environment's toolset). Do not retry raw shell network calls (`curl`, a direct socket connection) — Prompt 1 already confirmed those fail even after escalation; repeating them wastes a turn on a question already answered. Test the identified fetch tool against 5 real dossier URLs, picked from different buckets, and report: did it return real, distinguishable content for each (not a blocked/CAPTCHA/empty response)? This small test is the basis for Task 2's scope decision below — don't skip it and assume either way.

### Non-Negotiable Rules (restated and adjusted for this retry)
1. **Deadline backfill (Task 1 below) does not require live fetch and is not blocked by Task 0's fetch-capability result** — only by write access. It reads already-stored posting text (each dossier's own `## Posting` body, written at discovery time), not a fresh fetch. Proceed with it regardless of how Task 0's fetch test comes out, as long as write access is confirmed.
2. **Freshness/open-closed verification (Task 2 below) is now explicitly best-effort, not all-or-nothing.** If Task 0's 5-URL test came back unreliable (blocked, inconsistent, mostly empty), do not attempt the remaining 273 — report that the fetch tool isn't viable at this scale and stop there for this task, leaving every dossier's open/closed status exactly as it already is (permissive-by-default: unconfirmed is treated as still open, never as closed). If the test came back reliable, proceed in small batches (25-30 dossiers at a time, not all 278 in one pass) and report real, running coverage numbers as you go rather than promising a total you haven't reached — an interrupted retry should leave partial, honest progress behind, not an all-or-nothing gate like Prompt 1 hit.
3. **Permissive by default, unchanged from Prompt 1** — a false "still open" costs one wasted screening read later; a false "closed" silently kills a real opportunity. Never move a dossier to `Viewed/` on an ambiguous signal. Cite the real evidence for every verdict you do make.
4. **A session sharing a file with a parallel session only ever appends or fixes its own entries** — unchanged (see [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]'s standing lesson on this).
5. **Preserve everything [[Internship Notes Standard]] §1 already requires** on a dossier's frontmatter — unchanged.

### Task Order
1. **Task 0 above, first.** Report both results (write access, fetch-tool viability) before doing anything else.
2. **Deadline backfill, using stored content only — proceeds regardless of fetch-tool viability, as long as write access is real.** For every one of the 278 in-scope dossiers: read its stored `## Posting` body for a real stated deadline.
   - **`deadline_posted:`** — the posting's own stated deadline, ISO `YYYY-MM-DD`, only if the stored text actually states one. Mirrors the field name already used on promoted Program notes ([[Deadline and Intake Triage Standard]] §4 cites `deadline_posted`/`deadline_real`) — same name, not a parallel one.
   - **`own_deadline:`** — self-imposed, set only when `deadline_posted` has no real value. Compute as **today's date + 7 days** (not `date_found` + 7 days) — same reconciliation Prompt 1 specified and for the same reason: a `date_found` from weeks ago plus 7 days would already be in the past, defeating the field's purpose as a real forcing-deadline. This is explicitly independent of whether the posting's live status gets re-checked this round — you're confirming "here's your deadline to act by," not "here's proof it's still open."
   - Every dossier ends this task carrying exactly one of the two fields with a real value.
3. **Freshness recheck, scoped by Task 0's fetch-tool result (Non-Negotiable Rule 2).** If viable: batch through all 278 using the identified tool, 25-30 at a time, logging status/evidence per dossier to a scratch file as you go. For anything confirmed closed on an affirmative signal (per Non-Negotiable Rule 3), apply [[Internship Notes Standard]] §4's removal protocol by hand exactly as Prompt 1 specified: move to `Viewed/`, append the Removed Dossiers MOC link, set `status: removed` + `removed_date` + `removed_reason`, and keep a running old-path → new-path manifest for the handoff to the parallel Claude Code session (**you cannot touch `state/dossier_uids.json`**, that's repo-side). If not viable: skip this task entirely, state why, and leave the manifest empty — an empty, well-explained manifest is a better handoff than a fabricated one.
4. **Update the existing deadline-tracking artifacts**, per [[Deadline and Intake Triage Standard]]: re-anchor `Tracker/Deadline Tracker.md`'s bucket cutoffs to today and re-bucket every dossier you touched; remove from `_Today/No Deadline.md` anything that now carries a real `own_deadline`, and flag explicitly that this changes what that note means going forward (every live dossier now carries *some* deadline value).
5. **Patch [[Internship Notes Standard]] by heading** — add the `deadline_posted`/`own_deadline` section after its existing §7, citing this sweep's date, and add both fields to §1's required list. Don't touch anything else in that note.
6. **Write the final report directly into this file**, replacing this prompt's body.

### Report Back
- Task 0's two results: write-access confirmed (yes/no), fetch-tool identified and its 5-URL test result.
- Full deadline-backfill numbers: per-bucket `deadline_posted` vs. `own_deadline` counts, across all 278.
- If freshness recheck ran: real running coverage (checked / total), the closed-signal manifest (old path → new path, cited evidence per entry), and the ambiguous/blocked list with reasons. If it didn't run: the one-line reason why, stated plainly.
- Confirmation `Deadline Tracker.md` and `No Deadline.md` are updated, plus the flag on what `No Deadline.md` should mean going forward.
- Confirmation [[Internship Notes Standard]] carries the new section.

### Grading Rubric
Scored out of 10 against:
- Task 0 actually run first, with both results reported honestly before anything else was attempted.
- If write access failed: the prompt stopped cleanly there, nothing fabricated, no partial file damage.
- If write access succeeded: all 278 dossiers carry exactly one of `deadline_posted`/`own_deadline`, with the today+7 reconciliation applied consistently.
- Freshness-recheck coverage, whatever its real extent, is reported as an honest number — not inflated, not silently abandoned without a stated reason.
- Any dossier moved to `Viewed/` cites a real, affirmative closed signal.
- `Deadline Tracker.md`/`No Deadline.md` actually updated.
- [[Internship Notes Standard]] patched by heading, nothing else disturbed.
- The handoff manifest (even if empty) is honest and usable by the parallel Claude Code session.

---

# Codebase
A parallel high-effort Claude Code (Sonnet 5) session is running the same day in the `internship-research-loop` WSL repo doing a full truth-up and deep codebase audit — full prompt in [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]. That session is writing the permanent `deadline_posted`/`own_deadline` rule into `vault_writer/writer.py`'s `build_frontmatter()`, based on the field contract this prompt defines in Task 2/5 above — don't duplicate that code change here. **Heads up for that session: Prompt 1's attempt here was environment-blocked (no write access, no raw network egress), so the `dossier_uids.json` handoff manifest from this side may arrive empty or partial rather than complete — check this file's own latest report before assuming a full reconciliation is ready.**
