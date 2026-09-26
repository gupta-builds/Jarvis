---
type: project-brief
status: evergreen
created: 2026-09-26
updated: 2026-09-26
repo: Portfolio
graphify_version: 0.9.69
tags:
  - evergreen
  - graphify
  - codex
  - mcp
  - obsidian
  - knowledge-graph
  - portfolio
notes:
  - "[[60_Claude/40_Project_Briefs/How to use Graphify]]"
  - "[[40_Resources/CS/Concepts/Helpful Tools/Graphify]]"
  - "[[40_Resources/CS/AI/Workflows/Claude Code/Graphify Workflow]]"
  - "[[60_Claude/40_Project_Briefs/Graphify — Internship Research Loop Implementation]]"
  - "[[20_Progress/Internship/Building System/Source of Truth]]"
next: "Build the curated Portfolio brief compiler and ownership manifest described here; do not run a raw graphify Obsidian export into Jarvis."
---
# Graphify — In-depth Usage for Portfolio and Jarvis

==Graphify should be the machine-readable structural index for this codebase, while a small, stable set of curated Jarvis notes should be the human- and agent-readable explanation layer. Do not repeat the Internship design of exporting one Obsidian note per graph node as the primary documentation system.==

This note is the researched, verified operating manual for using Graphify with the Portfolio repository and Jarvis. It combines the existing Jarvis guidance, the real Internship implementation and failure history, Graphify 0.9.69's installed Codex skill and source, the official README/help pages, a live rebuild of this repository, a live MCP handshake, and queries against the resulting graph.

## Decisions — Read These First

1. **Use Graphify as an index, not as the finished documentation.** `graphify-out/graph.json` is the machine source for structural queries. Jarvis should contain durable narrative notes with real context, decisions, file ownership, failure modes, and verified links.
2. **Do not export the Portfolio graph directly into the Jarvis vault root.** Graphify's Obsidian exporter intentionally creates one note per node plus community notes. On this codebase that would produce well over a thousand mostly skeletal notes.
3. **Do not mix generated and authored content in the same folder.** If a raw Obsidian export is ever needed for debugging, place it under a clearly generated, disposable namespace such as `60_Claude/40_Project_Briefs/_Generated/Portfolio Graph/`. The proposed curated folder is separate.
4. **Code sync and semantic documentation sync are different systems.** Git hooks can rebuild code structure with zero LLM cost. README, PRD, policy, image, PDF, and rationale changes require a semantic `$graphify . --update` run or a configured headless model backend.
5. **Query first, verify second.** Use the graph to find the relevant path and files, then read the authoritative files before changing behavior. The graph narrows the search; it is not a substitute for checking the implementation.
6. **Stable note names beat generated node names.** A note should represent a durable subsystem such as “Portfolio — Chat Runtime and Grounding,” not a function, test name, sentence fragment, or current community label.
7. **The Portfolio needs a two-layer knowledge system.** Graphify answers “what connects to what?” Curated notes answer “why does this exist, what are its contracts, how does it fail, and which files must change together?”

## Verified Live State — 2026-09-26

| Item | Verified state |
|---|---|
| Repository | `/home/anant_gupta/projects/hub/portfolio` |
| Graphify package | `graphifyy 0.9.69`, installed globally as an isolated `uv tool` |
| CLI | `/home/anant_gupta/.local/bin/graphify` |
| Runtime | Python from `/home/anant_gupta/.local/share/uv/tools/graphifyy/bin/python` |
| MCP dependencies | `mcp 2.2.0` and `anyio 4.15.1` |
| Codex skill | Global `~/.codex/skills/graphify/`, version 0.9.69 |
| Claude skill | Global `~/.claude/skills/graphify/`, refreshed to 0.9.69 |
| Generic agent skill | Global `~/.agents/skills/graphify/`, refreshed to 0.9.69 |
| Codex MCP registration | Global server named `graphify`, stdio transport |
| MCP default graph | This repo's absolute `graphify-out/graph.json` |
| MCP smoke test | Initialize succeeded; ten tools listed; `graph_stats` succeeded |
| Current graph | 1,177 nodes, 2,126 edges, 78 communities |
| Integrity diagnostic | 0 missing endpoints, 0 dangling endpoints, 0 collapsed edges, 3 self-loops |
| Corpus report | 218 files, about 122,473 words |
| Measured query reduction | 9.9× fewer tokens per benchmark query than reading the full corpus |
| Git automation | Official `post-commit` and `post-checkout` hooks installed |
| Pull/merge automation | Custom machine-local `post-merge` hook installed |
| Merge driver | Registered; `graphify-out/graph.json merge=graphify` written to `.gitattributes` |
| Repo graph policy | `graphify-out/` is currently ignored by `.gitignore`, so the graph is local-only unless that policy is deliberately changed |
| Semantic label state | Structural graph is current; community labels should be refreshed after the next semantic build |
| Important blind spot | `src/app/globals.css` is unclassified by the current extractor, despite being central to this Tailwind v4 design system |

The successful MCP smoke test returned:

~~~text
SERVER: graphify 0.9.69
TOOLS: query_graph, get_node, get_neighbors, get_community,
       god_nodes, graph_stats, shortest_path,
       list_prs, get_pr_impact, triage_prs

Nodes: 1177
Edges: 2126
Communities: 78
EXTRACTED: 100%
INFERRED: 0%
AMBIGUOUS: 0%
~~~

The configured MCP command is intentionally absolute:

