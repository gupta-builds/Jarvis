---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, graph, community, sanity, config]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "All 11 schema type files are reachable from this community… `navigation.ts`, `contact.ts`" | 10 schema types (`src/sanity/schemaTypes/index.ts:13-26`); `contact.ts` does not exist and is absent from `git ls-tree 89cd2c0e` |
> | "`serverClient` (alias)" (Server Client) | No `serverClient` source symbol (it appears only in `src/components/__tests__/codebase-cleanup-bug-condition.test.ts`); the export is `getServerClient()` (`src/sanity/lib/server-client.ts:14`) |
> | "`env.ts` — `projectId`, `dataset`, `assertValue()`"; "`builder` — imageUrlBuilder instance" | `env.ts` exports `apiVersion` (`:1`), `dataset` (`:4`), `projectId` (`:9`); `assertValue` is a private function (`env.ts:14`). `builder` is a private const in `src/sanity/lib/image.ts:7`; only `urlFor` is exported (`:9`) |

# Community 2 — Sanity Config

> [[../INDEX|← Back to Index]] · [[../communities/community-overview|All Communities]]

**20 nodes · Cohesion: 0.06**

## What This Community Is

The Sanity configuration and client setup layer. Contains all the plumbing that wires Sanity to the Next.js app — env vars, client instances, schema registry, image builder, and Studio structure.

## Nodes

### Configuration
- `sanity.config.ts` (both paths) — Sanity project config
- `env.ts` / `src/sanity/env.ts` — `projectId`, `dataset`, `assertValue()`
- `projectId` — god node (11 edges), bridges to Community 1
- `dataset` — god node (11 edges), bridges to Community 1

### Client
- `client.ts` (both paths) — public read client
- `client` — the exported client instance

### Schema
- `index.ts` / `src/sanity/schemaTypes/index.ts` (both paths)
- `schema` — exported schema array

### Image Builder
- `image.ts` / `src/sanity/lib/image.ts` (both paths)
- `builder` — imageUrlBuilder instance

### Server Client
- `server-client.ts` / `src/sanity/lib/server-client.ts`
- `serverClient` (alias)
- `token` — SANITY_API_TOKEN reference

### Studio Structure
- `structure.ts` / `src/sanity/structure.ts`
- `structure()` — desk structure function

### Studio Client
- `StudioClient.tsx` (both paths)

### Schema Sub-files
All 11 schema type files are reachable from this community:
- `profile.ts`, `experience.ts`, `project.ts`, `skill.ts`, `education.ts`
- `certifications.ts`, `achievement.ts`, `blog.ts`, `siteSettings.ts`
- `navigation.ts`, `contact.ts`

## Bridge Nodes

`dataset` and `projectId` have **11 edges each** and bridge this community to Community 1 (chatbot backend). Both are read from `src/sanity/env.ts` and used by both the public content pipeline and the server-side chat tools.

## See Also
- [[../architecture/02-sanity-cms|Sanity CMS Layer]]
- [[../data/00-sanity-schemas|Schema Definitions]]
- [[community-01-chatbot-backend|Community 1 (uses dataset + projectId)]]
