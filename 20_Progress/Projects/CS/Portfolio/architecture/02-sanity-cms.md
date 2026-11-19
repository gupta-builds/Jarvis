---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, sanity, cms, groq]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "`live.ts` — `sanityFetch()`, `hasUsableData()`, `loadLocalQueryResult()`"; "Falls back via `loadLocalQueryResult()` if Sanity is unreachable" | `live.ts` exports only `sanityFetch` (`:40`) and `SanityLive` (`:44`). When `SANITY_API_TOKEN` is absent (`:8`) `sanityFetch` is `createFetchFallback()` (`:19`) — a bare `client.fetch` — and `SanityLive` is a no-op. The LOCAL-DATA fallback (`hasUsableData`, `loadLocalQueryResult`, `localContent.ts`) is gone (last touched in `0f01ae9`); there is still no timeout, try/catch, or error boundary around `sanityFetch` (e.g. `src/app/(portfolio)/page.tsx:95`; no `error.tsx` in `src/app`) |
> | "11 document types registered in `src/sanity/schemaTypes/index.ts`" | 10 types (`src/sanity/schemaTypes/index.ts:13-26`): profile, project, skill, experience, education, certifications, achievement, blog, siteSettings, navigation |
> | Table row "`contact` \| contact.ts \| Contact form submissions" | `src/sanity/schemaTypes/contact.ts` does not exist; not in `git ls-tree 89cd2c0e` |
> | "`getServerClient()` — write/auth client"; "Used by: contact form Server Action, chat tools" | Token-bearing client (`src/sanity/lib/server-client.ts:15-28`) with `useCdn:false`, `perspective:"published"` (`:27,:29`), but the only importers are `src/lib/chat-context.ts:5` and `src/lib/chat-tools.ts:18` (both read via `.withConfig({ stega: { enabled: false } })`); no contact form / Server Action exists (`src/app/actions/` empty) |
> | "`CERTS_SECTION_QUERY` / `ACHIEVEMENTS_SECTION_QUERY` / `BLOG_SECTION_QUERY`" listed as `queries.ts` exports; "`CHAT_PROFILE_QUERY`" | These are `defineQuery` consts inline in the section files: `CertificationsSection.tsx:12`, `AchievementsSection.tsx:9`, `BlogSection.tsx:8` (as are `ABOUT_QUERY` `AboutSection.tsx:7`, `EDUCATION_SECTION_QUERY` `EducationSection.tsx:7`, `CONTACT_QUERY` `ContactSection.tsx:5`). `queries.ts` exports 13 queries (`:4,42,58,73,99,112,150,156,162,168,174,182,190`); `CHAT_PROFILE_QUERY` is not defined — it appears only in a test asserting it is NOT in `queries.ts` (`src/components/__tests__/codebase-cleanup-bug-condition.test.ts:55-59`) |
> | "`src/sanity/env.ts` \| `projectId`, `dataset`, `assertValue()`"; "`builder`" as image export | `env.ts` exports `apiVersion` (`:1`), `dataset` (`:4`), `projectId` (`:9`); `assertValue` is a non-exported helper (`env.ts:14`, and a separate copy at `server-client.ts:6`). `image.ts` exports only `urlFor` (`:9`); `builder` is a private const (`:7`) |
> | "`SanityQueries`" listed among key exported types (TypeScript Types) | Not a standalone type export: it is an `interface SanityQueries` inside a `declare module "@sanity/client"` augmentation (`src/sanity/types/index.ts:1109-1110`) keyed by query string (e.g. the inline `ABOUT_QUERY` → `ABOUT_QUERYResult`) |

# Sanity CMS Layer

> [[../INDEX|← Back to Index]] · [[00-overview|Architecture Overview]]

## Overview

Sanity v4 is the **only** content source. `sanityFetch()` is the **only** way to read data — no direct client calls from components. Community 7 owns the live data layer; Community 2 owns the schema/config layer.

## Core Files

| File | Role | Community |
|------|------|-----------|
| `src/sanity/lib/live.ts` | `sanityFetch()`, `hasUsableData()`, `loadLocalQueryResult()` | 7 |
| `src/sanity/lib/queries.ts` | All GROQ queries | 15 |
| `src/sanity/lib/client.ts` | `client` — public read client | 2 |
| `src/sanity/lib/server-client.ts` | `getServerClient()` — write/auth client | 1 |
| `src/sanity/lib/image.ts` | `urlFor()`, `builder` | 2/15 |
| `src/sanity/env.ts` | `projectId`, `dataset`, `assertValue()` | 2 |
| `src/sanity/structure.ts` | `structure()` — studio desk structure | 2 |
| `src/sanity/types/index.ts` | GENERATED — all TypeScript types | 0 |
| `src/sanity/schemaTypes/index.ts` | Schema registry (`schema` export) | 2 |

