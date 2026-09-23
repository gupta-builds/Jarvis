---
type: concept
status: active
updated: 2026-09-05
tags:
  - portfolio
  - frontend
  - ui-fixes
  - projects
  - gsap
notes:
  - "[[_UI Fixes]]"
  - "[[frontend-ui-fixes-requirements]]"
  - "[[frontend-ui-fixes-design]]"
  - "[[frontend-ui-fixes-tasks]]"
  - "[[frontend-ui-fixes-index]]"
---

# UI Fix 04 — Projects Section (Pinned Cinematic Lock)

> **Status:** open (carousel exists and is more capable than previously documented; no pin/emerge/edge effect)
> **Ledger:** [[_UI Fixes]] §3 | **Tasks:** 4.1, 4.2
> **2026-09-05 correction pass:** re-verified line-by-line against `ProjectsSlider.tsx` (491 lines) and `PortfolioContent.tsx` on `post-frontend`. Several claims below were wrong or incomplete — corrected. Same correction applied to [[frontend-ui-fixes-design]] Fix 6 and [[frontend-ui-fixes-tasks]] Phase 4.

## Purpose

Projects becomes a **pinned cinematic beat**: cards **emerge from translucent space** into solid cards once when the section is scrolled into view, soothing **edge/border animation** during auto-scroll, and side-card drift — **without breaking the carousel's existing drag/keyboard/auto-play/chat-nav behavior**, all of which is more built-out than this note previously said.

## Current code (re-verified 2026-09-05)

| File | What exists today |
|---|---|
| `src/components/three/ProjectsSlider.tsx` (491 lines) | Full carousel: prev/next buttons, dot pagination, keyboard arrows, GSAP `Draggable`+`InertiaPlugin` swipe gesture, auto-play, ambient float on all three visible cards, `CometCard` tilt on the center card, chat-nav slug jump. |
| Section wrapper | `<section id="projects">` (kicker + `SplitHeading` + description) lives directly in `PortfolioContent.tsx` — **there is no separate `ProjectsSection.tsx` file.** `ProjectsSlider.tsx` renders its own nested `<section aria-label="Projects carousel">` inside that. Pin the outer `#projects` section. |
| Auto-play (~line 277–284) | `setInterval` every `AUTO_PLAY_INTERVAL_MS` (5000ms) advances `(prev + 1) % safeProjects.length`. **This cycles through every project, not just indices 0–2** — the "auto-play first 3 only" claim in the old note and in [[frontend-ui-fixes-requirements]] does not match the code. Pauses on any interaction via `pauseAutoPlay()` for `AUTO_PLAY_RESUME_DELAY_MS` (10000ms). |
| Slide transition (`slideVariants`, ~line 170) | Drives **every** index change — manual, drag, keyboard, and auto-play alike — via `AnimatePresence`: real ±200px horizontal `x` translate + opacity + scale (spring, stiffness 300 / damping 30). There is currently no separate "emerge-only" path distinct from this. |
| Side cards | Not just static/faded: `opacity-35 scale-[0.88] blur-[1px] pointer-events-none`, each individually wrapped in `useSpaceFloat({radius: 4, rotate: 0.3})` (`src/hooks/use-space-float.ts`) for ambient drift. **Drift already exists today** — the old note's "no side-card oscillation" gap claim is wrong. It's just not the specific "±8–12px, active only during auto-play, pauses on interaction" spec — it's always-on regardless of auto-play state. |
| Center card | `useSpaceFloat({radius: 2, rotate: 0.1})` + `CometCard rotateDepth={3} translateDepth={5}`. |
| Drag gesture (previously undocumented) | `Draggable.create` + `InertiaPlugin` on a wrapper ref: swipe past a distance/velocity threshold advances/retreats with an exit-then-snap animation; below threshold, elastic snap-back. Every advance (manual, drag, or auto-play) also fires a one-shot "tether flash" — a gradient line + `tether-flash` CSS keyframe — via `tetherActive` state. **This entire system must survive the pin/emerge work untouched.** |
| GSAP plugins registered in this file | `useGSAP`, `Draggable`, `InertiaPlugin` only. **`ScrollTrigger` is not registered here** — needs adding (it ships inside the already-installed `gsap` package, `gsap/ScrollTrigger` — not a new dependency). |
| `src/lib/gsap/projects-pin.ts` | Confirmed does not exist — genuinely new file, no naming collision. |
| Edge/border pulse CSS | Confirmed absent from `globals.css` (grepped for `edge-glow`, `edge-pulse`, `.edge-*`, `projects-edge` — nothing) — genuinely new work. |

