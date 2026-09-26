---
type: subsystem
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/04 Portfolio Lab — Agent Runtime and Grounding.md
sync: managed
tags: [portfolio, ai, agent, grounding, tools]
---

# 04 Portfolio Lab — Agent Runtime and Grounding

## Purpose

Portfolio Lab is a bounded, evidence-first chat surface. It is not a general assistant: it answers from live Sanity facts and a small authoritative site-context block, calls a closed tool set, and degrades deterministically when providers fail.

## Request flow

```text
PortfolioLab UI
  → POST /api/chat
  → request guards + HMAC cookie + input limits
  → fetchCatalog()
  → buildSystemPrompt(persona, catalog)
  → buildChatTools(catalog)
  → routeChat()
  → stream sanitizer/cache/tool rendering
```

Security details are separated into [[05 API Security, Auth, Rate Limits, and Degraded Mode]].

## Grounding model

`fetchCatalog` obtains `CHAT_CATALOG_QUERY` using a server client when possible and a public client fallback otherwise. The prompt compactor strips invisible characters, bounds fields, ranks skills, and serializes a compact catalog. The system prompt then enforces:

- answers only from the catalog/site context;
- a fixed refusal when the record lacks the answer;
- professional-scope limits;
- concise prose plus structured tool results;
- mandatory navigation and evidence cards for applicable answers;
- structured function calls only, never pseudo-tool markup in prose.

Persona modules change voice and decision framing, not factual permissions.

## Closed tools

`buildChatTools` creates six tools:

- `navigate` returns a validated section target plus Orby arrival text;
- `showProject` fetches a project by a live-catalog slug enum;
- `showExperience` fetches an experience by a live-catalog ID enum;
- `lookupFact` searches the bounded catalog and returns at most five records;
- `getResume` assembles a compact proof pack from catalog facts;
- `contact` opens the contact action.

Project slugs and experience IDs are derived from the current catalog, reducing model freedom. Tool implementations catch failures and return renderable fail-safe results.

## Model routing

`model-router.ts` tries Cerebras, Groq, then Mistral. Upstash stores per-session message counts and provider cooldowns. After the first ten session messages, routing begins at Groq to control budget. AI SDK streaming is forced far enough to surface initial provider failures before bytes reach the client. When all live providers are unavailable, the route selects persona-aware deterministic degraded text and navigation.

## UI responsibilities

`PortfolioLab.tsx` owns panel/session behavior. `ChatThread` renders constrained Markdown and tool events. `ToolResultRenderer` dispatches typed evidence cards. Suggested chips and fixed prompts provide deterministic high-value entry points; fixed prompts inject an exact navigation target and answer brief server-side.

## Change contracts

- Adding a factual answer requires Sanity → catalog projection → type → compact prompt/tool coverage → eval.
- Adding a tool requires a Zod schema, strict mode, bounded output, failure-safe execution, renderer, route tests, and tool-correctness evals.
- Never widen arbitrary URL, query, or identifier parameters when a live enum can close the domain.
- Preserve the exact refusal behavior and injection resistance.
- Changes to wire-format sanitization need regression cases for malformed pseudo-tool JSON and streaming fragments.

## Graphify query recipes

```bash
graphify query "chat route grounding system prompt personas tools model routing degraded" --context call --context import --budget 4000
graphify path "CHAT_CATALOG_QUERY" "ToolResultRenderer.tsx"
graphify affected "buildChatTools()" --depth 3
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1181 nodes / 2139 edges**
- This subsystem: **25 files / 131 nodes / 309 touching edges**
- Leading communities: `chat/route.ts` (21), `PortfolioLab.tsx` (20), `personas/index.ts` (17), `ToolResultRenderer.tsx` (15), `chat-tools.ts` (13), `chat-context.ts` (12)

### High-connectivity symbols

- `chat/route.ts` — `src/app/api/chat/route.ts:L1` (degree 37)
- `chat-tools.ts` — `src/lib/chat-tools.ts:L1` (degree 30)
- `chat-context.ts` — `src/lib/chat-context.ts:L1` (degree 21)
- `model-router.ts` — `src/lib/model-router.ts:L1` (degree 19)
- `POST()` — `src/app/api/chat/route.ts:L84` (degree 18)
- `personas/index.ts` — `src/lib/personas/index.ts:L1` (degree 17)
- `degraded-responses.ts` — `src/lib/degraded-responses.ts:L1` (degree 12)
- `buildChatTools()` — `src/lib/chat-tools.ts:L192` (degree 8)
- `fixed-prompts.ts` — `src/lib/fixed-prompts.ts:L1` (degree 8)
- `buildSystemPrompt()` — `src/lib/chat-context.ts:L139` (degree 6)
- `Persona` — `src/lib/personas/index.ts:L7` (degree 6)
- `Persona` — `src/components/lab/PersonaSelector.tsx:L5` (degree 6)

### Owned source files

- `src/app/api/chat/route.ts`
- `src/components/chat/ChatErrorBoundary.tsx`
- `src/components/lab/ChatInputBar.tsx`
- `src/components/lab/ChatThread.tsx`
- `src/components/lab/EvidenceCard.tsx`
- `src/components/lab/PanelOrby.tsx`
- `src/components/lab/PersonaSelector.tsx`
- `src/components/lab/PortfolioLab.tsx`
- `src/components/lab/PowerPromptBlock.tsx`
- `src/components/lab/ProofPack.tsx`
- `src/components/lab/SuggestedChips.tsx`
- `src/components/lab/cards/ExperienceEvidenceCard.tsx`
- `src/components/lab/cards/ProjectEvidenceCard.tsx`
- `src/components/lab/cards/ToolResultRenderer.tsx`
- `src/lib/chat-context.ts`
- `src/lib/chat-sanitizer.ts`
- `src/lib/chat-tools.ts`
- `src/lib/degraded-responses.ts`
- `src/lib/fixed-prompts.ts`
- `src/lib/model-router.ts`
- `src/lib/personas/ceo.ts`
- `src/lib/personas/friend.ts`
- `src/lib/personas/index.ts`
- `src/lib/personas/recruiter.ts`
- `src/lib/personas/weirdo.ts`
<!-- graphify:auto:end -->

## Related notes

- [[02 Sanity Content Model and Query Flow]]
- [[05 API Security, Auth, Rate Limits, and Degraded Mode]]
- [[08 Orby State, Navigation, and Commentary]]
- [[09 Testing, Prompt Evals, and Quality Gates]]
