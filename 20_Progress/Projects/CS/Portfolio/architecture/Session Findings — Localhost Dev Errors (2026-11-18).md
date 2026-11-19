---
type: concept
status: sprout
created: 2026-11-18
updated: 2026-11-18
tags:
  - portfolio
  - architecture
  - localhost
  - dev-errors
notes:
  - "[[00-overview|Architecture Overview]]"
  - "[[02-sanity-cms|Sanity CMS Layer]]"
  - "[[03-auth-clerk|Auth (Clerk)]]"
  - "[[../chatbot/00-orby-overview|Orby Chatbot]]"
next: "Re-run `pnpm dev` and `pnpm test:watch` after fixes; append deltas to this note or replace with a dated follow-up."
---

# Session Findings — Localhost Dev Errors (2026-11-18)

> [[../INDEX|← Back to Index]] · [[00-overview|Architecture Overview]]

==Snapshot of everything failing or noisy on `http://localhost:3000` and in `pnpm test:watch` on branch `post-frontend`, observed 2026-11-18 (Next.js 16.2.9, Turbopack, `.env.local` loaded).==

## Observation setup

- **Dev server:** `pnpm run dev` → `http://localhost:3000`, ready in ~424ms; first `GET /` took 11.2s, later loads 4.6–19.8s when Sanity timed out.
- **Tests:** `pnpm test:watch` (Vitest 4.1.5); **324 passed, 4 failed, 74 skipped** in one full run (~52s).
- **Repo path:** WSL portfolio checkout on `post-frontend` with uncommitted local changes.

## Severity map

| Tier | Area | Symptom |
|------|------|---------|
| **P0** | Sanity CDN | `ConnectTimeoutError` to `hh1i87hh.apicdn.sanity.io:443` (10s); `fetch failed` digest `3227098399`; page load up to ~20s |
| **P0** | Home render | Browser: `Uncaught TypeError: fetch failed` at `src/app/(portfolio)/page.tsx` (~line 113) inside `PortfolioContent` |
| **P1** | Chat router | Cerebras `zai-glm-4.7` archived; Groq `llama-3.3-70b-versatile` 404; Mistral `mistral-small-latest` 429; Orby turn falls through providers |
| **P1** | Turnstile | Cloudflare error **300030**; `[Turnstile] Challenge failed — chat token unavailable` (`ChatTokenInit.tsx` ~89); repeats in console |
| **P1** | Chat API | `{"event":"chat.rejected","reason":"parse_error","sessionId":"..."}` on first `/api/chat` compile |
| **P2** | Orby idle comment | `POST /api/orby-comment` **401** before a valid chat token exists |
| **P2** | Vitest | 4 failures: AboutSection source-contract tests (3) + `logoTexture.test.ts` timeout (1) |
| **Info** | Clerk | Development keys loaded (expected locally) |
| **Info** | Motion / layout | "container has a non-static position" scroll-offset warning |
| **Info** | Turnstile | "Ignored message from unexpected source for event: requestExtraParams" |

## Runtime — Sanity content API

Multiple GROQ fetches against Sanity CDN failed after **5 attempts** each:

- Profile (`coalesce` singleton profile query)
- Achievements (`*[_type == "achievement"]`)
- Blog posts (`*[_type == "blog"]` slice)

**Error shape:** `[TypeError: fetch failed]` with `cause: ConnectTimeoutError` (`UND_ERR_CONNECT_TIMEOUT`), target `https://hh1i87hh.apicdn.sanity.io/v2025-01-01/data/query/develop?...`, `attemptNumber: 5`.

**Effect:** Server-side `sanityFetch` / `next-loader.fetch.fetch-sync-tags` path blocks or degrades home composition; client surfaces `fetch failed` when `PortfolioContent` cannot complete its data path.

> [!WARNING] Network vs code
> Timeouts may be transient (WSL egress, VPN, Sanity edge). Still a P0 locally because the home route throws instead of falling back cleanly when CDN is unreachable.

## Runtime — AI provider router (Orby / idle commentary)

