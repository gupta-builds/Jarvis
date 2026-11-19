---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, chatbot, tools, function-calling]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> | This note says | Repo reality |
> |---|---|
> | `NavigateResult = { section: string; scrollId: string }` (§Tool Result Types) | `{ ok: true; sectionId: string; orbyMessage: string \| null; itemSlug?; itemIndex? }` (`src/lib/chat-tools.ts:74-80`). Tool input is `{ sectionId (enum), orbyMessage, itemSlug \| null, itemIndex \| null }`, `strict: true` (`chat-tools.ts:208-234`) |
> | `ShowProjectResult = { project: Project \| null }`, `ShowExperienceResult = { experience: Experience \| null }` (§Tool Result Types) | `{ ok: true, project } \| { ok: false, error }` and same shape for experience (`chat-tools.ts:82-88`). Inputs: `slug` and `id` are `z.enum` built per request from the catalog (`:196-205,:267,:298`) |
> | `LookupFactResult = { fact: string; source: string }` (§Tool Result Types) | `{ records: [{ type, id, title, snippet }] }`, max 5 matches (`chat-tools.ts:90-97,:390,:398`) |
> | `GetResumeResult = { url: string }`; getResume "Get resume download link" (§The 6 Tools, §Tool Result Types) | `{ name, role, topSkills, keyProjects, currentExperience }`, a proof-pack summary built from the catalog, no URL (`chat-tools.ts:99-105,:410-440`) |
> | `ContactResult = { email: string; formAvailable: boolean }` (§Tool Result Types) | `{ action: "open_contact" }` (`chat-tools.ts:107`, `:450`) |
> | "All results are discriminated unions" (§Tool Result Types) | Only `showProject` / `showExperience` use an `ok` discriminant (`chat-tools.ts:82-88`); the others are plain object types |
> | Key Exports lists `getSanityClient()`, `SECTION_IDS`, `NONE_SENTINEL`, `toEnum()` (§Key Exports) | These are module-private (`chat-tools.ts:116,163,179,181`). Exported: `Catalog` (`:28`), the six result types (`:74-107`), `buildChatTools` (`:192`), `ChatTools` (`:467`) |
> | "`SECTION_IDS` Map: Maps tool section names to actual DOM scroll targets" (§SECTION_IDS Map) | It is a hard-coded `as const` tuple of 9 ids: hero, about, experience, projects, skills, education, certifications, blog, contact (`chat-tools.ts:163-173`), used as the `navigate` enum (`:213`) |

# Orby's Closed Tool Set

> [[../INDEX|← Back to Index]] · [[00-orby-overview|Orby Overview]]

## File

`src/lib/chat-tools.ts` — Community 1

## The 6 Tools

| Tool | Return Type | Purpose |
|------|-------------|---------|
| `navigate` | `NavigateResult` | Scroll to a portfolio section |
| `showProject` | `ShowProjectResult` | Display a project evidence card |
| `showExperience` | `ShowExperienceResult` | Display an experience evidence card |
| `lookupFact` | `LookupFactResult` | Look up a specific fact about Anant |
| `getResume` | `GetResumeResult` | Get resume download link |
| `contact` | `ContactResult` | Open contact form / provide contact info |

## Key Exports

| Export | Role |
|--------|------|
| `buildChatTools()` | Builds tool definitions array for the AI SDK |
| `getSanityClient()` | Returns server client for tool data fetching |
| `SECTION_IDS` | Map of section names to DOM IDs |
| `NONE_SENTINEL` | Sentinel value for "no result" |
| `toEnum()` | Converts string to typed enum |
| `Catalog` | Type for the full Sanity catalog |
| `ChatTools` | Type for the built tools array |

## Tool Result Types

```typescript
// All results are discriminated unions
type NavigateResult = { section: string; scrollId: string }
type ShowProjectResult = { project: Project | null }
type ShowExperienceResult = { experience: Experience | null }
type LookupFactResult = { fact: string; source: string }
type GetResumeResult = { url: string }
type ContactResult = { email: string; formAvailable: boolean }
```

## Evidence Cards (UI Side — Community 17)

When Orby calls `showProject` or `showExperience`, the frontend renders an evidence card:

| Component | File | Purpose |
|-----------|------|---------|
| `ProjectEvidenceCard()` | `src/components/lab/cards/ProjectEvidenceCard.tsx` | Shows project info inline |
| `ExperienceEvidenceCard()` | `src/components/lab/cards/ExperienceEvidenceCard.tsx` | Shows experience inline |
| `ToolResultRenderer()` | `src/components/lab/cards/ToolResultRenderer.tsx` | Dispatches to correct card |
| `EvidenceCard()` | `src/components/lab/EvidenceCard.tsx` | Base evidence card wrapper |

## SECTION_IDS Map

Maps tool section names to actual DOM scroll targets, enabling `navigate` tool to reliably scroll the page.

## See Also
- [[01-api-route|API Route (builds and passes tools)]]
- [[../components/02-lab-chat-ui|Lab UI (renders tool results)]]
