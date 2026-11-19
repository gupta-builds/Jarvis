---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, chatbot, personas, orby]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> | This note says | Repo reality |
> |---|---|
> | `export const PERSONA_BLOCKS: Record<Persona, string>` and `export const PERSONAS: Persona[]` (§Persona Index) | `PERSONAS` is a readonly `as const` tuple (`src/lib/personas/index.ts:6`); `PERSONA_BLOCKS` is module-private, not exported (`index.ts:9`); `getPersonaBlock` is the accessor (`index.ts:16-17`). Invalid or missing persona falls back to `"friend"` in the route (`src/app/api/chat/route.ts:174-176`) |

# Orby Personas

> [[../INDEX|← Back to Index]] · [[00-orby-overview|Orby Overview]]

## Overview

4 personas live in `src/lib/personas/`. Each defines Orby's tone, vocabulary, and response style. The user selects a persona via `PersonaSelector` in the Lab UI.

## Files — Community 1

| File | Persona | Tone |
|------|---------|------|
| `src/lib/personas/recruiter.ts` | Recruiter | Professional, metrics-focused, concise |
| `src/lib/personas/friend.ts` | Friend | Casual, enthusiastic, first-name basis |
| `src/lib/personas/weirdo.ts` | Weirdo | Playful, quirky, unexpected analogies |
| `src/lib/personas/ceo.ts` | CEO | Strategic, high-level, business-minded |

## Persona Index — `src/lib/personas/index.ts`

```typescript
export type Persona = 'recruiter' | 'friend' | 'weirdo' | 'ceo'
export const PERSONAS: Persona[] = ['recruiter', 'friend', 'weirdo', 'ceo']
export const PERSONA_BLOCKS: Record<Persona, string>  // system prompt snippets
export function getPersonaBlock(persona: Persona): string
```

`getPersonaBlock()` is called in `POST()` to append the persona block to the base system prompt.

## Eval Fixtures

Each persona has eval fixtures in `evals/fixtures/`:
- `system-prompt-recruiter.txt`
- `system-prompt-friend.txt`
- `system-prompt-weirdo.txt`
- `system-prompt-ceo.txt`
- `system-prompt.txt` (base, no persona)

And persona-specific warmth evals in `evals/personas/`:
- `recruiter-warmth.yaml`
- `friend-warmth.yaml`
- `weirdo-warmth.yaml`
- `ceo-warmth.yaml`

## UI — PersonaSelector

`src/components/lab/PersonaSelector.tsx` — Community 4

```typescript
type Persona = 'recruiter' | 'friend' | 'weirdo' | 'ceo'
interface PersonaSelectorProps { ... }
const PERSONA_CONFIG: Record<Persona, { label, icon, description }>
```

User picks persona in the Lab panel header; state flows into `PortfolioLab` which passes it to the chat API calls.

## See Also
- [[05-evals|Eval Suite (persona warmth tests)]]
- [[../components/02-lab-chat-ui|Lab UI (PersonaSelector location)]]
