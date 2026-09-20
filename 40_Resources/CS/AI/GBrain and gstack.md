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
# GBrain and gstack

Documented together because they are, per [[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]]'s own words, "a matched pair, not two independent tools" — same author (`garrytan`), gstack's own `/setup-gbrain` command exists specifically to install GBrain.

## For future Claude
Real "how Anant actually uses this now" content, written after `second-brain-claudekit`'s Round 10 pipeline-doc pass (2026-09-05). Neither tool is live in Anant's day-to-day workflow yet — both are qualified but not installed/unblocked. Read this before assuming either is running.

## GBrain — personal-knowledge MCP with synthesis + gap-analysis

**Install state: cleared for global promotion, not yet installed.** Cited to `Tool Map.md`'s "GBrain" row (updated 2026-08-20) and `tested-tools/mcp-servers/gbrain/VERDICT.md` in `second-brain-claudekit`. All four `_docs/Promotion-Criteria.md` gates cleared 2026-08-20. Re-verified directly 2026-09-05: no `gbrain` binary on WSL `PATH`, no MCP entry in `~/.claude.json`, `~/.mcp.json`, or `~/.claude/.mcp.json` — only leftover `~/.gbrain/` data (config + PGLite DB) from the sandbox test run. **This is second-brain-claudekit's clearest "cleared but unpromoted" gap** — the decision is made, only the actual `~/.claude/` install (a separate session, per `_docs/Design.md`) hasn't happened.

**Real commands that worked** (from the sandbox test, not a README paraphrase):
```bash
bun install                                                    # 283 packages
bun run src/cli.ts init --pglite --no-embedding                # → 80/100 health, 100/100 brain score
gbrain doctor
gbrain init --force --pglite --embedding-model openai:text-embedding-3-large --embedding-dimensions 1536
gbrain search "<query>" --semantic                              # 0.8275 similarity on a real, non-keyword-overlapping query
```
**Real, undocumented bug found and worked around:** none of gbrain's own documented embedding-provider switch paths (`config set embedding_disabled false`, `init --embedding-model`, `reinit-pglite`) actually clear a stuck `embedding_disabled: true` sentinel in `~/.gbrain/config.json` — only a direct edit of that JSON file does. Root-caused by reading `src/commands/init.ts` directly. Full account: the VERDICT.md above.

**What it's for, once installed:** a personal-knowledge layer usable from any project (Jarvis, BOOM, Portfolio, TradingView, CausalOps) with synthesis + gap-analysis, not just retrieval — makes `memsearch` and `context-sync` both redundant once adopted.

**WSL vs. Windows split:** GBrain is a genuine global, project-agnostic memory layer — per `_docs/Design.md`'s own global test, it doesn't fit the "WSL = project-specific / Windows = Jarvis-specific" split cleanly, because a memory layer needs to be visible from *every* Claude Code entry point, WSL and Windows alike, not routed to one side. Its data (`~/.gbrain/`) currently only exists on WSL because that's where the sandbox test ran; both homes are the real target.

## gstack — ~34 commands + 55 generated skills (Playwright-based)

**Install state: blocked.** Cited to `Tool Map.md`'s "gstack" row. `./setup` compiled binaries, generated 55 skills, downloaded a 278MB Chromium build, then failed: `gstack setup failed: Playwright Chromium could not be launched` — missing WSL system libraries (`libnss3.so` confirmed missing via `60_Claude/scripts/check_dependency.py --preset gstack`, everything else present). Neither `~/.claude/skills/gstack` nor `~/.claude/commands/gstack*` exist — setup aborted before its own registration step.

**Fix, not yet run (needs an interactive terminal with `sudo`):**
```bash
sudo apt-get update && sudo apt-get install -y libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libasound2
cd ~/projects/ai/claude/second-brain-claudekit/sandbox/gstack && ./setup
```

**What it's for, once unblocked:** global by design (its own `./setup` targets Claude Code, Codex, Factory, and OpenCode simultaneously) — Playwright-based browse/design/PDF tooling, 55 skills.

**WSL vs. Windows split:** gstack's blocker (`libnss3.so`, a Linux shared library) is WSL-specific — this is squarely a WSL-side install once unblocked, not a Windows one; the same Chromium/Playwright dependency chain would need a different fix path on native Windows.

## Links
[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the authoritative, dated pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for where both sit in the wider inventory.
