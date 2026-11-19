---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, chatbot, evals, testing, promptfoo]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> | This note says | Repo reality |
> |---|---|
> | "GitHub Actions runs `pnpm eval` as a required check before deploy. Eval failures block the PR." (§CI Gate) | `.github/workflows/eval-gate.yml` runs `pnpm exec promptfoo eval --config evals/promptfooconfig.yaml --delay 12000 --fail-on-error` only when the `CEREBRAS_API_KEY` secret is non-empty (`eval-gate.yml:23-25`); otherwise it prints a warning and skips (`:26-28`). `continue-on-error: true` was removed only in the uncommitted working tree (`git diff` of that file). Whether it is a required check depends on GitHub branch protection, which is not visible from the repo |

# Eval Suite

> [[../INDEX|← Back to Index]] · [[00-orby-overview|Orby Overview]]

## Overview

Uses [promptfoo](https://promptfoo.dev) for deterministic eval assertions. Config: `evals/promptfooconfig.yaml`. Run with `pnpm eval`.

## Eval Categories

| File | Tests | What it checks |
|------|-------|---------------|
| `evals/grounding.yaml` | Grounding | Orby only states facts in the Sanity catalog |
| `evals/refusal.yaml` | Refusal | Orby refuses off-topic/harmful requests |
| `evals/tool-correctness.yaml` | Tools | Correct tool called with correct args |
| `evals/injection.yaml` | Injection | Prompt injection attacks fail |
| `evals/fail-safe.yaml` | Fail-safe | Degraded mode returns sensible answers |
| `evals/persona-warmth.yaml` | Persona | Base persona warmth check |

## Persona Warmth Evals

Each persona has its own warmth eval:
- `evals/personas/recruiter-warmth.yaml`
- `evals/personas/friend-warmth.yaml`
- `evals/personas/weirdo-warmth.yaml`
- `evals/personas/ceo-warmth.yaml`

These use `llm-rubric` judge assertions (not deterministic) to check tone/warmth.

## System Prompt Fixtures

Pre-built system prompts for eval use (no live Sanity call needed):
```
evals/fixtures/
  system-prompt.txt             # Base (no persona)
  system-prompt-recruiter.txt
  system-prompt-friend.txt
  system-prompt-weirdo.txt
  system-prompt-ceo.txt
```

## CI Gate

GitHub Actions runs `pnpm eval` as a required check before deploy. Eval failures block the PR.

## Test Files (Vitest, Community 1/4/45/46)

| File | Tests |
|------|-------|
| `src/app/api/chat/__tests__/route.test.ts` | API route unit tests |
| `src/components/__tests__/portfolio-lab-chat.test.tsx` | Lab chat integration |
| `src/components/__tests__/orby-chat-nav.test.ts` | Orby navigation |
| `src/components/__tests__/orby-section-messages.test.ts` | Section message triggers |

## See Also
- [[00-orby-overview|Orby Overview]]
- [[01-api-route|API Route]]
- [[03-personas|Personas]]