## Target behavior

### 1. ScrollTrigger pin
- Pin `#projects` (the `PortfolioContent.tsx` section, not `ProjectsSlider.tsx`'s inner section) for ~1 viewport on entry, `scrub: 1`.
- Import `ScrollTrigger` from `gsap/ScrollTrigger` and register it — it isn't registered anywhere in this file yet.
- Unpin resumes normal scroll; carousel (drag/keyboard/auto-play/chat-nav) keeps working exactly as it does today, before and after the pin.

### 2. Card emerge — a ONE-TIME reveal, separate from the existing slide transition
The existing `slideVariants` opacity/scale shape (0→1 opacity, 0.92→1 scale) already looks like "emerge" — but it fires on every index change via `AnimatePresence`, which the pin-entry reveal must NOT hijack or duplicate. Build the pin-entry emerge as its own one-time animation on the three cards' **outer wrappers** (the `useSpaceFloat`-floated divs, not the inner `AnimatePresence`/`slideVariants` layer), gated to fire once per pin-entry:

| Property | From → To |
|---|---|
| opacity | 0 → 1 (center first, ~0.2 progress into the pin) |
| scale | 0.92 → 1 |
| filter | blur(8px) → blur(0) |
| horizontal position | unchanged — no added translateX |

- Side cards: opacity ramps from 0 to their existing resting `0.35`, not to 1 — don't change their resting opacity.
- After the emerge completes, existing carousel interactions (drag/keyboard/dots/auto-play) resume completely unchanged, including their own `slideVariants` transitions.

##### 3. Background sequence — solar-system flythrough → starfield → hyperspace exit

> **2026-09-05: new spec, dictated by the user, not previously written anywhere.** This SUPERSEDES the earlier "simple CSS gradient pulse on the section edges" concept — that was a placeholder guess before this was described in detail. The `background:mode: projects-edge` CustomEvent stub mentioned in [[ui-fix-01-hero-background]] and referenced below is now this sequence's actual trigger, not an optional stretch goal.

**The experience, precisely, in three beats:**

**Beat 1 — Entry ("warp-out"), scrub-driven by the Projects pin's own scroll progress, roughly progress 0.0→0.35 (finishing at or slightly before the card-emerge completes at ~0.5 per the existing Timeline beats table):**
- As the user scrolls Projects into its pinned position, the background reads as the camera rapidly flying OUTWARD through a (generic, stylized — not literally our solar system) starfield/solar-system scene: a small number of planet-like spheres briefly pass by the viewer's periphery, and stars streak past, all from a first-person point of view (the camera itself is moving through space — this is not a third-person shot of a distant solar system).
- This happens fast — it's compressed into roughly a third of the pin's total scroll distance, not a leisurely pan.
- The moment the project cards finish emerging (rendered/solid), this motion stops — it does not continue past that point.

**Beat 2 — Settled ("starfield hold"), holds for the remainder of the pin (roughly progress 0.35→1.0, while the auto-play carousel is active):**
- The background has arrived at and holds on: a deep-space view with **one medium-to-large glowing object roughly centered**, bright enough to read as a light source (it should visually motivate the light hitting the front-facing project card, i.e. brighter on the side facing the card), surrounded by **thousands of stars** of varying size (mostly small/medium, a few noticeably bigger) filling the rest of the frame.
- This is the resting backdrop for however long the user stays in the pinned Projects section — no more camera motion, just the existing ambient star-twinkle/parallax the file already has, if any.

**Beat 3 — Exit ("hyperspace-in"), a one-shot fixed-duration transition (not scroll-scrubbed) triggered when the user scrolls DOWN past the end of the Projects pin (GSAP ScrollTrigger's `onLeave`, not a scrub range):**
- The camera now flies rapidly FORWARD/IN, targeting one specific star among the "thousands" from Beat 2 (pick the same central glowing object, or another — implementer's call, but be deliberate about which and say so in the PR/report).
- The motion has a clear ease-in acceleration curve: **starts slow, then builds up speed** until it's moving so fast that passing stars read as **streaks/light trails ("shooting stars")**, not discrete points — this is the "so fast it looks like shooting stars" moment, and it should be a *build*, not instant.
- It ends framed close on **one large, bright central star**, with the remaining starfield visible **around the borders/edges of the screen** (i.e., the final framing is a tight, off-center-feeling close-up on the bright star with stars only at the periphery, not spread evenly across the whole frame like Beat 2).
- Total duration should be short — on the order of 1–2 seconds, in the same "fast, punchy" register as this file's own `FORM_CLICK_OUT_DURATION`/`FORM_CLICK_IN_DURATION` constants (0.9s/2.6s) rather than a slow cinematic dissolve.

**Reduced motion:** skip this entire sequence. Cards still emerge (per §2) with no camera warp, no flythrough, no streaks — jump straight to a static version of the Beat 2 backdrop (or the file's existing resting sphere, implementer's call, whichever is cheaper) exactly as the rest of this file already handles `prefers-reduced-motion`.

**Where this lives, architecturally — reuse the existing canvas, do not build a second one:**
- `ObsidianBackgroundCanvas.tsx` is the single fixed, always-mounted background canvas per this project's own architecture contract (see project CLAUDE.md's "ObsidianBackground contract"). This sequence is a new **mode** on that same canvas, not a second competing Three.js scene — mounting a second canvas would double GPU/render cost for a background that's supposed to be one continuous space.
- Reuse what's already in the file rather than inventing new primitives:
  - The existing starfield generator (`createStars`, already producing 5,500/2,750 points depending on `useIsMobile`) is very plausibly "thousands of stars" already — extend/reuse its point cloud rather than generating a second star system from scratch. Boosting its brightness/opacity or repositioning the camera relative to it may be enough for Beat 2's backdrop.
  - The file's existing `LineSegments` pattern (already used for planet/ring edge connections, e.g. `planetLinesRef`/`ringLinesRef`) is the natural, already-proven mechanism for the Beat 3 "streak" look — a per-star short line segment from its previous-frame position to its current position, with opacity/length driven by the camera's current warp speed, reads as a streak without needing a custom shader.
  - The "planets passing by" in Beat 1 can be a small number (single digits, e.g. 4–8) of simple, cheap spheres (plain `sphereGeometry` + `meshBasicMaterial`, no need for the `MeshDistortMaterial`/`Float` treatment used on the Education blobs — these are glimpsed briefly, not focal objects) spawned ahead of the camera's flight path and recycled once passed.
  - Camera motion for both Beat 1 and Beat 3 should temporarily override (not fight) the existing scroll-driven `CAM_START`→`CAM_END` lerp — the cleanest approach is an explicit "warp mode" branch in the camera-update code (parallel to how `formationActive` already branches the per-point physics loop away from normal scroll physics) rather than blending two competing camera-position writers.

**Trigger wiring:**
- Beat 1/2 progress comes from the same GSAP ScrollTrigger pin instance driving the card-emerge/timeline-beats work in §1/§2 of this file — dispatch `background:mode` with `detail: { mode: 'projects-edge', phase: 'warp-out' | 'settled', progress }` from that same `onUpdate` callback (do not create a second ScrollTrigger for this).
- Beat 3 fires from that same trigger's `onLeave` callback (scrolling down past the pin) as a one-shot, not a scrub — dispatch `background:mode` with `detail: { mode: 'projects-edge', phase: 'hyperspace-exit' }` once, and let `ObsidianBackgroundCanvas.tsx` run its own internal timer/easing for the 1–2s duration rather than trying to drive it from scroll position (there is no more scroll distance to scrub against once the user has left the pin).
- On `onEnterBack` (scrolling back up into Projects from below) or a page reload mid-section, decide and document a sane fallback (e.g. snap straight to the Beat 2 settled state rather than re-playing Beat 1) rather than leaving it undefined.

### 4. Side card ambient drift — extend, don't duplicate
`useSpaceFloat` already drives side-card transforms. **Read `src/hooks/use-space-float.ts` before adding anything** — if it writes a CSS transform on the same element you'd target with a second Framer `repeat: Infinity` animation, the two will fight over the same `transform` property and one will silently win each render. Prefer: tune `useSpaceFloat`'s existing `radius`/`rotate` params (or add an optional bounded-mode param to the hook) over layering a second independent animation system on the same div.
- If a genuinely separate "auto-play-only, pauses on interaction" behavior is wanted (distinct from the always-on ambient float), gate it through `autoPlayPaused` (already tracked in `ProjectsSlider.tsx` state) rather than inventing new pause-tracking.

##### 5. Auto-play scope — RESOLVED 2026-09-05: keep current behavior

User confirmed: **keep cycling through all projects** (the live behavior). The "0–2 only" language in [[frontend-ui-fixes-requirements]] Fix Area 6 is stale — do not implement a cap. No code change is needed for the auto-play index range itself; this section is closed.

### 6. Document × card effects (brainstorm — pick 1–2, unchanged from before, still just a brainstorm)

| Option | Description |
|---|---|
| Edge chroma (recommended) | Border glow color shifts per project's Sanity accent |
| Tech tag pulse | Stack pills illuminate in sequence with active index |
| Live preview strip | Active project description scrolls in card border |
| Background constellation | R3F stars connect to project category |

## Files to modify

> **2026-09-05 root-cause finding:** user reported "no effect at all on scroll" after running the background-sequence prompt. Verified against the live repo: `ObsidianBackgroundCanvas.tsx`'s `projects-edge` mode (camera warp/settled/hyperspace-exit, pass-planets, streaks, glow) is fully built and correct — manually dispatching `background:mode` events proves it works. The actual bug: **`src/lib/gsap/projects-pin.ts` was never created.** Nothing dispatches these events on real scroll, and no ScrollTrigger pin exists for `#projects` at all yet (confirmed: `grep -rn ScrollTrigger src/components/three/ProjectsSlider.tsx` finds nothing; `Draggable`/`InertiaPlugin` are registered, `ScrollTrigger` is not). This isn't a bug to patch, it's the one piece of this file's own §1/§2 spec that was never run. As a genuinely minor, safe prerequisite fix (done directly, not via a Cursor prompt): extracted the event contract Cursor/Grok's canvas code was using as a private local type into `src/lib/background-mode.ts` (`BACKGROUND_MODE_EVENT`, `BackgroundModeDetail`, `ProjectsEdgePhase`, `dispatchBackgroundMode()`) — exactly the file this project's own design doc originally proposed and never built — so `projects-pin.ts` can import the exact contract instead of re-typing a string/shape that has to match by convention. `pnpm typecheck` and Biome both clean after this change; zero behavior change.

| File | Action |
|---|---|
| `src/lib/background-mode.ts` | **DONE** — shared `background:mode` event contract, extracted 2026-09-05. Import from here, do not re-type the event name or detail shape. |
| `src/lib/gsap/projects-pin.ts` | **NOT YET BUILT — this is the actual missing piece.** Pin + one-time card emerge + `background:mode` dispatch, registers `ScrollTrigger` (already globally registered in `Providers.tsx` — do not re-register) |
| `src/components/three/ProjectsSlider.tsx` | Wire pin-entry emerge on outer card wrappers; do not touch `slideVariants`, `Draggable`/`InertiaPlugin` setup, or `tetherActive` logic |
| `src/components/PortfolioContent.tsx` | `#projects` id already exists (confirmed, line 47) — no change needed here |
| `src/components/three/ObsidianBackgroundCanvas.tsx` | **DONE** — `projects-edge` mode fully implemented and verified. Do not modify; only consume its event contract from `projects-pin.ts`. |
| `src/hooks/use-space-float.ts` | Read first; extend only if needed for bounded auto-play drift |

## Do NOT

- Do not modify `slideVariants`, its spring config, or how `AnimatePresence` drives per-index transitions.
- Do not touch the `Draggable`/`InertiaPlugin` setup, drag thresholds, or the `tetherActive`/tether-flash effect.
- Do not remove or fight `useSpaceFloat` on the center or side cards — extend it, don't shadow it with a second transform system on the same element.
- Do not cap or otherwise change auto-play's index range — confirmed to keep cycling all projects (§5, resolved).
- Do not add a new animation dependency — `ScrollTrigger` ships inside the already-installed `gsap` package.
- Do not touch `orby:navigate` chat-nav slug handling.
- Do not mount a second Three.js/R3F canvas for the background sequence in §3 — it's a new mode on the existing `ObsidianBackgroundCanvas.tsx`, not a separate scene.
- Do not touch the hero click-scatter mechanism (`formationActive`, `pScatter`, `FORM_CLICK_*` constants) or the About-pin `about-pin` mode while building `projects-edge` — these are separate modes on the same file; keep them cleanly branched, don't let one mode's state leak into another's.
- Do not build the simple CSS gradient-pulse edge effect this section originally described — it's superseded by §3's sequence.

## Visual reference

- Projects screenshot: Resq center, side projects faded, position indicator dots below.
- Orby bubble text bottom-aligned — separate issue, Contact section, out of scope here.

## Accessibility

- WCAG 2.2.2: auto-play already pauses on interaction (`pauseAutoPlay`) — pin/emerge must not regress this.
- Existing `aria-label`s on nav buttons and `aria-current` on dots — preserve exactly.
- `prefers-reduced-motion` is already read into local state (`prefersReducedMotion`) and gates both auto-play and the Draggable setup — new pin/emerge/edge-pulse code must check the same flag, not add a second detection mechanism.

## Acceptance criteria

- [ ] Section pins on scroll entry
- [ ] Cards emerge once on pin-entry without disturbing per-index slide transitions
- [ ] Entering the pin: background reads as flying outward through space, planets/spheres briefly pass by, motion stops right as cards finish emerging
- [ ] Settled state: a bright central glowing object + thousands of stars fills the backdrop for the rest of the pin, motivating light on the front card
- [ ] Leaving the pin (scrolling past): a fast, accelerating zoom toward one star, streaking into "shooting stars," ending framed close on one large bright star with the remaining stars at the screen edges
- [ ] Auto-play still cycles through all projects (confirmed, unchanged) — side-card drift stays always-on as it is today
- [ ] Drag-to-swipe, keyboard arrows, dot nav, and chat-nav slug jump all still work exactly as before
- [ ] `prefers-reduced-motion`: no pin animation, no warp/flythrough/streak sequence — cards appear statically over the existing resting background
- [ ] `pnpm typecheck && pnpm lint` pass; frame rate holds on mobile (`useIsMobile` point-count reduction still applies to any new geometry)

## Implementation prompt

> Written for a single autonomous coding session (Claude Sonnet 5 in Cursor). Read this whole file before editing anything — it corrects a prior version of this note that misdescribed current auto-play scope and missed the drag gesture, tether-flash effect, and existing ambient drift entirely.

```
Read ui-fix-04-projects-section.md in full first. It was rewritten 2026-09-05 after re-verifying against the live repo; a prior version of this note wrongly claimed auto-play was limited to indices 0-2 (it actually cycles through every project) and didn't mention the existing GSAP Draggable swipe gesture, the "tether flash" effect, or the useSpaceFloat ambient drift already on all three visible cards. Do not trust summaries of this task from anywhere else.

AUTO-PLAY SCOPE IS RESOLVED (confirmed by the user 2026-09-05): keep cycling through all projects — this is the current, correct behavior. Do not cap it to the first 3. No code change is needed for the auto-play index range itself.

TASK — implement exactly this, nothing else:

1. Create src/lib/gsap/projects-pin.ts: import ScrollTrigger from "gsap/ScrollTrigger" and register it (it's part of the already-installed gsap package — do not add a new dependency). Pin the #projects section (defined in PortfolioContent.tsx, not ProjectsSlider.tsx's own inner <section>) for ~1 viewport with scrub: 1.

2. Wire a ONE-TIME emerge animation that fires on pin-entry, on the three cards' OUTER wrapper divs (the ones already wrapped by useSpaceFloat in ProjectsSlider.tsx) — NOT by touching slideVariants or the AnimatePresence block, which must keep working exactly as today for every subsequent index change (manual, drag, keyboard, auto-play). Emerge: opacity 0→1 (center first), scale 0.92→1, blur(8px)→blur(0), no horizontal translate. Side cards animate opacity 0 → their existing resting 0.35, not to 1.

3. Add a new CSS edge-pulse effect (globals.css or a scoped style) — violet/indigo gradient pulse on the section's screen periphery, 4-6s loop, ~15% opacity, active during auto-play. No existing class to reuse or collide with — confirmed absent from globals.css.

4. Read src/hooks/use-space-float.ts before touching side-card drift. It already drives always-on ambient drift on both side cards regardless of auto-play state — that matches the resolved "keep all projects cycling" scope, so no gating change is required here. Only touch this hook if you need to tune radius/rotate for the emerge transition to look right, or if the emerge animation's opacity/scale conflicts with the transform it writes (see constraints below) — do not add a second independent Framer Motion repeat:Infinity transform animation on the same element it targets.

CONSTRAINTS:
- Do not modify slideVariants, its spring config (stiffness 300 / damping 30), or how AnimatePresence drives index-change transitions.
- Do not touch the Draggable/InertiaPlugin setup (drag bounds, thresholds, snap-back/exit animations) or the tetherActive "tether flash" effect — verify by manual swipe test after your changes that this still works identically.
- Do not cap or otherwise change auto-play's index range.
- Do not touch orby:navigate chat-nav slug handling.
- Respect prefers-reduced-motion exactly via the existing prefersReducedMotion state — do not add a second media-query check.

VERIFY before reporting done, and state the result of each explicitly:
(a) Scrolling into #projects pins it and the three cards visibly emerge once, without a horizontal slide.
(b) After the emerge, clicking prev/next still slides with the original x-translate spring animation.
(c) Drag-to-swipe left and right still works, including the tether-flash line on advance.
(d) Auto-play still advances through all projects at the same interval and still pauses on interaction for the same 10s.
(e) Keyboard arrows and dot-pagination nav both still work.
(f) Chat-nav (orby:navigate) slug jump still works.
(g) prefers-reduced-motion: no pin animation, no edge pulse.
Run pnpm typecheck && pnpm lint and paste the output. Do not deploy, do not commit.
```

### Implementation prompt — Background Sequence (§3, separate session from card emerge)

> This is a materially bigger, more novel piece of work than the card-emerge prompt above — new camera behavior, new transient geometry, and a new rendering technique (streaks) inside a 1,296-line file that currently has zero of those. Run it as its own session, not bundled with §1/§2.

```
Read ui-fix-04-projects-section.md §3 ("Background sequence — solar-system flythrough → starfield → hyperspace exit") in full before writing any code. This is a new, previously-undocumented spec — do not look for it anywhere else, and do not confuse it with the old "CSS gradient edge-pulse" idea, which it explicitly supersedes.

CONTEXT: src/components/three/ObsidianBackgroundCanvas.tsx is a single, always-mounted, fixed-position R3F canvas (~1,300 lines) already handling: a fibonacci-sphere particle "planet," a tilted-ring particle system, a 5,500/2,750-point starfield (createStars, mobile-reduced via useIsMobile), scroll-driven camera dolly (CAM_START→CAM_END, lerped by scroll progress), a magnetic cursor dent, and a click-triggered "formation" scatter/reassemble sequence (formationActive branch) that already demonstrates this file's pattern for a mode that temporarily takes over the per-point physics loop and the camera. You are adding a FOURTH mode to this same file — do not create a second canvas or a second Three.js scene.

STEP 0 — before writing the full implementation, write a short comment block (10-20 lines) at the top of your diff describing your concrete plan: what new refs/state you're adding, how the camera-override branch will parallel the existing formationActive pattern without fighting it, which existing geometry you're reusing for the starfield vs. what's new (the "passing planets" and the streak lines), and how the three beats (warp-out / settled / hyperspace-exit) will be sequenced and gated by prefers-reduced-motion. This is a novel enough feature that a wrong architectural guess costs more than a few minutes of planning up front.

TASK — implement the three-beat sequence exactly as specced in §3:

1. **Trigger plumbing:** Extend (or create, if it doesn't exist yet from other in-flight work) the `background:mode` CustomEvent listener in ObsidianBackgroundCanvas.tsx to handle `mode: 'projects-edge'` with a `phase` of `'warp-out' | 'settled' | 'hyperspace-exit'` and a `progress` (0-1) field for the scrubbed phases. This will be dispatched by the Projects GSAP ScrollTrigger (a separate task/file, src/lib/gsap/projects-pin.ts) — for THIS task, you can drive/test it by dispatching the CustomEvent manually from devtools or a temporary test button; do not build the ScrollTrigger dispatch side unless it already exists.

2. **Beat 1 (warp-out, scrubbed 0→~0.35):** On progress driven by the incoming event, branch the camera update (parallel to, not fighting, the existing scroll-driven CAM_START/CAM_END lerp — look at how `formationActive` already diverts the per-point loop away from normal physics for the pattern to follow) into a fast forward-dolly motion. Spawn 4-8 simple spheres (plain `sphereGeometry` + `meshBasicMaterial`, varied size/color, no distort material needed) ahead of the camera's path, animate them past/behind it, and recycle (reposition ahead again, don't create/destroy every frame — this file is written zero-allocation-per-frame on purpose, follow that convention for any new per-frame code).

3. **Beat 2 (settled, holds while phase === 'settled'):** Camera holds a fixed deep-space position. Reuse the existing starfield point cloud (extend/repurpose `createStars`'s output rather than generating a second star system) at increased brightness/visibility. Add ONE new bright object roughly centered — a glowing sprite or small emissive-looking sphere is fine, it does not need real PBR lighting, just needs to read as a light source (brighter facing side, e.g. via a simple gradient sprite texture or `MeshBasicMaterial` with a bright color, whichever is the smaller diff given what's already in the file — `createPointSprite` may already give you what you need).

4. **Beat 3 (hyperspace-exit, one-shot ~1-2s on receiving `phase: 'hyperspace-exit'`, no `progress` driving it — run your own internal easing/timer):** Camera dollies rapidly toward the central bright object (or another star, your call — state which in your report) with an ease-in curve (slow start, fast finish). During the fast portion, draw per-star trailing line segments using the same `LineSegments` pattern already in this file (see `planetLinesRef`/`ringLinesRef` for the existing approach: a `BufferGeometry` with position pairs updated per frame) — segment endpoints are each star's previous-frame vs. current-frame position, opacity/length scaling with current camera speed. End framed close on the bright star with remaining stars visible only at the screen periphery.

5. **prefers-reduced-motion:** this entire sequence (all three beats) must be a no-op — reuse the exact `reducedMotion` detection already in this file (grep for how it's checked elsewhere, e.g. the click listener) rather than adding a second check. Cards (built in the separate §1/§2 task) should still appear over whatever the file's normal resting background is.

CONSTRAINTS:
- Do not touch `formationActive`, `pScatter`, any `FORM_CLICK_*`/`FORM_MOUNT_*` constant, or the click-scatter mechanism from ui-fix-01 — build `projects-edge` as a cleanly separate branch, not by extending or reusing that state.
- Do not touch the magnetic cursor dent, the scroll-driven `stretchT` physics, or the ring particle system except where Beat 1/3's camera override needs to temporarily suspend the normal camera lerp (suspend cleanly, restore cleanly when the sequence ends — do not leave the camera stuck in a warp position if the user scrolls back up mid-sequence).
- No new npm dependencies — everything here (spheres, line segments, sprites) is buildable with primitives already imported in this file (`three`, `@react-three/fiber`, `@react-three/drei` if already imported).
- No new per-frame heap allocations — this file's existing code reuses typed arrays and scratch variables throughout; match that discipline for anything new.
- Respect the existing mobile point-count reduction pattern (`useIsMobile`) for any new geometry (fewer passing-planets, fewer/no streak segments on mobile if frame time is a concern).

VERIFY before reporting done, and state the result of each explicitly:
(a) Dispatching a test `projects-edge` / `warp-out` event with increasing progress visibly moves the camera forward with planets passing by, without fighting or permanently breaking the normal scroll-driven camera path afterward.
(b) The `settled` phase shows a clearly brighter central object plus a dense starfield, stable (no jitter) for as long as the phase persists.
(c) Dispatching `hyperspace-exit` produces a visibly accelerating zoom that becomes streaky, ending on a close framing of one bright star with stars at the periphery — total duration in the 1-2s range.
(d) Scrolling back to a normal, non-`projects-edge` state afterward returns the camera and starfield to their exact prior normal-mode appearance — no leftover offset, stuck state, or visual artifact.
(e) prefers-reduced-motion: none of this fires; background stays in its normal resting state.
(f) Frame rate: describe (numerically if you can measure it, qualitatively if not) whether this holds acceptable frame time on a throttled/mobile profile with the new geometry active.
Run pnpm typecheck && pnpm lint and paste the output. Do not deploy, do not commit.

If your Step 0 plan reveals this needs a bigger architectural change than "a fourth mode branch" (e.g. you find the existing camera-update code structurally cannot be branched this way without a larger refactor), stop after Step 0 and report that finding rather than forcing an awkward implementation on top of a plan you already know is wrong.
```
## Dependencies

- Task 3.0 GSAP research (reuse ScrollTrigger patterns from About, once that exists)
- Optional: [[ui-fix-01-hero-background]]'s deferred `background:mode` event, if projects-edge R3F sync is attempted

## Risks

- Emerge animation and the existing `AnimatePresence`/`slideVariants` transition both touching opacity/scale on nested elements — keep them on clearly separate DOM layers (outer wrapper vs. inner `motion.div`) so they don't fight.
- A second transform-writing system layered onto `useSpaceFloat`'s target element will visibly stutter or freeze drift — read the hook first (see §4 above).
- Pin duration vs. carousel height on mobile — carousel side cards are already `hidden md:block`, so mobile only ever shows the center card; account for that when sizing the pin.
