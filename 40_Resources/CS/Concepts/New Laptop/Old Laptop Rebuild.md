---
type: concept
status: seed
created: 2026-11-04
updated: 2026-11-04
course: Life
track:
  - laptop
  - ai-infrastructure
prerequisites:
  - "[[New Laptop Setup]]"
  - "[[Old Laptop Decommission Checklist]]"
used_in: []
evidence: []
tags:
  - concept
related:
  - "[[New Laptop Setup]]"
  - "[[Old Laptop Decommission Checklist]]"
  - "[[second-brain-claudekit-git-clone-and-bootstrap]]"
  - "[[second-brain-claudekit-jarvis-unison-sync]]"
  - "[[second-brain-claudekit-wsl-session-and-jarvis-mcp-build]]"
  - "[[second-brain-claudekit-ignored-state-and-sandbox]]"
next: "Fix gbrain MCP (CONNECTION_CLOSED); update jarvis-memory MCP; evaluate orchestration/hierarchy and humanization-of-text plugins via second-brain-claudekit before finalizing the Acer build"
---
# Old Laptop Rebuild

## One-Line Answer

The Acer build is deliberately on hold while the Dell - the machine this work actually runs on - gets ==a toolkit upgrade pass (MCP fixes plus new orchestration and humanization tooling, done through `second-brain-claudekit`) before the Acer gets finalized==, not in parallel with it.

## Current State (verified 2026-11-04)

Three MCP servers checked this session, one clean, two broken:

- **`gbrain`** (global, `C:\Users\Anant Gupta\.claude.json`, runs via `wsl.exe` invoking a bun script at `~/.claude/skills/gbrain`) - failing with `CONNECTION_CLOSED`.
- **`the-plan`** (global, HTTP, `http://127.0.0.1:27124/mcp/`) - failing with `ECONNREFUSED`. The REST API listener behind it isn't running.
- **`jarvis-memory`** (project-level, this vault's own `.mcp.json`, runs `python 30_Order/System/jarvis-memory/server.py`) - connected, but flagged for an upgrade beyond connectivity. Not just "make it connect" like `gbrain`.

Cleanup done the same session, for context:

- Firecrawl's API key was stale/revoked, rotated, confirmed live with a scrape of `example.com`.
- Dead MCP servers removed. Global: `jarvis-fs`, `the-plan-fs`, `pencil` (plus the orphaned `~/.pencil` folder - no Pencil extension was actually installed in VS Code or Cursor). Project (`.mcp.json`): `obsidian`, `filesystem`, `git`, `fetch` - all redundant with `jarvis`/`jarvis-memory` and Firecrawl; `mcp-server-fetch` in particular is a bare URL-to-markdown tool with no search, crawl, or JS rendering, fully subsumed by Firecrawl.

Surviving inventory after cleanup:

| Scope | Servers |
|---|---|
| Global | `firecrawl`, `jarvis` (vault REST API, working), `the-plan` (failing), `github`, `gbrain` (failing) |
| Project (Jarvis vault) | `jarvis-memory` (working, needs upgrade), `excalidraw` |

## The Plan

Dell gets this toolkit upgrade before the Acer build is locked in:

1. Fix `gbrain` (`CONNECTION_CLOSED`) and get `the-plan` MCP's REST listener running again, then upgrade `jarvis-memory` past basic connectivity.
2. Install new MCP/plugin tooling for **orchestration and hierarchy management** - better structure for multi-agent/subagent work. Exact tools not chosen yet; this note tracks the decision, not the pick.
3. Install new MCP/plugin tooling for **humanization of text** - same spirit as this vault's `anti-slop-editor` agent and `HUMAN_WRITING.md`, but as installed toolkit rather than prompt-level policy. Exact tools not chosen yet.
4. Do all of the above through **`second-brain-claudekit`** (tracked in this vault under `40_Resources/CS/Concepts/New Laptop/Codebases/second-brain-claudekit/`: git-clone-and-bootstrap, ignored-state-and-sandbox, jarvis-unison-sync, wsl-session-and-jarvis-mcp-build). Anant named this repo explicitly as the mechanism to "make sure we do this correctly" - the upgrade runs through its bootstrap/sync process, not ad hoc on the Dell.

Caveat from [[Old Laptop Decommission Checklist]]: that repo was last known to be **22 commits ahead of origin, unpushed, on the Dell**. Account for that unpushed state before any rebuild work touches it - push first, or at least confirm the working tree matches what the rebuild assumes.

## Toolkit Inventory

The full skills/agents/commands catalog already lives elsewhere - don't re-list it here:

- [[Tool Map]] - `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md`
- [[What MCPs]], [[What Agents]], [[What Skills]], [[What Commands]] - `20_Progress/Projects/AI Use/Claude Kit/Toolkit/`

## Open Questions

- Which specific MCP or plugin covers orchestration/hierarchy management - not yet evaluated.
- Which specific MCP or plugin covers humanization of text, and how it should divide labor against the existing `anti-slop-editor` agent - not yet evaluated.
- Whether `the-plan`'s REST listener needs a one-time restart or has a deeper config break - not yet diagnosed.
- Whether the Dell's 22 unpushed `second-brain-claudekit` commits get pushed before or during the rebuild work.

## Evidence From This Vault
- [[New Laptop Setup]] - the Acer's pinned source of truth; this note's hold-and-sequence decision sits alongside it, not inside it.
- [[Old Laptop Decommission Checklist]] - source of the 22-commits-unpushed caveat on `second-brain-claudekit`.
- [[Cross-Laptop Sync - Build Roadmap]] - the sync mechanism this upgrade pass has to stay compatible with.
