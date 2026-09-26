---
type: subsystem
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/03 Page Composition and Content Sections.md
sync: managed
tags: [portfolio, sections, components, content-flow]
---

# 03 Page Composition and Content Sections

## Purpose

`PortfolioContent.tsx` is the page’s composition root. It establishes order, stable section IDs, navigation integration, the fixed background, and the boundary between server-fetched sections and interactive clients.

## Current order

1. Header
2. Hero
3. About
4. Experience
5. Projects
6. Skills
7. Education
8. Certifications
9. Achievements
10. Blog
11. Contact
12. Footer

The project block is composed directly because it combines the section heading with `ProjectsSlider`; the other content areas live under `src/components/sections`.

## Section pattern

The preferred pattern is:

```text
Async server section
  ├─ owns GROQ query and null/empty handling
  ├─ emits stable section id and semantic heading
  └─ passes typed data to a focused client component when interaction is needed
```

Examples include `AboutSection` → `AboutSectionClient`, `ExperienceSection` → `ExperienceSectionClient`, and `SkillsSection` → `SkillsSectionClient`. Keep content fetching out of interactive children unless the interaction itself requires a request.

## Shared composition contracts

- Every navigable section needs a stable lower-case `id` that agrees with header links, chat `SECTION_IDS`, fixed prompts, and Orby triggers.
- Every section uses the documented code-style kicker. Do not silently rename it in one component.
- Content remains readable over the background through `.section-backdrop`, spacing tokens, and cosmic-card surfaces.
- Empty CMS collections should degrade to an intentional empty state or omit the section; they must not crash a carousel or graph.
- Project/experience keys come from Sanity IDs or stable slugs, never array text.
- Links to live work must distinguish live URL from source URL and remain keyboard accessible.

## High-coupling components

- `ProjectsSlider.tsx` combines presentation, drag physics, autoplay, GSAP pinning, and project navigation. Treat it with [[06 Three.js, Motion, and Animation Performance]].
- `SkillsSectionClient.tsx` owns filtering and feeds `SkillsCapabilityGraph`; category normalization must agree with Sanity values and color helpers.
- `EducationFlowchart.tsx` is an R3F visualization embedded in a content section; it requires a reduced-motion/mobile review.
- `AboutTelemetry.tsx` turns content into telemetry-style cards. Preserve meaning when changing visual density.
- `ContactPanel.tsx`, `BlogFeed.tsx`, and `ExperienceCard.tsx` contain interactive controls that fall under the floating-button and accessibility contracts.

## Adding a section safely

1. Define its content model and query.
2. Create a server section with a stable `id` and correct kicker.
3. Add a client child only for browser-only behavior.
4. Mount it in the intentional order in `PortfolioContent`.
5. Update navigation, chat tool enum/fixed prompts, Orby triggers, and tests if it is navigable.
6. Verify desktop/mobile layout, reduced motion, empty data, and keyboard order.

## Graphify query recipes

```bash
graphify query "PortfolioContent sections projects skills education contact" --context import --context call --budget 3500
graphify affected "ProjectsSlider()" --depth 2
graphify path "SKILLS_QUERY" "SkillsCapabilityGraph()"
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1181 nodes / 2139 edges**
- This subsystem: **21 files / 116 nodes / 376 touching edges**
- Leading communities: `PortfolioContent.tsx` (41), `EducationFlowchart.tsx` (21), `SkillsCapabilityGraph.tsx` (18), `SkillsSectionClient.tsx` (15), `AboutTelemetry.tsx` (11), `lucide-react` (9)

### High-connectivity symbols

- `buildCategoryData()` — `src/components/sections/SkillsCapabilityGraph.tsx:L160` (degree 8)
- `SkillsCapabilityGraph()` — `src/components/sections/SkillsCapabilityGraph.tsx:L398` (degree 6)
- `CertificationsSection()` — `src/components/sections/CertificationsSection.tsx:L28` (degree 5)
- `ExperienceCard()` — `src/components/cards/ExperienceCard.tsx:L30` (degree 5)
- `AboutTelemetry()` — `src/components/AboutTelemetry.tsx:L122` (degree 4)
- `CategoryPill()` — `src/components/sections/SkillsSectionClient.tsx:L85` (degree 4)
- `HeroSection()` — `src/components/sections/HeroSection.tsx:L6` (degree 4)
- `SkillsSectionClient()` — `src/components/sections/SkillsSectionClient.tsx:L322` (degree 4)
- `AboutSection()` — `src/components/sections/AboutSection.tsx:L24` (degree 3)
- `AchievementsSection()` — `src/components/sections/AchievementsSection.tsx:L15` (degree 3)
- `BlogFeed()` — `src/components/BlogFeed.tsx:L102` (degree 3)
- `BlogSection()` — `src/components/sections/BlogSection.tsx:L14` (degree 3)

### Owned source files

- `src/components/sections/AboutSectionClient.tsx`
- `src/components/AboutTelemetry.tsx`
- `src/components/BlogFeed.tsx`
- `src/components/ContactPanel.tsx`
- `src/components/EducationFlowchart.tsx`
- `src/components/PortfolioContent.tsx`
- `src/components/cards/ExperienceCard.tsx`
- `src/components/sections/AboutSection.tsx`
- `src/components/sections/AchievementsSection.tsx`
- `src/components/sections/BlogSection.tsx`
- `src/components/sections/CertificationsSection.tsx`
- `src/components/sections/ContactSection.tsx`
- `src/components/sections/EducationSection.tsx`
- `src/components/sections/ExperienceSection.tsx`
- `src/components/sections/ExperienceSectionClient.tsx`
- `src/components/sections/HeroContent.tsx`
- `src/components/sections/HeroSection.tsx`
- `src/components/sections/ProfileImage.tsx`
- `src/components/sections/SkillsCapabilityGraph.tsx`
- `src/components/sections/SkillsSection.tsx`
- `src/components/sections/SkillsSectionClient.tsx`
<!-- graphify:auto:end -->

## Related notes

- [[00 Portfolio — Codebase Map]]
- [[02 Sanity Content Model and Query Flow]]
- [[06 Three.js, Motion, and Animation Performance]]
- [[07 Design System, Accessibility, and Responsive Behavior]]
