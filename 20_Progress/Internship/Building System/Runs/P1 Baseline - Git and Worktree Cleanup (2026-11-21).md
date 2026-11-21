# P1 Baseline - Git and Worktree Cleanup (2026-11-21)

Prompt: leave Git, worktrees and the tailnet in a verified baseline, then open the PRs that carry the cleanup (Dell WSL, `gupta-builds/internship-research-loop`, public). Docs and Git layout only.

## Result

**Status: local work complete, NOT pushed. No PR exists yet.** Every push from a linked worktree fails the tracked `pre-push` hook (cause below). Fixing it means editing the hook; the auto-mode classifier denied that edit, so I stopped and left the decision to Anant.

### Task 1 - Preflight
All Verified Facts re-checked and matched: host `DESKTOP-3VBG0JH`; `SSH_CONNECTION` source 100.84.91.11 (the session rode Tailscale SSH); branch 6 ahead / 5 behind, no upstream; 21 `.agents` deletions + AGENTS.md edit + untracked `docs/codex/`; two stashes; no `.agents` on origin; PR 14 MERGED (2026-10-04); installed `pre-push` identical to origin's; `delete_branch_on_merge` false, rebase merge allowed; uv 0.12.23. No differences.

### Task 2 - Recovery directory `~/.local/state/internship-loop/recovery-2026-11-21/`
`branch-and-master.bundle` (`git bundle verify`: "The bundle records a complete history"), `status-porcelain.txt`, `AGENTS.md.patch`, `docs-codex/`, `stash0.patch`, `stash1.patch` (with `--include-untracked`), `stash-shas.txt`, `SHA256SUMS` (9 files hashed).

### Task 3 - Main checkout
- Hard Rule 1 fired first: the AGENTS.md edit held more than stale path references (template-drift warnings, a new "Codex-local durable context" section, rewritten autoMode text). Stopped and reported; **Anant decided to keep the edit**.
- Restored: 21 `.agents/skills/**` files (redundant: origin has no `.agents`, 38217cc moved the 21 files to `.codex/skills`) and the AGENTS.md working-tree edit (saved as patch; re-applied in PR 2). Removed untracked `docs/codex/` only after `diff -r` against the recovery copy was empty. `git status` was empty.

### Task 4 - Layout
Main checkout on `master` == `origin/master` (dc5edc1). Old branch renamed `fix/deadline-quota-and-reseed`. uv cache and `.worktrees` share a filesystem (device 2096). Worktrees under `~/projects/work/.worktrees/`:
- `internship-research-loop-chore-single-host-worktree-workflow` (`chore/single-host-worktree-workflow`)
- `internship-research-loop-docs-codex-agent-memory` (`docs/codex-agent-memory`)
- `internship-research-loop-fix-deadline-quota-and-reseed` (`fix/deadline-quota-and-reseed`)

All three are still **locked** ("owner: P1 baseline session 2026-11-21") because nothing is pushed yet; unlocking would be misleading. Tests: 499 passed (chore), 499 passed (docs), 529 passed (fix, after rebase).

### Task 5 - PR 1 content (local, 2 commits, plus a note on the third)
1. `Rewrite the workflow doc for the single-host, worktree-per-task design` (`docs/TWO_LAPTOP_WORKFLOW.md`): topology, hub checkout, lifecycle commands, slug rule, branch names, per-worktree setup, commit cadence, one phase = one PR, bot-owned `state/` `logs/`, lock-based ownership, recovery rules; supersedes `<machine>/<topic>`.
2. `Point CLAUDE.md and AGENTS.md at the single-host workflow`.

### Task 6 - PR 2 content (local, 3 commits)
`docs/codex` scanned: only secret *names* and generic words, no values, personal data or absolute home paths. Commits: the three files as authored; AGENTS.md edit (kept per Anant, with `.Codex`/`.agents` skill paths corrected to `.codex/skills`); corrections: Jarvis repo is **PUBLIC** (`gh repo view`), `gh` auth valid, branch/master-sha/test-count lines marked as 2026-10-03 snapshots.

