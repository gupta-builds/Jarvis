---
type: class
input_kind: project
status: active
created: 2026-07-11
updated: 2026-09-27
area: portfolio/frontend
tags:
  - "#class"
  - portfolio
  - frontend
  - ui-fixes
next: "[[ui-fixes-requirements]]"
notes:
  - "[[ui-fixes-requirements]]"
  - "[[ui-fixes-design]]"
  - "[[ui-fixes-tasks]]"
---

# UI Fixes — Master Note

### Per-component build specs (implementation-ready)

Each fix area has a **detailed standalone spec** with verified file paths, current vs target behavior, acceptance criteria, and copy-paste prompts:

→ **Start here:** [[ui-fixes-index]]

| Area | Spec |
|---|---|
| Hero / background | [[ui-fix-01-hero-background]] |
| About pin + summary | [[ui-fix-02-about-section]] |
| About telemetry (2 glow cards) | [[ui-fix-03-about-telemetry]] |
| Projects cinematic pin | [[ui-fix-04-projects-section]] |
| Education spring/rope | [[ui-fix-05-education-section]] |
| Logo + footer | [[ui-fix-06-logo-footer]] |
| Portfolio Lab input | [[ui-fix-07-portfolio-lab]] |
| July carry-forward | [[ui-fix-08-carry-forward]] |

Formal trio: [[ui-fixes-requirements]] · [[ui-fixes-design]] · [[ui-fixes-tasks]]

---

> **CORRECTION 2026-09-27:** The walkthrough table below is raw human dictation from session `2026-09-04` — it has **not** been re-verified against the live repo. [[ui-fixes-index]] and the 8 `ui-fix-0N-*` component specs (re-checked against the live repo on 2026-09-05, with exact file/line citations) are **more current and more reliable** than this table. Several rows below marked "open" are already built — corrected inline with a link to the spec that confirms it. **Start at [[ui-fixes-index]], not here**, when checking what's actually left to build.
>
> Formal spec: [[ui-fixes-requirements]], [[ui-fixes-design]], [[ui-fixes-tasks]].

---

## Current Localhost Walkthrough (Sep 2026)

Verified against localhost + screenshots from session `2026-09-04`. This is the active fix list.

### Status Legend

| Status | Meaning |
|---|---|
| **open** | Not built or visibly wrong on localhost |
| **partial** | Exists but does not match spec |
| **done** | Matches spec on localhost |
| **superseded** | Old requirement — do not implement |

---

### 1. Hero / Background Sphere

| Fix | Status | Detail |
|---|---|---|
| Profile image static | **partial** | Previously fixed from moving; must stay static at all times — no ambient drift after entrance |
| Image hover overlay full cover | **open** | On hover, Open Portfolio Lab / Close tab overlay must cover the **entire** profile image. Current gap on left border and bottom border is visible |
| Sphere click → 3D volumetric scatter | **partial** *(corrected 09-27)* | The scatter math is already genuinely 3D and isotropic (`randomOffsetInSphere` is correct) — the "looks 2D" complaint is a rendering gap (no parallax, no depth stratification, scatter direction ignores click point), not a math gap. A first refinement pass already shipped; see [[ui-fix-01-hero-background]] for the remaining camera-bias fix |
| Scroll-driven background upgrade | **open** | Scroll effect improved but needs next level — see About/Projects/Education pinned sections below |

**Components:** `HeroContent.tsx`, `ProfileImage.tsx`, `ObsidianBackgroundCanvas.tsx`

**Screenshots:** landing hero (profile card right, particle sphere center)

---

### 2. About Section — Pinned Scroll + Summary

| Fix | Status | Detail |
|---|---|---|
| Pinned one-screen scroll moment | **open** | As user scrolls past landing, About pins for one viewport. First frame: short summary + 2 stat cards. One more scroll: summary transforms/reveals next state |
| Mesmerizing background scatter on pin | **open** | During About pin, background does a **mesmerizing scatter/reform** — same family as sphere click but more attention-catching. This is the "pause and scroll" hook |
| Click-anywhere bio expand | **open** | Full bio currently only expands via "Read full bio" button. Must expand when clicking **anywhere** on the About card or description text |
| Remove bottom 2 stat cards | **open** | Remove "2+ Coding Experience" and "15+ Technologies Mastered" cards |
| Keep 2 Sanity-editable cards | **open** | Keep only: **"Ongoing always (5+)" / Side Quests** and **"100%" / Eager to Learn**. Both editable in Sanity (`profile.stats[]`) |
| Glow-only card interaction | **open** | Clicking either card triggers a **subtle whole-card glow** at a mild, noticeable pace. **No dropdown, no graph, no accordion** — supersedes July spec's mini-graph expand |

