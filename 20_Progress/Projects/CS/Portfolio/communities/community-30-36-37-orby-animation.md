---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, graph, community, orby, animation, speech]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "OrbyState — 'idle' \| 'thinking' \| 'speaking' \| 'navigating' \| ..." | `intro`, `pointing`, `roaming`, `section-comment`, `exitingLeft`, `departingLeft`, `returningRight`, `goodbye`, `reducedMotion`, `chat-nav-home`, `chat-nav-arrival` (`src/components/orby/useOrbyState.ts:8-19`) |
> | "OrbyStateResult — { state: OrbyState; message: string \| null }" | `{ state, speechText: string \| null, showArrow: boolean }` (`useOrbyState.ts:21-25`) |
> | "PositionModifiers — { x, y, scale } for Orby position tweaks" | `{ sidebarOpen: boolean; isMobile: boolean }` (`useOrbyState.ts:27-30`) |
> | "PanelOrbyState — 'idle' \| 'thinking' \| 'speaking'"; "OrbyCanvasProps — canvas size, className, state" | `PanelOrbyState` is `"idle" \| "thinking" \| "responding"` (`src/components/lab/PanelOrby.tsx:8`). `OrbyCanvasProps` is `{ pose?: OrbyPose; speaking?: boolean; size?: number }` (`src/components/orby/OrbyCanvas.tsx:414-418`) |
> | "`prefersReducedMotion()`" and `useTypedText()` listed under `OrbySpeechCloud.tsx` | Both are in `src/components/orby/useTypedText.ts` (`prefersReducedMotion` `:9`, `useTypedText` `:22`) |
> | Phase 7 table: `SECTION_TRIGGERS` / `SECTION_COPY` "Scaffolded"; "Section entry detection \| `useActiveSection.ts` \| Hook exists"; "Phase 7 = wire `useActiveSection` → `useOrbyState` → `OrbySpeechCloud`" | Already wired differently: `useOrbyState` itself runs an `IntersectionObserver` over `SECTION_TRIGGERS` (`useOrbyState.ts:56,241-253`) and `Orby.tsx` renders `OrbySpeechCloud` (`:438`). No `useActiveSection` reference exists under `src/components/orby/` (rg) |

# Communities 30, 36, 37 — Orby Animation Layer

> [[../INDEX|← Back to Index]] · [[../communities/community-overview|All Communities]]

Three tightly-coupled communities that form Orby's animation and interaction layer.

---

## Community 30 — Speech Cloud (10 nodes, cohesion 0.21)

Everything that makes Orby "speak":

```
OrbySpeechCloud.tsx
  ├── OrbySpeechCloudProps         — component props type
  ├── speechCloudTransition        — Framer Motion Transition config
  ├── speechCloudVariants          — Framer Motion Variants config
  ├── OrbySpeechCloud()            — animated speech bubble
  ├── prefersReducedMotion()       — accessibility check
  ├── useTypedText()               — typewriter hook
  ├── clearIntervalSpy             — test utility
  └── { result }                   — test result ref
```

`useTypedText(text, speed?)` — returns progressively-longer string, driving the typewriter animation. Tested in `useTypedText.test.ts`.

---

## Community 36 — Orby State (9 nodes, cohesion 0.20)

What Orby says and when:

```
useOrbyState.ts
  ├── OrbyState           — 'idle' | 'thinking' | 'speaking' | 'navigating' | ...
  ├── OrbyStateResult     — { state: OrbyState; message: string | null }
  ├── INTRO_COPY          — array of intro messages
  ├── LAB_HINT_COPY       — hints when Lab is first opened
  ├── SECTION_COPY        — per-section message arrays (Phase 7 readiness)
  ├── SECTION_TRIGGERS    — section IDs that fire messages
  ├── PositionModifiers   — { x, y, scale } for Orby position tweaks
  └── pickRandom<T>()     — random array element selector
```

`SECTION_TRIGGERS` + `SECTION_COPY` are Phase 7's data layer. When scroll enters a section in `SECTION_TRIGGERS`, Orby picks a random line from `SECTION_COPY[sectionId]`.

---

## Community 37 — Orby Canvas (7 nodes, cohesion 0.20)

The R3F rendering layer for Orby:

```
OrbyCanvas.tsx
  ├── OrbyCanvasProps      — canvas size, className, state
  └── OrbyCanvas()         — R3F Canvas wrapper

PanelOrby.tsx
  ├── PanelOrbyProps       — in-panel version props
  ├── PanelOrbyState       — 'idle' | 'thinking' | 'speaking'
  └── PanelOrby()          — in-Lab-panel Orby renderer

SceneProps                  — internal R3F scene props
AstronautProps              — 3D model animation props
```

`PanelOrby` lives in `src/components/lab/` but reaches into Community 37. It's the bridge between the Lab UI (Community 4) and the 3D rendering layer.

---

## Phase 7 Readiness Summary

| Node | File | Status |
|------|------|--------|
| `SECTION_TRIGGERS` | `useOrbyState.ts` | Scaffolded |
| `SECTION_COPY` | `useOrbyState.ts` | Scaffolded |
| Scroll-driven camera | `ObsidianBackgroundCanvas.tsx` | Done (background uses it) |
| Section entry detection | `useActiveSection.ts` | Hook exists |
| Message → speech cloud | `OrbySpeechCloud.tsx` | Done |
| Typewriter animation | `useTypedText.ts` | Done |

Phase 7 = wire `useActiveSection` → `useOrbyState` → `OrbySpeechCloud`. Infrastructure is ready.

## See Also
- [[../components/03-orby-companion|Orby Companion Detail]]
- [[../chatbot/00-orby-overview|Orby Phase 7 Spec]]
