---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, graph, community, lab, UI, chat]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "`PanelOrbyState` — type: `'idle' \| 'thinking' \| 'speaking'`" | `"idle" \| "thinking" \| "responding"` (`src/components/lab/PanelOrby.tsx:8`) |
> | "`MODES` — chat vs proof mode union type"; "`MODE_DESCRIPTIONS`"; "`LabMode` — `'chat' \| 'proof'`" | No `MODE_DESCRIPTIONS` in `src`; `MODES` is only a test-local const (`src/components/__tests__/portfolio-lab.test.ts:6`). `LabMode = "Recruiter" \| "Builder" \| "Research" \| "Skeptic"` (`src/lib/lab-data.ts:3`) |
> | "`PERSONA_CONFIG` — `Record<Persona, { label, icon, description }>`" | Array of `{ id, label, icon }`, no `description` (`src/components/lab/PersonaSelector.tsx:12-14`) |
> | "`CHIPS` — array of `LabChip` from lab-data"; "`POWER_PROMPTS` — string array of deep questions" | `CHIPS: Record<Persona, string[]>` is local (`SuggestedChips.tsx:11`); `POWER_PROMPTS` is a persona-keyed record (`PowerPromptBlock.tsx:12`) |
> | "`ToolResult` — type: `{ toolName: string; result: unknown }`"; "`ChatMessage` — type: `{ id, role, content, toolResults? }`" | `ToolResult.result: Record<string, unknown>`; `ChatMessage` has `text` and `timestamp`, not `content` (`src/components/lab/ChatThread.tsx:10-21`) |
> | "`LAB_CHIPS` — suggested chip definitions"; "`generateProofPack()` — builds proof pack items" | `LAB_CHIPS: Record<LabMode, LabChip[]>` (`src/lib/lab-data.ts:26`); `generateProofPack(mode: LabMode): string` (`:347`) |

# Community 4 — Lab / Chat UI

> [[../INDEX|← Back to Index]] · [[../communities/community-overview|All Communities]]

**48 nodes · Cohesion: 0.09**

## What This Community Is

The Portfolio Lab sidebar UI — everything the user interacts with when chatting with Orby. Tight cluster of React components that render messages, manage personas, show evidence, and drive the chat interface.

## Nodes

### PortfolioLab (`src/components/lab/PortfolioLab.tsx`)
- `PortfolioLab.tsx` (both src paths)
- `PanelOrbyState` — type: `'idle' | 'thinking' | 'speaking'`
- `generateId()` — unique message ID generator
- `MODES` — chat vs proof mode union type
- `MODE_DESCRIPTIONS` — human-readable mode labels

### PersonaSelector (`src/components/lab/PersonaSelector.tsx`)
- `PersonaSelector.tsx`
- `Persona` — local type alias
- `PersonaSelectorProps` — component props
- `PERSONA_CONFIG` — `Record<Persona, { label, icon, description }>`
- `PersonaSelector()` — renders persona tabs

### SuggestedChips (`src/components/lab/SuggestedChips.tsx`)
- `SuggestedChips.tsx`
- `SuggestedChipsProps`
- `CHIPS` — array of `LabChip` from lab-data
- `SuggestedChips()` — renders pill buttons

### PowerPromptBlock (`src/components/lab/PowerPromptBlock.tsx`)
- `PowerPromptBlock.tsx`
- `PowerPromptBlockProps`
- `POWER_PROMPTS` — string array of deep questions
- `PowerPromptBlock()` — collapsible block of prompts

### ChatThread (`src/components/lab/ChatThread.tsx`)
- `ChatThread.tsx`
- `ToolResult` — type: `{ toolName: string; result: unknown }`
- `ChatMessage` — type: `{ id, role, content, toolResults? }`
- `ChatThreadProps`
- `ChatThread()` — message list renderer

### ChatInputBar (`src/components/lab/ChatInputBar.tsx`)
- `ChatInputBar.tsx`
- `ChatInputBarProps`
- `ChatInputBar()` — input field + send button

### EvidenceCard (`src/components/lab/EvidenceCard.tsx`)
- `EvidenceCard.tsx` (both paths)
- `EvidenceCardProps`
- `EvidenceCard()` — base wrapper for tool result cards

### Lab Data (`src/lib/lab-data.ts`)
- `lab-data.ts` (both paths)
- `LabMode` — `'chat' | 'proof'`
- `LabChip` — `{ label: string; prompt: string }`
- `EvidenceItem` — `{ type, label, value }`
- `LabResponse` — `{ intent, response, evidence }`
- `LAB_CHIPS` — suggested chip definitions
- `LAB_RESPONSES` — static proof pack responses
- `generateProofPack()` — builds proof pack items

### ProofPack (`src/components/lab/ProofPack.tsx`)
- `ProofPack.tsx` (both paths)
- `ProofPackProps`
- `ProofPack()` — renders evidence proof pack

### Tests
- `portfolio-lab.test.ts` (both paths)
- `MODES` — test reference
- `pack` — proof pack test fixture

## Relationship to Other Communities

- Receives tool results from **Community 1** (backend tools)
- Uses `useSidebar()` from **Community 67** to control sidebar open state
- Uses `cn()` from **Community 6** everywhere
- Renders `PanelOrby` → `OrbyCanvas` from **Community 37**
- Evidence cards rendered here belong to **Community 17** (ExperienceEvidenceCard, ProjectEvidenceCard)

## See Also
- [[../components/02-lab-chat-ui|Lab UI Detail]]
- [[../chatbot/04-tools|Chat Tools (produces tool results)]]
- [[community-07-portfolio-core|Community 7 (parent page structure)]]