### Task 7 - PR 3 content (local, 6 commits on origin/master)
Exactly one conflict, README.md. Resolution: kept the branch's truth-up sentence ("One-time per clone: `cp scripts/hooks/pre-push .git/hooks/pre-push` - this repo has no PR gate, so this local hook is what blocks a `git push` with a failing suite.") and origin's two-laptop pointer paragraph; **dropped** the branch's "Two machines work in this repo: branch as `<machine>/<topic>`..." sentence because the new workflow retires that convention. `git diff origin/master --stat`: 15 files, all touched by the six commits. Tests: **529 passed** after the rebase (529 passed on the old branch in a plain run). Commits: f7618a4 deadline stamping (deadline_posted or 7-day own_deadline), b91c117 grade_resume resolves Main Resume via JARVIS_DIR, 0528d9f README/PRD/skill truth-up, c10d552 quota-shortfall debate-loss fix (ee5da85), e115db4 reseed.yml confirm via env, bb50a6c dossier_uids.json repoint. Deferred (not in this PR): `recheck.py` coverage of ApplyGuy/Freehire/InternDock, the unwired company cache.

### Task 8 - Cleanup
Deleted local `docs/two-laptop-workflow` (PR 14 MERGED; `git cherry` showed only `-`; `git branch -D`). Dropped stash@{1} then stash@{0} (its CLAUDE.md lines, `.claudeignore` and `.gitattributes` are already on origin, byte-identical; patches saved). `git remote prune origin`. `gh repo edit --delete-branch-on-merge`; verified `{"delete_branch_on_merge":true,"allow_rebase_merge":true}`. No other setting changed.

### Task 9 - Tailscale and host (real outputs)
- `tailscale status`: `dell-wsl` 100.94.129.113 linux; `gupta-builds` 100.84.91.11 windows, "active; direct 10.5.8.251:41641". Health `[]`, Self online, KeyExpiry None.
- `tailscale ping -c 3 gupta-builds`: "pong ... via 10.5.8.251:41641 in 11ms" (direct, no relay).
- `tailscale0` MTU 1280. `RunSSH: true`. `systemctl is-active tailscaled`: active.
- `.wslconfig`: `vmIdleTimeout=-1`, `[general] instanceIdleTimeout=-1` (also mirrored networking, 20GB, 10 cpu).
- Windows `Get-Service Tailscale` (absolute powershell path, since `powershell.exe` is not on PATH in WSL): empty, as required.
- `~/tools/sync-check`: internship-research-loop master, ahead 0 behind 0, dirty 0 (second-brain-claudekit: main, dirty_count=8, not touched).

Not verifiable from the Dell - for Anant on the Acer Windows side:
- `tailscale status`
- `ssh dell-wsl hostname` (expect `DESKTOP-3VBG0JH`)
- `wsl -d Ubuntu -- bash -lc "ls ~/projects 2>&1"` (expect no repo)
- In the Tailscale admin console: confirm `dell-wsl` key expiry is still disabled and the SSH `check` rule from `autogroup:member` to `autogroup:self` exists.

### Task 10 - Final state
Main checkout: `master` == `origin/master` (dc5edc1), clean, 0 stashes. `pre-push` present, executable, identical to origin's `scripts/hooks/pre-push`. Worktrees: all clean, 2 / 3 / 6 commits ahead of origin/master, **none has a remote branch** (so "pushed and tracking" is NOT met; chore and docs have `origin/master` as a side-effect upstream from `worktree add`, fix has none). Tests per worktree: 499 / 499 / 529 passed. PR URLs: none.

