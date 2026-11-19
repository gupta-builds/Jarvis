---
type: index
status: sprout
tags: [portfolio, codebase-map, MOC]
created: 2026-06-12
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> This map was generated from a stale graph snapshot. The linked `architecture/`, `components/`, `data/`, `chatbot/`, `communities/` notes inherit these errors; each carries its own correction callout. Corrections to THIS note:
>
> | This note says | Repo reality |
> |---|---|
> | "Commit `89cd2c0e` · 141 files · 99 communities · 1,230 nodes" | Repo HEAD is `5f29675` (23+ commits later, plus ~115 uncommitted entries). Repo-native graph (`graphify-out/GRAPH_REPORT.md`, 2026-11-18): **219 files · 1,193 nodes · 2,201 edges · 71 communities**. Several files this map documents (`localContent.ts`, `contact.ts`, `submit-contact-form.ts`, `ContactForm.tsx`, `ui/card.tsx`, `ui/chart.tsx`, `ui/dropdown-menu.tsx`, `ui/spinner.tsx`) were deleted *before* `89cd2c0e`. |
> | AEO & SEO "(not yet built)" | **Split state.** Phase 1 SEO basics exist in the working tree but are **uncommitted / not deployed**: root + `(portfolio)/layout.tsx` metadata (canonical, OpenGraph), JSON-LD (`Person`/`ProfilePage`/`WebSite` in `(portfolio)/page.tsx`), `src/app/sitemap.ts`, `src/app/robots.ts` (single `*` rule), `/privacy`. **AEO (Phase 2) is not built**: no `public/llms.txt`, no per-bot robots rules, no `SoftwareApplication` JSON-LD, no OG image route. |
> | "Sanity Schemas — 11 document types" | **10** document types: profile, project, skill, experience, education, certification, achievement, blog, siteSettings, navigation. There is no `contact` type. |
> | Orby model chain "Gemini → Groq → degraded" | `src/lib/model-router.ts`: **Cerebras `zai-glm-4.7` → Groq `llama-3.3-70b-versatile` → Mistral `mistral-small-latest` → degraded**. No Gemini anywhere in `src/`. |
> | God node `getLocalDataForQuery()` / "Local fallback data hub" | The local-content fallback was removed (`localContent.ts` deleted). `src/sanity/lib/live.ts` now falls back only to a bare `client.fetch`, with no local data and no timeout or error boundary. |
>
> Use `graphify-out/GRAPH_REPORT.md` and `docs/knowledge/portfolio/*` **in the repo** as the current map; treat the graph-derived notes here as historical.

# Portfolio Codebase — Knowledge Map

> Auto-generated from graphify knowledge graph · Commit `89cd2c0e` · 141 files · 129,597 words

## Graph Stats

| Metric | Value |
|--------|-------|
| Nodes | 1,230 |
| Edges | 2,146 |
| Communities | 99 |
| Extraction | 100% extracted, 0% inferred |
| Files mapped | 141 |

## Navigation

### Core Sections
- [[architecture/00-overview|🏗️ Architecture Overview]] — Stack, data flow, entry points
- [[architecture/01-nextjs-routes|📦 Next.js App Router]] — Pages, layouts, API routes
- [[architecture/02-sanity-cms|🗄️ Sanity CMS]] — Schemas, queries, live API
- [[architecture/03-auth-clerk|🔐 Auth (Clerk)]] — Proxy, middleware, studio guard
- [[architecture/04-design-system|🎨 Design System]] — Tailwind v4, cn(), CometCard
- [[AEO & SEO/00 - Agent-Ready Infrastructure Build Plan|🤖 AEO & SEO]] — metadata/sitemap/robots/OpenGraph build plan (not yet built)

### AI Chatbot — Orby
- [[chatbot/00-orby-overview|🤖 Orby Overview]] — Phases 0–6, god nodes, communities
- [[chatbot/01-api-route|🛡️ API Route]] — POST handler, gates, rate limiting
- [[chatbot/02-model-router|🔀 Model Router]] — Gemini → Groq → degraded
- [[chatbot/03-personas|🎭 Personas]] — Recruiter / Friend / Weirdo / CEO
- [[chatbot/04-tools|🔧 Closed Tools]] — 6 tools: navigate, showProject…
- [[chatbot/05-evals|🧪 Eval Suite]] — Promptfoo grounding/refusal/tools

### Components
- [[components/00-overview|🧩 Component Map]]
- [[components/01-page-sections|📄 Page Sections]] — Hero, About, Experience…
- [[components/02-lab-chat-ui|💬 Lab / Chat UI]] — PortfolioLab, ChatThread…
- [[components/03-orby-companion|🚀 Orby Companion]] — Orby.tsx, canvas, speech
- [[components/04-three-js|✨ Three.js / R3F]] — ObsidianBackground, ProjectsSlider
- [[components/05-ui-primitives|🪵 UI Primitives]] — CometCard, shadcn, sidebar

### Data Layer
- [[data/00-sanity-schemas|📋 Sanity Schemas]] — 11 document types
- [[data/01-groq-queries|🔍 GROQ Queries]] — All queries by domain

### Graph Intelligence
- [[god-nodes|⚡ God Nodes]] — Top 20 most-connected abstractions
- [[communities/community-01-chatbot-backend|Community 1: Chatbot Backend]]
- [[communities/community-04-lab-ui|Community 4: Lab UI]]
- [[communities/community-07-portfolio-core|Community 7: Portfolio Core]]
- [[communities/community-overview|All 99 Communities]]

## God Nodes (Quick Reference)

| Node | Edges | Role |
|------|-------|------|
| `cn()` | 96 | Class-name utility — used everywhere |
| `sanityFetch()` | 35 | Only way to read CMS content |
| `Data Overview` | 22 | Local fallback data hub |
| `useSidebar()` | 20 | Sidebar state singleton |
| `GROQ Query Examples` | 18 | GROQ documentation hub |
| `CometCard()` | 17 | Base floating card primitive |
| `getLocalDataForQuery()` | 16 | Fallback resolver |
| `useIridescentEffect()` | 15 | Iridescent hover effect hook |

## Surprising Connections

- `OrbyModel()` → calls → `cn()` — 3D model uses class utility
- `Spinner()` → calls → `cn()` — spinner uses class utility  
- `dataset` bridges Community 2 (Sanity config) ↔ Community 1 (Chatbot backend)
- `CometCard()` bridges 6 communities — it's the cross-cutting card primitive

## Knowledge Gaps (359 isolated nodes)
Notable weakly-connected nodes: `securityHeaders`, `ERRORS`, `labButton`, `chatInput`, `submitTime` — possible undocumented components or missing edges.
