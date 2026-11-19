---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, auth, clerk, middleware]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "Community 48 — Root Proxy (`proxy.ts`)" with `clerk, isPublicRoute, event, config, proxy()` | Root `proxy.ts` does not exist (it existed at `89cd2c0e`, where `src/proxy.ts` was only `export { proxy } from "../proxy"`). Today's single `src/proxy.ts` holds `isStudioRoute` (`:5`), `clerk`, `event`, `proxy()` (`:24`), `config` (`:38`) |
> | "Community 57 — Src Proxy: `isPublicRoute`, `isStudioRoute`, `config`" | No `isPublicRoute` in `src/proxy.ts` (only `isStudioRoute` `:5`, used `:8,25`) |
> | "Two proxy files exist — check which one Next.js is actually using as `middleware.ts` before editing either" | One file only: `src/proxy.ts`; no root `proxy.ts`, no `src/middleware.ts` |
> | "Chat Security (Not Clerk)": 1. `isAllowedOrigin()` 2. HMAC token 3. Upstash burst + daily | Also first checks `BLOCKED_UA` (`src/app/api/chat/route.ts:87`); `isAllowedOrigin` is imported from `src/lib/request-guards.ts` (`route.ts:19`); limits are `slidingWindow(10, "60 s")` (`:41`) and `slidingWindow(100, "24 h")` (`:47`). Cloudflare Turnstile siteverify gates `POST /api/chat-token` (`src/app/api/chat-token/route.ts:20,109`) — not mentioned in this note |
> | Route Rules table (7 paths) | Other route files exist: `api/orby-comment` (returns 401 without a valid chat token, `orby-comment/route.ts:74`), `api/revalidate` (POST webhook), `api/health` (GET), `api/error-report` (POST), page `/privacy` |

# Auth — Clerk

> [[../INDEX|← Back to Index]]

## Overview

Clerk guards **`/studio` only**. The portfolio itself is fully public — no auth required to view.

## Community 48 — Root Proxy (`proxy.ts`)

```
proxy.ts (root)
  ├── clerk          — Clerk client instance
  ├── isPublicRoute  — matcher for all public portfolio routes
  ├── event          — auth event handler
  ├── config         — Next.js middleware config (matcher)
  └── proxy()        — main middleware function (calls clerk)
```

`proxy()` → calls `clerk` → uses `isPublicRoute` to decide whether to enforce auth.

## Community 57 — Src Proxy (`src/proxy.ts`)

```
src/proxy.ts
  ├── isPublicRoute   — public route matcher
  ├── isStudioRoute   — /studio/* matcher
  └── config          — middleware matcher export
```

Two proxy files exist — check which one Next.js is actually using as `middleware.ts` before editing either.

## Route Rules

| Path | Auth Required | Notes |
|------|--------------|-------|
| `/` | No | Portfolio home |
| `/studio/*` | Yes | Sanity Studio — Clerk login |
| `/sign-in/*` | No | Clerk sign-in page |
| `/sign-up/*` | No | Clerk sign-up page |
| `/api/chat` | No | HMAC token + rate limit instead |
| `/api/chat-token` | No | Issues HMAC cookie |
| `/api/draft-mode/*` | Sanity secret | Draft mode enable/disable |

## Studio Layout — `src/app/studio/layout.tsx`

Clerk's server-side auth check runs here before rendering `StudioClient.tsx`. If unauthenticated, redirects to `/sign-in`.

## Chat Security (Not Clerk)

The `/api/chat` endpoint uses its own security stack independent of Clerk:
1. `isAllowedOrigin()` — checks `Origin` header against allowlist
2. HMAC token in cookie — issued by `/api/chat-token`
3. Upstash rate limiting — burst + daily limits per IP

See [[../chatbot/01-api-route|Chatbot API Route]] for full detail.

## Appearance Config

`src/lib/clerk-appearance.ts` — custom Clerk modal styling to match the cosmic dark theme.
