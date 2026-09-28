---
type: subsystem
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/08 Orby State, Navigation, and Commentary.md
sync: managed
tags: [portfolio, orby, state-machine, navigation, commentary]
---

# 08 Orby State, Navigation, and Commentary

## Purpose

Orby is the ambient astronaut companion connecting scroll position, section awareness, and Portfolio Lab navigation. It has two independent speech producers—deterministic page-state copy and optional model-generated idle commentary—feeding one event/state surface.

## State machine

`useOrbyState.ts` owns these states:

```text
intro → pointing → roaming → exitingLeft → goodbye
                         ↘ departingLeft → returningRight → pointing

chat navigation: chat-nav-home → chat-nav-arrival
accessibility: reducedMotion
```

Timers drive intro/pointing/departure transitions. Lenis progress drives end-of-page transitions, with a native scroll fallback when Lenis is absent. IntersectionObservers emit one-time section comments for about, projects, blog, and contact. Chat navigation temporarily takes priority and uses cancellation/timeout cleanup.

## Position and rendering

`Orby.tsx` converts state into pose and screen position while accounting for sidebar and mobile layout. `OrbyCanvas`, `OrbyModel`, `OrbySpeechCloud`, and `OrbyArrow` split rendering responsibilities. Keep state decisions out of the canvas/model components.

## Chat navigation contract

The chat `navigate` tool returns `sectionId`, `orbyMessage`, and optional project/experience targeting. The Lab dispatches a browser event; Orby glides home, the page scrolls to the section, an arrival observer confirms the destination, and Orby speaks the provided line. Stable section IDs therefore couple:

- `PortfolioContent` and section DOM;
- `chat-tools.ts` `SECTION_IDS`;
- fixed prompts;
- Orby section observers;
- navigation regression tests.

## Idle commentary

`useOrbyIdleCommentary.ts` fires after an eight-second scroll dwell or three Orby clicks, with a 45-second cooldown and one request in flight. It calls `/api/orby-comment` and emits `orby:speech` only on a successful text response.

The route reuses token, origin, user-agent, IP, rate-limit, and provider routing infrastructure. Its prompt explicitly avoids unprovided facts, uses no meaningful catalog, limits output to one short line, and falls back to local copy on every failure path.

## Invariants

- Reduced motion bypasses roaming animation and network-driven distraction.
- All timers, observers, scroll listeners, and custom-event listeners are cleaned up.
- A section comment fires once per browsing cycle unless explicitly reset.
- Ambient commentary never states a professional fact.
- Failed requests are silent in the UI.
- Chat-directed navigation wins over ambient transitions until arrival or cancellation.
- Sidebar/mobile offsets are computed in one position layer.

## Graphify query recipes

```bash
graphify query "Orby state navigation scroll progress idle commentary speech event" --context call --context field --budget 4000
graphify path "navigate" "useOrbyState()"
graphify affected "useOrbyIdleCommentary()" --depth 3
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1147 nodes / 2163 edges**
- This subsystem: **12 files / 62 nodes / 150 touching edges**
- Leading communities: `useOrbyState.ts` (16), `Orby.tsx` (13), `orby-comment/route.ts` (11), `OrbySpeechCloud.tsx` (8), `OrbyCanvas.tsx` (7), `utils.ts` (7)

### High-connectivity symbols

- `orby-comment/route.ts` — `src/app/api/orby-comment/route.ts:L1` (degree 22)
- `useOrbyState.ts` — `src/components/orby/useOrbyState.ts:L1` (degree 17)
- `Orby()` — `src/components/orby/Orby.tsx:L72` (degree 11)
- `orby-comment/__tests__/route.test.ts` — `src/app/api/orby-comment/__tests__/route.test.ts:L1` (degree 9)
- `POST()` — `src/app/api/orby-comment/route.ts:L60` (degree 8)
- `useScrollProgress.ts` — `src/components/orby/useScrollProgress.ts:L1` (degree 8)
- `getRawScrollProgress()` — `src/components/orby/useScrollProgress.ts:L24` (degree 7)
- `useOrbyState()` — `src/components/orby/useOrbyState.ts:L90` (degree 7)
- `useTypedText.ts` — `src/components/orby/useTypedText.ts:L1` (degree 5)
- `useTypedText()` — `src/components/orby/useTypedText.ts:L22` (degree 5)
- `OrbySpeechCloud()` — `src/components/orby/OrbySpeechCloud.tsx:L32` (degree 4)
- `OrbyArrow()` — `src/components/orby/OrbyArrow.tsx:L14` (degree 3)

### Owned source files

- `src/app/api/orby-comment/__tests__/route.test.ts`
- `src/app/api/orby-comment/route.ts`
- `src/components/orby/useOrbyIdleCommentary.ts`
- `src/components/OrbyLoader.tsx`
- `src/components/orby/Orby.tsx`
- `src/components/orby/OrbyArrow.tsx`
- `src/components/orby/OrbyCanvas.tsx`
- `src/components/orby/OrbyModel.tsx`
- `src/components/orby/OrbySpeechCloud.tsx`
- `src/components/orby/useOrbyState.ts`
- `src/components/orby/useScrollProgress.ts`
- `src/components/orby/useTypedText.ts`
<!-- graphify:auto:end -->

## Related notes

- [[01 Routing, Rendering, and Server Boundaries]]
- [[04 Portfolio Lab — Agent Runtime and Grounding]]
- [[05 API Security, Auth, Rate Limits, and Degraded Mode]]
- [[06 Three.js, Motion, and Animation Performance]]
