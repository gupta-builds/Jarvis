---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, components, lab, chat, UI]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "type ChatMessage = { id; role; content: string; toolResults?: ToolResult[] }"; "type ToolResult = { toolName: string; result: unknown }" | `ChatMessage` is `{ id, role: "user" \| "assistant", text: string, timestamp: number, toolResults? }`; `ToolResult.result` is `Record<string, unknown>` (`src/components/lab/ChatThread.tsx:10-21`) |
> | "type PanelOrbyState = 'idle' \| 'thinking' \| 'speaking'" | `"idle" \| "thinking" \| "responding"` (`src/components/lab/PanelOrby.tsx:8`) |
> | "type MODES = 'chat' \| 'proof'"; "`MODES` / `MODE_DESCRIPTIONS`"; "`type LabMode = 'chat' \| 'proof'`" | No `MODE_DESCRIPTIONS` in `src`; `MODES` exists only as a test-local const (`src/components/__tests__/portfolio-lab.test.ts:6`). `LabMode = "Recruiter" \| "Builder" \| "Research" \| "Skeptic"` (`src/lib/lab-data.ts:3`) |
> | "`LAB_CHIPS: LabChip[]`"; "`LAB_RESPONSES: LabResponse[]`"; "`generateProofPack(): EvidenceItem[]`" | `LAB_CHIPS: Record<LabMode, LabChip[]>` (`lab-data.ts:26`); `LAB_RESPONSES: Record<string, LabResponse>` (`:98`); `generateProofPack(mode: LabMode): string` (`:347`) |
> | "`const CHIPS: LabChip[]  // from lib/lab-data.ts`" (SuggestedChips) | `CHIPS` is local to the component, `Record<Persona, string[]>` (`src/components/lab/SuggestedChips.tsx:11`); it imports only `Persona` from `./PersonaSelector` (`:4`), not `lib/lab-data` |
> | "`const POWER_PROMPTS: string[]`"; "Shown in a collapsible block" | `POWER_PROMPTS` is a record keyed by persona (`PowerPromptBlock.tsx:12`), read via `POWER_PROMPTS[persona]` (`:27`); rendered only for recruiter and ceo (`PortfolioLab.tsx:332-333`) |
> | "`const PERSONA_CONFIG: Record<Persona, { label; icon; description }>`"; "Switching persona clears chat history" | `PERSONA_CONFIG` is an array of `{ id, label, icon }` with no `description` (`PersonaSelector.tsx:12-14`). Switching persona stores the current thread in `perPersonaMessages` (`PortfolioLab.tsx:55-68`) rather than clearing it |

# Lab / Chat UI

> [[../INDEX|← Back to Index]] · [[00-overview|Component Map]]

## Overview

The Portfolio Lab is the chat sidebar panel. It lives at `src/components/lab/` and forms **Community 4** — the tightest UI cluster in the codebase.

## Component Tree

```
PortfolioLab.tsx                # Top-level Lab panel (Client Component)
  ├── PersonaSelector.tsx       # Persona switcher (recruiter/friend/weirdo/ceo)
  ├── SuggestedChips.tsx        # Suggestion pill buttons
  ├── PowerPromptBlock.tsx      # Pre-written power prompts
  ├── ChatThread.tsx            # Message list
  │     ├── ChatMessage         # Single message (user/assistant)
  │     ├── ToolResult          # Tool call result display
  │     └── ToolResultRenderer  # Dispatches to evidence cards
  │           ├── ProjectEvidenceCard.tsx
  │           └── ExperienceEvidenceCard.tsx
  ├── EvidenceCard.tsx          # Base evidence card wrapper
  ├── ChatInputBar.tsx          # Input + send button
  └── PanelOrby.tsx             # Orby 3D model inside Lab panel
        └── OrbyCanvas.tsx      # R3F Canvas for Orby
```

## Key Types (Community 4)

```typescript
// ChatThread.tsx
type ChatMessage = { id: string; role: 'user' | 'assistant'; content: string; toolResults?: ToolResult[] }
type ToolResult = { toolName: string; result: unknown }

// PortfolioLab.tsx
type PanelOrbyState = 'idle' | 'thinking' | 'speaking'
type MODES = 'chat' | 'proof'
```

## PortfolioLab.tsx — Orchestrator

- `generateId()` — creates unique message IDs
- `MODES` / `MODE_DESCRIPTIONS` — chat vs proof pack mode
- Manages: messages state, persona, mode, input
- Calls `POST /api/chat` with streaming fetch
- Passes `PanelOrbyState` down to `PanelOrby`

## PersonaSelector — Community 4

```typescript
const PERSONA_CONFIG: Record<Persona, { label: string; icon: string; description: string }>
```

Renders persona tabs. Switching persona clears chat history.

## SuggestedChips — Community 4

```typescript
const CHIPS: LabChip[]  // from lib/lab-data.ts
```

Quick-action chips shown when thread is empty. Clicking a chip sends that message.

## PowerPromptBlock — Community 4

```typescript
const POWER_PROMPTS: string[]
```

Pre-written deep questions Orby handles well. Shown in a collapsible block.

## Lab Data — `src/lib/lab-data.ts` (Community 4)

```typescript
type LabMode = 'chat' | 'proof'
type LabChip = { label: string; prompt: string }
type EvidenceItem = { type: string; label: string; value: string }
type LabResponse = { intent: string; response: string; evidence: EvidenceItem[] }

const LAB_CHIPS: LabChip[]          // suggested prompt chips
const LAB_RESPONSES: LabResponse[]  // static proof-pack responses
function generateProofPack(): EvidenceItem[]  // builds proof pack
```

## ProofPack — Community 4

`src/components/lab/ProofPack.tsx` — displays a structured "proof pack" of evidence items when in proof mode. Uses `LAB_RESPONSES` and `generateProofPack()` from `lab-data.ts`.

## Evidence Cards (Community 17)

| Component | Triggered by |
|-----------|-------------|
| `ProjectEvidenceCard()` | Orby calling `showProject` tool |
| `ExperienceEvidenceCard()` | Orby calling `showExperience` tool |
| `EvidenceCard()` | Base wrapper for both |
| `ToolResultRenderer()` | Routes tool result to correct card |

Types: `ProjectEvidenceCardProps`, `ExperienceEvidenceCardProps`, `EvidenceCardProps`
Also in Community 17: `formatDate()`, `formatDateRange()`, `Project` and `Experience` types.

## AppSidebar — `src/components/app-sidebar.tsx` (Community 5)

Wraps the Radix/shadcn `Sidebar` primitive. Contains `PortfolioLab` as the panel content.
`useSidebar()` (20 edges, Community 67) controls open/close state across the app.

## See Also
- [[../chatbot/04-tools|Chat Tools (produces ToolResult)]]
- [[03-orby-companion|Orby Companion (PanelOrby uses it)]]
- [[../communities/community-04-lab-ui|Community 4 Full Detail]]
