---
created: 2026-09-26
type: project
status: active
tags:
  - laptop
  - codebase-sync
  - wsl
  - git
  - internship
related:
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
  - "[[Jarvis MCP and REST API Setup]]"
  - "[[second-brain-claudekit-new-laptop-directive]]"
next: "[[internship-research-loop-git-clone-and-bootstrap]]"
---

# internship-research-loop — New Laptop Directive

## One-Line Answer

Clone this repo into WSL, recreate a Python 3.12 venv from `requirements.txt`, and reach the Jarvis vault the same way this machine already does — the user-global `~/.claude/.mcp.json` MCP servers, not a sibling checkout — then start doing new work on an `acer-predator/<topic>` branch merged via PR, never a direct commit to `master`. Git clone restores the whole codebase and its committed automation; it does not restore the venv, any secret, the contact-researcher PII cache, or graphify's git hooks.

## Current verified baseline — 2026-09-26

Live audit of this repo on `dell-latitude` before writing this note:

- Default branch: `master` (confirmed via `gh repo view`). Repository visibility: **PUBLIC** (`gupta-builds/internship-research-loop`).
- Before this session: local `master` was 5 commits ahead and 16 commits behind `origin/master` — the 16 were all automated "Recheck log" commits from `recheck.yml` touching only `logs/rechecks.jsonl` and `state/dossier_uids.json`; the 5 were real local feature work never pushed. No file overlap between the two sets.
- Full test suite: 499 passed, both before and after resolving the above.
- Python: 3.12 pinned identically across all five workflows (`run.yml`, `recheck.yml`, `reseed.yml`, `revalidate.yml`, `test.yml`). No root `pyproject.toml`/`uv.lock` — plain `requirements.txt` + venv.
- No sibling `Jarvis/` (or similarly named) checkout exists anywhere under `~/projects/work/` on this laptop. `~/.claude/.mcp.json` is the live path, registering `jarvis`, `the-plan`, `jarvis-fs`, `github`.
- No root `.mcp.json` inside this repo itself — MCP config is machine-global here, not project-local. `.claude/settings.json` (committed) holds only `permissions` and `hooks`.

## What Git clone restores

- Every committed file: `core/`, `ingestion/`, `vault_writer/`, `tests/`, `run_pipeline.py`, `recheck.py`, `reseed.py`, `revalidate.py`, `screen_report.py`, `enrich.py`, `requirements.txt`.
- `.claude/` (agents, skills, hooks, `settings.json`), `.codex/` (Codex mirror), `.agents/skills/` (generic AGENTS.md-ecosystem mirror), `AGENTS.md`, `CLAUDE.md`.
- `.github/workflows/` (all five) and their cron schedules.
- Committed state — unusually, this repo tracks its own runtime state in git: `state/dossier_uids.json`, `logs/*.jsonl`.
- Full commit history from GitHub.

## What Git clone does not restore

- `.venv/`, `__pycache__/`, `.pytest_cache/` — regenerate; see [[internship-research-loop-git-clone-and-bootstrap]].
- Any secret. `FIRECRAWL_API_KEY`, `JARVIS_PUSH_TOKEN`, `GH_TOKEN` are GitHub Actions repo secrets referenced by name only — never in this repo's history. See [[internship-research-loop-jarvis-vault-and-secrets]] for what a human needs locally versus what's already fine server-side.
- `~/.claude/.mcp.json`'s `jarvis`/`jarvis-fs`/`github` entries — user-global, shared across every codebase on the machine, not this repo's to restore.
- `jarvis-checkout/` — exists only inside a GitHub Actions run (a throwaway checkout of `gupta-builds/Jarvis`); never a local artifact.
- `.claude/agent-memory-local/contact-researcher/` — real found-PII (names/emails/LinkedIn URLs) the `contact-researcher` agent caches; gitignored on purpose, starts empty on a new checkout.
- `.git/hooks/` — **never part of git history**, so the graphify→Jarvis live code-graph sync (post-commit/post-checkout/post-merge hooks) does not survive a clone at all. Optional to reinstall (`graphify hook install`, then re-add the `post-merge` hook by hand); the repo works fully without it.

## Source-laptop gate — completed 2026-09-26, one step open

Before treating this repo as backed up and ready to clone from:

```bash
cd "$HOME/projects/work/internship-research-loop"
git fetch origin
git log origin/master..master --oneline   # must be empty once PR #12 is merged
git status --short --branch               # must be clean
python3 -m pytest -q                      # must pass in full
```

What actually happened this session: audited every uncommitted/untracked file for secrets and PII (none found — the one dossier fixture uses a fabricated company, "Acme"), ran the full suite (499 passed), rebased the 5 local-only commits onto `origin/master`'s 16 recheck-log commits (no conflicts — disjoint file sets), split the pending work into 8 logical commits on `dell-latitude/repo-cleanup-and-migration-prep`, and opened **PR #12** (`https://github.com/gupta-builds/internship-research-loop/pull/12`).

**One manual step left**: merging PR #12. This session's own auto-mode classifier blocked a self-merge (merge-without-review), which is the correct call — merge it yourself (`gh pr merge 12 --rebase --delete-branch`), then `git checkout master && git pull --ff-only` locally, before trusting this repo as fully synced.

## New-laptop execution order

1. [[internship-research-loop-git-clone-and-bootstrap]]
2. [[internship-research-loop-jarvis-vault-and-secrets]]

Shared WSL/GitHub-CLI base tooling (WSL verification, `gh auth login`, apt packages) is not repeated here — it's a machine-level prerequisite already covered once in [[second-brain-claudekit-git-clone-and-bootstrap]] §1–3.

## Two-laptop workflow

Documented in the repo itself, not duplicated here — see `CLAUDE.md`'s "Two-laptop workflow" entry (added 2026-09-26, in the Auto-mode classifier notes section): `dell-latitude` / `acer-predator`, new work on `<machine>/<topic>` branches merged via PR, `master` deliberately left without GitHub branch protection because `run.yml`/`recheck.yml` already commit to it directly from Actions (a "require PR" rule has no clean bot-bypass on a personal free-tier public repo).

## Final completion gate

The migration is complete only when all are true:

- [ ] PR #12 is merged; local `master` on the new laptop matches `origin/master` exactly.
- [ ] `git clone` succeeds; `git status --short --branch` is clean.
- [ ] `python3.12 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt` succeeds.
- [ ] `python3 -m pytest -q` passes (499 tests as of 2026-09-26 — a different count on its own isn't alarming, but fewer or any failure means the environment is wrong).
- [ ] `gh auth status` succeeds without exposing a token.
- [ ] Claude Code (or Codex) starts from the repo root and loads its project-local `.claude/` (or `.codex/`).
- [ ] `~/.claude/.mcp.json` has fresh `jarvis`/`jarvis-fs`/`github` entries; a live `mcp__jarvis__vault_list` call returns real vault content.
- [ ] No secret-bearing file was copied from the old laptop.
- [ ] First new work on the new laptop starts on an `acer-predator/<topic>` branch, not `master`.

## Related

- [[internship-research-loop-git-clone-and-bootstrap]]
- [[internship-research-loop-jarvis-vault-and-secrets]]
- [[second-brain-claudekit-new-laptop-directive]]
- [[WSL New Laptop Master Plan — Verified 2026-09-11]]
- [[Jarvis MCP and REST API Setup]]
