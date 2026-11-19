---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, architecture, overview]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "Next.js 16.1.1 App Router" (Stack) | `"next": "16.2.9"` (`package.json:54`; installed 16.2.9). React stays `19.2.3` (`:57`) |
> | "AI \| Gemini 2.5 Flash → Groq → degraded" (Stack); "routeChat() → Gemini → Groq → degraded" (Data Flow); "Gemini → Groq → degraded routing" (Key Files) | Chain is Cerebras `zai-glm-4.7` → Groq `llama-3.3-70b-versatile` → Mistral `mistral-small-latest` → degraded (`src/lib/model-router.ts:2`, `:50-68`). No `gemini` string appears anywhere in `src` (rg) |
> | "`GEMINI_API_KEY` — primary AI model"; "`GROQ_API_KEY` — fallback AI model" (Environment Variables) | No `GEMINI_API_KEY`. Keys read by the router: `CEREBRAS_API_KEY`, `GROQ_API_KEY`, `MISTRAL_API_KEY` (`model-router.ts:52,60,67`). Other server vars read in `src` and missing from the list: `SANITY_API_TOKEN`, `SANITY_REVALIDATE_SECRET`, `TURNSTILE_SECRET_KEY`, `DEV_BYPASS_IP`; `NEXT_PUBLIC_TURNSTILE_SITE_KEY` and `NEXT_PUBLIC_SANITY_*` are intentionally public |
> | "`proxy.ts` / `src/proxy.ts` \| Clerk auth proxy" (Key Files) | Root `proxy.ts` and any `src/middleware.ts` do not exist; the only proxy is `src/proxy.ts` (`isStudioRoute` `:5`, `proxy()` `:24`, `config` `:38`) |
> | "`PortfolioContent()` … `sanityFetch()` × N queries … renders all sections" (Data Flow) | `PortfolioContent` fetches only `NAVIGATION_QUERY` + `PROJECTS_QUERY` (`src/components/PortfolioContent.tsx:25-26`); `Home()` fetches `PROFILE_QUERY` + `SITE_SETTINGS_QUERY` (`src/app/(portfolio)/page.tsx:95-96`); each section component fetches its own data |
> | "pnpm typegen → pnpm typecheck → pnpm lint → pnpm build" (Build Pipeline) | `build` already runs `pnpm typegen && pnpm typecheck && next build` (`package.json:7`); `lint` is `npx @biomejs/biome check .` (`:9`) |
> | "POST /api/chat … isAllowedOrigin() gate" (Data Flow) | Route first rejects `BLOCKED_UA` (`src/app/api/chat/route.ts:87`), then `isAllowedOrigin` (`:94`, imported from `src/lib/request-guards.ts` `:19`), then verifies the `chat_token` cookie (`:101`) |

# Architecture Overview

> [[../INDEX|← Back to Index]]

## Stack

| Layer | Tech | Notes |
|-------|------|-------|
| Framework | Next.js 16.1.1 App Router | React 19.2.3 |
| Language | TypeScript strict | `@/*` → `src/*` |
| Styling | Tailwind CSS v4 | CSS-first, no tailwind.config.ts |
| CMS | Sanity v4 + next-sanity | Live content API |
| Auth | Clerk | Guards `/studio` only |
| 3D | Three.js + R3F + drei | `@react-three/fiber`, `@react-three/drei` |
| AI | Gemini 2.5 Flash → Groq → degraded | Server-only keys |
| Lint | Biome 2.2.0 | Never ESLint or Prettier |
| Tests | Vitest 4 + jsdom + @testing-library | `pnpm test` |
| Deploy | Vercel | Auto-deploy on push to `main` |
| Package | pnpm | Never npm or yarn |

## High-Level Data Flow

```
Browser
  │
  ├─► GET / (portfolio page)
  │     └─► Home() [src/app/(portfolio)/page.tsx]
  │           └─► PortfolioContent() [server component]
  │                 ├─► sanityFetch() × N queries
  │                 └─► renders all sections
  │
  ├─► GET /studio/* (Sanity Studio)
  │     └─► Clerk auth guard → StudioClient
  │
  └─► POST /api/chat (Orby chatbot)
        ├─► isAllowedOrigin() gate
        ├─► HMAC token verification
        ├─► Upstash rate limit (burst + daily)
        ├─► fetchCatalog() → buildSystemPrompt()
        ├─► routeChat() → Gemini → Groq → degraded
        └─► streaming response
```

## Key Files

| File | Role |
|------|------|
| `src/app/(portfolio)/page.tsx` | Portfolio home entry |
| `src/components/PortfolioContent.tsx` | Section composition (server) |
| `src/sanity/lib/live.ts` | `sanityFetch()` — only way to read content |
| `src/sanity/lib/queries.ts` | All GROQ queries |
| `src/app/api/chat/route.ts` | Chat POST handler |
| `src/lib/model-router.ts` | Gemini → Groq → degraded routing |
| `src/lib/chat-context.ts` | System prompt builder |
| `src/lib/chat-tools.ts` | 6 closed tools |
| `src/lib/personas/index.ts` | 4 persona system prompts |
| `proxy.ts` / `src/proxy.ts` | Clerk auth proxy |
| `src/app/globals.css` | Design system (Tailwind v4 CSS-first) |

## Build Pipeline

```bash
pnpm typegen        # 1. Sync Sanity schema → src/sanity/types/index.ts
pnpm typecheck      # 2. TypeScript strict
pnpm lint           # 3. Biome check
pnpm build          # 4. Full production build
```

## Environment Variables (server-only, never NEXT_PUBLIC_)

- `GEMINI_API_KEY` — primary AI model
- `GROQ_API_KEY` — fallback AI model  
- `CHAT_TOKEN_SECRET` — HMAC token signing
- `UPSTASH_REDIS_REST_URL` — rate limit store
- `UPSTASH_REDIS_REST_TOKEN` — rate limit auth

## See Also
- [[01-nextjs-routes|Next.js Routes]]
- [[02-sanity-cms|Sanity CMS]]
- [[03-auth-clerk|Auth (Clerk)]]
- [[../chatbot/00-orby-overview|Orby Chatbot]]
