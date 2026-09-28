---
created: 2026-09-26
type: project
status: active
tags:
  - laptop
  - wsl
  - git
  - internship
related:
  - "[[internship-research-loop-new-laptop-directive]]"
  - "[[second-brain-claudekit-git-clone-and-bootstrap]]"
---

# internship-research-loop — Git Clone and Bootstrap

## One-Line Answer

This is a Python 3.12 pipeline repo with no Node tooling and no `pyproject.toml`/`uv` — clone it, create a plain `.venv`, install `requirements.txt`, and run the test suite before touching anything else, to confirm the checkout (not just the clone command) is actually good.

## 1. Base WSL and GitHub CLI — shared, not repeated here

Already covered once for this machine in [[second-brain-claudekit-git-clone-and-bootstrap]] §1–3 (WSL base verification, `apt install git git-lfs curl jq ... gh`, `gh auth login --hostname github.com --web --git-protocol https`). Don't redo `gh auth login` per repo — it's a machine-level credential, not something this repo owns.

## 2. Clone the codebase

```bash
mkdir -p "$HOME/projects/work"
git clone https://github.com/gupta-builds/internship-research-loop.git "$HOME/projects/work/internship-research-loop"
cd "$HOME/projects/work/internship-research-loop"
git status --short --branch
```

If the destination already exists, inspect before cloning over it:

```bash
git -C "$HOME/projects/work/internship-research-loop" status --short --branch
git -C "$HOME/projects/work/internship-research-loop" remote -v
```

## 3. Python environment

This repo is now a uv project (converted 2026-09-27): `pyproject.toml` and `uv.lock` exist at the repo root, both committed. Python 3.12 is still pinned the same way as every GitHub Actions workflow, now also through `requires-python` in `pyproject.toml`.

```bash
uv sync
```

`uv sync` reads `uv.lock` and creates or updates `.venv` with the exact resolved versions, replacing the old `python3.12 -m venv .venv && pip install -r requirements.txt` sequence. `requirements.txt` still exists in the repo for reference, but `uv.lock` is now the source of truth for installed versions.

## 4. Validate the checkout

```bash
source .venv/bin/activate
python3 -m pytest -q
```

Expect **499 passed** (2026-09-26 baseline). A different count on a later checkout isn't itself alarming (the suite grows), but fewer tests or any failure means the checkout or environment is wrong, not the tests.

```bash
python3 -m py_compile core/*.py ingestion/*.py vault_writer/*.py \
  run_pipeline.py recheck.py reseed.py revalidate.py screen_report.py enrich.py
test -d .claude/agents && test -d .claude/skills
test -f CLAUDE.md && test -f AGENTS.md && test -f README.md && test -f PRD.md
```

## 5. Start the coding agent

```bash
cd "$HOME/projects/work/internship-research-loop"
claude
```

Or Codex from the same directory — `.codex/agents/*.toml` and `.codex/hooks.json` mirror `.claude/`'s agents and hooks for it (see `CLAUDE.md`'s note on why this is a mirror, not a second source of truth to hand-maintain).

## What this step does not set up

- The Jarvis vault connection (MCP servers, or a real sibling checkout for running the pipeline scripts by hand) — see [[internship-research-loop-jarvis-vault-and-secrets]].
- `FIRECRAWL_API_KEY` / `JARVIS_DIR` for a manual local run of `run_pipeline.py`/`enrich.py` — same note.
- The two-laptop branch convention — not a setup step, just don't commit to `master` once this checkout exists; see `CLAUDE.md`'s "Two-laptop workflow" entry.

## Related

- [[internship-research-loop-new-laptop-directive]]
- [[internship-research-loop-jarvis-vault-and-secrets]]
- [[second-brain-claudekit-git-clone-and-bootstrap]]