**Components:** `AboutSection.tsx`, `AboutSectionClient.tsx`, `AboutTelemetry.tsx`, `ObsidianBackgroundCanvas.tsx` (background sync)

**GSAP:** ScrollTrigger pin required — see [[ui-fixes-design]] § Pinned Sections

**Screenshots:** About collapsed (4 cards visible — target is 2), About expanded (full bio + 4 cards — target is 2 glow cards)

---

### 3. Projects Section — Pinned Cinematic Lock

| Fix | Status | Detail |
|---|---|---|
| Pinned lock-screen on scroll | **open** | Similar to About: section pins when user reaches Projects |
| Border/edge background effect | **open** | Soothing recurring effect on **outer borders/edges of screen** while auto-scroll runs — distinct from About's center scatter |
| Cards emerge from space | **open** | On reaching scroll point, 3 project cards emerge from fully translucent → solid 3D-feeling cards that appear **in space** (not sliding around) |
| Side card ambient drift | **done** *(corrected 09-27)* | Already exists via `useSpaceFloat`, always-on drift, independent of hover — confirmed in [[ui-fix-04-projects-section]] |
| Auto-play scope | **done** *(corrected 09-27)* | Resolved — live code already cycles all 9 projects. The "0–2 only" cap was a stale July requirement, not a live bug; confirmed in [[ui-fixes-requirements]] |

**Components:** `ProjectsSlider.tsx`, `ObsidianBackgroundCanvas.tsx`, section wrapper

**GSAP:** ScrollTrigger pin + timeline for card emergence

**Brainstorm note:** Document should have active role in card effects — options to explore in design doc before coding

**Screenshots:** Projects carousel (Resq center, TradingView/OpsPilot faded sides)

---

### 4. Education Section — Spring, Rope, Deform

| Fix | Status | Detail |
|---|---|---|
| Pinned one-screen lock | **open** | Education fits one viewport on entry; spring entrance sequence plays inside pin |
| Spring bounce entry sequence | **open** | Bachelor's sphere bounces up first, then High School, then Middle School — spring-like, not instant |
| Rope connectors (not rigid lines) | **partial** *(corrected 09-27)* | Already built (`StretchingLine`, a live bent Bezier curve, not a rigid line) — only a loop-restart snap bug remains; see [[ui-fix-05-education-section]] |
| Dot delay +0.5s | **open** | Travelling dot starts ~0.5s later than now so Bachelor's can return to rigid shape before next loop |
| Bachelor's gradual deform with dot | **partial** *(corrected 09-27)* | Already built (`collegeDistortForT` ties deformity to dot travel timing) — same loop-restart snap bug as the rope connectors above; see [[ui-fix-05-education-section]] |
| Reduce Education header padding | **open** | Header padding covers/obscures Bachelor's sphere — tighten so sphere is unobstructed |

**Components:** `EducationSection.tsx`, `EducationFlowchart.tsx`, `globals.css` (section padding)

**Supersedes (partially):** July deformity direction had middle-school-most-deformed on entry — Sep spec ties deformity to **dot travel timing**, not just scroll-into-view stagger

