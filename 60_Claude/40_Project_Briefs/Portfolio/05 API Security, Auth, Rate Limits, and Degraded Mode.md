---
type: subsystem
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/05 API Security, Auth, Rate Limits, and Degraded Mode.md
sync: managed
tags: [portfolio, security, api, auth, rate-limit]
---

# 05 API Security, Auth, Rate Limits, and Degraded Mode

## Purpose

The public site has multiple server routes, with `/api/chat` and `/api/orby-comment` carrying the highest abuse and cost risk. Their controls are layered so no single header, cookie, or provider is treated as sufficient.

## Chat admission sequence

`POST /api/chat` applies controls in this order:

1. Reject known scraper user agents.
2. Require an allowed Origin or Referer.
3. Verify the short-lived HMAC `chat_token` cookie.
4. Parse and bound the message array, reject `system` roles, cap content length, and strip HTML.
5. Resolve a proxy-aware client IP.
6. Apply burst and daily Upstash limits unless the explicit development bypass matches.
7. Build grounded context and closed tools.
8. Route across providers, sanitize model output, and cache safe exact-match responses.

`/api/orby-comment` uses the same origin/token/IP foundation and a separate three-per-minute limit. A rate-limit or provider failure returns local flavor text rather than surfacing an infrastructure failure.

## Token boundary

`/api/chat-token` issues the cookie used by both chat paths. `src/lib/chat-token.ts` signs and verifies it with a server secret and TTL. `ChatTokenInit` exists only to initialize this browser-to-server trust token; it does not authorize CMS or Clerk operations.

## IP and origin trust

`request-guards.ts` trusts Cloudflare’s connecting IP only when both the production host and Cloudflare ray header are present. Otherwise it uses platform proxy headers. Allowed origins are assembled from localhost, configured public URLs, and the current Vercel deployment URL.

When editing this logic, test Cloudflare production, Vercel preview, localhost, spoofed forwarding headers, absent Origin/Referer, and malformed Referer separately.

## Fail-open versus fail-closed

- Authentication, origin checks, message validation, and system-role injection are fail-closed.
- Rate-limit storage failure is logged and fails open so Redis downtime does not take down the portfolio.
- Provider failures cascade through the model router and end in deterministic degraded output.
- Sanity catalog fetch failure supplies an empty catalog; the refusal rule then prevents invented facts.
- Ambient Orby commentary always has local fallback lines.

These choices are intentional. Do not homogenize them into “always fail open” or “always fail closed.”

## Platform headers

`next.config.ts` sets HSTS, nosniff, frame denial, referrer policy, permissions policy, and an enforced CSP. The CSP allows only the origins needed by Clerk, Cloudflare Turnstile, Sanity, images, and same-origin APIs. Production removes development-only `unsafe-eval` and upgrades insecure requests.

## Security-sensitive change checklist

- Route input has a size/shape bound.
- Secrets remain server-only and are absent from logs/errors.
- External origin additions are minimal and reflected in CSP tests.
- New Upstash keys have a namespace and TTL.
- New model/tool behavior cannot bypass catalog grounding.
- Route tests cover 400/401/403/429 and degraded behavior.
- Run the security reviewer before production changes.

## Graphify query recipes

```bash
graphify query "chat security token origin IP rate limit CSP degraded mode" --context call --context field --budget 4000
graphify path "verifyToken()" "routeChat()"
graphify affected "isAllowedOrigin()" --depth 3
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1181 nodes / 2139 edges**
- This subsystem: **14 files / 64 nodes / 156 touching edges**
- Leading communities: `orby-comment/route.ts` (25), `next` (16), `chat/__tests__/route.test.ts` (11), `chat/route.ts` (10), `app/layout.tsx` (2)

### High-connectivity symbols

- `chat/route.ts` — `src/app/api/chat/route.ts:L1` (degree 37)
- `orby-comment/route.ts` — `src/app/api/orby-comment/route.ts:L1` (degree 22)
- `POST()` — `src/app/api/chat/route.ts:L84` (degree 18)
- `chat/__tests__/route.test.ts` — `src/app/api/chat/__tests__/route.test.ts:L1` (degree 15)
- `chat-token.ts` — `src/lib/chat-token.ts:L1` (degree 10)
- `chat-token/route.ts` — `src/app/api/chat-token/route.ts:L1` (degree 9)
- `orby-comment/__tests__/route.test.ts` — `src/app/api/orby-comment/__tests__/route.test.ts:L1` (degree 9)
- `verifyToken()` — `src/lib/chat-token.ts:L43` (degree 9)
- `POST()` — `src/app/api/orby-comment/route.ts:L60` (degree 8)
- `getClientIp()` — `src/lib/request-guards.ts:L21` (degree 7)
- `request-guards.ts` — `src/lib/request-guards.ts:L1` (degree 7)
- `isAllowedOrigin()` — `src/lib/request-guards.ts:L41` (degree 6)

### Owned source files

- `src/app/api/orby-comment/__tests__/route.test.ts`
- `src/app/api/orby-comment/route.ts`
- `src/lib/request-guards.ts`
- `next.config.ts`
- `src/app/api/chat-token/route.ts`
- `src/app/api/chat/__tests__/route.test.ts`
- `src/app/api/chat/route.ts`
- `src/app/api/draft-mode/disable/route.ts`
- `src/app/api/draft-mode/enable/route.ts`
- `src/app/api/error-report/route.ts`
- `src/app/api/health/route.ts`
- `src/app/api/revalidate/route.ts`
- `src/lib/chat-token.ts`
- `src/lib/clerk-appearance.ts`
<!-- graphify:auto:end -->

## Related notes

- [[04 Portfolio Lab — Agent Runtime and Grounding]]
- [[08 Orby State, Navigation, and Commentary]]
- [[09 Testing, Prompt Evals, and Quality Gates]]
- [[10 Deployment, Preview, and Operational Runbook]]
