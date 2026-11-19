---
type: subsystem
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/09 Testing, Prompt Evals, and Quality Gates.md
sync: managed
tags: [portfolio, tests, evals, ci, quality]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> | This note says | Repo reality |
> |---|---|
> | FACT-FIX: "Workflows under `.github/workflows` run build/eval/security automation." (§CI ownership) | Only two workflows exist: `eval-gate.yml` (promptfoo, tracked, modified) and `semgrep.yml` (untracked). No workflow runs lint, typecheck, tests, or build. `.github/dependabot.yml` is also untracked (`git ls-files .github` lists only `eval-gate.yml`). |
> | FACT-FIX: eval CI behavior (§Promptfoo evals / CI ownership) | Working tree `eval-gate.yml:25` runs `pnpm exec promptfoo eval --config evals/promptfooconfig.yaml --delay 12000 --fail-on-error` with `CEREBRAS_API_KEY` (`:12`); committed HEAD has `continue-on-error: true` (advisory) and no `--fail-on-error`. |

# 09 Testing, Prompt Evals, and Quality Gates

## Purpose

The quality system has two distinct layers: deterministic code tests and model-behavior evals. A green TypeScript build does not prove grounding/persona behavior; a passing prompt rubric does not prove route security or animation cleanup.

## Deterministic checks

- `pnpm lint` runs Biome—not ESLint.
- `pnpm typecheck` runs strict TypeScript without emitting.
- `pnpm test` runs Vitest in jsdom with the shared setup file.
- `pnpm build` regenerates Sanity schema/types, typechecks, then builds Next.js.

Tests live close to code under `__tests__`. The suite includes route admission/fallback tests, chat UI/tool rendering, Orby navigation/state behavior, R3F/logo resource and `useFrame` properties, CSS/design preservation, content regressions, and accessibility checks.

## Promptfoo evals

`evals/promptfooconfig.yaml` orchestrates deterministic assertions for:

- grounded answers and required refusal;
- tool correctness and navigation;
- prompt-injection resistance;
- provider/tool fail-safe behavior;
- persona warmth through persona-specific cases and rubric judges.

Run evals with the required environment and provider budgets. Treat flaky model output as a design signal: tighten prompts/tools/assertions rather than blindly retrying until green.

## CI ownership

Workflows under `.github/workflows` run build/eval/security automation. Dependabot and Semgrep are repository hygiene/security inputs, not substitutes for route-specific review. Before production, the full gate is typecheck → tests/lint as configured → build → eval → security review.

## Test selection by change

| Change | Minimum focused evidence |
|---|---|
| Sanity field/query | typegen, typecheck, affected section tests |
| Chat route/security | route tests including rejection/degraded paths |
| Prompt/persona/tool | focused Vitest plus promptfoo cases |
| Orby navigation | state/event/arrival tests |
| Three/shader | constructor, resource, useFrame, fallback, reduced-motion tests |
| CSS/card/button | preservation and accessibility tests |
| Knowledge sync | `pnpm knowledge:check` and a dry-run/temp-vault sync |

## Regression-test discipline

Name the invariant, reproduce the real failure, and assert externally visible behavior or a meaningful resource contract. Avoid tests that merely repeat implementation text. When a source-inspection test protects an architectural rule—such as no constructor inside `useFrame`—document why it is intentionally structural.

## Failure triage

1. Run the smallest failing file with verbose output.
2. Determine whether generated Sanity types are stale.
3. Separate environment/provider failures from deterministic failures.
4. Check whether a mock erased the server/client boundary being tested.
5. Fix the implementation or the now-intentionally-changed contract; do not weaken an assertion without recording the new invariant.
6. Re-run the complete relevant gate.

## Graphify query recipes