**Screenshots:** Education section (Bachelor's rigid circle top, deformed blobs below, rigid white connector lines — target is rope)

---

### 5. Logo & Footer

| Fix | Status | Detail |
|---|---|---|
| Remove tab-open glow on logo | **done** *(corrected 09-27)* | Closed, not a real bug — no code path ties any glow to sidebar/tab state. The actual complaint was about the static favicon, which has no glow mechanism at all; see [[ui-fix-06-logo-footer]] |
| Thinner, more cursive "A" | **open** | Keep structure and alignment; refine the A to be thinner and more cursive within existing logo system |
| Footer logo placement | **partial** *(corrected 09-27)* | Placement already done (`Footer.tsx:43`) — only sizing is still open (currently 32px, spec wants `~1em` to match footer text size); see [[ui-fix-06-logo-footer]] |

**Components:** Logo component (header + tab), `Footer.tsx`, `PortfolioLab.tsx` (tab state)

**Screenshots:** Tab open (glowing A + "Ana"), footer pill (small glyph + "Anant's Hub")

---

### 6. Portfolio Lab — Chat Input

| Fix | Status | Detail |
|---|---|---|
| Textarea vertical centering | **open** | When input has 1–3 lines, typed text sits at **bottom** of card instead of vertically centered. Text must be **left-aligned, vertically centered** when short; top-align naturally as it grows to 3-line cap |
| Growable textarea (3 lines) | **partial** | July spec — likely partially built; verify against localhost |
| Mobile send button layout | **open** | Still needs on-device repro at 320/375/390px — see requirements Fix Area 4 |

**Components:** `ChatInputBar.tsx`, `PortfolioLab.tsx`

**Screenshots:** Lab input ("Say something to Orby..." placeholder appears centered; typed multi-line text misaligns)

---

### 7. Items Still Valid From July (Unchanged Priority)

These remain open unless marked done in codebase:

- Hero terminal removed from render tree (**done** in code — verify visually)
- Scatter-intro on page load (**partial** — verify 3D depth quality)
- Experience card line-clamp (**partial**)
- Skills graph 2022 start + 35 cap (**partial**)
- Skills/Education section padding tighten (**partial**)
- Dark mode toggle wiring + light tokens (**partial** — toggle may still be no-op)
- Orby radio/wave/idle commentary/roaming (**partial**)
- Chat bubble `break-words` (**done** *(corrected 09-27)* — already shipped, `ChatThread.tsx:162`)
- Deploy sync verification (**open** — local HEAD may differ from production)

---

### 8. Explicitly Superseded (Do Not Build)

| Old requirement (July) | Superseded by (Sep) |
|---|---|
| 4 telemetry cards with click-to-expand mini-graph + accordion | 2 cards, glow-only, no dropdown |
| About: 4 cards clickable with graph detail | Same |
| Education: deformity stagger on section entry only | Dot-synchronized gradual deform + spring pin sequence |
| Projects: auto-play only (no pin/emerge) | Pinned cinematic section with emerge + border effect |

---

### 9. Open Questions (Resolve Before Implementation)

1. **About pin steps:** Exact number of scroll "beats" inside pin — 2 (summary → transformed summary) or 3 (+ full bio reveal)?
2. **Projects border effect:** Color, speed, and shape of edge effect — needs visual reference or mood board
3. **Education rope physics:** Pure SVG/canvas bend vs. physics simulation vs. GSAP morph — design decision
4. **Logo asset:** SVG path edit vs. font swap — same system, but confirm source file location
5. **Orby speech bubble alignment:** Contact screenshot shows Orby bubble text bottom-aligned — separate fix or in scope?

---

## Historical Context — July 2026 Raw Dump

> Preserved verbatim-ish from original dictated notes. **Do not treat as current spec** where contradicted above.

### Original Overview
- Deploy sync verification requested at start of session
- Profile image should be static; light comet effect on photo (not deep 3D tilt)
- Remove HeroTerminal from render (keep file)
- Background: stars/particles scattered on load, converge to sphere over 2–4s
- About: collapsible 3–4 sentence summary; full bio on toggle
- 4 telemetry boxes: clickable, reveal tiny graph + summary per stat
- Lab: responsive send button, growable textarea (3 lines), character indicator
- Experience: content quality out of scope; line-clamp for summaries
- Projects: auto-play first 3 only; strong chatbot slug navigation
- Skills: graph starts 2022, no skill above 35 at start; reduce pill effect variety
- Education: deformity hierarchy (middle most deformed, bachelor's solid); padding tighten
- Sphere click scatter within blast radius, scales with scroll zoom
- Dark mode: real toggle, inverted-but-not-white palette
- Orby: radio antenna, full wave, AI idle comments, walking, ground anchor
- Footer polish

### Original Screenshots (July embeds — paths may be unresolved)
![[Pasted image 20260711204507.png]]
![[Pasted image 20260711204540.png]]
![[Pasted image 20260711211130.png]]
![[Pasted image 20260711211213.png]]
![[Pasted image 20260711211259.png]]
![[Pasted image 20260711211336.png]]
![[Pasted image 20260711211404.png]]

---

## Plan (tracking)

- [x] Phase 1 — Master ledger + localhost walkthrough (Sep 2026)
- [x] Phase 2 — Update requirements / design / tasks trio + per-component specs
- [ ] Phase 3 — GSAP research + About carousel architecture (separate engagement)
- [ ] Phase 4 — Implementation via [[ui-fixes-tasks]] + [[ui-fixes-index]]

## Concepts used
- [[ui-fixes-requirements]]
- [[ui-fixes-design]]
- [[ui-fixes-tasks]]

- [[ui-fixes-index]]
- [[ui-fix-01-hero-background]]
- [[ui-fix-02-about-section]]
- [[ui-fix-03-about-telemetry]]
- [[ui-fix-04-projects-section]]
- [[ui-fix-05-education-section]]
- [[ui-fix-06-logo-footer]]
- [[ui-fix-07-portfolio-lab]]
- [[ui-fix-08-carry-forward]]

## Post-submit reflection
- What failed first?
- What pattern repeats?
