---
created: 2026-09-26
type: project
status: active
tags:
  - laptop
  - jarvis
  - secrets
  - internship
related:
  - "[[internship-research-loop-new-laptop-directive]]"
  - "[[internship-research-loop-git-clone-and-bootstrap]]"
  - "[[Jarvis MCP and REST API Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
---

# internship-research-loop — Jarvis Vault Access and Secrets

## One-Line Answer

Two independent things reach the Jarvis vault from this codebase and need separate setup: the interactive Claude Code skills (`/promote-dossier`, `contact-researcher`, etc.) reach it only through this machine's user-global `~/.claude/.mcp.json` MCP servers — there is no sibling `Jarvis/` checkout here; the unattended pipeline scripts (`run_pipeline.py`, `recheck.py`, `reseed.py`, `revalidate.py`) instead read a real `JARVIS_DIR` filesystem path directly and never call MCP tools at all.

## Verified live state — 2026-09-26

- No `Jarvis/` (or similarly named) directory exists as a sibling of this repo, or anywhere searched under `~/projects/work/`, on `dell-latitude`.
- `~/.claude/.mcp.json` exists and registers four servers: `jarvis`, `the-plan`, `jarvis-fs`, `github` — confirmed by actually calling `mcp__jarvis__vault_list`/`vault_read`/`vault_write` successfully in this same session.
- No root `.mcp.json` inside this repo — MCP config here is machine-global, not project-local.
- `.claude/settings.json` (committed to this repo) holds only `permissions` and `hooks` keys — no `mcpServers` entry of its own.

## Path 1 — interactive skills (MCP), what to recreate

Recreate `~/.claude/.mcp.json`'s `jarvis`/`jarvis-fs`/`github` entries per [[Jarvis MCP and REST API Setup]] and the WSL-native config block in [[WSL New Laptop Master Plan — Verified 2026-09-11#Phase 11 — WSL-native MCP]] — this is shared machine setup used by every codebase on this machine, not specific to this repo, so it isn't re-documented here. Once done, confirm before trusting it — an error means "not connected," not "empty vault," exactly as this repo's own `.claude/rules/jarvis.md` states for every vault-writing agent:

```
mcp__jarvis__vault_list
```

## Path 2 — unattended pipeline scripts, what's actually different

`run_pipeline.py`, `recheck.py`, `reseed.py`, `revalidate.py`, and `screen_report.py` all read `os.environ["JARVIS_DIR"]` directly — confirmed in the source 2026-09-26, none of them touch MCP tools. In GitHub Actions this is `${{ github.workspace }}/jarvis-checkout`, a fresh throwaway checkout of `gupta-builds/Jarvis` made with the `JARVIS_PUSH_TOKEN` secret on every run of all four scheduled workflows. Running any of these scripts by hand on a new laptop needs the same thing recreated locally — a real sibling clone, separate from Path 1:

```bash
git clone https://github.com/gupta-builds/Jarvis.git "$HOME/projects/work/Jarvis"
export JARVIS_DIR="$HOME/projects/work/Jarvis"
export FIRECRAWL_API_KEY="..."   # optional — absent means thinner dossiers, never a hard failure
python3 run_pipeline.py
```

Path 1 and Path 2 are independent — neither substitutes for the other. The interactive skills never read `JARVIS_DIR`; the pipeline scripts never call `mcp__jarvis__*`.

## Secrets — none of these exist as files in this repo, ever

| Secret | Where it actually lives | Used by |
|---|---|---|
| `JARVIS_PUSH_TOKEN` | GitHub Actions repo secret only | checking out + pushing `jarvis-checkout/` in `run.yml`, `recheck.yml`, `reseed.yml`, `revalidate.yml` |
| `FIRECRAWL_API_KEY` | GitHub Actions repo secret, or a personal local env var for a manual run | discovery-time posting fetch in `run.yml`, `reseed.yml`, `enrich.py` |
| `GH_TOKEN` | `${{ github.token }}`, auto-provided per workflow run | this repo's own `gh issue create` calls (schema-drift notices, the dossier-ready notification) |

All three are referenced **by name only** in `.github/workflows/*.yml` per `CLAUDE.md`'s own "Secrets management" note. Nothing needs recreating server-side — they already exist as GitHub repo secrets independent of any laptop. What a human needs *locally* is only `FIRECRAWL_API_KEY` and `JARVIS_DIR` as personal environment variables, and only if running the pipeline scripts by hand instead of letting Actions run them.

## What's gitignored / machine-local (never restored by clone)

- `.venv/`, `__pycache__/`, `.pytest_cache/` — regenerate; see [[internship-research-loop-git-clone-and-bootstrap]].
- `jarvis-checkout/` — CI-only; never present locally unless you create it yourself for Path 2 above.
- `.claude/agent-memory-local/contact-researcher/` — real found-PII (names/emails/LinkedIn URLs) cached by the `contact-researcher` agent's 30-day freshness window; starts empty, refills through normal use, deliberately never synced between laptops.
- `graphify-out/`'s regenerated files (`.graphify_labels.json`, `.graphify_labels.json.sig`, `graph.json`, `graph.html`, `GRAPH_REPORT.md`, `manifest.json`, dated snapshot folders, `cache/`) — rebuilt by the repo's own git hooks on first commit.
- `.git/hooks/` itself — never part of git history at all, so the graphify→Jarvis live code-graph sync doesn't survive a clone. Reinstall with `graphify hook install` plus a hand-added `post-merge` hook if the live mirror into `60_Claude/40_Project_Briefs/Internship` is wanted on the new laptop too; optional, the repo works fully without it.

## Related

- [[internship-research-loop-new-laptop-directive]]
- [[internship-research-loop-git-clone-and-bootstrap]]
- [[Jarvis MCP and REST API Setup]]
- [[WSL New Laptop Master Plan — Verified 2026-09-11]]
