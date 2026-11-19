---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, graph, community, core, sanity, sections]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "`hasUsableData()` — validates Sanity result shape"; "`loadLocalQueryResult()` — fallback loader" | Neither exists in `src` (rg). `src/sanity/lib/live.ts` now has only `createFetchFallback()` (`:19`, bare `client.fetch`, used when `SANITY_API_TOKEN` is absent `:8,:40`) and a no-op `SanityLive` fallback (`:44`). The LOCAL-DATA fallback (`localContent.ts`) is gone (last touched in `0f01ae9`); there is still no timeout, try/catch, or error boundary around `sanityFetch` |
> | "`Home()` — entry point, renders PortfolioContent in Suspense" | `src/app/(portfolio)/page.tsx` has no `Suspense` (rg); `Home()` awaits `sanityFetch` for `PROFILE_QUERY` + `SITE_SETTINGS_QUERY` (`:95-96`) |
> | "`PortfolioContent()` — server component, orchestrates all section fetches"; "calls `sanityFetch` × N queries (one per section) and passes results down as props" | `PortfolioContent` fetches only `NAVIGATION_QUERY` + `PROJECTS_QUERY` (`src/components/PortfolioContent.tsx:25-26`); sections fetch their own data (e.g. `SkillsSection.tsx:7`, `ContactSection.tsx:22`, `AchievementsSection.tsx:16`) |

# Community 7 — Portfolio Core

> [[../INDEX|← Back to Index]] · [[../communities/community-overview|All Communities]]

**33 nodes · Cohesion: 0.13**

## What This Community Is

The load-bearing center of the portfolio page. `sanityFetch()` (35 edges, the #2 god node) lives here alongside `PortfolioContent`, `ObsidianBackground`, and the section components that render directly from server fetches.

## Nodes

### Data Layer
- `live.ts` (both paths) — the `sanityFetch` module
- `live` — the next-sanity live client instance
- `sanityFetch()` — god node, 35 edges
- `hasUsableData()` — validates Sanity result shape
- `loadLocalQueryResult()` — fallback loader
- `createFetchFallback()` — fallback factory
- `client` — public Sanity read client

### Page Structure
- `page.tsx` (both paths) — `Home()` component
- `Home()` — entry point, renders PortfolioContent in Suspense
- `PortfolioContent.tsx` (both paths)
- `PortfolioContent()` — server component, orchestrates all section fetches

### Footer
- `Footer.tsx` (both paths)
- `Footer()` — site footer with back-to-top, social links

### Three.js
- `ObsidianBackground.tsx` (both paths)
- `ObsidianBackground` — dynamic import wrapper (must load with `ssr: false`)

### Sections (server-side)
- `SkillsSection.tsx` (both paths) + `SkillsSection()`
- `AchievementsSection.tsx` (both paths) + `AchievementsSection()`
- `ACHIEVEMENTS_SECTION_QUERY` — defined inline in AchievementsSection
- `ContactSection.tsx` + `ContactSection()`

### Queries Used
- `SKILLS_QUERY` — from queries.ts

## Why This Community Is the Core

`sanityFetch()` reaches into every section. `PortfolioContent()` is the server component tree root that calls `sanityFetch` × N queries (one per section) and passes results down as props. Every user-visible section flows through this community's data layer.

## Relationship to Other Communities

- Feeds data to: Community 3 (HeroContent, SkillsSectionClient), Community 12 (AboutSection), Community 13 (CertificationsSection), Community 29 (ExperienceSection), Community 23 (EducationSection), Community 34 (BlogSection)
- Uses `cn()` from Community 6
- Served by Community 2 (Sanity client, schema config)
- Chat route in Community 1 uses the same Sanity infrastructure

## See Also
- [[../architecture/02-sanity-cms|Sanity CMS]]
- [[../architecture/01-nextjs-routes|Next.js Routes]]
- [[../components/01-page-sections|Page Sections]]
