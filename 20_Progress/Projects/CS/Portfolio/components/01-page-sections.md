---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, components, sections]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "All sections are server components that receive data from `PortfolioContent()` via `sanityFetch()`" | `PortfolioContent` only fetches `NAVIGATION_QUERY` + `PROJECTS_QUERY` (`PortfolioContent.tsx:25-26`). Each section fetches its own data (e.g. `HeroSection.tsx:7`, `SkillsSection.tsx:7`, `ExperienceSection.tsx:8`, `ContactSection.tsx:22`). Client halves exist: `AboutSectionClient`, `ExperienceSectionClient`, `SkillsSectionClient`, `SkillsCapabilityGraph`, `HeroContent`, `ProfileImage` all start with `"use client"` |
> | Hero: "Query: `PROFILE_QUERY`, `SITE_SETTINGS_QUERY`" | `HeroSection` fetches only `PROFILE_QUERY` (`HeroSection.tsx:7`). `AboutSection` fetches `ABOUT_QUERY` + `SKILLS_QUERY` + `PROJECTS_QUERY` (`AboutSection.tsx:27-29`) |
> | About: `CANONICAL_READOUTS`, `CanonicalReadout`, `findStat()` | None of the three exist in `src` (rg). `AboutTelemetry.tsx` has `STAT_ICONS` (`:13`), `SPARKLINE_BARS` (`:16`) and `TelemetryCard` |
> | Experience: "`getCategoryColor()` — color by employment category"; "`CATEGORY_COLORS`, `EMPLOYMENT_LABELS`" (ExperienceSection / ExperienceCard) | `getCategoryColor` and a `CATEGORY_COLORS` map live in `src/lib/category-colors.ts:20,1`; no component imports `getCategoryColor` (rg). `ExperienceCard.tsx` only owns `EMPLOYMENT_LABELS` (`:15`); `SkillsSectionClient.tsx:24` and `SkillsCapabilityGraph.tsx:13` keep their own local `CATEGORY_COLORS` |
> | Projects: "`ProjectsSlider()` — 3D carousel inside R3F canvas"; "Uses `Float` from drei"; "elastic spring (`@react-spring/web`)" | `ProjectsSlider.tsx` is DOM + GSAP: `gsap`, `Draggable`, `InertiaPlugin` (`:3-6,19`), `useProjectsPin` (`:15`), `useSpaceFloat` (`:12,210-223`). No `@react-three` / `Canvas` / drei `Float` there, and `@react-spring/web` is not in `package.json` |
> | Education: "`EducationEntry.tsx`"; "Uses `MeshDistortMaterial` + `Float` from drei"; "`BLOB_COLORS`, `BLOB_ICONS`, `BLOB_SIZES`, `BLOB_VARIANTS`, `BlobVariant`" | No `EducationEntry` file or symbol. `EducationFlowchart.tsx` is R3F (`Canvas` `:4,522`) and imports `Html, Line, MeshDistortMaterial` from drei (`:3`) — not drei `Float` (its float is a local animation section, `:58`); no `BLOB_*` / `BlobVariant` symbols exist (rg). `FlowchartItem` exists (`:83`) |
> | Certifications: "`getGlareOverlay()`, `getInnerCard()`"; "`glare`, `inner` — CSS ref targets" | Not in `CertificationsSection.tsx`; `getGlareOverlay` / `getInnerCard` exist only as test helpers (`src/components/ui/__tests__/comet-card.test.tsx:101`) |
> | Contact: "`ContactForm.tsx`"; "`ContactForm()` — form calling `submitContactForm()` Server Action" | No `ContactForm` component or `submitContactForm` in `src`; `src/app/actions/` is empty |
> | Contact: "`formatCategory()`, `normalizeCategoryKey()` — helpers" (`ContactPanel`) | Defined in `src/lib/utils.ts` and used by `SkillsSectionClient.tsx` / `SkillsCapabilityGraph.tsx` — not in `ContactPanel.tsx` (rg) |
> | Navigation: "`SECTION_IDS` — section scroll targets" (`HeaderScrolling.tsx`) | Not in `HeaderScrolling.tsx` (rg). `SECTION_IDS` consts exist in `src/hooks/useActiveSection.ts:4` and `src/lib/chat-tools.ts:163`. `HeaderScrolling.tsx` has `CORE_NAV` (`:27`), `NavItem` (`:16`), `isExternalHref` (`:39`), `buildNavItems` (`:45`) |

# Page Sections

> [[../INDEX|← Back to Index]] · [[00-overview|Component Map]]

All sections are server components that receive data from `PortfolioContent()` via `sanityFetch()`.

## Hero Section (Communities 3, 15)

**Files:** `HeroSection.tsx`, `HeroContent.tsx`, `ProfileImage.tsx`, `HeroTerminal.tsx`

