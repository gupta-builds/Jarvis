---
type: subsystem
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/06 Three.js, Motion, and Animation Performance.md
sync: managed
tags: [portfolio, threejs, r3f, animation, performance]
---

# 06 Three.js, Motion, and Animation Performance

## Purpose

This subsystem creates the “floating command center in space” without allowing graphics to compromise readability, accessibility, or mobile stability. React Three Fiber owns scene lifecycle; Motion and GSAP own DOM interaction; shared hooks coordinate reduced motion.

## Main surfaces

- `ObsidianBackground.tsx` is the lazy/fallback boundary for the fixed background.
- `ObsidianBackgroundCanvas.tsx` owns the particle planet, ring, stars, scroll deformation, pointer attraction, project-transition effects, and R3F canvas.
- `ProjectsSlider.tsx` owns card arrangement, drag/keyboard navigation, autoplay, and its GSAP pin transition.
- `EducationFlowchart.tsx` renders an R3F education path inside a section.
- `HeaderLogo.tsx` detects WebGL and chooses the liquid-metal canvas or SVG fallback.
- `HeaderLogoCanvas.tsx`, `liquidMetalMaterial.ts`, and logo-texture utilities own the custom shader pipeline.

## Performance contracts

- The canvas uses bounded DPR and R3F performance controls.
- Mobile particle counts are half the desktop counts; expensive passes are reduced.
- Geometry, textures, position arrays, and materials are allocated outside frame loops and memoized or module-scoped.
- `useFrame` mutates refs; it must not construct new Three objects per frame.
- Listeners, RAF/ticker registrations, textures, geometries, and materials have explicit cleanup ownership.
- Text-heavy sections lower background intensity rather than relying on cards alone.
- WebGL detection must fail safely to a non-canvas visual.

## Reduced motion

Reduced motion is a behavior path, not a duration tweak. Site-wide Lenis is removed, R3F motion is constrained or stopped, autoplay/float effects are disabled or minimized, and a static header-logo fallback remains visible. `useAnimationGate` centralizes live media-query/page-visibility gating for newer effects.

When introducing animation, test both the initial reduced-motion value and an OS preference change during the session.

## Background coupling

The background reacts to scroll position, sidebar layout, pointer input, and project-section transitions. Changes to its coordinate system can break visual alignment elsewhere. Verify:

- fixed positioning, `z-index: 0`, and `pointer-events: none` at the outer boundary;
- content at `z-index: 1+`;
- sidebar open/closed camera offset;
- mobile density and touch behavior;
- the project pass/settled camera states;
- no layout shift when the dynamic canvas loads.

## Project slider invariants

Only the center card is primary. Drag distance and velocity thresholds select advance versus snap-back. User interaction pauses autoplay and resumes it after the documented delay. Arrow controls and card actions remain keyboard accessible and use `.float-btn` styling.

## Change checklist

1. Query Graphify for affected imports/calls.
2. Identify the owner of every Three resource.
3. Prove no allocation was added to `useFrame`.
4. Exercise WebGL unavailable, mobile, reduced motion, page hidden, and normal desktop paths.
5. Run focused Three/logo tests plus the full suite.
6. Profile before raising particle counts or post-processing cost.

## Graphify query recipes

```bash
graphify query "ObsidianBackground ProjectsSlider HeaderLogo reduced motion WebGL" --context import --context call --budget 4000
graphify affected "ObsidianBackground()" --depth 3
graphify path "detectWebGL2Support()" "HeaderLogoCanvas.tsx"
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1147 nodes / 2163 edges**
- This subsystem: **22 files / 149 nodes / 340 touching edges**
- Leading communities: `ObsidianBackgroundCanvas.tsx` (23), `HeaderLogoCanvas.tsx` (22), `EducationFlowchart.tsx` (21), `logoTexture.ts` (15), `HeaderLogo.tsx` (14), `HeaderLogoCanvas.useFrame.property.test.tsx` (12)

### High-connectivity symbols

- `logoTexture.ts` — `src/lib/logoTexture.ts:L1` (degree 20)
- `liquidMetalConstants.ts` — `src/lib/liquidMetalConstants.ts:L1` (degree 14)
- `liquidMetalMaterial.ts` — `src/components/three/liquidMetalMaterial.ts:L1` (degree 13)
- `liquidMetalColor.ts` — `src/lib/liquidMetalColor.ts:L1` (degree 12)
- `useAnimationGate.ts` — `src/hooks/useAnimationGate.ts:L1` (degree 11)
- `useLogoTexture.ts` — `src/hooks/useLogoTexture.ts:L1` (degree 11)
- `Graph()` — `src/components/three/ObsidianBackgroundCanvas.tsx:L308` (degree 10)
- `useLogoTexture()` — `src/hooks/useLogoTexture.ts:L44` (degree 9)
- `HeaderLogoCanvas()` — `src/components/three/HeaderLogoCanvas.tsx:L88` (degree 8)
- `useAnimationGate()` — `src/hooks/useAnimationGate.ts:L84` (degree 8)
- `buildEdgeGradient()` — `src/lib/logoTexture.ts:L225` (degree 6)
- `detectWebGL2Support()` — `src/lib/detectWebGl.ts:L27` (degree 6)

### Owned source files

- `src/components/three/HeaderLogo.tsx`
- `src/components/three/HeaderLogoCanvas.tsx`
- `src/components/three/HeaderLogoFallback.tsx`
- `src/components/three/__tests__/HeaderLogo.branching.test.tsx`
- `src/components/three/__tests__/HeaderLogoCanvas.integration.test.tsx`
- `src/components/three/__tests__/HeaderLogoCanvas.memoization.property.test.tsx`
- `src/components/three/__tests__/HeaderLogoCanvas.useFrame.property.test.tsx`
- `src/components/three/__tests__/HeaderLogoCanvas.wiring.test.tsx`
- `src/components/three/__tests__/liquidMetalMaterial.test.ts`
- `src/components/three/liquidMetalMaterial.ts`
- `src/hooks/useAnimationGate.ts`
- `src/hooks/useLogoTexture.ts`
- `src/lib/detectWebGl.ts`
- `src/lib/gsap/projects-pin.ts`
- `src/lib/liquidMetalColor.ts`
- `src/lib/liquidMetalConstants.ts`
- `src/lib/logoGlyphPath.ts`
- `src/lib/logoTexture.ts`
- `src/components/EducationFlowchart.tsx`
- `src/components/three/ObsidianBackground.tsx`
- `src/components/three/ObsidianBackgroundCanvas.tsx`
- `src/components/three/ProjectsSlider.tsx`
<!-- graphify:auto:end -->

## Related notes

- [[03 Page Composition and Content Sections]]
- [[07 Design System, Accessibility, and Responsive Behavior]]
- [[08 Orby State, Navigation, and Commentary]]
- [[09 Testing, Prompt Evals, and Quality Gates]]