## Incident I caused and repaired (read this)
The first `git push -u` from the chore worktree ran the `pre-push` hook, which runs `pytest`. Git exports `GIT_DIR` to hooks; in a linked worktree it is an absolute path to that worktree's gitdir (in the main checkout it is a relative `.git`, which is why this never bit before). `tests/test_git_ops.py`'s throwaway repos then operated on the **real** repo: 4 test errors and these side effects, all local:
- `core.bare=true` written to the shared `.git/config` (main checkout reported "not inside a work tree");
- `[user] Test <test@example.com>` written to the shared config, so my docs commits were authored as "Test" and the fix commits' committer was "Test";
- a stray `seed` commit (`0dddebf`) on the chore branch that deletes 172 files.
Verified nothing escaped: `git ls-remote --heads origin` shows only `master` at dc5edc1. Repaired: `core.bare=false`, removed the local `[user]` block, reset the chore branch to `90ff2ec`, rewrote the unpushed docs/fix commits with the correct identity (trees byte-identical before and after). Old tips recoverable from the reflog/bundle. I did not use `--no-verify` or `core.hooksPath` (a plugin hook forbids bypassing hooks); I then tried to add `unset GIT_DIR GIT_WORK_TREE GIT_INDEX_FILE GIT_PREFIX` to `scripts/hooks/pre-push`, which the auto-mode classifier denied as undermining oversight. Not worked around.

## Decisions not in the prompt
- Kept the AGENTS.md edit (Anant's instruction) and fixed its stale skill paths in PR 2.
- Dropped the README `<machine>/<topic>` sentence (superseded).
- Report written to this note (path given by Anant) because the prompt's "this file" had no path.
- Left the worktrees locked (unpushed work).
- Did not touch README.md line about "either laptop ... Never work on the same branch from both laptops" (origin's pointer, partly stale versus the new doc), nor `docs/codex/ACCESS.md` line 12 ("hook runs tests only when `.venv/bin/python` exists; it fails open") which is contradicted by the live hook (fails closed, uv fallback). Both are out of the stated scope.

## Needs Anant (decide, then push)
1. **Pre-push hook fix.** Add `unset GIT_DIR GIT_WORK_TREE GIT_INDEX_FILE GIT_PREFIX` before the pytest call in `scripts/hooks/pre-push` (with a comment), install it to `.git/hooks/pre-push`, and ship it in PR 1. Until then, worktree pushes fail and can corrupt `.git/config`. Alternatively make the tests scrub `GIT_*` (a test change, out of this prompt's scope). **Do not push from a worktree before this is fixed.**
2. The Jarvis vault repo is **public** while holding personal career data (found while correcting the docs). Worth checking on purpose.

## Merge order and commands (once pushed and PRs opened)
```bash
cd ~/projects/work/internship-research-loop && export GRAPHIFY_SKIP_HOOK=1
# push each branch (after the hook fix), open PRs against master, then:
gh pr merge <PR1> --rebase     # chore/single-host-worktree-workflow
# in each remaining worktree:
git fetch origin --prune && git rebase origin/master && git push --force-with-lease
gh pr merge <PR2> --rebase     # docs/codex-agent-memory
git fetch origin --prune && git rebase origin/master && git push --force-with-lease   # in the fix worktree
gh pr merge <PR3> --rebase     # fix/deadline-quota-and-reseed
# once all three are merged:
git worktree unlock <path>; git worktree remove <path>     # for each of the three
git branch -d chore/single-host-worktree-workflow docs/codex-agent-memory fix/deadline-quota-and-reseed   # -D if a rebase merge hides ancestry
git pull --ff-only origin master && git fetch --prune && git worktree prune
```
Expect a possible AGENTS.md rebase overlap between PR 1 (line 78 bullet) and PR 2 (other sections); they are separate hunks and should apply cleanly.

## Recovery directory
`~/.local/state/internship-loop/recovery-2026-11-21/`: `AGENTS.md.patch`, `SHA256SUMS`, `branch-and-master.bundle`, `docs-codex/`, `stash-shas.txt`, `stash0.patch`, `stash1.patch`, `status-porcelain.txt`.