Logged during `router.turn` with `startProvider: cerebras`, `tier: full`:

1. **Cerebras** — HTTP 404, body: `Model zai-glm-4.7 is archived and unavailable for the organization.` → `router.fail` + 30s cooldown.
2. **Groq** — HTTP 404, `llama-3.3-70b-versatile` does not exist or no access → `router.fail` + cooldown.
3. **Mistral** — HTTP 429 rate limit (`x-ratelimit-remaining-req-minute: 0`) → `router.fail` + cooldown.

A later `POST /api/orby-comment` returned **200** after ~14.2s (likely degraded path or late provider), but the failure chain shows **configured model IDs and API quotas are out of sync with what the keys can call**.

## Runtime — Chat token and Turnstile

- `POST /api/chat-token` often **200** (fast, 9–45ms) even when Turnstile fails in the browser.
- Repeated browser errors: **Turnstile 300030** and `Challenge failed — chat token unavailable` in `src/components/ChatTokenInit.tsx`.
- First `POST /api/orby-comment` **401** aligns with missing/invalid token before Turnstile succeeds.

Local dev may need Turnstile test keys, host allowlisting, or the documented dev bypass path if Cloudflare challenge cannot complete on localhost.

## Runtime — Chat request rejection

On first compile of `/api/chat`:

```json
{"event":"chat.rejected","reason":"parse_error","sessionId":"1795064443686"}
```

Indicates the chat route rejected a malformed or unparsable request body (or stream chunk) before provider routing. Correlate with client payload shape and Zod/parse guards in `src/app/api/chat/route.ts`.

## Browser — informational

- **Clerk:** dev instance warning (not a production defect).
- **Scroll container:** non-static positioning warning (likely Framer Motion / scroll-linked component parent).
- **Turnstile:** `requestExtraParams` message from unexpected source (often benign in embedded widgets).

## Vitest — failing tests (same session)

### AboutSection contract drift (3 failures)

Preservation and bug-condition tests still assert symbols live in `AboutSection.tsx` server source:

| Test expectation | Actual (2026-11-18) |
|------------------|---------------------|
| `PortableText` in AboutSection | Bio moved to `AboutSectionClient` |
| `AboutTelemetry` in AboutSection | Stats UI not imported in server file |
| `CometCard` import in AboutSection | Server section only wires `AboutSectionClient` |

**Files:** `hero-ui-polish-preservation.test.tsx`, `hero-ui-polish-bug-condition.test.tsx` vs `src/components/sections/AboutSection.tsx`.

### logoTexture property test (1 failure)

`src/lib/__tests__/logoTexture.test.ts` — fast-check property **timed out at 5000ms** (`never throws, returns length width*height...`). Likely heavy/fast-check iteration under load, not necessarily a production logo bug.

### Warnings (non-failing)

- `vi.mock` not at top level in `hero-ui-polish-bug-condition.test.tsx` (future Vitest error).
- `THREE.WARNING: Multiple instances of Three.js` in some component tests.
- `<mesh>` unrecognized in jsdom HeaderLogo tests (expected in non-R3F test env).

## What was not failing

- `src/app/api/chat/__tests__/route.test.ts` — **10/10 passed** (mocks cover failover and degraded mode).
- Most UI preservation tests in `hero-ui-polish-preservation.test.tsx` — **40/42 passed**.
- Subsequent `GET /` **200** responses after timeouts (partial recovery when Sanity responds).

## Evidence

- Dev terminal: `pnpm run dev`, Next.js 16.2.9, logs through Turnstile/chat-token spam on 2026-11-18.
- Test terminal: `pnpm test:watch` full run summary **4 failed | 324 passed | 74 skipped**.

## See also

- [[02-sanity-cms|Sanity CMS Layer]] — `sanityFetch` and CDN query path
- [[03-auth-clerk|Auth (Clerk)]] — studio guard; unrelated to chat 401
- [[../chatbot/00-orby-overview|Orby Chatbot]] — provider stack and degraded mode
- [[../frontend/ui-fixes-index|Frontend UI Fixes Index]] — AboutSection / hero polish context
