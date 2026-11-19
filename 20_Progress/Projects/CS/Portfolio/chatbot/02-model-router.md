---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, chatbot, model-router, gemini, groq, degraded]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> | This note says | Repo reality |
> |---|---|
> | "Try: google (Gemini 2.5 Flash)" (§Routing Logic), "`GEMINI_API_KEY` # Gemini 2.5 Flash — primary" (§Environment Variables) | No Gemini in `src/`. `PROVIDER_CHAIN`: Cerebras `zai-glm-4.7` (`src/lib/model-router.ts:48-56`) → Groq `llama-3.3-70b-versatile` (`:58-63`) → Mistral `mistral-small-latest` (`:65-69`); keys `CEREBRAS_API_KEY`, `GROQ_API_KEY`, `MISTRAL_API_KEY` |
> | "groq (Groq LLaMA/Mixtral)" (§Routing Logic) | `llama-3.3-70b-versatile` only; no Mixtral (`model-router.ts:61`) |
> | Key Exports: `google`, `groq`, `isQuotaError()`, `LiveResult` (§Key Exports) | `model-router.ts` exports only `RouterOpts` (`:89`), `RouterResult` (`:103`), `routeChat` (`:116`). No `isQuotaError` anywhere in `src/`; `LiveResult` is a private type. Failover is on any thrown error, with Redis cooldown key `chat:cooldown:{provider}` (30 s default, retry hints parsed up to 120 s) (`:152,:228-250`) |
> | Router result has `live` and degraded only (§Routing Logic) | `RouterResult` has three modes `live`, `degraded`, `cooldown` (`model-router.ts:103-110`); `cooldown` when every keyed leg is cooling down (`:254-271`) and the route answers with a cooldown text (`src/app/api/chat/route.ts:359-370`) |
> | Degraded exports `Intent`, `detectIntent()`, `DegradedTemplates` / `TEMPLATES`, `DEGRADED_ORBY_MESSAGES`, `NAV_PATTERNS` (§Degraded Mode) | Those are module-private (`src/lib/degraded-responses.ts:17,43,51,64,66,139`). Exported: `getDegradedNavigation` (`:32`), `getDegradedText` (`:130`), `getDegradedOrbyMessage` (`:193`) |
> | "`getDegradedText(intent, persona)`" (§Degraded Mode) | Signature is `getDegradedText(persona, userMessage)`; intent is detected inside (`degraded-responses.ts:130-132`) |

# Model Router

> [[../INDEX|← Back to Index]] · [[00-orby-overview|Orby Overview]]

## File

`src/lib/model-router.ts` — Community 1

## Routing Logic

```
routeChat(opts)
  │
  ├── Try: google (Gemini 2.5 Flash)
  │     ├── Success → stream LiveResult
  │     └── isQuotaError() → fall through
  │
  ├── Try: groq (Groq LLaMA/Mixtral)
  │     ├── Success → stream LiveResult
  │     └── isQuotaError() → fall through
  │
  └── Degraded: getDegradedText(intent, persona)
        └── Return pre-written answer from src/lib/degraded-responses.ts
```

## Key Exports

| Export | Role |
|--------|------|
| `google` | Google AI SDK instance (Gemini) |
| `groq` | Groq SDK instance |
| `routeChat()` | Main routing function |
| `isQuotaError()` | Detects 429/quota errors from either provider |
| `LiveResult` | Type for streaming result |
| `RouterOpts` | Input type |
| `RouterResult` | Output type |

## Degraded Mode — `src/lib/degraded-responses.ts`

When both Gemini and Groq are quota-exhausted, Orby falls back to pre-written answers.

Key exports:
- `Intent` — enum of detectable user intents
- `detectIntent()` — classifies user message into Intent
- `DegradedTemplates` / `TEMPLATES` — pre-written responses per intent × persona
- `getDegradedText(intent, persona)` — returns best pre-written answer
- `DEGRADED_ORBY_MESSAGES` — Orby-specific fallback messages
- `getDegradedOrbyMessage()` — gets Orby UI message for degraded state
- `NAV_PATTERNS` — regex patterns for navigation intent detection
- `getDegradedNavigation()` — returns navigation instructions in degraded mode

## Environment Variables

```
GEMINI_API_KEY   # Gemini 2.5 Flash — primary
GROQ_API_KEY     # Groq — secondary fallback
```

Both are server-only. Never expose to client.

## See Also
- [[01-api-route|API Route (calls routeChat)]]
- [[03-personas|Personas (injected into routeChat opts)]]
- [[04-tools|Tools (passed to routeChat)]]