- `HeroSection()` — outer wrapper, loads profile data
- `HeroContent()` — CTA buttons, animated headline, `useIridescentEffect()` on name
- `ProfileImage()` — Sanity image with `urlFor()`
- `HeroTerminal.tsx` — animated terminal-style text display (Community 12)
- Query: `PROFILE_QUERY`, `SITE_SETTINGS_QUERY`

## About Section (Community 12)

**Files:** `AboutSection.tsx`, `AboutTelemetry.tsx`

- `AboutSection()` — bio, skills summary
- `AboutTelemetry()` — stats display (Community 12):
  - `CANONICAL_READOUTS` — static stat definitions
  - `CanonicalReadout` — type
  - `findStat()` — look up stat by key
  - `SPARKLINE_BARS` — sparkline data
  - `STAT_ICONS` — icon map
  - `TelemetryCard()` — individual stat card
- Query: `ABOUT_QUERYResult`

## Experience Section (Community 29)

**Files:** `sections/ExperienceSection.tsx`, `cards/ExperienceCard.tsx`

- `ExperienceSection()` — section wrapper, staggered animation
- `ExperienceCard()` — individual job card with `CometCard` base
- `getCategoryColor()` — color by employment category
- `CATEGORY_COLORS`, `EMPLOYMENT_LABELS` — config maps
- `formatDate()`, `formatDateRange()` — date display helpers
- Query: `EXPERIENCE_QUERY`

## Projects (Community 3, Three.js)

**File:** `three/ProjectsSlider.tsx`

- `ProjectsSlider()` — 3D carousel inside R3F canvas
- Uses `Float` from drei for gentle drift
- Uses elastic spring (`@react-spring/web`) for card physics
- Query: `PROJECTS_QUERY`

## Skills Section (Communities 3, 7)

**Files:** `sections/SkillsSection.tsx`, `sections/SkillsSectionClient.tsx`

- `SkillsSection()` — server wrapper (Community 7)
- `SkillsSectionClient()` — client component with category filter (Community 3)
- Query: `SKILLS_QUERY`

## Education Section (Communities 13, 23)

**Files:** `sections/EducationSection.tsx`, `EducationFlowchart.tsx`, `EducationEntry.tsx`

- `EducationSection()` — section wrapper
- `EducationFlowchart()` — R3F-powered flowchart with blob variants (Community 23):
  - `BLOB_COLORS`, `BLOB_ICONS`, `BLOB_SIZES`, `BLOB_VARIANTS`
  - `BlobVariant` type, `FlowchartItem` type
  - Uses `MeshDistortMaterial` + `Float` from drei
- Query: `EDUCATION_SECTION_QUERYResult`, `EDUCATION_QUERYResult`

## Certifications Section (Community 13)

**File:** `sections/CertificationsSection.tsx`

- `CertificationsSection()` — grid of cert cards
- `getGlareOverlay()`, `getInnerCard()` — glare effect helpers
- `glare`, `inner` — CSS ref targets
- Uses `CometCard` variant `"dark"` heavily
- Query: `CERTS_SECTION_QUERY`, `CERTS_SECTION_QUERYResult`

## Achievements Section (Community 7)

**File:** `sections/AchievementsSection.tsx`

- `AchievementsSection()` — orbit chip grid
- `ACHIEVEMENTS_SECTION_QUERY` — defined inline
- Uses `.orbit-chip` CSS class
- Query: `ACHIEVEMENTS_SECTION_QUERYResult`

## Blog Section (Community 34)

**Files:** `sections/BlogSection.tsx`, `BlogFeed.tsx`

- `BlogSection()` — section wrapper
- `BlogFeed()` — feed of blog cards
- `formatPostDate()` — date formatter
- `MagneticButton()` — magnetic hover button
- `PINNED_GITHUB` — pinned GitHub link config
- Query: `BLOG_SECTION_QUERY`, `BLOG_SECTION_QUERYResult`

## Contact Section (Communities 3, 7)

**Files:** `sections/ContactSection.tsx`, `ContactPanel.tsx`, `ContactForm.tsx`

- `ContactSection()` — section wrapper (Community 7)
- `ContactPanel()` — profile + social links (Community 3):
  - `ContactProfile` — profile display
  - `IridSocialButton()` — iridescent social icon button
  - `SocialLinks` — links config
  - `formatCategory()`, `normalizeCategoryKey()` — helpers
- `ContactForm()` — form calling `submitContactForm()` Server Action (Community 1)
- Query: `CONTACT_QUERYResult`

## Navigation (Community 9)

**File:** `HeaderScrolling.tsx`

- `HeaderScrolling()` — sticky header with scroll-aware style
- `buildNavItems()` — builds nav from `CORE_NAV`
- `CORE_NAV` — section ID list
- `NavItem`, `NavLink()` — nav link types and component
- `SECTION_IDS` — section scroll targets
- `isExternalHref()` — external link detector
- `HeaderScrollingProps` — component props type
