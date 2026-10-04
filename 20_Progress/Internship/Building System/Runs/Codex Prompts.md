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
## Prompt 3 — Freshness Recheck, Per-Item, Prioritized By Urgency (written and run 2026-10-04)
### Result
The pre-run recount was exactly **278 dossiers**: `1 - AI & ML` 130, `2 - Fullstack` 41, `3 - CyS & Finance` 48, and `Other` 59. `_Career Fair/`, `Viewed/`, and the codebase repository were excluded. The stray diff marker was present as `+# Current sweep — 2026-10-04`; it is now `# Current sweep — 2026-10-04`. No other tracker content was changed except removing the nine dossiers confirmed closed in this pass from active deadline buckets.

Every stored URL was attempted individually. Final coverage across all 278 was **85 open, 9 confirmed closed, and 184 ambiguous/blocked**. The three `Already Over` dossiers were all attempted first and all remained ambiguous, so the remaining 275 produced **94 real verdicts** (85 open + 9 closed) and **181 ambiguous/blocked**. Ambiguous means the reader returned an inaccessible/blocked URL, HTTP 403/406/503, a zero-line or empty HTML response, a JavaScript-only shell, or a generic careers page/redirect with no affirmative closed signal. Those were left in place.

### Already Over — first three attempts
- **Moog — ambiguous, left active.** The [stored Workday URL](https://moog.wd5.myworkdayjobs.com/moog_external_career_site/job/Buffalo-NY/Intern--Software-Engineering_R-26-18885-1) returned an empty HTML response with zero lines; that is not an affirmative closure signal.
- **Regions Bank — ambiguous, left active.** The [stored Workday URL](https://regions.wd5.myworkdayjobs.com/regions_careers/job/Hoover-AL---Riverchase-Operations-Center-Birmingham-AL/XMLNAME-2027-ETP-Intern---Technology--Operations--Digital--and-Data---Analytics_R105426) was reported inaccessible by the reader.
- **Manhattan Associates — ambiguous, left active.** The [stored Workday URL](https://manh.wd5.myworkdayjobs.com/campus/job/US---Home-Office/AI-Developer-Co-Op--Boston--MA-_16931) was reported inaccessible by the reader.

### Running coverage — remaining 275
| Pass | Attempted | Open | Closed | Ambiguous | Cumulative attempted, including Already Over |
| --- | ---: | ---: | ---: | ---: | ---: |
| Batch 1 | 25 | 6 | 2 | 17 | 28/278 |
| Batch 2 | 25 | 0 | 0 | 25 | 53/278 |
| Batch 2 catch-up | 2 | 0 | 0 | 2 | 55/278 |
| Batch 3 | 25 | 8 | 0 | 17 | 80/278 |
| Batch 4 | 25 | 7 | 0 | 18 | 105/278 |
| Batch 5 | 25 | 8 | 0 | 17 | 130/278 |
| Batch 6 | 25 | 4 | 3 | 18 | 155/278 |
| Batch 7 | 25 | 9 | 0 | 16 | 180/278 |
| Batch 8 | 25 | 18 | 2 | 5 | 205/278 |
| Batch 9 | 25 | 14 | 1 | 10 | 230/278 |
| Batch 10 | 25 | 2 | 1 | 22 | 255/278 |
| Batch 11 | 23 | 9 | 0 | 14 | 278/278 |

The two-item catch-up was deliberate: after the first two moves, directory offsets shifted. The original 275-item roster was reconstructed and the skipped original positions 26–27 were attempted before continuing. The scratch record is [[20_Progress/Internship/Building System/Runs/Prompt 3 Freshness Sweep Scratch]].

### Confirmed-closed move manifest
- `10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/AIML Intern - Artificial IntelligenceMachine Learning - Kodiak Robotics.md` → `10_Areas/Career/Internships/List/Dossiers/Viewed/AIML Intern - Artificial IntelligenceMachine Learning - Kodiak Robotics.md` — [stored URL](https://job-boards.greenhouse.io/kodiak/jobs/4377407009) redirected to `https://job-boards.greenhouse.io/kodiak?error=true`, and the specific requisition was absent.
- `10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Applications Intern - AI and Machine Learning - TMEIC Corporation Americas.md` → `10_Areas/Career/Internships/List/Dossiers/Viewed/Applications Intern - AI and Machine Learning - TMEIC Corporation Americas.md` — [stored URL](https://apply.workable.com/tmeic-corporation-americas/j/6FDBF2FD32/apply) redirected to `https://apply.workable.com/tmeic-corporation-americas/?not_found=true`.
- `10_Areas/Career/Internships/List/Dossiers/2 - Fullstack/2027 North America Software Engineering Internship - The Trade Desk.md` → `10_Areas/Career/Internships/List/Dossiers/Viewed/2027 North America Software Engineering Internship - The Trade Desk.md` — [stored URL](https://job-boards.greenhouse.io/thetradedesk/jobs/5187605007) redirected to `https://job-boards.greenhouse.io/thetradedesk?error=true`; the returned current-openings list did not contain the requisition.
- `10_Areas/Career/Internships/List/Dossiers/2 - Fullstack/2027 Software Engineering Internship - Uber.md` → `10_Areas/Career/Internships/List/Dossiers/Viewed/2027 Software Engineering Internship - Uber.md` — the [stored Uber URL](https://jobs.uber.com/en/jobs/300697/) returned a genuine HTTP 404.
- `10_Areas/Career/Internships/List/Dossiers/2 - Fullstack/Software Engineer Intern - Hyperlight.md` → `10_Areas/Career/Internships/List/Dossiers/Viewed/Software Engineer Intern - Hyperlight.md` — [stored URL](https://apply.workable.com/hyperlight/j/5581EA0668/) redirected to `https://apply.workable.com/hyperlight/?not_found=true`.
- `10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/Investment Data Science Intern - Walleye Capital.md` → `10_Areas/Career/Internships/List/Dossiers/Viewed/Investment Data Science Intern - Walleye Capital.md` — [stored URL](https://job-boards.greenhouse.io/walleyecapital-external-students/jobs/4676587006) redirected to the Walleye listings page with `error=true` and no requisition.
- `10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/Risk Technology Analyst Intern - Walleye Capital.md` → `10_Areas/Career/Internships/List/Dossiers/Viewed/Risk Technology Analyst Intern - Walleye Capital.md` — [stored URL](https://job-boards.greenhouse.io/walleyecapital-external-students/jobs/4679224006) redirected to the Walleye listings page with `error=true` and no requisition.
- `10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/Technology Intern - Walleye Capital.md` → `10_Areas/Career/Internships/List/Dossiers/Viewed/Technology Intern - Walleye Capital.md` — [stored URL](https://job-boards.greenhouse.io/walleyecapital-external-students/jobs/4681002006) redirected to the Walleye listings page with `error=true` and no requisition.
- `10_Areas/Career/Internships/List/Dossiers/Other/Software Engineer Intern - Atoms.md` → `10_Areas/Career/Internships/List/Dossiers/Viewed/Software Engineer Intern - Atoms.md` — [stored URL](https://job-boards.greenhouse.io/cssmerge/jobs/8687896002) redirected to the ATOMS careers page with `error=true`; the specific requisition was absent.

All nine destination files carry `status: removed`, `removed_date: 2026-10-04`, a signal-specific `removed_reason`, the original Dossiers MOC link, and the Removed Dossiers MOC link. `state/dossier_uids.json` was not touched. `Deadline Tracker.md` no longer lists these nine as active. [[Internship Notes Standard]] §1 and §8 were not edited.

---

# Codebase
A parallel high-effort Claude Code (Sonnet 5) session is on Session 2 in the `internship-research-loop` WSL repo — see [[20_Progress/Internship/Building System/Runs/Claude Code Prompts]]. It is committing Session 1's verified work (the `deadline_posted`/`own_deadline` write-time rule, among other fixes) and patching two safety-relevant findings; it is explicitly not touching dossier files or `state/dossier_uids.json` this round. If this prompt moves any dossier to `Viewed/`, that session's *next* prompt (not Session 2) is where the manifest handoff actually gets reconciled — don't expect an immediate reaction from the current codebase session.
