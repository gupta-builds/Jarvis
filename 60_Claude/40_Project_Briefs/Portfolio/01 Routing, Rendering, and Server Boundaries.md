---
type: subsystem
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/01 Routing, Rendering, and Server Boundaries.md
sync: managed
tags: [portfolio, nextjs, app-router, rendering]
---

# 01 Routing, Rendering, and Server Boundaries

## Purpose

This note explains how a request becomes the portfolio UI and where server work stops and browser work begins. The route group `(portfolio)` shares the global root without leaking the portfolio shell into Studio, authentication, or privacy routes.

## Render chain

1. `src/app/layout.tsx` owns the HTML document, fonts, Clerk provider, global client providers, analytics, and `globals.css`.
2. `src/app/(portfolio)/layout.tsx` fetches site metadata and mounts the portfolio shell: right sidebar, toggle, Orby, chat-token initialization, and `SanityLive`.
3. `src/app/(portfolio)/page.tsx` fetches profile/settings, emits JSON-LD, then renders `PortfolioContent`.
4. `src/components/PortfolioContent.tsx` fetches navigation/projects and composes the visible section order over `ObsidianBackground`.
5. Individual async section components fetch their own Sanity projections and hand interactive work to client children.

## Boundary rules

- Keep route/layout metadata and data fetching on the server. Do not add `"use client"` to a layout just to satisfy one interactive child.
- Isolate browser APIs, `useEffect`, state machines, GSAP, Motion, and R3F behind client components.
- `Providers.tsx` is intentionally client-side. It joins Lenis to GSAP’s ticker and falls back to native scrolling when reduced motion is active.
- `SidebarAwareContent` coordinates content width/background placement with sidebar state. Changes here affect the entire page, not one section.
- `ChatTokenInit` bootstraps the HMAC-protected chat cookie; it belongs in the portfolio shell so both the lab and Orby commentary share the same trust path.
- `SanityLive` is present only when a token exists; the fallback fetcher still renders content without live subscriptions.

## Routes outside the main page

- `/studio` hosts Sanity Studio and is dynamically rendered.
- Clerk owns catch-all sign-in/sign-up pages.
- `/privacy`, `robots.ts`, `sitemap.ts`, and the app icon provide public-site support.
- API routes are documented in [[05 API Security, Auth, Rate Limits, and Degraded Mode]].

## Common changes

### Add a portfolio section

Add the server/client section pair, mount it in `PortfolioContent`, give it a stable DOM `id`, add Sanity data if factual, update navigation, extend Orby/chat navigation enums when appropriate, and add a section-level regression test.

### Add a route

Choose deliberately whether it belongs inside `(portfolio)`. A route inside the group inherits the sidebar, Orby, token bootstrap, and live Sanity component. A route outside inherits only the root Clerk/theme/font providers.

### Change global scrolling

Treat `Providers.tsx`, GSAP ScrollTrigger consumers, Orby progress, and reduced-motion tests as one change set. There must remain one scroll source of truth.

## Verification

```bash
pnpm typecheck
pnpm test
pnpm build
```

Check metadata/JSON-LD in server output, keyboard/sidebar behavior, reduced motion, and direct navigation to non-portfolio routes.

## Graphify query recipes

```bash
graphify query "app layout portfolio layout page PortfolioContent server client" --context import --context call --budget 3000
graphify path "app/layout.tsx" "PortfolioContent()"
graphify affected "Providers()" --relation call --depth 2
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1181 nodes / 2139 edges**
- This subsystem: **27 files / 90 nodes / 235 touching edges**
- Leading communities: `next` (24), `orby-comment/route.ts` (15), `app/layout.tsx` (11), `chat/__tests__/route.test.ts` (11), `chat/route.ts` (9), `PortfolioContent.tsx` (7)

### High-connectivity symbols

- `chat/route.ts` — `src/app/api/chat/route.ts:L1` (degree 37)
- `orby-comment/route.ts` — `src/app/api/orby-comment/route.ts:L1` (degree 22)
- `POST()` — `src/app/api/chat/route.ts:L84` (degree 18)
- `chat/__tests__/route.test.ts` — `src/app/api/chat/__tests__/route.test.ts:L1` (degree 15)
- `chat-token/route.ts` — `src/app/api/chat-token/route.ts:L1` (degree 9)
- `orby-comment/__tests__/route.test.ts` — `src/app/api/orby-comment/__tests__/route.test.ts:L1` (degree 9)
- `POST()` — `src/app/api/orby-comment/route.ts:L60` (degree 8)
- `POST()` — `src/app/api/chat-token/route.ts:L109` (degree 5)
- `buildStructuredData()` — `src/app/(portfolio)/page.tsx:L31` (degree 4)
- `Providers()` — `src/components/Providers.tsx:L34` (degree 4)
- `ChatTokenInit()` — `src/components/ChatTokenInit.tsx:L15` (degree 3)
- `error-report/route.ts` — `src/app/api/error-report/route.ts:L1` (degree 3)

### Owned source files

- `src/app/api/orby-comment/__tests__/route.test.ts`
- `src/app/api/orby-comment/route.ts`
- `src/app/icon.svg`
- `src/app/privacy/page.tsx`
- `src/app/robots.ts`
- `src/app/sitemap.ts`
- `src/app/(portfolio)/layout.tsx`
- `src/app/(portfolio)/page.tsx`
- `src/app/api/chat-token/route.ts`
- `src/app/api/chat/__tests__/route.test.ts`
- `src/app/api/chat/route.ts`
- `src/app/api/draft-mode/disable/route.ts`
- `src/app/api/draft-mode/enable/route.ts`
- `src/app/api/error-report/route.ts`
- `src/app/api/health/route.ts`
- `src/app/api/revalidate/route.ts`
- `src/app/favicon.ico`
- `src/app/globals.css`
- `src/app/layout.tsx`
- `src/app/sign-in/[[...sign-in]]/page.tsx`
- `src/app/sign-up/[[...sign-up]]/page.tsx`
- `src/app/studio/[[...tool]]/StudioClient.tsx`
- `src/app/studio/[[...tool]]/page.tsx`
- `src/app/studio/layout.tsx`
- `src/components/ChatTokenInit.tsx`
- `src/components/Providers.tsx`
- `src/components/SidebarAwareContent.tsx`
<!-- graphify:auto:end -->

## Related notes

- [[00 Portfolio — Codebase Map]]
- [[02 Sanity Content Model and Query Flow]]
- [[03 Page Composition and Content Sections]]
- [[08 Orby State, Navigation, and Commentary]]