~~~bash
codex mcp add graphify -- \
  /home/anant_gupta/.local/share/uv/tools/graphifyy/bin/python \
  -m graphify.serve \
  /home/anant_gupta/projects/hub/portfolio/graphify-out/graph.json
~~~

This avoids the exact cross-repo interpreter failure observed during setup: the ambient `python -m graphify.serve` resolved through the Internship repository's virtualenv and could not import Graphify. Never use an unqualified ambient interpreter for the global MCP entry.

A Codex restart or new session is required for a newly added MCP server to appear in the session's tool list. Once the server is running, Graphify 0.9.69 hot-reloads `graph.json` when its modification time or size changes, so a graph rebuild does not require restarting the long-lived MCP process.

## What The Existing Jarvis Material Already Established

The following notes were read as the prior source of truth:

- [[60_Claude/40_Project_Briefs/How to use Graphify]]
- [[40_Resources/CS/Concepts/Helpful Tools/Graphify]]
- [[40_Resources/CS/AI/Workflows/Claude Code/Graphify Workflow]]
- [[60_Claude/40_Project_Briefs/Graphify — Internship Research Loop Implementation]]
- [[20_Progress/Internship/Building System/Source of Truth]]
- [[20_Progress/Internship/Building System/Research Loop - Implementation Plan]]
- [[20_Progress/Internship/Building System/Research Loop - Improvement Plan]]
- [[20_Progress/Internship/Building System/Research Loop - Resources]]
- [[20_Progress/Internship/Building System/System - Build Log]]

Those notes correctly established several durable facts:

- The official PyPI package is `graphifyy`; the executable is `graphify`.
- Code extraction is deterministic and local via tree-sitter AST.
- Docs, papers, images, and other semantic material require the assistant or a configured model backend.
- `graphify update` is the zero-LLM code path used by hooks.
- `graphify hook install` manages post-commit, post-checkout, and the graph merge driver.
- Commits arriving from another machine or CI need a post-merge complement.
- A raw Obsidian export is generated material and must not be treated as hand-authored knowledge.
- Old Graphify releases had real merge-driver and Obsidian-orphan bugs; version drift must be checked before diagnosing graph behavior.
- Graphify output ownership and a manifest are mandatory for safe cleanup.

This session extends that work with current 0.9.69 behavior, Codex-specific installation, an MCP validation, a fresh Portfolio graph, and a better vault architecture.

## Why The Internship Folder Is Not The Pattern To Repeat

The current Internship mirror contains:

- 1,395 Markdown notes
- 86 `_COMMUNITY_*.md` notes
- 437 notes whose filenames begin with `test_`
- 84 notes whose filenames begin with a numbered heading
- 128 suffix-duplicate notes such as `_1.md`
- sentence-fragment notes derived from comments and rationale text

Representative examples confirm the problem:

- `Internship Research Loop — PRD.md` is a generated node stub containing frontmatter and a list of links, not the PRD's useful prose.
- `_COMMUNITY_Internship Research Loop — PRD.md` repeats the same membership as a Dataview list.
- `test_run_once_happy_path_marks_seen_and_writes_dossiers().md` contains only the test node and two connections.
- `A bucket with 0 eligible candidates this run must not let another bucket's i.md` is a sentence fragment promoted to a file.
- `writer.py.md` is structurally useful, but it links to more than twenty additional generated symbol files instead of explaining the writer's responsibility, invariants, and write-gate behavior.

The raw graph is valuable. The note granularity is not.

