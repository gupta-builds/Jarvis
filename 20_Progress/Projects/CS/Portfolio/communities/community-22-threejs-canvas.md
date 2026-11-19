---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, graph, community, threejs, canvas, 3D]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | Node tree lists `useIsMobile()` under `ObsidianBackgroundCanvas.tsx` | `useIsMobile` is defined in `src/hooks/use-mobile.ts:5` and only imported by the canvas (`ObsidianBackgroundCanvas.tsx:13`, called `:1539`). `CAM_START` (`:101`), `CAM_END` (`:103`), `clamp01` (`:191`), `createPointSprite` (`:207`), `fibonacciSphere` (`:226`), `createRing` (`:241`), `createStars` (`:280`) are module-private; the file's only export is the default component (`:1527`) |
> | "`CAM_START` → `CAM_END` lerp driven by scroll position (from `useScrollProgress`)" | `useScrollProgress` is not referenced in `ObsidianBackgroundCanvas.tsx` (rg). Scroll comes from a local `scroll01` ref fed by `window.scrollY` / Lenis `lenis.progress` (`:567-570,599-603`), smoothed at `:672` and applied at `:808-810` |
> | "`dpr={[1, 2]}  // pixel ratio cap`" (Canvas Config) | `dpr={dpr}` is a variable (`:1605`); `performance={{ min: 0.5 }}` is literal (`:1606`) |

# Community 22 — Three.js Canvas

> [[../INDEX|← Back to Index]] · [[../communities/community-overview|All Communities]]

**13 nodes · Cohesion: 0.24**

## What This Community Is

The ObsidianBackground canvas implementation — particle sphere, starfield, camera animation, and the mobile detection hook that gates particle count.

## Nodes

```
ObsidianBackgroundCanvas.tsx
  ├── useIsMobile()         — viewport < 768px check
  ├── CAM_START             — camera start position vector
  ├── CAM_END               — camera end position vector
  ├── clamp01()             — clamp value to [0, 1]
  ├── createPointSprite()   — creates THREE.Texture for points
  ├── createRing()          — creates ring BufferGeometry
  ├── createStars()         — creates starfield BufferGeometry
  └── fibonacciSphere()     — generates evenly-distributed sphere points
```

## Key Patterns

### fibonacciSphere()
Returns `Float32Array` of positions for an even point distribution on a sphere surface. Used instead of random sampling to avoid clustering at poles.

### Camera Animation
`CAM_START` → `CAM_END` lerp driven by scroll position (from `useScrollProgress`). Camera slowly pulls back as user scrolls down the page.

### Mobile Performance Gate
`useIsMobile()` gates:
- Particle count: halved on mobile
- Post-processing effects: disabled on mobile
- Ring/star geometry: simplified on mobile

### Canvas Config
```typescript
<Canvas
  dpr={[1, 2]}                        // pixel ratio cap
  performance={{ min: 0.5 }}          // auto-downgrade below 60fps
  camera={{ position: CAM_START }}
>
```

## See Also
- [[../components/04-three-js|Three.js / R3F Components]]
- [[community-07-portfolio-core|Community 7 (ObsidianBackground wrapper)]]
