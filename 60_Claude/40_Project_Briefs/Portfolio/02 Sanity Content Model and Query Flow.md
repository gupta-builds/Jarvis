---
type: subsystem
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/02 Sanity Content Model and Query Flow.md
sync: managed
tags: [portfolio, sanity, cms, groq, content]
---

# 02 Sanity Content Model and Query Flow

## Purpose

Sanity is the source of truth for profile, projects, experience, skills, education, certifications, achievements, navigation, blog entries, and site settings. A content change normally crosses four layers: schema → GROQ projection → generated query type → rendering/chat consumer.

## Data path

```text
src/sanity/schemaTypes/*
  → Sanity dataset
  → src/sanity/lib/queries.ts
  → sanityFetch / server client
  → async section or chat catalog
  → client presentation / grounded tool result
```

`src/sanity/schemaTypes/index.ts` registers document types. `sanity.config.ts` configures Studio. `src/sanity/env.ts` validates public project/dataset settings. Browser reads use `src/sanity/lib/client.ts`; server-only authenticated reads use `server-client.ts` where available.

## Query ownership

- `PROFILE_QUERY` and `SITE_SETTINGS_QUERY` feed metadata, hero/contact data, and structured data.
- `NAVIGATION_QUERY` and `PROJECTS_QUERY` feed `PortfolioContent`.
- Skills, experience, education, certifications, achievements, and blog queries feed their matching sections.
- Detail queries support chat cards without shipping the full dataset in the prompt.
- `CHAT_CATALOG_QUERY` is a deliberately compact, bounded projection for grounding and closed tool enums.

Several sections define a local projection close to the component. When changing a shared shape, search both `src/sanity/lib/queries.ts` and `defineQuery(` calls under sections so one projection does not drift.

## Live-content behavior

`src/sanity/lib/live.ts` selects one of two paths:

- With `SANITY_API_TOKEN`, `defineLive` provides `sanityFetch` plus `SanityLive` and disables revalidation caching.
- Without the token, a public client fallback performs normal fetches and returns the same `{data, sourceMap, tags}` shape.

This fallback keeps preview/dev/build behavior usable, but it does not make missing required public environment values optional.

## Change contract

When adding or renaming a field:

1. Change the schema type.
2. Update every GROQ projection that needs the field.
3. Run `pnpm typegen`; do not hand-edit `src/sanity/types/index.ts`.
4. Update server and client consumers.
5. If the fact should be answerable in Portfolio Lab, extend `CHAT_CATALOG_QUERY`, `Catalog`, prompt compaction, and the appropriate tool result.
6. Verify empty/null/legacy documents. Queries use `coalesce` and `select` in several places to retain compatibility.

## Grounding boundary

Sanity data is untrusted content until compacted. `chat-context.ts` disables stega, removes invisible Unicode, selects bounded fields, and places the JSON inside an explicit catalog boundary. Never inject entire Portable Text documents or hidden editing markers into the system prompt.

## Failure modes

- Schema changed but types were not regenerated.
- A local section query drifts from the shared query.
- A reference is projected without `->`, leaving IDs where objects are expected.
- A new fact appears visually but is absent from the chat catalog.
- A token is exposed to client code outside the controlled live-content setup.

## Graphify query recipes

```bash
graphify query "Sanity schema queries live fetch profile projects experience skills" --context import --context field --budget 3500
graphify path "CHAT_CATALOG_QUERY" "buildSystemPrompt()"
graphify affected "PROFILE_QUERY" --depth 3
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1181 nodes / 2139 edges**
- This subsystem: **22 files / 58 nodes / 203 touching edges**
- Leading communities: `schemaTypes/index.ts` (24), `PortfolioContent.tsx` (16), `image.ts` (11), `chat-tools.ts` (4), `chat-context.ts` (2), `next` (1)

### High-connectivity symbols

- `sanityFetch` — `src/sanity/lib/live.ts:L40` (degree 25)
- `queries.ts` — `src/sanity/lib/queries.ts:L1` (degree 24)
- `schemaTypes/index.ts` — `src/sanity/schemaTypes/index.ts:L1` (degree 22)
- `live.ts` — `src/sanity/lib/live.ts:L1` (degree 20)
- `urlFor()` — `src/sanity/lib/image.ts:L9` (degree 15)
- `image.ts` — `src/sanity/lib/image.ts:L1` (degree 13)
- `sanity.config.ts` — `sanity.config.ts:L1` (degree 11)
- `server-client.ts` — `src/sanity/lib/server-client.ts:L1` (degree 10)
- `client.ts` — `src/sanity/lib/client.ts:L1` (degree 9)
- `env.ts` — `src/sanity/env.ts:L1` (degree 8)
- `getServerClient()` — `src/sanity/lib/server-client.ts:L14` (degree 6)
- `dataset` — `src/sanity/env.ts:L4` (degree 5)

### Owned source files

- `sanity.cli.ts`
- `sanity.config.ts`
- `src/sanity/env.ts`
- `src/sanity/lib/client.ts`
- `src/sanity/lib/image.ts`
- `src/sanity/lib/live.ts`
- `src/sanity/lib/queries.ts`
- `src/sanity/lib/server-client.ts`
- `src/sanity/schema.json`
- `src/sanity/schemaTypes/achievement.ts`
- `src/sanity/schemaTypes/blog.ts`
- `src/sanity/schemaTypes/certifications.ts`
- `src/sanity/schemaTypes/education.ts`
- `src/sanity/schemaTypes/experience.ts`
- `src/sanity/schemaTypes/index.ts`
- `src/sanity/schemaTypes/navigation.ts`
- `src/sanity/schemaTypes/profile.ts`
- `src/sanity/schemaTypes/project.ts`
- `src/sanity/schemaTypes/siteSettings.ts`
- `src/sanity/schemaTypes/skill.ts`
- `src/sanity/structure.ts`
- `src/sanity/types/index.ts`
<!-- graphify:auto:end -->

## Related notes

- [[01 Routing, Rendering, and Server Boundaries]]
- [[03 Page Composition and Content Sections]]
- [[04 Portfolio Lab — Agent Runtime and Grounding]]
