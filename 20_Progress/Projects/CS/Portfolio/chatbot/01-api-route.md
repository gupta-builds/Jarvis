---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, chatbot, api, security, rate-limiting]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> | This note says | Repo reality |
> |---|---|
> | Gate order 1 origin, 2 HMAC, 3 rate limit, 4 scraper block (§Security Gate Stack) | Actual order in `POST`: scraper UA block 403 (`src/app/api/chat/route.ts:87-88`) → Origin/Referer 403 (`:94-95`) → HMAC `chat_token` cookie 401 (`:100-102`) → body validation 400 (`:122-168`) → rate limit 429 (`:192-215`) |
> | `limiter: Ratelimit.slidingWindow(10, '10 s')` for burst (§Rate Limiting) | `Ratelimit.slidingWindow(10, "60 s")`, prefix `chat:burst` (`route.ts:41`); daily `slidingWindow(100, "24 h")` is correct (`route.ts:47`). Rate limiting fails open if Upstash is unreachable (`route.ts:219-221`) |
> | `const redis = Redis.fromEnv()` (§Rate Limiting) | `new Redis({ url: process.env.UPSTASH_REDIS_REST_URL!, token: process.env.UPSTASH_REDIS_REST_TOKEN! })` (`route.ts:34-37`) |
> | Key Exports table lists `redis`, `burstLimit`, `dailyLimit`, `isAllowedOrigin()` as `route.ts` exports (§Key Exports) | `route.ts` exports only `POST` (`route.ts:84`); `redis`/limiters are module-private (`:34,:39,:44`); `isAllowedOrigin` and `BLOCKED_UA` live in `src/lib/request-guards.ts` (imported `route.ts:19`) |
> | "`getSanityClient()` → `fetchCatalog()` → `buildSystemPrompt()`" and "`routeChat({ messages, systemPrompt, tools })`" (§Request Flow) | Route calls `fetchCatalog()` then `buildSystemPrompt(persona, catalog)` and `buildChatTools(catalog)` (`route.ts:236-240`); `routeChat({ system, messages, tools, maxOutputTokens: 800, stopWhen: stepCountIs(5), abortSignal, persona, userMessage, sessionId })` (`route.ts:321-331`) |
> | "Try Gemini 2.5 Flash … On quota error → try Groq → On Groq quota error → `getDegradedText()`" (§Request Flow) | No Gemini. Chain Cerebras `zai-glm-4.7` → Groq `llama-3.3-70b-versatile` → Mistral `mistral-small-latest` → `degraded` (or `cooldown`) (`src/lib/model-router.ts:48-70,254-273`) |
> | "On page load, `ChatTokenInit` component calls `GET /api/chat-token`" (§HMAC Token Flow) | `ChatTokenInit` does `POST /api/chat-token` with a `turnstileToken` (`src/components/ChatTokenInit.tsx:25-30`); server verifies it with Cloudflare siteverify before issuing the cookie (`src/app/api/chat-token/route.ts:15,109`). `GET` is a legacy / local-dev path (`ChatTokenInit.tsx:46`, `chat-token/route.ts:71`). Token TTL 1 h (`src/lib/chat-token.ts:1`), cookie `httpOnly`, `sameSite: "strict"`, `maxAge: 3600` (`chat-token/route.ts:96-99,164-167`) |
> | "Injects full Sanity catalog as grounding context"; "Formats catalog: profile, experience, projects, skills, education, certs, achievements" (§System Prompt Construction, §Request Flow) | Prompt gets a compact index, not full records: projects (`_id,title,slug,tagline`), experience without descriptions, top-60 skill names, education, certs, achievements; no `profile` key (`src/lib/chat-context.ts:67,103-136`; `CHAT_CATALOG_QUERY` `src/sanity/lib/queries.ts:190-211`). Full records come on demand via tools |

# Chatbot API Route

> [[../INDEX|← Back to Index]] · [[00-orby-overview|Orby Overview]]

## File

`src/app/api/chat/route.ts` — Community 1

## Security Gate Stack (in order)

```
POST /api/chat
  │
  1. isAllowedOrigin() — checks Origin header against allowlist
  │   → 403 if origin not permitted
  │
  2. HMAC token — verifies cookie signed with CHAT_TOKEN_SECRET
  │   → 401 if token missing or invalid
  │
  3. Upstash rate limit
  │   ├── burstLimit  — short window (per-IP burst protection)
  │   └── dailyLimit  — 24h window (quota protection)
  │   → 429 if either limit exceeded
  │
  4. Scraper block — checks User-Agent for known bot patterns
  │   → 403 if detected
  │
  └── ✅ Pass → build context → route to model → stream response
```

## Key Exports from route.ts

| Export | Role |
|--------|------|
| `redis` | Upstash Redis instance (rate limit store) |
| `burstLimit` | Ratelimit instance — burst window |
| `dailyLimit` | Ratelimit instance — daily window |
| `isAllowedOrigin()` | Origin allowlist check function |
| `POST()` | Main handler |

## Request Flow inside POST()

```
POST()
  ├── Parse body: { messages, persona }
  ├── getSanityClient() → fetchCatalog() → buildSystemPrompt()
  │     └── Injects full Sanity catalog as grounding context
  ├── getPersonaBlock(persona) → append persona system prompt
  ├── buildChatTools() → 6 closed tools
  └── routeChat({ messages, systemPrompt, tools })
        ├── Try Gemini 2.5 Flash (Google)
        ├── On quota error → try Groq
        ├── On Groq quota error → getDegradedText()
        └── Stream response back
```

## HMAC Token Flow

1. On page load, `ChatTokenInit` component calls `GET /api/chat-token`
2. Server signs a token with `CHAT_TOKEN_SECRET` and sets `httpOnly` cookie
3. Chat route reads cookie and verifies HMAC signature
4. Tokens are short-lived; `ChatTokenInit` refreshes on mount

## Rate Limiting (Upstash Redis)

```typescript
// Community 1
const redis = Redis.fromEnv()
const burstLimit = new Ratelimit({
  redis,
  limiter: Ratelimit.slidingWindow(10, '10 s'),
})
const dailyLimit = new Ratelimit({
  redis,
  limiter: Ratelimit.slidingWindow(100, '24 h'),
})
```

## System Prompt Construction

`buildSystemPrompt()` in `src/lib/chat-context.ts`:
1. `fetchCatalog()` — runs `CHAT_CATALOG_QUERY` against Sanity
2. Formats catalog: profile, experience, projects, skills, education, certs, achievements
3. Appends refusal rules (no hallucination, grounded-only answers)
4. Persona block appended after base prompt

## See Also
- [[02-model-router|Model Router]]
- [[../architecture/03-auth-clerk|Auth (Clerk)]]
- [[../communities/community-01-chatbot-backend|Community 1 Detail]]
