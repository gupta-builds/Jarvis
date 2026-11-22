---
type: project
status: active
created: 2026-07-26
updated: 2026-11-21
tags:
  - internship
  - automation
  - prompts
project_kind: prompt
prompt_shape: queue
next: 'Merge PR #18 (repo governance, ready), then the owner steps under "P1.5
  Status": set REPO_BOT_TOKEN and JARVIS_PUSH_TOKEN, test recheck.yml, apply the
  two rulesets, create the Project board (needs gh auth refresh -s project). P2
  starts after #18 merges. The Dell Vault Claude session has ended; its prompts are in the archive.'
related_progress:
  - "[[Weekend Build]]"
  - "[[Source of Truth]]"
  - "[[Agent Prompt Standard]]"
  - "[[Claude Code Prompts - Archive]]"
  - "[[Codex Prompts]]"
---
# Claude Code Prompts
This file holds the next prompt to run and nothing else. On 2026-11-21 the old queue (Session 4, the bounded freshness pilot, never run) and its long lessons list moved to [[Claude Code Prompts - Archive]], because [[Weekend Build]] replaces the pilot with native connectors.
## Prompting Guide In Use
[Prompting Claude Sonnet 5.5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5), read in full on 2026-11-21. The Sonnet 5 patterns it builds on still hold: literal instruction following, scope stated outright, everything front-loaded.
- **Effort is `high`.** Levels were recalibrated for 5.5, so do not carry over an older setting. `medium` is acceptable for a well-specified build. `xhigh` and `max` start their own review rounds and subagents, so they are off for routine work.
- **Low and medium effort stop to check in.** Every prompt carries the guide's keep-working paragraph, with the approval gates named, so a deliberate stop reads as allowed and a lazy one does not.
- **Every prompt carries the guide's stop-when-done paragraph.** It blocks the unrequested files, docs and refactors that 5.5 adds on its own.
- **Verification is a named check.** For code it is the test suite. For `30_Order` notes it is Vault Lint with exact flags. A check that failed to start does not count.
- **No prompt asks the session to print its reasoning.** That invites `reasoning_extraction` refusals. Ask for actions taken, evidence and decisions instead.
- **Ask for a plan and the model stops at the plan.** The checkpoint in P1 relies on that.
- **Updates at set points.** One line before the first tool call and one recap per step. The guide says this helps most when a human is in the loop.
- **Verified facts are handed over, hypotheses are labeled, and the session re-checks both.**
- Carried forward from the archived queue: a result becomes a literal numbered task or it does not get written back. A prompt's own hypothesis can be wrong. Recount, never inherit a number. Parallel sessions share files, so re-read before editing and never delete what you did not write. A prompt that says commit names the branch.
# Dell
## Vault
## Codebase
# Acer
## Vault
## Codebase
### P1 - Git, Worktree and Tailscale Baseline
Model: Claude Sonnet 5.5, effort `high`, fresh session started from the Acer over Remote-SSH or a terminal into `dell-wsl` (Tailscale SSH). Working directory `~/projects/work/internship-research-loop`. The Acer is only a display: every command runs on the Dell's filesystem. Numbering is per section, so this P1 is not the Dell vault P1. No application code changes in this prompt. It must finish, and its PRs must be merged by Anant, before any other codebase prompt runs.
````text
You are working in the Dell's WSL checkout of gupta-builds/internship-research-loop (a PUBLIC repo). Your job is to leave Git, worktrees and the tailnet in a clean, verified baseline before any build work lands, then open the PRs that carry the cleanup. You change documentation and Git layout only. You do not touch pipeline code, tests, workflows or the vault.

Before your first tool call, say in one line what you are about to do. After each task, give a one-line recap.

