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
# Claude Context (Zilliz)

## For future Claude
Real "how Anant actually uses this now" content, written 2026-09-05. Short answer: **run once, for real, against Anant's own Zilliz Cloud cluster — genuinely works — but not yet promotion-decided or compared against plain Grep/Glob.** See [[Graphify]]'s own "Contrast With Nearby Tools" section for how this differs from graphify (structure/graph vs. semantic/embeddings — complementary, not competing, per that note).

## What it is
An MCP server that crawls a codebase, chunks it, embeds it into Milvus, and exposes semantic code search to Claude Code.

## Install state
**Real next step executed, 2026-08-20** — cited to `Tool Map.md`'s sandbox-triage section, `sandbox/claude-context/`. Not promotion-decided.

## The real commands that worked (and the real blocker hit along the way)
```bash
pnpm install
pnpm build:core
```
The real `examples/basic-usage` index+search run hit Anant's existing Zilliz Cloud cluster (`in03-b8880982a4d3a16`) in `STOPPED` state on the first attempt — a named, specific blocker, same discipline as gstack's Chromium blocker. Anant resumed the cluster; the retry succeeded for real: **108 files, 1369 code chunks indexed**, 4 semantic queries all returned topically correct top hits (e.g. "embedding generation" → `packages/core/src/embedding/openai-embedding.ts`).

## What it's for, if promoted
Claims 40% token reduction over full-file loading by letting an agent fetch relevant chunks instead — the framing use case is large codebases (`_docs/Design.md` names it project-scoped to BOOM specifically, blocked there on Milvus/Docker). Whether this beats Grep/Glob for real `second-brain-claudekit`-scale work is still open, not yet tested.

## WSL vs. Windows split
Project-scoped to BOOM (a real code project) per `_docs/Design.md`'s own confirmed decision — WSL-side, not Jarvis/Obsidian-specific.

## Links
[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[Graphify]] for the complementary structure-vs-embeddings comparison. [[40_Resources/CS/Repos|Repos]] for the wider inventory.
