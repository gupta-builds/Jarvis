---
type: subsystem
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/07 Design System, Accessibility, and Responsive Behavior.md
sync: managed
tags: [portfolio, css, design-system, accessibility, responsive]
---

# 07 Design System, Accessibility, and Responsive Behavior

## Purpose

The design system is CSS-first Tailwind v4 in `src/app/globals.css`. It encodes the site’s visual identity and component contracts; there is intentionally no `tailwind.config.ts`.

## Visual language

The interface is a dark, floating portfolio command center inside space. Surfaces are translucent but readable, with violet/cyan signal accents and green reserved for status. White solid cards, fully transparent cards, and generic dashboard styling violate the system.

The main reusable contracts are:

- `.cosmic-card`: translucent dark surface, violet border, backdrop blur, resting elevation, and stronger hover lift.
- `.float-btn`: visible resting shadow/border, hover lift and sheen, compressed active state.
- `.section-kicker`: muted monospace code-comment label.
- `.section-backdrop`: local readability layer over the R3F background.
- `.orbit-chip` and related badges: compact signal metadata, not primary actions.

Apply `.float-btn` to hero/project/contact actions, carousel controls, social icons, the Lab launcher, and back-to-top controls.

## Component primitives

`src/components/ui` contains shadcn/Radix primitives plus portfolio-specific pieces. `CometCard` provides bounded 3D hover tilt with `default`, `dark`, and `large` variants. Dark/large variants cap tilt at eight degrees; reduced motion disables tilt. `SplitHeading` provides the section-heading reveal and must retain a readable non-animated state.

## Accessibility invariants

- Every icon-only button has an accessible name.
- Focus order follows page order; floating elements do not trap focus.
- Hover-only information has a keyboard/touch equivalent.
- Motion responds live to `prefers-reduced-motion`.
- Text/card contrast remains sufficient over the brightest background state.
- Dialog/sheet primitives retain Radix titles, descriptions, escape handling, and focus restoration.
- Canvas content is decorative unless an equivalent DOM representation exists.
- Headings remain semantically ordered even when animation splits their text.

## Responsive model

Mobile changes density and interaction, not just width. The sidebar becomes full-width, particle counts drop, project drag targets remain reachable, and large data displays must avoid horizontal overflow. `use-mobile.ts` is the shared breakpoint hook for behavior that cannot remain CSS-only.

## Tailwind v4 warning

Graphify currently does not extract `globals.css` well, so its graph can understate design-system coupling. For CSS changes, source search and focused preservation tests are mandatory even when the graph shows no neighbors.

## Change checklist

1. Reuse a token/contract before adding a one-off style.
2. Inspect dark/light selectors and background interaction.
3. Check keyboard, screen-reader label, reduced-motion, mobile, and 200% zoom paths.
4. Update visual-contract tests when intentionally changing a contract.
5. Avoid creating a Tailwind config or hardcoding content in a styling component.

## Graphify query recipes

```bash
graphify query "CometCard HeaderScrolling Footer sidebar split heading accessibility" --context import --context call --budget 3500
graphify affected "CometCard()" --depth 2
rg -n "cosmic-card|float-btn|section-kicker|section-backdrop|orbit-chip" src/app/globals.css src/components
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1181 nodes / 2139 edges**
- This subsystem: **14 files / 52 nodes / 199 touching edges**
- Leading communities: `cn` (16), `HeaderScrolling.tsx` (15), `comet-card.tsx` (7), `lucide-react` (3), `PortfolioContent.tsx` (3), `utils.ts` (3)

### High-connectivity symbols

- `CometCard()` — `src/components/ui/comet-card.tsx:L15` (degree 14)
- `useSidebar()` — `src/components/ui/sidebar.tsx:L33` (degree 14)
- `SplitHeading()` — `src/components/ui/split-heading.tsx:L31` (degree 9)
- `HeaderScrolling()` — `src/components/HeaderScrolling.tsx:L109` (degree 8)
- `useIsMobile()` — `src/hooks/use-mobile.ts:L5` (degree 5)
- `Footer()` — `src/components/Footer.tsx:L7` (degree 4)
- `isExternalHref()` — `src/components/HeaderScrolling.tsx:L39` (degree 4)
- `SheetContent()` — `src/components/ui/sheet.tsx:L47` (degree 4)
- `Sidebar()` — `src/components/ui/sidebar.tsx:L148` (degree 4)
- `SidebarProvider()` — `src/components/ui/sidebar.tsx:L42` (degree 4)
- `SpaceRail()` — `src/components/ui/space-rail.tsx:L49` (degree 4)
- `use-mobile.ts` — `src/hooks/use-mobile.ts:L1` (degree 4)

### Owned source files

- `src/components/ui/split-heading.tsx`
- `src/app/globals.css`
- `src/components/Footer.tsx`
- `src/components/HeaderScrolling.tsx`
- `src/components/ThemeProvider.tsx`
- `src/components/ui/__tests__/comet-card.test.tsx`
- `src/components/ui/comet-card.tsx`
- `src/components/ui/layout-text-flip.tsx`
- `src/components/ui/sheet.tsx`
- `src/components/ui/sidebar.tsx`
- `src/components/ui/space-rail.tsx`
- `src/hooks/use-mobile.ts`
- `src/hooks/useActiveSection.ts`
- `src/hooks/useShowOnScroll.ts`
<!-- graphify:auto:end -->

## Related notes

- [[03 Page Composition and Content Sections]]
- [[06 Three.js, Motion, and Animation Performance]]
- [[09 Testing, Prompt Evals, and Quality Gates]]
