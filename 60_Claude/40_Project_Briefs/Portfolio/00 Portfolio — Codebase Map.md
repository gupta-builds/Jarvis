---
type: codebase-map
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/00 Portfolio — Codebase Map.md
sync: managed
tags: [portfolio, architecture, graphify, ai-context]
---

# 00 Portfolio — Codebase Map

This is the entry point for humans and agents. The application is a Next.js 16 App Router portfolio with Sanity-backed content, a grounded AI lab, and an R3F space interface. Use this map to choose a subsystem note before opening implementation files.

## System at a glance

```text
Sanity documents
  ├─ server sections and metadata ──> portfolio page
  └─ compact catalog ──> grounded chat prompt + closed tools

Root layout ──> global providers ──> portfolio layout
  ├─ sidebar / Portfolio Lab
  ├─ Orby companion
  ├─ chat-token bootstrap
  └─ page content over a fixed R3F background

/api/chat ──> request guards ──> grounded context ──> model router
  ├─ Cerebras → Groq → Mistral
  ├─ closed Sanity-backed tools
  └─ deterministic degraded responses
```

## Where to go

| Question | Read |
|---|---|
| Route groups, layouts, server/client boundaries | [[01 Routing, Rendering, and Server Boundaries]] |
| Content fields, GROQ, live updates, generated types | [[02 Sanity Content Model and Query Flow]] |
| Page order and section responsibilities | [[03 Page Composition and Content Sections]] |
| Chat prompt, tools, personas, provider routing | [[04 Portfolio Lab — Agent Runtime and Grounding]] |
| API defenses, tokens, limits, CSP, fallbacks | [[05 API Security, Auth, Rate Limits, and Degraded Mode]] |
| R3F, shaders, project motion, reduced-motion behavior | [[06 Three.js, Motion, and Animation Performance]] |
| CSS contracts, cards, buttons, accessibility | [[07 Design System, Accessibility, and Responsive Behavior]] |
| Orby state machine and page navigation | [[08 Orby State, Navigation, and Commentary]] |
| Vitest, promptfoo, CI, regression contracts | [[09 Testing, Prompt Evals, and Quality Gates]] |
| Environment, builds, deployment, knowledge sync | [[10 Deployment, Preview, and Operational Runbook]] |

## Architectural invariants

- Content facts originate in Sanity. Components should not become a second content database.
- Server components fetch and shape content; client components own interaction, animation, browser APIs, and local state.
- The chat agent may answer only from its grounded catalog and fixed site context. New factual capability starts with Sanity and the chat catalog, not prompt prose.
- Tool inputs are closed from live catalog values when possible. Tool failures return safe values rather than crashing the stream.
- `prefers-reduced-motion`, mobile load, and WebGL failure are first-class rendering paths.
- The Three.js canvas remains behind readable content; visual surfaces retain the cosmic-card contrast contract.
- Graphify is navigation evidence, not an authority that replaces source verification.

## Deep codebase memory

These curated notes are the orientation layer, not the complete memory corpus. The generated deep layer lives at `graphify-out/codebase-memory/` and is rebuilt by `pnpm knowledge:atlas` or `pnpm knowledge:sync`.

| Deep artifact | Use |
|---|---|
| `README.md` | Entry point and regeneration contract |
| `FILE_INDEX.md` | Every present tracked/unignored repository file |
| `files/` | One substantive dossier per file: purpose, source evidence, symbols, dependencies, dependents, tests, and review signals |
| `COMMUNITY_INDEX.md` | File membership grouped by Graphify community |
| `REVIEW_QUEUE.md` | Deterministic candidates for professional review—not assumed defects |
| `graphify-nodes/` | Graphify’s native symbol/community notes and graph canvas |
| `atlas.json` | Machine-readable file relationships for agents and automation |

Use this note to choose the subsystem, then open its file dossiers for exhaustive review. The native Graphify layer answers symbol-level traversal questions; the file atlas restores the source content and ownership context that native node notes do not carry by themselves.

## Change-routing checklist

1. Identify the owning note from the table above.
2. Use the note’s Graphify recipes to find connected symbols.
3. Read the listed source files before changing behavior.
4. Update Sanity schema, GROQ projection, generated types, and consumers together when content shape changes.
5. Add or adjust focused tests for the invariant being changed.
6. Run the smallest relevant check, then the complete pre-ship sequence.
7. Run `pnpm knowledge:sync` when architecture or ownership documentation changes.
8. For exhaustive review, start from `graphify-out/codebase-memory/REVIEW_QUEUE.md`, verify a signal in the file dossier, then inspect the live source and tests.

## Graphify query recipes

```bash
graphify query "PortfolioContent server client boundaries Sanity chat Orby" --context import --budget 3000
graphify god-nodes --top 20 --json
graphify path "PortfolioContent()" "POST()"
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1147 nodes / 2163 edges**
- This subsystem: **6 files / 159 nodes / 519 touching edges**
- Leading communities: `dependencies` (36), `package.json` (27), `devDependencies` (21), `scripts` (16), `Anant Gupta Portfolio` (9), `sanityFetch` (8)

### High-connectivity symbols

- `package.json` — `package.json:L1` (degree 62)
- `react` — `package.json:L57` (degree 52)
- `vitest` — `package.json:L86` (degree 43)
- `dependencies` — `package.json:L29` (degree 36)
- `next` — `package.json:L54` (degree 27)
- `devDependencies` — `package.json:L66` (degree 21)
- `@testing-library/react` — `package.json:L71` (degree 19)
- `lucide-react` — `package.json:L52` (degree 18)
- `motion` — `package.json:L53` (degree 16)
- `scripts` — `package.json:L5` (degree 16)
- `sanity` — `package.json:L61` (degree 15)
- `next-sanity` — `package.json:L55` (degree 14)

### Owned source files

- `README.md`
- `package.json`
- `src/app/(portfolio)/layout.tsx`
- `src/app/(portfolio)/page.tsx`
- `src/app/layout.tsx`
- `src/components/PortfolioContent.tsx`
<!-- graphify:auto:end -->

## Related notes

- [[01 Routing, Rendering, and Server Boundaries]]
- [[02 Sanity Content Model and Query Flow]]
- [[04 Portfolio Lab — Agent Runtime and Grounding]]
- [[10 Deployment, Preview, and Operational Runbook]]
