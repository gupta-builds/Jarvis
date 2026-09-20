---
type: evergreen
status: sprout
created: 2026-09-05
updated: 2026-09-05
tags: [evergreen, ai, tooling, second-brain-claudekit]
notes:
  - "[[40_Resources/CS/Repos]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]"
---
# ECC — everything-claude-code (affaan-m)

## For future Claude
Real "how Anant actually uses this now" content, written 2026-09-05. Non-obvious fact this note exists to fix: **ECC exists in three separate, unmerged places on this machine** — don't assume one implies the other two are in the same state.

## The three ECC manifestations, checked directly 2026-09-05
1. **A real, live Claude Code plugin marketplace on WSL** — `~/.claude/plugins/marketplaces/ecc/` (source: `affaan-m/ECC.git`), with cached files at `~/.claude/plugins/cache/ecc/ecc/2.1.0/`. This is genuinely installed and available to any WSL Claude Code session today.
2. **A pre-existing plain `git clone`** at `~/projects/ai/claude/everything-claude-code/` — the real ECC 2.0 Rust-based control-plane scaffold (`ecc2/`), confirmed 2026-07-30 via `git remote -v` (`affaan-m/everything-claude-code`). Alpha quality per its own README.
3. **`second-brain-claudekit`'s own qualification clone** at `sandbox/ecc/` — deliberately kept separate from #2 rather than reused, per this repo's "nothing skips `sandbox/`" rule.

## Install state (of #3, the pipeline's own qualification clone)
**Undetermined at the whole-repo level — real testing started, no promotion decision made.** Cited to `Tool Map.md`'s "ECC" row. `npm install --no-audit --no-fund` completed clean (210 packages). `node tests/run-all.js` (the repo's own documented test command): **3378/3388 passed (99.7%), 10 failed, exit 0** — all 10 failures isolated to two files (9 in `integration/plan-canvas-e2e.test.js`, environment-specific per a local server never coming up in this sandboxed WSL; 1 in `lib/dry-run.test.js`, not yet root-caused).

**Real finding new to this pipeline:** merely cloning ECC into `sandbox/ecc/` caused Claude Code to auto-load its `CLAUDE.md`, `.claude/rules/*.md`, and register a `.claude/skills/everything-claude-code` skill — no explicit install step required. This falsified `_docs/Architecture.md`'s original assumption that `sandbox/` is inert until deliberately run, for any tool shipping its own config; the doc was corrected 2026-08-20.

## What it's for, if a real gap is ever named
67 agents, 281 skills, 94 legacy command shims, AgentShield security scanning, a Memory Vault. Scope discipline per `_docs/Design.md`'s Implement > Knowledge principle: wholesale install (`./install.sh --profile full`) would itself be the anti-pattern this pipeline exists to prevent. **Not yet decided which 2-4 specific components (if any) close a real gap** nothing already-adopted (GBrain, mattpocock-engineering, this repo's own `/challenge`/`/ideas`/`/llm-council` skills) already closes.

## WSL vs. Windows split
All three manifestations above are WSL-only today. If a specific ECC component is ever promoted, apply the split per-component: a code-review/engineering agent → WSL-side (real code projects); nothing in ECC's catalog is Jarvis/Obsidian-specific, so a Windows-side promotion is unlikely to apply here.

## Links
[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.