## sanityFetch() — Community 7's Hub Node (35 edges)

```typescript
// src/sanity/lib/live.ts
export async function sanityFetch<T>({ query, params }: { query: string; params?: Record<string, unknown> }): Promise<T>
```

- Wraps `next-sanity` live content API
- Falls back via `loadLocalQueryResult()` if Sanity is unreachable
- `hasUsableData()` — validates result before use
- `createFetchFallback()` — creates a fallback fetcher

## Schema Types (Community 2)

11 document types registered in `src/sanity/schemaTypes/index.ts`:

| Type | File | Purpose |
|------|------|---------|
| `profile` | profile.ts | Main bio, headline, avatar |
| `experience` | experience.ts | Work history entries |
| `project` | project.ts | Portfolio projects |
| `skill` | skill.ts | Skills with categories |
| `education` | education.ts | Degrees, institutions |
| `certifications` | certifications.ts | Certs with issue/expiry dates |
| `achievement` | achievement.ts | Awards, milestones |
| `blog` | blog.ts | Blog posts with slug, tags |
| `siteSettings` | siteSettings.ts | Global site config (singleton) |
| `navigation` | navigation.ts | Nav links |
| `contact` | contact.ts | Contact form submissions |

See [[../data/00-sanity-schemas|Sanity Schemas]] for field-level detail.

## GROQ Queries (Community 15)

Defined in `src/sanity/lib/queries.ts`. Key exports:

| Const | Purpose |
|-------|---------|
| `PROFILE_QUERY` | Main profile for hero/about |
| `SITE_SETTINGS_QUERY` | Global site config |
| `NAVIGATION_QUERY` | Nav links |
| `PROJECTS_QUERY` | All projects |
| `PROJECT_BY_SLUG_QUERY` | Single project lookup |
| `EXPERIENCE_QUERY` | Work history |
| `EXPERIENCE_BY_ID_QUERY` | Single experience (chat tool) |
| `SKILLS_QUERY` | All skills |
| `EDUCATION_QUERY` | Education entries |
| `CERTIFICATIONS_QUERY` / `CERTS_SECTION_QUERY` | Certifications |
| `ACHIEVEMENTS_QUERY` / `ACHIEVEMENTS_SECTION_QUERY` | Achievements |
| `BLOG_QUERY` / `BLOG_SECTION_QUERY` | Blog posts |
| `CHAT_CATALOG_QUERY` | Full catalog for Orby's system prompt |
| `CHAT_PROFILE_QUERY` | Profile subset for chat |

See [[../data/01-groq-queries|GROQ Queries Reference]] for full query bodies.

## Server Client — `getServerClient()` (Community 1)

```typescript
// src/sanity/lib/server-client.ts
export function getServerClient(): SanityClient
```

- Uses `SANITY_API_TOKEN` (server-only)
- Used by: contact form Server Action, chat tools that read protected content
- `assertValue()` — throws if env var missing at startup

## Image Helper — `urlFor()` (15 edges, Community 15)

```typescript
// src/sanity/lib/image.ts
import imageUrlBuilder from '@sanity/image-url'
export const urlFor = (source) => builder.image(source)
```

- `builder` — imageUrlBuilder instance (Community 2)
- Used in: all sections that display images

## TypeScript Types — `src/sanity/types/index.ts`

**GENERATED — never edit manually.** Regenerate with `pnpm typegen`.

Key types: `Navigation`, `Achievement`, `Certification`, `Education`, `Project`, `Blog`, `SanityImageMetadata`, `SanityImageDimensions`, `SanityImagePalette`, `Geopoint`, `SanityQueries`, plus `*_QUERYResult` types for every query.

## Adding a New Query

1. Add to `src/sanity/lib/queries.ts`
2. `pnpm typegen` — regenerates types
3. `pnpm typecheck` — verify no breaks
4. Use in component via `sanityFetch({ query: YOUR_QUERY })`

## See Also
- [[../data/00-sanity-schemas|Sanity Schemas Detail]]
- [[../data/01-groq-queries|GROQ Queries Reference]]
- [[../chatbot/04-tools|Chat Tools (uses getServerClient)]]
