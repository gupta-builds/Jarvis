---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, components, shadcn, radix, primitives]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "Card — `src/components/ui/card.tsx`", "Dropdown Menu — `ui/dropdown-menu.tsx`", "Chart — `ui/chart.tsx`", "Tooltip — `ui/tooltip.tsx`", "Spinner — `ui/spinner.tsx`", "Input — `src/components/ui/`" | None exist. `src/components/ui/` contains `comet-card.tsx`, `layout-text-flip.tsx`, `sheet.tsx`, `sidebar.tsx`, `space-rail.tsx`, `split-heading.tsx` (+ `__tests__`). `card.tsx` / `spinner.tsx` are absent from `git ls-tree 89cd2c0e`; no `recharts` dependency in `package.json` (rg) |
> | "function Sidebar(); function SidebarToggle(); … SidebarFooter, SidebarGroup, SidebarGroupAction, SidebarGroupContent, SidebarGroupLabel" (`ui/sidebar.tsx`) | `ui/sidebar.tsx` exports only `Sidebar, SidebarContent, SidebarProvider, useSidebar` (`:266`). `SidebarToggle` is `src/components/SidebarToggle.tsx:6` (imports `useSidebar` from `./ui/sidebar`, `:4`) |
> | "`useIridescentEffect(ref: RefObject<HTMLElement>, opts?: UseIridescentEffectOptions): void`" with `intensity?`, `colors?` | `useIridescentEffect(options: { gradientAlpha?: number } = {}): { ref: RefObject<HTMLDivElement \| null> }` (`src/hooks/useIridescentEffect.ts:5-16`) |
> | "Used on: profile name in Hero, social buttons in Contact, nav links" | Call sites: `HeroContent.tsx:42`, `ContactPanel.tsx:44`, `SkillsSectionClient.tsx:192`, `ProjectsSlider.tsx:28`; none in `HeaderScrolling.tsx` (rg) |
> | Hooks table lists 4 hooks | Also in `src/hooks/`: `use-space-float.ts:59` (`useSpaceFloat`), `useAnimationGate.ts:84`, `useLogoTexture.ts:44`; `ui/space-rail.tsx:49` (`SpaceRail`) and `ui/split-heading.tsx:31` (`SplitHeading`) are also unlisted primitives |

# UI Primitives

> [[../INDEX|← Back to Index]] · [[00-overview|Component Map]]

## CometCard — `src/components/ui/comet-card.tsx` (Community 13, 17 edges)

See [[../architecture/04-design-system|Design System]] for full contract. The cross-community card primitive used in CertificationsSection, ContactPanel, ExperienceCard, and more.

## Sidebar — `src/components/ui/sidebar.tsx` (Communities 6, 9, 67)

The most complex primitive. Community 67 owns the hook:

```typescript
// Community 67
function useSidebar(): SidebarContext   // 20 edges — god node
function Sidebar(): JSX.Element
function SidebarToggle(): JSX.Element
```

Community 6 owns the sub-components:
```typescript
function SidebarProvider(props): JSX.Element
function SidebarFooter(): JSX.Element
function SidebarGroup(): JSX.Element
function SidebarGroupAction(): JSX.Element
function SidebarGroupContent(): JSX.Element
function SidebarGroupLabel(): JSX.Element
// + more sidebar sub-components
```

Community 9 owns navigation use: `Sheet()`, `SheetContent()` used for mobile sidebar.

## Card — `src/components/ui/card.tsx` (Community 47)

```typescript
function Card(): JSX.Element
function CardHeader(): JSX.Element
function CardTitle(): JSX.Element
function CardContent(): JSX.Element
function CardFooter(): JSX.Element
function CardDescription(): JSX.Element
function CardAction(): JSX.Element  // shadcn v2 addition
```

All call `cn()`. Standard shadcn Card implementation.

## Dropdown Menu — `src/components/ui/dropdown-menu.tsx` (Community 24)

```typescript
function DropdownMenuCheckboxItem()
function DropdownMenuContent()
function DropdownMenuItem()
function DropdownMenuLabel()
function DropdownMenuRadioItem()
function DropdownMenuSeparator()
function DropdownMenuShortcut()
function DropdownMenuSubContent()
function DropdownMenuTrigger()  // implied
```

## Sheet — `src/components/ui/sheet.tsx` (Community 9)

Used for mobile sidebar overlay. `Sheet()`, `SheetContent()` from Radix.

## Chart — `src/components/ui/chart.tsx` (Community 28)

Recharts-based chart primitives:
```typescript
type ChartConfig = Record<string, { label: string; color?: string }>
interface ChartContextProps { config: ChartConfig }
const ChartContext: React.Context<ChartContextProps>
function ChartContainer(props: { config: ChartConfig }): JSX.Element
function ChartTooltipContent(props: ChartTooltipContentProps): JSX.Element
function ChartLegendContent(props: ChartLegendContentProps): JSX.Element
type ChartPayloadItem = { name: string; value: number; ... }
```

## Input — `src/components/ui/` (Community 6)

`Input()` is in Community 6 alongside `cn()` and sidebar primitives.

## Tooltip — `src/components/ui/tooltip.tsx` (Community 6)

Standard Radix tooltip primitive.

## Layout Text Flip — `src/components/ui/layout-text-flip.tsx`

Animated text flip/swap component for hero headline transitions.

## Spinner — `src/components/ui/spinner.tsx`

Simple loading spinner. **Calls `cn()`** — noted as a surprising connection in the graph.

## Hooks

| Hook | File | Community | Purpose |
|------|------|-----------|---------|
| `useIridescentEffect()` | `src/hooks/useIridescentEffect.ts` | 3 | Mouse-driven iridescent glow (15 edges) |
| `useIsMobile()` | `src/hooks/use-mobile.ts` | 22 | Viewport width < 768px check |
| `useActiveSection()` | `src/hooks/useActiveSection.ts` | — | IntersectionObserver for active nav section |
| `useShowOnScroll()` | `src/hooks/useShowOnScroll.ts` | — | Scroll visibility trigger |

### useIridescentEffect (15 edges — god node)

```typescript
interface UseIridescentEffectOptions {
  intensity?: number
  colors?: string[]
}
function useIridescentEffect(ref: RefObject<HTMLElement>, opts?: UseIridescentEffectOptions): void
```

Used on: profile name in Hero, social buttons in Contact, nav links.

## See Also
- [[../architecture/04-design-system|Design System (cn, cosmic-card, float-btn)]]