### Why This Exists
Today starts a weekend build: about eight code phases landing over two days from sessions driven from both laptops. The vault's locked design (note "Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem", decisions made 2026-10-04, outcomes verified 2026-10-17) says the Dell is the single canonical host, the Acer is a display reaching it over Tailscale SSH, the Acer's WSL holds no clones (bundled and removed 2026-10-17), and two sessions are kept apart by task using `git worktree`, with no lock enforcing it. The repo has not caught up:
- `docs/TWO_LAPTOP_WORKFLOW.md` on origin/master (PR #14) still describes two independent clones, has no worktree section, and says branch names must not carry a machine.
- This checkout is still on `dell-latitude/deadline-quota-and-reseed-fixes`, the old `<machine>/<topic>` naming, and its CLAUDE.md line says the same. Origin's CLAUDE.md already says task-named branches.
- The main checkout is dirty and holds two stashes.
Resolution, decided by Anant: task-named branches (`feature/`, `fix/`, `docs/`, `chore/` + topic, never a machine), one worktree per phase, the main checkout stays on `master` and clean, work lands through PRs with frequent clean commits, one PR per completed phase.

### Verified Facts (read-only, 2026-11-21). Re-check every one before relying on it.
- Host `DESKTOP-3VBG0JH` (the Dell). `tailscale status`: `dell-wsl` 100.94.129.113 (this node, Linux, Tailscale SSH on, `KeyExpiry` None) and `gupta-builds` 100.84.91.11 (the Acer, Windows side). `tailscale ping gupta-builds` was direct, 15 ms. `tailscale0` MTU 1280. Live `.wslconfig` has `vmIdleTimeout=-1` and `[general] instanceIdleTimeout=-1`. Nothing listens on :22 in WSL, by decision (Tailscale SSH only).
- Branch `dell-latitude/deadline-quota-and-reseed-fixes` (tip 74a894d) is 6 commits ahead of and 5 behind origin/master (dc5edc1). No upstream. `git merge-tree` against origin/master showed exactly one conflict: README.md.
- Dirty tree: 21 deleted `.agents/skills/**` files (origin removed `.agents` in 3d3798d and moved skills to `.codex/skills` in 38217cc), a modified AGENTS.md that points at `.agents/skills` and a `.Codex` path (stale), and untracked `docs/codex/` (ARCHITECTURE.md, ACCESS.md, BUILD_PLAYBOOK.md).
- Two stashes on master: stash@{0} graphify-out regeneration only; stash@{1} graphify-out plus CLAUDE.md.
- Local branch `docs/two-laptop-workflow` is dead: PR #14 merged, remote gone, `git cherry` shows its one commit as already upstream.
- Hooks live in `.git/hooks` (shared by every worktree): `pre-push` (blocks pushes to master, runs the test suite, falls back to `uv run` when no `.venv`), and three graphify hooks that write into the vault under `/mnt/d` on commit, checkout and merge. All honor `GRAPHIFY_SKIP_HOOK=1`.
- `gh` is authenticated as gupta-builds (repo, workflow scopes). master is unprotected on purpose, because scheduled Actions commit `state/` and `logs/` to it. Repo settings: rebase merge allowed, `delete_branch_on_merge` false.
- `pyproject.toml` and `uv.lock` exist on origin/master, not yet on the local branch. `uv` 0.12.23 is installed. `~/tools/sync-check` is a read-only status report for the two shared checkouts.
- The ssh config file is under a deny rule. Do not read it, and do not work around the rule.

### Hard Rules
1. Stop and report, change nothing further, if: `hostname` is not DESKTOP-3VBG0JH; the repo path is missing; the recovery bundle fails `git bundle verify`; the AGENTS.md working-tree edit contains anything beyond the stale `.agents`/`.Codex` path references; the rebase conflicts in any file other than README.md; or Tailscale is unhealthy. Never clone anything on any machine.
2. Preserve before you touch (Task 2). Nothing is deleted, restored, dropped or reset until its copy exists and is verified. Unknown changes are evidence, not clutter.
3. Never push to master (`ALLOW_MASTER_PUSH` stays unset). Never plain `--force`. `--force-with-lease` only on your own task branch and only if its remote already exists. Never `git add -A` or `git add .`: add explicit paths and read `git diff --staged` before every commit.
4. Do not merge any PR. Anant merges. Do not dispatch, disable or enable any workflow, and do not touch issues, secrets, branch protection or the vault (`/mnt/d`). Do not run any pipeline script.
5. Run every worktree command with `GRAPHIFY_SKIP_HOOK=1` exported, so commits do not rebuild graphify or write into the vault.
6. Do not restart `tailscaled`, run `wsl --shutdown`, install Tailscale anywhere, edit ACLs, or touch `~/.ssh`. The session may itself be riding Tailscale SSH.
7. Never print a secret or token value. Names only.
8. Commit often and cleanly: one coherent change per commit, imperative subject, a body that says why, explicit paths. End commit messages and PR descriptions with the attribution lines your harness specifies.

### Task Order
1. **Preflight, read-only.** Record: `hostname`; `echo "${SSH_CONNECTION:-local}"` (over Tailscale the source should be 100.84.91.11); `git fetch origin --prune`; `git status -sb`; `git worktree list`; `git branch -vv`; `git stash list`; `git ls-tree -r origin/master --name-only | grep '^\.agents/'` (expect empty); `gh pr view 14 --json state,mergedAt`; `diff .git/hooks/pre-push <(git show origin/master:scripts/hooks/pre-push)`; `gh api repos/gupta-builds/internship-research-loop --jq '{delete_branch_on_merge,allow_rebase_merge}'`; `uv --version`. Compare each to the Verified Facts and report every difference before going on.
2. **Preserve.** Create `~/.local/state/internship-loop/recovery-2026-11-21/` (never inside the repo). Put in it: `git bundle create branch-and-master.bundle --all` followed by `git bundle verify`; `git status --porcelain=v1` output; `git diff -- AGENTS.md` as a patch; a `cp -a` of `docs/codex`; `git stash show -p` for each stash (add `--include-untracked` for stash@{1}); and a SHA-256 list of everything saved. Do not proceed until all of it exists and the bundle verifies.
3. **Clear the main checkout.** (a) Confirm the `.agents` deletions are redundant: origin/master contains no `.agents` path and `git show --stat 38217cc` shows the move into `.codex/skills`. (b) Compare the AGENTS.md patch to `git show origin/master:AGENTS.md`; if it carries anything besides the stale references, stop (Hard Rule 1). (c) Run `git restore -- .agents AGENTS.md`. (d) Confirm `diff -r docs/codex <recovery copy>` is empty, then remove the untracked `docs/codex` from the main checkout (it moves to its own branch in Task 6). (e) `git status` must now print nothing.
4. **Rebuild the branch layout.** In the main checkout: `git switch master && git pull --ff-only origin master`; HEAD must equal origin/master. Rename the old branch: `git branch -m dell-latitude/deadline-quota-and-reseed-fixes fix/deadline-quota-and-reseed`. Confirm `uv cache dir` and `~/projects/work/.worktrees` are on the same filesystem (`stat -c %d` on both). Then create three worktrees, the root being `~/projects/work/.worktrees/` and the directory name `internship-research-loop-<branch slug>` (slug = type and topic, joined by a hyphen):
   - `git worktree add <root>/internship-research-loop-chore-single-host-worktree-workflow -b chore/single-host-worktree-workflow origin/master`
   - `git worktree add <root>/internship-research-loop-docs-codex-agent-memory -b docs/codex-agent-memory origin/master`
   - `git worktree add <root>/internship-research-loop-fix-deadline-quota-and-reseed fix/deadline-quota-and-reseed`
   Lock each while you work: `git worktree lock --reason "owner: P1 baseline session 2026-11-21" <path>`. In each worktree run `uv sync` and confirm `uv run pytest -q` passes (the fix worktree has no pyproject until Task 7's rebase, so test it there after the rebase).
5. **PR 1: the workflow doc (chore worktree).** Rewrite the two-laptop doc to match the single-host design. Keep its recovery rules. Replace the "setup on each laptop", clone-per-laptop and "Move an unfinished task to the other laptop" parts. The new doc must state: the topology (Dell host, Acer display through `ssh dell-wsl`, nothing cloned on the Acer, how to identify a session with `hostname` and `$SSH_CONNECTION`); the main checkout is the hub, always on `master`, never edited, only `git pull --ff-only`; the worktree lifecycle with exact commands (add, lock, work, push, unlock, remove, prune) and the path and slug rule above; branch names `feature|fix|docs|chore/<topic>` with no machine, and that this supersedes the `<machine>/<topic>` text in older notes; per-worktree setup (`export GRAPHIFY_SKIP_HOOK=1`, `uv sync`, tests via `uv run pytest -q`); commit cadence (one coherent change per commit, tests green at each, explicit paths, push at every checkpoint); one phase equals one branch equals one PR, opened when the phase's done condition holds, rebase-merged, then worktree removed, branch deleted, `git fetch --prune`, and every other open worktree rebased on origin/master; `state/` and `logs/` are bot-owned tracked paths, so a feature branch does not edit them unless the task is a deliberate state repair, and any run of a pipeline script in a worktree uses `--dry-run` or temp paths and leaves `git status` clean; ownership is `git worktree lock`, never two sessions in one worktree, a session ends by pushing, confirming a clean tree and unlocking. Then update the "Two-laptop workflow" bullet in CLAUDE.md and the matching line in AGENTS.md to point at the doc in one or two sentences. Run `git diff --check`. Commit in two commits (doc, then pointers), push with `-u`, open the PR against master using `.github/pull_request_template.md`.
6. **PR 2: the Codex memory docs (docs worktree).** Copy `docs/codex` in from the recovery directory. Scan it for secrets, personal data and absolute home paths before committing, and fix anything found. Correct only these facts, each cited to what you verified today: the vault repo is public (it says private), local `gh` auth is valid (it says invalid), and the branch, test-count and `master` state lines are dated snapshots, so mark them as such. Change nothing else. One commit for the files, one for the corrections. Push with `-u`, open the PR.
7. **PR 3: the six reseed and deadline commits (fix worktree).** `git fetch origin && git rebase origin/master`. Expect exactly one conflict, README.md. Read both sides in full before resolving: keep the 2026-10-03 truth-up content from the branch and keep origin's two-laptop pointer. Show the resolved hunk in your report. After `git rebase --continue`, `git diff origin/master --stat` must touch only files the six commits touched. Run `uv sync` then `uv run pytest -q` and report the exact count (the branch was 529 passed in a plain run today). Push with `-u` (no remote branch exists yet, so no force is needed) and open the PR with a body that lists each of the six commits and what it fixes, the test result, and what is deliberately deferred (the quota shortfall exclusion hazard was fixed in ee5da85; `recheck.py` coverage of ApplyGuy, Freehire and InternDock and the unwired company cache are not part of this PR).
8. **Clean up.** (a) Delete local `docs/two-laptop-workflow` only after `gh pr view 14` says MERGED and `git cherry -v origin/master docs/two-laptop-workflow` shows only `-` lines; use `git branch -D` because a rebase merge hides the ancestry. (b) Drop stash@{1} first, then stash@{0}, only after the recovery copies exist. stash@{0} is graphify regeneration, which is local and gitignored. For stash@{1}, check that its CLAUDE.md lines already exist on origin/master; if they do, drop it; if not, keep it and list it in the report. (c) `git remote prune origin`. (d) Set `gh repo edit gupta-builds/internship-research-loop --delete-branch-on-merge` (explicitly authorized by Anant) and verify it with `gh api`. Change no other repo setting.
9. **Tailscale and host verification, read-only.** Report each of these with its real output: `tailscale status` (Self online, peer `gupta-builds` online, health empty, key expiry none), `tailscale ping -c 3 gupta-builds` (direct path, not a relay, and the latency), `ip -o link show tailscale0` (MTU), `tailscale debug prefs | grep -i RunSSH`, `systemctl is-active tailscaled`, the `.wslconfig` from `/mnt/c/Users/*/.wslconfig` (both idle timers -1), `powershell.exe -NoProfile -Command "Get-Service Tailscale -ErrorAction SilentlyContinue | Select Name,Status"` (nothing: Tailscale must not run on the Dell's Windows side), and `~/tools/sync-check`. Anything that differs from the Verified Facts is a finding to report, not something to fix. List separately what you cannot verify from the Dell and give Anant these one-liners to run on the Acer Windows side: `tailscale status`, `ssh dell-wsl hostname` (expect DESKTOP-3VBG0JH), `wsl -d Ubuntu -- bash -lc "ls ~/projects 2>&1"` (expect no repo), and a reminder to confirm in the Tailscale admin console that `dell-wsl` key expiry is still disabled and the SSH `check` rule from `autogroup:member` to `autogroup:self` exists.
10. **Final verification.** Report: `git worktree list --porcelain`; for the main checkout and each worktree, clean status and ahead/behind against its own origin branch (all 0); the main checkout on master equal to origin/master; the pre-push hook present, executable and identical to `scripts/hooks/pre-push`; `uv run pytest -q` result per worktree that has pyproject; the three PR URLs with `gh pr checks` status; the recovery directory listing. Then unlock the three worktrees (the work is handed off, so the locks no longer mean an owner).
11. **Write the report into this file**, under this prompt, as a `Result` heading, before you consider the session done. Include the exact merge order and commands for Anant: merge PR 1, then PR 2, then PR 3 with `gh pr merge <n> --rebase`; after each merge, in every remaining worktree run `git fetch origin --prune && git rebase origin/master && git push --force-with-lease`; once all three are merged, `git worktree remove <path>` for each, `git branch -d` the local branches, `git fetch --prune`. Do not write anywhere else in the vault.

### Report Back
Task 1's differences from the Verified Facts; the recovery directory contents and the bundle verification; what Task 3 restored and removed and why it was safe; the final branch and worktree layout; each PR URL with CI status; the README.md resolution; the test count before and after the rebase; the Tailscale findings and the Acer-side follow-ups; every decision you made that was not in this prompt; anything you could not do or check.

### Grading Rubric (out of 10)
- Nothing destructive happened before its copy was verified, and the recovery directory can rebuild every discarded or dropped item.
- The main checkout ends on master, clean, equal to origin/master, with no stashes unless one was deliberately kept and reported.
- Three worktrees exist under the stated root with the stated names, all clean, pushed and tracking origin, and unlocked at the end.
- The workflow doc describes the single-host design accurately and contains every item listed in Task 5, and the old `<machine>/<topic>` convention is explicitly superseded.
- The README.md conflict was resolved by reading both sides, and the rebased branch touches only its own files.
- No master push, no merge, no workflow, secret, protection or vault change, and the only repo setting changed is `delete_branch_on_merge`.
- Tailscale findings are real outputs, with unverifiable items handed to Anant instead of guessed.
- The report is written into this file with the merge commands.

### What Not To Do
- Do not carry a Verified Fact forward without re-checking it. A past prompt in this file named the wrong cause and was corrected only because the session checked.
- Do not remove something because it looks unfamiliar. A past session deleted links a parallel session had added.
- Do not widen the scope. No code edits, no pipeline run, no vault write, no extra docs, no refactor. If you think one would help, say so at the end.
````
### Queue After P1 (gates settled with Anant on 2026-11-21)
Numbering is per section. Each phase is one branch, one worktree, one PR, and its own research step before any code. A phase prompt is written after the previous phase's report is reviewed, not before.
| Next | Branch | Gate settled or found, to carry into that prompt |
|---|---|---|
| P2 Landing and gates | none (merges only) | After the three PRs merge: test `JARVIS_PUSH_TOKEN` (PAT created 2026-07-17, may have expired; `run.yml` has no runs since August, `recheck` last ran 2026-09-20), check Firecrawl credits, and make a read-only shallow clone of the public vault (`gupta-builds/Jarvis`, about 373 MB) at `~/projects/work/Jarvis` with its push URL disabled, for dry runs. `jarvis-checkout/` in the repo is empty and CI-only. Also diagnose why the scheduled `run.yml` fired nothing between 2026-08-29 and 2026-11-21, and why the scheduled run of 2026-11-21 17:51 UTC failed with no issue filed (the commands are in the Phase 2 closing pass of `V0/System Rebuild Plan.md`). Read the run log, then check the failure path as well as the cause. |
| P3 Tier registry and limits | `feature/tier-registry-and-limits` | `tier` 1/2/3 replaces `preference_tier` (writer, `REQUIRED_FRONTMATTER_FIELDS`, `screen_report.py`, tests). Thresholds approved: info 120 and 150, issue 170 and 190, hard pause 200. The reserved tier 1 slot contradicts a locked regression test (`test_select_exact_quota_does_not_grant_a_reserved_slot_unlike_prioritize_and_cap`): change it deliberately and cite the decision. The 200 pause must not go live before the archive phase, or the first run disables `run.yml` (278 dossiers plus 11 in `_Career Fair/` today). |
| P4 Dry run and workflow inputs | `feature/dry-run-and-workflow-inputs` | `run_once` writes seen_ids, state files, the run log, issues, `disable_workflow` and a push, and `__main__` always commits and pushes, so each of those needs gating, not just a flag. One shared concurrency group for run, recheck and reseed. |
| P5 Tier 1 native connectors (replaces the freehire-only P5) | `feature/tier1-native-connectors` | **Why the vault holds no tier 1 postings (found 2026-11-21).** The loop stopped on 2026-08-29, before most Summer 2027 tier 1 postings opened. Its native connectors are 9 Greenhouse, 9 Ashby and 4 Lever tokens (quant firms and AI startups) and none of the nine tier 1 companies. `core/profile.yaml` prefers 11 companies (quant firms, Google, Microsoft, LinkedIn, MLH, NASA, Capital One, Bloomberg) with one grade, so the Stage 1 comparator never favored tier 1. Tier 1 reached the vault only through aggregator lists: Google 3, Microsoft 8 and NVIDIA 1 in the role folders, none for Anthropic, OpenAI, Meta, Amazon, Netflix or Apple. **Endpoints probed read-only on 2026-11-21.** Amazon `https://www.amazon.jobs/en/search.json?base_query=<q>&country=USA&sort=recent` returns live Summer 2027 SDE interns. Netflix Eightfold `https://explore.jobs.netflix.net/api/apply/v2/jobs?domain=netflix.com&query=<q>` returns "Software Engineer Intern - Summer 2027". Microsoft Eightfold `https://apply.careers.microsoft.com/api/pcsx/search?domain=microsoft.com&query=<q>` responds, positions under `data.positions`. NVIDIA Workday CXS (`nvidia.wd5`, site `NVIDIAExternalCareerSite`, POST) returned 429 from this IP, so it needs a User-Agent, a low rate and backoff. Anthropic Greenhouse `anthropic` (635 jobs) and OpenAI Ashby `openai` (852 jobs) respond and list no intern title today: add both tokens anyway, since a wrong token fails silently and a right one fires when they post. A title match must exclude "International" and "Internal", which a naive intern pattern catches. Google, Meta and Apple need custom parsers (Weekend Build step 20). Each connector needs a test against a recorded response. **Acceptance:** a dry run writes dossiers for live tier 1 postings and each one passes `node vault-lint.js --family internship-dossier`. |
| P5b freehire fixes | `fix/freehire-connector` | Pagination, US filter, source allowlist, title guard, `posted_date`, no unconditional `active=True`. Several tier 2 slugs are already connected (Scale AI, Fireworks AI, Cohere, Cursor, Modal, ElevenLabs); check before adding. |
| P6 Archive and status vocabulary | `feature/archive-state-and-status-vocab` | In scope today, decided as one change: writer and move functions emit `status: seed` and `archived` (plus `type: input`, `input_kind: job-dossier`, `review_state`), because the 2026-11-07 standards expect them and lint passes 0 of 354. `scan_dossiers` globs every subfolder and `recheck.py` skips only `status == "removed"`, so `Archived/` would be re-swept daily: skip `archived`. `Archived/` and `Applied/` are excluded from counts, `_Career Fair/` counts in the total only. Verify how `seen_ids` and `dossier_uids.json` behave on archive in a dry run before any live move. The vault-side move of the 269 expired dossiers is a separate Codex prompt after this lands. |
| P7 Apply queue and `mark_applied` | `feature/apply-queue-mark-applied` | Cover letters must not be public, and `gupta-builds/Jarvis` is public with `Cover Letters/` tracked and no ignore rule for it. The archive of sent documents must not write letters into a tracked path. Resumes may be public. |
| P8 Resume variants and document gates | `feature/resume-variants-docx` | Output goes to `20_Progress/Internship/Resumes/Altered/<Role> - <Company>.docx` (Anant's decision, overriding the Standard's flat-folder rule, so the Standard is amended at session end). Hard requirement: DOCX that parses cleanly in any ATS, single column, real text layer, no watermark, no garbled text, verified by reading the file back. `Main Resume.md` is typed `project` and may be stale: check it against the PDF before building variants. |
| P9 Cover letter bank | vault, with Anant | Needs Anant for about 40 minutes, and it is the Sunday blocker for tier 2 letters, so it comes before Sunday if it can. Two example letters already sit in `Cover Letters/` as Word files (the technical one is generic and close to outdated) and are the seed. Per-application letters land in `Cover Letters/Altered/`, and example and main letters stay outside it. A vault-side ignore rule for `Cover Letters/Altered/` and `Sent/` comes first (both are new and empty, so no tracked history is involved). `cover-letter-builder` currently writes `type: project` while the Standard says `type: output` with `output_kind: cover-letter`, and it still cites `.cursor` skills. |
**Recommended order (not yet approved).** P1.5b (issue board) and P1.5c (Copilot review) do not move the loop toward Sunday or toward tier 1 coverage. Run P2 (revival) and P5 (tier 1 connectors) before them, and P3 and P6 right after, since they carry the `tier` and status contracts the vault notes already describe.
**Acceptance for every code prompt.** A phase is not done on tests alone. It ends with a Vault Lint check on a sample note the code wrote, against its family in the vault (`internship-dossier`, `internship-tracker`, `generated-output`), and with the Contracts row it implements ticked in the Code Build Brief of [[Instruction Notes Rewrite Plan]]. It also ends with "update the System record through Loop Contract Change".
# P1 Status (updated 2026-11-21)
P1 is complete: the three branches are pushed with tests green (499, 499, 529), PRs #15, #16 and #17 are open and mergeable, the `pre-push` hook is fixed (`GIT_*` scrubbed, shipped in PR 15), `delete_branch_on_merge` is on, and Tailscale was verified. Report: `Runs/P1 Baseline - Git and Worktree Cleanup (2026-11-21).md`.
**Gate for P2 and every later phase:** Anant merges 15, then 16, then 17 (`gh pr merge <n> --rebase`), and the three worktrees are unlocked and removed. Each later phase starts from a fresh worktree off the merged `master`.
# P1.5 - Repo Governance (approved by Anant 2026-11-21)
One phase, three sequential PRs, each opened only after the previous one is merged (the 2026-11-21 lesson: never host PRs in parallel).
| Step | Branch | Contents | Gate to start |
|---|---|---|---|
| **P1.5a** (prompt below) | `chore/pr-gates-and-ruleset` | Zero-LLM, zero-cost deterministic gates: `pr-gates` Action, fixed `test.yml`, Dependabot config, importable ruleset JSON, throwaway-repo proof of the bot bypass | PRs #15, #16, #17 merged, worktrees removed |
| P1.5b | `chore/issues-board-labels` | Label set, issue forms, Project board with Iteration field, milestones, close or relabel the 8 stale bot issues (#4-#11), flip the `linked-issue` gate from warn to enforce, issue-sync Action | P1.5a merged and rulesets applied by the owner |
| P1.5c | `chore/copilot-review-setup` | `.github/copilot-instructions.md`, path-scoped `*.instructions.md`, decision on how Copilot treats `CLAUDE.md`/`AGENTS.md`, the review-on-ready ruleset at Lite or Balanced, review-on-push OFF | P1.5b merged |
**Principle (Anant, 2026-11-21):** the strongest layer is deterministic, zero-cost, zero-LLM rules and runs that fire on every PR. Copilot comes last and handles judgment only. Everything below the gates is written later and individualised per repo.
**Facts found 2026-11-21 that shape P1.5a:**
- `test.yml` triggers on `push` and `pull_request`, so each PR branch runs pytest twice.
- No ruleset, no branch protection, no Project, 0 milestones, no issue forms, default labels only.
- Dependabot security and version updates are disabled. Secret scanning and push protection are enabled.
- The pipeline is dormant: `run.yml` last ran on a schedule on 2026-08-29, `recheck.yml` on 2026-09-20, `revalidate.yml` on 2026-09-14, and all five workflows still show "active".
- The bot commits `state/` and `logs/` to `master` with the default `GITHUB_TOKEN` (github-actions identity). `JARVIS_PUSH_TOKEN` is used only for the Jarvis checkout. Whether a ruleset can let that identity through is conflicting in the sources, so P1.5a proves it on a throwaway repo.
- Copilot review reads instructions from the PR head branch, so a PR can change the rules that review it. A ruleset must require the PR to pass the required checks regardless.
## Acer or Dell - Codebase - P1.5a - Deterministic PR Gates and Ruleset
**Model:** Claude Code, Sonnet 5.5, effort high, on the Dell WSL (Remote-SSH from the Acer is fine). Start the session in the main checkout; the session creates its own worktree.
````text
You are P1.5a. Build the zero-LLM, zero-cost PR gates for gupta-builds/internship-research-loop (public) and prove how the ruleset treats the Actions bot. One branch, one PR, no merge.

## Why This Exists
On 2026-11-21 three PRs were opened at once, test.yml ran pytest twice per PR, there is no ruleset, and a pre-push hook bug let a worktree push corrupt .git/config. Anant wants the strongest layer of the GitHub workflow to be deterministic rules that run on every PR, before any Copilot or LLM review exists. Copilot setup is P1.5c, not this prompt.

## Preconditions (Task 0 verifies; stop and report if any fail)
- PRs #15, #16 and #17 are MERGED, the three P1 worktrees are removed, and the main checkout is on a clean master equal to origin/master. If not, stop.
- Host is DESKTOP-3VBG0JH. Never clone anywhere else.

## Hard Rules
1. Zero LLM. The gates are python3 standard library plus `gh`/`git`. No Copilot request, no API call to any model, no third-party action except GitHub-owned ones pinned by version tag (actions/checkout@v4, actions/setup-python@v5, actions/dependency-review-action@v4).
2. Script-injection safety: NEVER interpolate ${{ github.event.* }} text (title, body, branch, commit messages) into a `run:` script. Pass it through `env:` or read GITHUB_EVENT_PATH. This is the same fix reseed.yml got in commit e115db4.
3. Triggers are `pull_request`, never `pull_request_target`. Each workflow declares least-privilege `permissions:` (contents: read; pull-requests: read).
4. Every threshold and pattern cites real data in a comment next to the code (CLAUDE.md convention 4): measure first, then set. Run `gh pr list --state all --limit 50 --json number,title,additions,deletions,changedFiles,headRefName` and `git log origin/master --format=%s` and derive size and title-length limits from them.
5. You do NOT apply any ruleset or change any repo setting on gupta-builds/internship-research-loop. You write importable JSON and print the exact commands for Anant. The only GitHub resource you create is the one throwaway probe repo in Task 7.
6. No merge, no push to master, no `--no-verify`, no `git add -A`, no force push except `--force-with-lease` on your own branch. Export GRAPHIFY_SKIP_HOOK=1 in the worktree. Commits author "Anant Gupta"; verify `git log -1 --format=%an` after the first commit.
7. Do not re-enable, disable or dispatch any scheduled workflow (run, recheck, revalidate, reseed). Report only.
8. Commit after each task. Keep the PR under about 600 changed lines excluding tests.

## Task Order
0. Preflight, read-only. Verify the preconditions. Report: why the scheduled workflows have not run since 2026-08-29 / 2026-09-20 (look at `gh run list` and the Actions tab state, whether GitHub auto-disabled them, and the 60-day-inactivity rule for scheduled workflows in public repos). Check whether requirements.txt (used by CI) and pyproject.toml/uv.lock (used by the pre-push hook) agree on test dependencies; report drift, do not fix it.
1. Worktree. `git worktree add ~/projects/work/.worktrees/internship-research-loop-chore-pr-gates-and-ruleset -b chore/pr-gates-and-ruleset origin/master`, then `git worktree lock` with owner and date. Work only there.
2. Fix .github/workflows/test.yml: `on: pull_request` plus `push: branches: [master]`; add `concurrency` (cancel-in-progress per ref); `permissions: contents: read`; keep the job id and name exactly `pytest` (the ruleset requires that context). Commit.
3. Write scripts/ci/pr_gates.py: pure functions, one per gate, each returning a list of violation strings, plus a thin main() that reads the PR from GITHUB_EVENT_PATH and uses `gh api` for files, commits and open PRs. Offline mode `--pr N` runs the same checks against a real PR for local proof. Gates:
   - branch_name: ^(feature|fix|docs|chore)/[a-z0-9]+(-[a-z0-9]+)*$, allow dependabot/*. Real data: the retired `<machine>/<topic>` form and this repo's current branches.
   - pr_title: length and no trailing period, WIP or Draft prefix; limits from the measured history of origin/master subjects (do not invent conventional-commit rules the history does not follow).
   - commits: no merge commits (exactly one parent), subject length limit from data, no `fixup!`, `squash!` or `WIP`, and no author or committer named `Test` or at `test@example.com` (real incident 2026-11-21, commit authored by a test fixture).
   - forbidden_paths: ^Cover Letters/, \.env, \.mcp\.env, \.(pem|key)$, ^graphify-out/, ^\.worktrees/, \.(orig|rej|bundle)$, recovery-, ^\.claude/settings\.local\.json$. Public repo: these must never land.
   - template_sections (ready-for-review only): the PR body contains the "Verification" and "Repository conventions" sections of .github/pull_request_template.md and no unchecked box in them (N/A means check the box and write N/A).
   - size (ready-for-review only): changed files and added+deleted lines under limits measured from PRs #1-#17; label `large-ok` overrides.
   - wip_limit (ready-for-review only): fail if another OPEN NON-DRAFT PR with a lower number exists; label `parallel-ok` overrides. Real data: PRs #15-#17 were opened together on 2026-11-21.
   - linked_issue: body has `(Closes|Fixes|Resolves|Refs) #N` or label `no-issue`. Ships in WARN mode (annotation only) because the issue system does not exist until P1.5b. Implement a single GATES_ENFORCE set so P1.5b flips it with a one-line change.
   Draft PRs evaluate only branch_name, pr_title, commits, forbidden_paths and linked_issue. Output a Markdown table to $GITHUB_STEP_SUMMARY and `::error` annotations. Do not post PR comments.
4. Tests: tests/test_pr_gates.py, unit tests on the pure functions with fixtures built from real data (the bad identity from 2026-11-21, a `Cover Letters/x.md` path, the old machine-prefixed branch name, PR #17's real size). Full suite must pass.
5. .github/workflows/pr-gates.yml: `on: pull_request` types opened, edited, synchronize, reopened, ready_for_review, labeled, unlabeled; permissions contents: read, pull-requests: read; one job named exactly `pr-gates`; checkout with fetch-depth 0; run `python3 scripts/ci/pr_gates.py` with GH_TOKEN from github.token via env. Add a separate non-required job `dependency-review` (actions/dependency-review-action@v4, fail-on-severity high) that runs only when requirements.txt, pyproject.toml, uv.lock or .github/workflows change. Add .github/dependabot.yml: pip and github-actions, monthly, grouped, open-pull-requests-limit 1 (Anant wants minimal PRs).
6. Ruleset JSON, importable and reviewed, not applied. Write .github/rulesets/master.json: target the default branch; rules deletion, non_fast_forward, required_linear_history, pull_request (0 required approvals because this is a solo repo, allowed_merge_methods ["rebase"], required_review_thread_resolution true), required_status_checks (strict_required_status_checks_policy true; contexts `pytest` and `pr-gates`); enforcement active; bypass_actors decided in Task 7. Also write .github/rulesets/branch-names.json only if Task 7 shows the plan supports a branch_name_pattern rule, targeting all branches except master and dependabot/**.
7. Bypass proof on a throwaway repo (no data, public so rulesets are testable on any plan): create public `gupta-builds/ruleset-probe-20261121` with one workflow_dispatch workflow that commits a file to master using the default GITHUB_TOKEN. Run this matrix and record each result verbatim:
   a. ruleset requiring a PR, NO bypass actors: dispatch the workflow (control: expect rejected).
   b. same ruleset, bypass actor `{"actor_id":15368,"actor_type":"Integration","bypass_mode":"always"}` (GitHub Actions app): dispatch again. Accepted or rejected?
   c. same ruleset, bypass actor Repository admin `{"actor_id":5,"actor_type":"RepositoryRole","bypass_mode":"always"}`: does a direct push as the owner succeed? Does the Actions dispatch still fail?
   d. does the API accept a `branch_name_pattern` rule on this plan, and does pushing a branch named `bad-name` get rejected?
   Then `gh repo archive` the probe repo and tell Anant to delete it (`gh auth refresh -s delete_repo` then `gh repo delete`). Use the result to fix bypass_actors in master.json. If NEITHER (b) nor a PAT route works, do not guess: write the fallback option (bot writes state/ and logs/ to a `bot-state` branch) in the report as a decision for Anant and leave master.json without a bypass for the bot.
8. Prove it on real PRs. Run `python3 scripts/ci/pr_gates.py --pr 15` and 16 and 17 and paste the output tables into the report. Anything that fails on a merged, legitimate PR means the threshold is wrong; recalibrate with data, not by loosening blindly.
9. Docs: add a short "PR gates" section to docs/TWO_LAPTOP_WORKFLOW.md (what each gate checks, the one-open-PR rule, draft until ready, the override labels, how to apply the rulesets). Do not create a new doc.
10. Final verification: full pytest passes; YAML parses (python3 -c yaml.safe_load on every workflow); `actionlint` if available; `git diff origin/master --stat` shows only intended files; push with the pre-push hook active (never bypass); open ONE draft PR, then mark it ready only when the checks `pytest` and `pr-gates` are green on the PR itself. Do not request Copilot. Do not merge.
11. Report. Write the Result into Runs/P1.5a Deterministic PR Gates (2026-11-21).md (create it) and a short status under this heading in Claude Code Prompts.md. Include: the Task 7 matrix, the Task 8 tables, the measured thresholds with their data, the pipeline-dormancy finding, and the exact owner commands, in order:
    - `gh api -X POST repos/gupta-builds/internship-research-loop/rulesets --input .github/rulesets/master.json`
    - (if supported) the same for branch-names.json
    - settings the owner toggles: Dependabot security updates ON; Actions default workflow permissions stay read; keep "Allow GitHub Actions to create and approve pull requests" OFF.
    - the merge command and worktree removal.

## Report Back (in the run note)
Per task: what changed, commands run, real output. Anything skipped and why. Anything you could not verify.

## Grading Rubric
- Gates are deterministic, stdlib-only, and each threshold cites measured data. (3)
- No `${{ github.event.* }}` inside any run script. (2)
- test.yml runs once per PR and the job is still named `pytest`. (1)
- The bypass question is answered by the probe matrix, not by assumption. (3)
- Nothing applied to the live repo; one PR; not merged; Copilot not requested. (2)
- Report is honest about failures and recalibrations. (1)

## What Not To Do
Do not add Copilot, an LLM, or any non-GitHub third-party action. Do not apply the ruleset. Do not touch run/recheck/revalidate/reseed. Do not open more than one PR. Do not enforce linked_issue yet. Do not create issues, labels, a Project or milestones (that is P1.5b).
````
### P1.5a status (2026-11-21)
Done, PR #18 ready, not merged; PRs #15-#17 merged and their worktrees removed first. `pytest` and `pr-gates` green on the PR. The Actions bot cannot be a ruleset bypass actor on this user-owned repo (API 422), admin-role bypass does not cover the Actions token, and `branch_name_pattern` is unsupported on this plan, so `master.json` has no bypass and must not be applied until you choose a PAT or a `bot-state` branch. Also found: `JARVIS_PUSH_TOKEN` fails with Bad credentials, so the scheduled pipeline is broken. Full result and the owner commands in order: [[P1.5a Deterministic PR Gates (2026-11-21)]].
# P1.5 Status (updated 2026-11-21, review and hardening pass)
**PR #18 is ready to merge** (`chore/pr-gates-and-ruleset`, issue #19, milestone `Weekend Build 2026-11-21`). Anant asked for the whole governance loop in one PR, so P1.5b and P1.5c from the table above were folded in; the PR carries `large-ok` (972 lines, 23 files) on purpose. 547 tests pass; `pytest`, `pr-gates` and `dependency-review` are green. Run this P1.5 note: `Runs/P1.5a Deterministic PR Gates (2026-11-21).md`.
**What was added beyond the first pass**
- Gates: `tests_with_code` (35 of 35 real code commits touched tests/), `workflow_lint` (no PR text in `run:`, `permissions:` present, pinned actions; it correctly flags PR #12's pre-fix `reseed.yml`), `conventions` (the repo's `check_conventions.py` check 1 as a hard fail, checks 2-4 as warnings), `linked_issue` now enforced. Checked offline against PRs #12, #14, #17, #18: legacy PRs fail only where they really lack an issue, template or valid branch name.
- Issue system, live on GitHub: 12 labels from `.github/labels.yml`, milestone, phase issues #19-#27 (P1.5-P9), owner issues #28 (schedules dormant since 2026-08-29), #29 (rotate `JARVIS_PUSH_TOKEN`, add `REPO_BOT_TOKEN`), #30 (delete probe repo). Bot alerts #4-#11 labelled `bot-alert`; #9 and #10 closed as superseded by #11.
- Token decision (Anant): a repo-scoped fine-grained PAT, `REPO_BOT_TOKEN`, is what workflows use to push this repo; the global agent PAT is never used by a workflow. Workflows fall back to the default token until the secret exists.
- Ruleset: `master.json` bypasses the Repository admin role (the only bypass the probe showed working), requires `pytest`, `pr-gates`, `dependency-review`; `copilot-review.json` is separate, review once per PR, not on push or drafts. Trade-off recorded in the workflow doc: any owner token, including the agent PAT, can then push to master; the local pre-push hook is the guard.
- Copilot instructions: `.github/copilot-instructions.md` plus three path-scoped files. Dependency graph enabled by turning on vulnerability alerts (no automatic security PRs).
- Docs: the issue-to-merge loop, gate table, owner steps and a reuse checklist are in `docs/TWO_LAPTOP_WORKFLOW.md`.
**Not done or unverified**
- Copilot review did not start: requesting it by `gh pr edit --add-reviewer @copilot` and by the REST API left the reviewer list empty. Check Copilot code review is enabled for the account (github.com/settings/copilot) or add Copilot from the PR sidebar.
- The Project board with an Iteration field is not created: the CLI token lacks the `project` scope. Owner runs `gh auth refresh -s project`, then it is created.
- `copilot_code_review` as a ruleset rule type is untested on this plan.
- Why the schedules stopped is still unexplained (issue #28).
**Owner steps, in order:** merge #18 (`gh pr merge 18 --rebase`); set both secrets (`gh secret set REPO_BOT_TOKEN`, `gh secret set JARVIS_PUSH_TOKEN`); run `recheck.yml` once by hand; apply the two rulesets (commands in the workflow doc); delete the probe repo (`gh auth refresh -s delete_repo`, `gh repo delete gupta-builds/ruleset-probe-20261121`); remove the P1.5 worktree. **Gate for P2:** #18 merged and the PR gates running on a later PR.


# P1.5 Closed (2026-11-21, evening)
- PR #18 merged (rebase). Copilot reviewed it once: 6 findings (2 blocker, 4 should-fix), 5 fixed, 1 declined and tracked in #31. Real catches: the gate ran from the PR's own checkout (now `pull_request_target`, base branch only, linted), a missing `dossier-ready` label, the owner's real identity in a public test fixture. Review record is the last comment on the PR.
- Copilot works on the owner's account through the Student Developer Pack. Rule: one review per PR at ready-for-review, never per push; gates stay zero-LLM.
- `REPO_BOT_TOKEN` and `JARVIS_PUSH_TOKEN` are set (90-day expiry, over-broad permissions: tighten at renewal, about 2027-02-19). Probe repo deleted. Rulesets in `.github/rulesets/` are NOT applied yet: owner decision.
- GitHub is the sprint record: project board "Internship Loop - Weekend Build" (user project 4), sprint "Thanksgiving Lock In or Fail" (9 days from 2026-11-21), epic #46 with sub-issues P2 to P11, owner tasks (#34 cover letter interview, #35 decisions, #36 apply day), backlog #39 to #43, critical certifi alert #38.
- Next: P2 (#20) and #38 certifi. Start each phase from its issue.