The official Graphify issue tracker independently confirms the same weakness: [issue #1968](https://github.com/Graphify-Labs/graphify/issues/1968) reports that Obsidian node notes are bare frontmatter-plus-connections stubs with no source substance. Historical [issue #1896](https://github.com/Graphify-Labs/graphify/issues/1896) documents stale notes from removed nodes, while [issue #1506](https://github.com/Graphify-Labs/graphify/issues/1506) documents risks when exporting directly into an existing vault. Windows path-length concerns remain documented in [issue #2655](https://github.com/Graphify-Labs/graphify/issues/2655).

The Internship implementation still gives us useful engineering patterns:

- one-way sync from repo to vault
- explicit generated-file ownership
- a manifest
- post-commit, post-checkout, and post-merge triggers
- a shared log
- background, non-blocking rebuilds
- health checks comparing graph nodes, manifest entries, and files on disk
- Git as a safety net before deleting generated notes

The improvement is to apply those mechanics to **curated subsystem notes**, not to one-file-per-node output.

## Mental Model — Five Layers

~~~text
repository source
    ↓
deterministic + semantic extraction
    ↓
graphify-out/graph.json
    ↓
MCP / CLI traversal
    ↓
curated Portfolio notes in Jarvis
~~~

### Layer 1 — Repository source

The codebase is authoritative. Graph nodes must always point back to concrete files and locations. Remote Sanity documents are a separate source of truth: Graphify sees the schemas, GROQ queries, types, and consuming components, but it does not automatically see the current production documents stored in Sanity.

### Layer 2 — Extraction

Graphify combines:

- deterministic AST extraction for code, configuration, many data formats, and source relations
- semantic extraction for docs, papers, images, and rationale
- local transcription for video/audio when the optional extra is installed
- community detection over the resulting graph

A code-only update costs no LLM tokens. A semantic update can cost model tokens and should be deliberate.

### Layer 3 — The graph

`graphify-out/graph.json` is the canonical machine graph. Nodes include an ID, human label, type, source file, source location, and community. Edges include source, target, relation, confidence, score, source file, and location. Hyperedges represent a shared relation across three or more nodes.

Confidence is part of the truth contract:

| Confidence | Meaning | Use |
|---|---|---|
| `EXTRACTED` | Explicit import, call, citation, containment, or other source evidence | Treat as strong structural evidence |
| `INFERRED` | A reasoned semantic connection | Verify before making a consequential change |
| `AMBIGUOUS` | Deliberately uncertain | Treat as a research lead, never as fact |

### Layer 4 — Query surfaces

The graph can be traversed through MCP or the shell CLI. Query results are bounded subgraphs, not prose answers. The agent must interpret the returned nodes and edges and cite the relevant files.

### Layer 5 — Curated Jarvis notes

Curated notes explain subsystem purpose, flows, contracts, failure modes, and change coupling. Their filenames and identities are stable. Graphify helps identify what should be linked or refreshed, but it does not choose the final note boundaries by itself.

## Three Different Graphify Interfaces

Do not conflate these interfaces.

### 1. Assistant skill

In Codex, invoke the installed skill as `$graphify`. Other assistants often use `/graphify`.

Examples:

~~~text
$graphify .
$graphify . --update
$graphify . --mode deep
$graphify query "how does the chat route ground answers?"
~~~

The skill orchestrates detection, AST extraction, semantic extraction, subagents, clustering, labeling, exports, cleanup, and reporting. It is the correct surface for a mixed code-and-doc corpus when semantic material must be refreshed.

### 2. Shell CLI

The shell CLI is explicit and deterministic:

~~~bash
graphify update .
graphify query "chat grounding tools"
graphify path "POST()" "sanityFetch"
graphify explain "buildSystemPrompt()"
graphify affected "sanityFetch" --depth 3
graphify god-nodes --top 20
graphify diagnose multigraph
graphify benchmark graphify-out/graph.json
graphify cluster-only .
graphify label .
graphify check-update .
graphify save-result ...
graphify reflect --if-stale
graphify export obsidian --dir <generated-folder>
~~~

A common error is typing the assistant-style `/graphify .` in a shell. The leading-slash form belongs to the assistant skill, not the packaged shell subcommand parser.

### 3. MCP server

The MCP server exposes a read-only, structured graph API to an agent. It is ideal for repeated architecture navigation because it avoids shell parsing and returns bounded tool results.

Every MCP tool in 0.9.69 also accepts optional `project_path`. The globally registered server defaults to Portfolio, but it can serve another already-built repository graph by receiving that repository's absolute path. Graph contexts are cached and hot-reloaded.

## MCP Tools — Exact Use

### `graph_stats`

Start here. It establishes graph size, community count, and confidence distribution. Large unexpected count swings are a freshness or extraction warning.

### `god_nodes`

Returns the most connected nodes. For this Portfolio, raw results are dominated by generic hubs such as `react`, `vitest`, and `cn()`. Use `exclude_hubs_percentile` when you want application-specific architecture instead of package hubs.

Good use:

~~~json
{"top_n": 20, "exclude_hubs_percentile": 98}
~~~

### `query_graph`

Use BFS for broad neighborhood questions and DFS for dependency or flow tracing.

Parameters:

- `question`: use vocabulary that appears in the repo
- `mode`: `bfs` for breadth, `dfs` for a path-like trace
- `depth`: start at 2; increase only if the answer is incomplete
- `token_budget`: 1,200–2,500 for ordinary queries; raise after narrowing
- `context_filter`: filter relations such as `call`, `import`, `field`, or another observed edge context

Portfolio example:

~~~json
{
  "question": "chat route grounding tools sanity persona",
  "mode": "bfs",
  "depth": 2,
  "token_budget": 1800,
  "context_filter": ["call", "import"]
}
~~~

Do not start with depth 6 and a huge budget. That recreates the context problem Graphify is meant to solve.

### `get_node`

Resolve a specific label or ID and read its source, type, community, and degree. Use this after a broad query surfaces the likely entry point.

Examples:

~~~json
{"label":"POST()"}
{"node_id":"src_app_api_chat_route_post"}
~~~

### `get_neighbors`

Inspect one node's direct incoming and outgoing relationships. Use `relation_filter` to answer questions like “who calls this?” or “what does this import?”

~~~json
{"label":"buildSystemPrompt()","relation_filter":"call","token_budget":1600}
~~~

### `shortest_path`

Use for “how does A reach B?” It follows stored direction by default. Retry with `undirected: true` only when the conceptual relationship matters more than call direction, and say that direction was relaxed.

~~~json
{
  "source":"POST()",
  "target":"sanityFetch",
  "max_hops":8,
  "undirected":false
}
~~~

### `get_community`

Use after a node lookup reveals a relevant community ID. It is good for enumerating a subsystem, but community membership alone does not explain responsibility or runtime order.

### PR tools

- `list_prs`: open PRs, CI state, review state, and graph impact
- `get_pr_impact`: changed files, touched communities, and blast radius for one PR
- `triage_prs`: actionable PRs ranked with graph impact

These require GitHub CLI access and authentication. Use them before modifying a heavily connected subsystem or deciding merge order.

## Query Discipline For AI

### Start with the graph's vocabulary

Graphify's CLI matching is lexical. It does not perform embedding search, automatic synonym expansion, or arbitrary cross-language matching. If a query produces noise or no results:

1. run a broad, low-depth query with concrete repo terms
2. inspect labels returned by `god_nodes` or `query_graph`
3. rerun with exact labels such as `sanityFetch`, `PortfolioContent()`, `POST()`, `buildChatTools()`, or `useAnimationGate()`
4. narrow by relation
5. retrieve the exact node and neighbors
6. read the authoritative files

### Portfolio query sequence

For “How does the AI Lab answer a grounded question?”:

1. `graph_stats`
2. `query_graph("chat route grounding tools sanity persona", bfs, depth 2)`
3. `get_node("POST()")`
4. `get_neighbors("POST()", relation_filter="call")`
5. `get_node("buildSystemPrompt()")`
6. `get_node("fetchCatalog()")`
7. `get_node("buildChatTools()")`
8. read:
   - `src/app/api/chat/route.ts`
   - `src/lib/chat-context.ts`
   - `src/lib/chat-tools.ts`
   - `src/lib/model-router.ts`
   - `src/lib/degraded-responses.ts`
9. answer with file locations and separate extracted facts from inference

For “What changes together when modifying the 3D header logo?”:

1. query `HeaderLogo HeaderLogoCanvas liquidMetal useAnimationGate logoTexture`
2. inspect `HeaderLogoCanvas()` and its community
3. traverse neighbors with call/import filters
4. inspect related property and integration tests
5. include `src/app/globals.css` manually because CSS is absent from the graph

### Answer contract

Every graph-based codebase answer should state:

- the entry node or nodes
- the path or important edges
- whether evidence is extracted, inferred, or ambiguous
- source files and locations
- what the graph could not represent
- which raw files were checked before recommending a change

### Save useful and failed traversals

Graphify supports a work-memory loop:

~~~bash
graphify save-result \
  --question "How does the chat route ground answers?" \
  --answer "<concise evidence-backed answer>" \
  --type query \
  --nodes "POST()" "buildSystemPrompt()" "fetchCatalog()" \
  --outcome useful

graphify save-result \
  --question "<question>" \
  --answer "<what was attempted>" \
  --type query \
  --nodes "<nodes>" \
  --outcome corrected \
  --correction "<the correct explanation>"

graphify reflect --if-stale
~~~

Read `graphify-out/reflections/LESSONS.md` at the start of future graph-heavy work. It records preferred sources, dead ends, and corrections. This feedback belongs in the generated graph layer, not as dozens of vault files.

## Build And Update Commands — When To Use Each

| Situation | Correct action | Why |
|---|---|---|
| No graph exists | `$graphify .` | Full mixed-corpus pipeline |
| Existing graph, code changed | `graphify update .` | Deterministic AST update, no LLM |
| Existing graph, docs/README/PRD changed | `$graphify . --update` | Semantic extraction is required |
| Need richer inferred semantic edges | `$graphify . --mode deep` | More expensive; use only for a real need |
| Community membership is useful but names are poor | `graphify label .` | Refresh semantic names |
| Communities changed after structural rebuild | `graphify cluster-only .`, then label if needed | Recluster without rereading source |
| Intentional deletion/refactor makes graph smaller | `graphify update . --force` only after verifying deletions | Bypasses shrink protection |
| Very large graph, visualization is costly | use `--no-viz` | Query JSON/MCP instead |
| Need continuous local code updates while editing | `$graphify . --watch` | Watcher updates code, flags semantic changes |
| Need one URL added to corpus | `$graphify add <url>` | Ingest then semantic update |
| Need cross-repo view | build each graph, then `graphify merge-graphs` | Preserves repo origin |
| Need dependency blast radius | `graphify affected "<node>" --depth N` | Reverse traversal |
| Need direct relationship | `graphify path "A" "B"` | Shortest path |
| Need one concept explained | `graphify explain "X"` | Node plus neighbors |

### Parameter tuning

- Start query depth at 2. Depth 3 is usually enough. Depth 4–6 is for a specific DFS trace.
- Start token budgets at 1,200–2,000. Narrow before raising.
- Use `--mode deep` for docs, ADRs, and cross-domain reasoning, not ordinary code rebuilds.
- Use `--code-only` in headless CI when semantic material is intentionally excluded.
- Use `--no-cluster` when testing extraction or handling an exceptionally large flat corpus.
- Use `GRAPHIFY_MAX_WORKERS` to cap extraction parallelism on constrained machines.
- Keep `PYTHONHASHSEED=0` for deterministic community assignments; current hooks set it.
- Use `GRAPHIFY_OUT` only if the output folder is deliberately renamed across the entire setup.
- Never use `--force` merely because node counts differ. First determine which files disappeared and whether ignore rules changed.

## Files In graphify-out And Their Roles

| File | Role | Commit? |
|---|---|---|
| `graph.json` | Canonical graph and MCP input | Official team flow says yes; this repo currently ignores it |
| `GRAPH_REPORT.md` | Human architecture summary | Same policy as graph |
| `graph.html` | Interactive visualization | Optional; often too large/noisy to commit |
| `manifest.json` | File hashes and update baseline | Keep with a committed graph; portable keys |
| `.graphify_labels.json` | Curated community labels | Keep if labels matter |
| `cache/` | Extraction cache | Optional; useful for speed, can be local |
| `cost.json` | Per-run semantic token accounting | Local |
| `memory/` | Saved Q&A outcomes | Generated work memory |
| `reflections/LESSONS.md` | Deterministic summary of query outcomes | Generated but useful to agents |
| `.needs_update` | Semantic-update signal | Machine-local |
| dated backup directory | Safety backup made before replacing curated graph outputs | Machine-local; do not let these accumulate in version control |
| `.rebuild.lock` / pending state | Concurrency coordination | Machine-local |

This repo currently ignores the entire `graphify-out/` folder. That means:

- the MCP works locally
- hooks refresh the local graph
- other clones do not receive the graph
- the merge driver has no practical effect until `graph.json` becomes tracked
- every machine must build its own graph
- the team-setup procedure in the official README is not active here

Do not change this policy casually. A future decision should explicitly choose one of:

1. **Local graph policy:** keep `graphify-out/` ignored; each machine builds locally; remove unnecessary versioned merge attributes.
2. **Shared graph policy:** track `graph.json`, `manifest.json`, `GRAPH_REPORT.md`, and labels; ignore cache, costs, locks, backups, and machine paths; keep the merge driver.

For a solo portfolio repository, local graph plus global MCP is reasonable. For repeated multi-agent or multi-machine work, the shared graph policy is more reliable.

## Automatic Update Matrix

| Event | What happens now | Limitation |
|---|---|---|
| Local commit | Official post-commit hook launches background code rebuild | Semantic docs are not refreshed |
| Branch switch | Official post-checkout hook launches a full code graph rebuild | Only real branch switches |
| Pull/merge | Custom post-merge hook launches `graphify update .` | Code graph only |
| Uncommitted code edit | No hook until commit; optional watcher can cover it | MCP may be stale during the edit |
| README/PRD/Markdown edit | Not semantically rebuilt by code hooks | Run `$graphify . --update` |
| CSS edit | Current extractor does not classify `globals.css` | Curated design note and raw CSS inspection required |
| Remote Sanity content edit | Repository graph does not see remote document values | Query Sanity separately; refresh content notes from CMS |
| Graph file replacement | MCP hot-reloads on its next tool call | Query already in flight uses its current context |
| Graphify package upgrade | Hooks keep their old embedded interpreter until reinstalled | Run `graphify hook install` again |
| New Codex MCP registration | Existing session does not gain the tool dynamically | Start a new Codex session |

The installed post-merge hook logs Portfolio runs to:

~~~text
~/.cache/graphify-portfolio-rebuild.log
~~~

The official post-commit/post-checkout hooks use Graphify's standard rebuild log. Keep repository-specific logs separate; the shared Internship log was too ambiguous during diagnosis.

## Recommended Portfolio Knowledge Architecture

Create a curated folder only after the note contract and sync tool are built:

~~~text
60_Claude/40_Project_Briefs/Portfolio/
  00 Portfolio — Codebase Map.md
  01 Routing, Rendering, and Server Boundaries.md
  02 Sanity Content Model and Query Flow.md
  03 Page Composition and Content Sections.md
  04 Portfolio Lab — Agent Runtime and Grounding.md
  05 API Security, Auth, Rate Limits, and Degraded Mode.md
  06 Three.js, Motion, and Animation Performance.md
  07 Design System, Accessibility, and Responsive Behavior.md
  08 Orby State, Navigation, and Commentary.md
  09 Testing, Prompt Evals, and Quality Gates.md
  10 Deployment, Preview, and Operational Runbook.md
  Decisions/
  Runs/
~~~

This is a starting map, not a mandate to create all files immediately. Create a note only when it can carry a durable responsibility boundary and real evidence.

### 00 Portfolio — Codebase Map

Purpose: the MOC, system boundary, primary flows, note ownership table, and freshness status.

Key sources:

- `package.json`
- `next.config.ts`
- `src/app/layout.tsx`
- `src/app/(portfolio)/layout.tsx`
- `src/app/(portfolio)/page.tsx`
- `src/components/PortfolioContent.tsx`
- `README.md`

### 01 Routing, Rendering, and Server Boundaries

Purpose: App Router tree, server/client boundaries, providers, auth routes, Studio, draft mode, revalidation, sitemap, robots, and privacy.

Key sources:

- `src/app/layout.tsx`
- `src/app/(portfolio)/layout.tsx`
- `src/app/(portfolio)/page.tsx`
- `src/components/Providers.tsx`
- `src/proxy.ts`
- `src/app/studio/[[...tool]]/page.tsx`
- `src/app/api/draft-mode/enable/route.ts`
- `src/app/api/revalidate/route.ts`

### 02 Sanity Content Model and Query Flow

Purpose: schemas → GROQ → generated result types → server fetch → section components; identify which content is remote and which behavior is local.

Key sources:

- `src/sanity/schemaTypes/*.ts`
- `src/sanity/lib/queries.ts`
- `src/sanity/lib/live.ts`
- `src/sanity/lib/server-client.ts`
- `src/sanity/types/index.ts`
- `src/components/PortfolioContent.tsx`
- `src/components/three/ProjectsSlider.tsx`
- `src/components/sections/*.tsx`

### 03 Page Composition and Content Sections

Purpose: section order, data props, component ownership, kicker conventions, navigation anchors, and fallbacks.

Key sources:

- `src/components/PortfolioContent.tsx`
- `src/components/HeaderScrolling.tsx`
- `src/components/Footer.tsx`
- `src/components/sections/*.tsx`
- `src/components/cards/ExperienceCard.tsx`
- `src/components/BlogFeed.tsx`

### 04 Portfolio Lab — Agent Runtime and Grounding

Purpose: request lifecycle, catalog construction, system prompt, tool schemas, persona layer, model routing, evidence rendering, and refusal/fail-safe behavior.

Key sources:

- `src/app/api/chat/route.ts`
- `src/lib/chat-context.ts`
- `src/lib/chat-tools.ts`
- `src/lib/model-router.ts`
- `src/lib/personas/index.ts`
- `src/lib/fixed-prompts.ts`
- `src/lib/degraded-responses.ts`
- `src/components/lab/PortfolioLab.tsx`
- `src/components/lab/cards/ToolResultRenderer.tsx`

### 05 API Security, Auth, Rate Limits, and Degraded Mode

Purpose: Clerk boundaries, origin checks, request guards, chat tokens, Upstash rate limiting, security headers, public endpoints, and failure behavior.

Key sources:

- `src/proxy.ts`
- `src/lib/request-guards.ts`
- `src/lib/chat-token.ts`
- `src/app/api/chat-token/route.ts`
- `src/app/api/chat/route.ts`
- `src/app/api/orby-comment/route.ts`
- `src/app/api/error-report/route.ts`
- `next.config.ts`

### 06 Three.js, Motion, and Animation Performance

Purpose: R3F canvas ownership, reduced-motion gate, WebGL fallback, object lifecycles, particle counts, texture/material generation, GSAP pinning, and test-backed invariants.

Key sources:

- `src/components/three/ObsidianBackground.tsx`
- `src/components/three/ObsidianBackgroundCanvas.tsx`
- `src/components/three/HeaderLogo.tsx`
- `src/components/three/HeaderLogoCanvas.tsx`
- `src/components/three/liquidMetalMaterial.ts`
- `src/components/three/ProjectsSlider.tsx`
- `src/hooks/useAnimationGate.ts`
- `src/hooks/useLogoTexture.ts`
- `src/lib/logoTexture.ts`
- `src/lib/gsap/projects-pin.ts`
- `src/components/three/__tests__/*`

### 07 Design System, Accessibility, and Responsive Behavior

Purpose: cosmic-card/float-btn contracts, Tailwind v4 CSS-first tokens, focus behavior, icon labels, mobile adaptations, and reduced motion.

Key sources:

- `src/app/globals.css` — manually read; not represented in the current graph
- `src/components/ui/comet-card.tsx`
- `src/components/ui/sidebar.tsx`
- `src/components/ui/sheet.tsx`
- `src/components/sections/*`
- `src/components/__tests__/icon-button-accessibility.test.ts`
- `src/hooks/use-mobile.ts`

### 08 Orby State, Navigation, and Commentary

Purpose: Orby state machine, scroll-derived state, idle commentary, API fallback, 3D model/canvas, typed speech, and navigation coupling.

Key sources:

- `src/components/orby/Orby.tsx`
- `src/components/orby/useOrbyState.ts`
- `src/components/orby/useScrollProgress.ts`
- `src/components/orby/useOrbyIdleCommentary.ts`
- `src/components/orby/OrbyCanvas.tsx`
- `src/app/api/orby-comment/route.ts`
- Orby tests under `src/components/__tests__/`

### 09 Testing, Prompt Evals, and Quality Gates

Purpose: what each test layer proves, which behavior is deterministic, promptfoo assertions, persona judge coverage, and CI order.

Key sources:

- `vitest.config.ts`
- `playwright.config.ts`
- `src/**/__tests__/*`
- `evals/promptfooconfig.yaml`
- `evals/grounding.yaml`
- `evals/tool-correctness.yaml`
- `evals/injection.yaml`
- `evals/fail-safe.yaml`
- `evals/persona-warmth.yaml`
- `.github/workflows/eval-gate.yml`

### 10 Deployment, Preview, and Operational Runbook

Purpose: build commands, generated types, preview environment, Vercel, Sanity Studio/schema deployment, required secrets by name only, health checks, rollback, and Graphify maintenance.

Key sources:

- `package.json`
- `scripts/set-preview-env.mjs`
- `scripts/patch-sanity-content.mjs`
- `sanity.config.ts`
- `sanity.cli.ts`
- `src/app/api/health/route.ts`
- `.github/workflows/*`
- the repo-local skills under `.agents/skills/`

## Curated Note Contract

Every Portfolio project brief should include:

~~~yaml
---
type: project-brief
status: current
repo: Portfolio
subsystem: <stable subsystem id>
source_commit: <git commit>
graph_built_at: <ISO timestamp>
last_verified: <ISO date>
source_files:
  - src/...
related:
  - "[[...]]"
tags:
  - portfolio
  - architecture
---
~~~

Required body sections:

1. **Purpose** — what responsibility the subsystem owns
2. **Boundary** — what it explicitly does not own
3. **Runtime flow** — ordered entry-to-output flow
4. **Contracts and invariants** — facts future changes must preserve
5. **Data and trust boundaries** — server/client, CMS/local, public/private
6. **Failure and degraded behavior** — what happens when dependencies fail
7. **Change coupling** — files that must usually change together
8. **Verification** — tests, evals, build commands, and expected signals
9. **Authoritative files** — concrete paths with why each matters
10. **Graph evidence** — important nodes/edges, confidence, and source locations
11. **Known gaps** — what Graphify or the note cannot see
12. **Related notes** — meaningful links, not link spam
13. **Refresh triggers** — file patterns or schema changes that make the note stale

A note should be rejected if it only lists files or graph edges. The explanation is the value.

## Proposed Curated Sync Pipeline

The Portfolio vault sync should be custom and manifest-driven. Do not call raw `graphify export obsidian` as the final product.

### Phase 1 — Snapshot and classify

- capture commit SHA and dirty-worktree status
- run `graphify check-update .`
- run deterministic graph update if code changed
- require semantic update if Markdown/README/PRD or other semantic sources changed
- capture Graphify version and graph hash
- detect current Sanity schema/query changes separately from remote Sanity content changes

### Phase 2 — Map changes to note owners

Maintain a small ownership manifest such as:

~~~yaml
src/app/api/chat/**:
  - portfolio-chat-runtime
  - portfolio-security
src/lib/chat-*.ts:
  - portfolio-chat-runtime
src/sanity/**:
  - portfolio-sanity
src/components/three/**:
  - portfolio-three
src/app/globals.css:
  - portfolio-design-system
evals/**:
  - portfolio-quality
~~~

This registry is the stable bridge between unstable graph communities and durable note identities.

### Phase 3 — Gather bounded evidence

For each affected note:

1. query relevant graph vocabulary
2. fetch the owning nodes
3. fetch direct neighbors with relation filters
4. trace one or two critical paths
5. read the concrete source files
6. fetch current Sanity facts when the note documents content rather than structure
7. produce an evidence bundle with file paths, locations, confidence, and graph hash

Do not give a note generator the entire graph.

### Phase 4 — Patch, do not overwrite

- use fixed headings and patch only generated/evidence sections
- preserve authored decisions and explanations
- use Jarvis MCP structured patching with the document version token
- fail on concurrent edits instead of overwriting
- stage all proposed note changes before applying them
- do not delete a note merely because a graph community disappeared

### Phase 5 — Validate before landing

Mechanical gates:

- every `source_files` path exists
- every wikilink resolves
- every note has a unique subsystem ID
- no generated filename is derived from arbitrary node text
- no empty “Connections” stubs
- no note under a minimum context threshold
- no unexpected note-count spike
- no duplicate `_1`/`_2` filenames
- source commit and graph hash are present
- changed-note count is within a configured safety budget
- graph node/edge count swings are explained
- CSS and remote CMS blind spots are explicitly covered
- a dry-run diff is saved to `Runs/`
- only after validation does Jarvis receive patches

### Phase 6 — Record the run

Each run record should include:

- timestamp
- repo and branch
- source commit
- dirty state
- Graphify and MCP versions
- graph node/edge/community counts
- files changed since the prior run
- notes refreshed
- skipped notes and why
- validation results
- semantic token cost
- links to the prior and next run

This is a far more useful audit trail than thousands of generated node files.

## Trigger Strategy

Use three cadences:

### Immediate structural sync

- post-commit
- post-checkout
- post-merge
- optional foreground watcher while actively editing

Result: `graph.json` stays structurally current.

### Semantic sync

Run `$graphify . --update` when:

- README, MEMORY, AGENTS, PRD, or architecture docs change
- new docs, images, PDFs, or rationale are introduced
- community labels are stale after a major refactor
- the curated-note compiler needs current semantic edges

This can be scheduled only if a headless backend and credentials are intentionally configured. Do not pretend a zero-LLM hook can semantically understand documentation.

### Curated note sync

Run after:

- a meaningful subsystem change
- a schema/query contract change
- a security or API route change
- a Three.js performance architecture change
- an eval or deployment pipeline change
- a weekly drift check if the repo was active

Do not update curated notes on every formatting-only commit.

## Portfolio-Specific Graph Findings

The current graph is healthy enough to navigate and already surfaces the major subsystems:

- `sanityFetch` is a high-degree application hub
- `POST()` in the chat route connects to `buildSystemPrompt()`, `fetchCatalog()`, `verifyToken()`, and `buildChatTools()`
- `PortfolioContent()` connects content queries to page sections
- `ProjectsSlider()` connects Sanity project data, Framer Motion/GSAP behavior, cards, and UI primitives
- `useAnimationGate()` and the logo/Three.js tests form a real reduced-motion and lifecycle boundary
- Orby forms several related but distinct communities: state, canvas/model, speech/commentary, and API behavior
- tests and package references create generic high-degree hubs, so hub suppression and relation filtering are important

The current graph also exposes limitations:

1. **`globals.css` is missing.** Tailwind v4 and the visual identity live there. A design-system note must read it directly.
2. **A stray `mnt/c/Users/Anant Gupta/cursor-repair-handoff.md` exists inside the repo tree.** It pollutes the corpus and should be excluded through `.graphifyignore` unless it is deliberately part of the codebase.
3. **Community names currently use many file hubs.** They are structurally usable, but a semantic labeling pass would make navigation clearer.
4. **The graph was rebuilt against a dirty worktree.** It describes the current files, while the report's commit line can only name the last commit. Curated notes must record both commit and dirty state.
5. **Remote Sanity content is absent.** The graph maps the pipeline, not the current production entries.
6. **Generated Sanity types are noisy but useful.** Keep them for result-shape tracing, but do not let them define note boundaries.
7. **Repo skills and commands are graph-visible.** This is useful for operations documentation; keep them unless the goal is a runtime-only graph.

## Recommended .graphifyignore Policy

Create a repo-level `.graphifyignore` before the next full build. Start with:

~~~gitignore
mnt/
graphify-out/
.next/
coverage/
dist/
e2e-screenshots/
test-results/
~~~

Do not automatically exclude:

- `src/sanity/types/index.ts` — generated, but important for query result shapes
- `evals/` — essential to the AI Lab's behavior contract
- `.agents/skills/` — useful for deployment and maintenance topology
- `README.md` and `MEMORY.md` — useful semantic sources, but they need an assistant update

After adding ignore rules, run a full update and verify any graph shrink before using `--force`.

## Failure Runbook

### MCP server does not appear in Codex

1. start a new Codex session
2. run `codex mcp get graphify`
3. confirm the command uses the absolute Graphify uv-tool interpreter
4. confirm the absolute `graph.json` exists
5. run the direct MCP initialize/list-tools/`graph_stats` smoke test outside a restrictive command sandbox
6. distinguish a transport failure from a client test harness blocked by sandboxed worker threads

### `python -m graphify.serve` says Graphify is missing

The wrong Python is being used. Use the absolute interpreter from the Graphify uv tool. Do not rely on an activated project virtualenv.

### Graph is structurally stale

- compare graph mtime with source changes
- inspect `~/.cache/graphify-rebuild.log` and the Portfolio post-merge log
- run `graphify update .`
- confirm `graph_stats` changes or reports an honest no-op

### Docs are stale but code graph is current

Run `$graphify . --update`. Git hooks are not semantic agents.

### Node count drops sharply

- check file deletions
- check new ignore rules
- check scan root
- check package version
- inspect the backup
- run diagnostics
- use `--force` only when the shrink is intentional

### Community names look wrong

Run clustering/label refresh. A structural rebuild can change community membership without providing semantic names.

### Query returns generic React/Vitest noise

- lower depth
- use exact application labels
- filter relations
- suppress hub percentile in `god_nodes`
- use `get_node` and `get_neighbors` rather than one giant broad query

### Obsidian export produces too many notes

That is expected behavior, not a query failure. Delete only manifest-owned generated output, and switch to the curated sync design in this note.

### Generated note counts diverge

For any raw-export sandbox, compare:

- graph node count
- export manifest count
- actual Markdown count
- community-note count

Investigate before deleting. Use Git history to prove a file is generated.

### Graphify upgrade creates warnings

Refresh each installed platform explicitly and reinstall hooks:

~~~bash
uv tool install --upgrade "graphifyy[mcp]"
graphify install --platform codex
graphify install --platform claude
graphify install --platform agents
graphify hook uninstall
graphify hook install
graphify hook status
~~~

## Health Check Checklist

### Installation

- [x] `graphify --version` reports 0.9.69
- [x] global Codex skill version is 0.9.69
- [x] global Claude and generic agent copies are aligned
- [x] Codex `multi_agent = true` is enabled for semantic extraction
- [x] MCP extra is installed
- [x] global Codex MCP registration exists
- [x] live MCP initialize succeeded
- [x] live `graph_stats` call succeeded

### Repository graph

- [x] graph rebuilt on 2026-09-26
- [x] diagnostic shows no missing/dangling/collapsed edges
- [x] post-commit hook installed
- [x] post-checkout hook installed
- [x] merge driver registered
- [x] post-merge hook installed
- [ ] decide local-only versus committed graph policy
- [ ] add `.graphifyignore` and exclude `mnt/`
- [ ] run a semantic update for current docs
- [ ] refresh community labels
- [ ] resolve or document the three self-loops
- [ ] create the curated note ownership manifest
- [ ] build a dry-run curated note compiler
- [ ] validate the compiler before creating the Portfolio folder

### Vault safety

- [x] no raw Portfolio Obsidian node export was created
- [x] only this requested note was authored
- [ ] define the generated staging namespace
- [ ] define per-note stable IDs and source patterns
- [ ] implement version-checked Jarvis patches
- [ ] implement link/frontmatter/source validation
- [ ] add run logs and diff-size safety gates

## Official Sources

- [Graphify official repository and README](https://github.com/Graphify-Labs/graphify)
- [Official PyPI package — graphifyy](https://pypi.org/project/graphifyy/)
- [Official changelog](https://github.com/Graphify-Labs/graphify/blob/v8/CHANGELOG.md)
- [Official MCP server source](https://github.com/Graphify-Labs/graphify/blob/v8/graphify/serve.py)
- [Official Obsidian bare-note issue #1968](https://github.com/Graphify-Labs/graphify/issues/1968)
- [Official Obsidian stale-note issue #1896](https://github.com/Graphify-Labs/graphify/issues/1896)
- [Official existing-vault safety issue #1506](https://github.com/Graphify-Labs/graphify/issues/1506)
- [Official Windows path-length issue #2655](https://github.com/Graphify-Labs/graphify/issues/2655)
- [Model Context Protocol Python SDK](https://github.com/modelcontextprotocol/python-sdk)

## Bottom Line

The Portfolio should not become a second Internship mirror. Its graph is already useful and measurably reduces query context, but raw node export would turn 1,177 graph nodes into a noisy vault rather than a usable codebase brief.

The correct next build is a **curated compiler**:

- Graphify maintains structural truth.
- MCP gives agents fast bounded traversal.
- raw source verifies behavior.
- a stable ownership manifest maps file changes to durable subsystem notes.
- Jarvis receives version-checked patches only after validation.
- code updates are automatic.
- semantic updates are explicit.
- authored context is preserved.
- generated evidence is replaceable.
- note count stays small enough that a human or agent can actually read the system.