```bash
graphify query "Vitest promptfoo typecheck build security quality gate" --context import --context call --budget 3000
graphify query "route tests reduced motion WebGL grounding refusal tool correctness" --budget 3500
graphify affected "POST()" --depth 2
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `9cb1959bdeaafdd8567f9c8d34ae6451ecdc4d23`
- Whole graph: **1193 nodes / 2201 edges**
- This subsystem: **71 files / 202 nodes / 362 touching edges**
- Leading communities: `vitest` (32), `biome.json` (26), `compilerOptions` (20), `orby-chat-nav.test.ts` (13), `HeaderLogoCanvas.useFrame.property.test.tsx` (12), `chat/__tests__/route.test.ts` (11)

### High-connectivity symbols

- `compilerOptions` — `tsconfig.json:L2` (degree 16)
- `chat/__tests__/route.test.ts` — `src/app/api/chat/__tests__/route.test.ts:L1` (degree 15)
- `orby-chat-nav.test.ts` — `src/components/__tests__/orby-chat-nav.test.ts:L1` (degree 11)
- `useLogoTexture.regeneration.test.ts` — `src/hooks/__tests__/useLogoTexture.regeneration.test.ts:L1` (degree 11)
- `liquidMetalColor.test.ts` — `src/lib/__tests__/liquidMetalColor.test.ts:L1` (degree 9)
- `orby-comment/__tests__/route.test.ts` — `src/app/api/orby-comment/__tests__/route.test.ts:L1` (degree 9)
- `orby-section-messages.test.ts` — `src/components/__tests__/orby-section-messages.test.ts:L1` (degree 9)
- `useAnimationGate.liveReducedMotion.test.ts` — `src/hooks/__tests__/useAnimationGate.liveReducedMotion.test.ts:L1` (degree 9)
- `useAnimationGate.pauseResumeMonotonicity.test.ts` — `src/hooks/__tests__/useAnimationGate.pauseResumeMonotonicity.test.ts:L1` (degree 9)
- `rasterizeGlyph.test.ts` — `src/lib/__tests__/rasterizeGlyph.test.ts:L1` (degree 8)
- `useAnimationGate.reducedMotionBound.test.ts` — `src/hooks/__tests__/useAnimationGate.reducedMotionBound.test.ts:L1` (degree 8)
- `liquidMetalColor.contrast.test.ts` — `src/lib/__tests__/liquidMetalColor.contrast.test.ts:L1` (degree 7)

### Owned source files

- `.github/workflows/semgrep.yml`
- `src/app/api/orby-comment/__tests__/route.test.ts`
- `src/components/__tests__/HeaderScrolling.logo.integration.test.tsx`
- `src/components/three/__tests__/HeaderLogo.branching.test.tsx`
- `src/components/three/__tests__/HeaderLogoCanvas.integration.test.tsx`
- `src/components/three/__tests__/HeaderLogoCanvas.memoization.property.test.tsx`
- `src/components/three/__tests__/HeaderLogoCanvas.useFrame.property.test.tsx`
- `src/components/three/__tests__/HeaderLogoCanvas.wiring.test.tsx`
- `src/components/three/__tests__/liquidMetalMaterial.test.ts`
- `src/hooks/__tests__/useAnimationGate.liveReducedMotion.test.ts`
- `src/hooks/__tests__/useAnimationGate.pauseResumeMonotonicity.test.ts`
- `src/hooks/__tests__/useAnimationGate.reducedMotionBound.test.ts`
- `src/hooks/__tests__/useLogoTexture.regeneration.test.ts`
- `src/lib/__tests__/detectWebGl.test.ts`
- `src/lib/__tests__/detectWebGl.unit.test.ts`
- `src/lib/__tests__/fixed-prompts.test.ts`
- `src/lib/__tests__/liquidMetalColor.contrast.test.ts`
- `src/lib/__tests__/liquidMetalColor.test.ts`
- `src/lib/__tests__/logoTexture.test.ts`
- `src/lib/__tests__/rasterizeGlyph.test.ts`
- `.github/workflows/eval-gate.yml`
- `biome.json`
- `evals/fail-safe.yaml`
- `evals/fixtures/catalog.json`
- `evals/fixtures/chat-ceo.json`
- `evals/fixtures/chat-default.json`
- `evals/fixtures/chat-friend.json`
- `evals/fixtures/chat-recruiter.json`
- `evals/fixtures/chat-template.json`
- `evals/fixtures/chat-weirdo.json`
- `evals/fixtures/system-prompt-ceo.txt`
- `evals/fixtures/system-prompt-friend.txt`
- `evals/fixtures/system-prompt-recruiter.txt`
- `evals/fixtures/system-prompt-weirdo.txt`
- `evals/fixtures/system-prompt.txt`
- `evals/grounding.yaml`
- `evals/injection.yaml`
- `evals/persona-warmth.yaml`
- `evals/personas/ceo-warmth.yaml`
- `evals/personas/friend-warmth.yaml`
- …and 31 more
<!-- graphify:auto:end -->

## Related notes

- [[04 Portfolio Lab — Agent Runtime and Grounding]]
- [[05 API Security, Auth, Rate Limits, and Degraded Mode]]
- [[06 Three.js, Motion, and Animation Performance]]
- [[10 Deployment, Preview, and Operational Runbook]]
