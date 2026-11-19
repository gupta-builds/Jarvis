---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, components, map]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "AppSidebar.tsx # App sidebar wrapper" | File is `src/components/app-sidebar.tsx` (exports `AppSidebar`; imported at `src/app/(portfolio)/layout.tsx:2`) |
> | "EducationEntry.tsx # Single education entry"; "ContactForm.tsx # Contact form" | Neither file exists in `src/components/`; no `EducationEntry` or `ContactForm` symbol in `src` (rg). `ContactForm.tsx` is also absent from `git ls-tree 89cd2c0e` |
> | "Providers.tsx # ClerkProvider + SidebarProvider" | `Providers` = `ThemeProvider` + `ReactLenis` (`src/components/Providers.tsx:65-81`). `ClerkProvider` is `src/app/layout.tsx:40`; `SidebarProvider` is `src/app/(portfolio)/layout.tsx:51` |
> | "cards/ # Reusable card components"; "ui/ # shadcn + custom primitives" | `cards/` holds only `ExperienceCard.tsx`. `ui/` holds `comet-card`, `layout-text-flip`, `sheet`, `sidebar`, `space-rail`, `split-heading` (+ `__tests__`) — no `card.tsx`, `spinner.tsx`, `dropdown-menu.tsx`, `chart.tsx` |
> | Tree / "Quick Reference by Community" (`useIridescentEffect` in Community 3) | `useIridescentEffect` is a hook in `src/hooks/useIridescentEffect.ts`, not under `src/components/` |
> | Tree lists only the files shown | Present in repo but missing from the tree: `SidebarAwareContent.tsx`, `TelemetryDetail.tsx`, `chat/ChatErrorBoundary.tsx`, `lab/ProofPack.tsx`, `lab/cards/{ExperienceEvidenceCard,ProjectEvidenceCard,ToolResultRenderer}.tsx`, `three/{HeaderLogo,HeaderLogoCanvas,HeaderLogoFallback}.tsx`, `three/liquidMetalMaterial.ts`, `orby/{OrbyModel,OrbySpeechCloud,useOrbyIdleCommentary,useScrollProgress,useTypedText}`, `sections/{AboutSectionClient,ExperienceSectionClient,SkillsCapabilityGraph}.tsx` |

# Component Map

> [[../INDEX|← Back to Index]]

## Tree

```
src/components/
│
├── PortfolioContent.tsx         # Server — section orchestrator (Community 7)
├── HeaderScrolling.tsx          # Sticky header + nav (Community 9)
├── Footer.tsx                   # Footer (Community 7)
├── HeroTerminal.tsx             # Animated terminal (Community 12)
├── AboutTelemetry.tsx           # About section stats (Community 12)
├── BlogFeed.tsx                 # Blog feed (Community 34)
├── EducationFlowchart.tsx       # Education flowchart (Community 23)
├── EducationEntry.tsx           # Single education entry (Community 13)
├── ContactPanel.tsx             # Contact info panel (Community 3)
├── ContactForm.tsx              # Contact form (Community 1)
├── OrbyLoader.tsx               # Loading state for Orby
├── AppSidebar.tsx               # App sidebar wrapper (Community 5)
├── SidebarToggle.tsx            # Sidebar toggle button (Community 67)
├── Providers.tsx                # ClerkProvider + SidebarProvider (Community 5)
├── ThemeProvider.tsx            # next-themes (Community 5)
├── ChatTokenInit.tsx            # HMAC token init on mount (Community 5)
│
├── sections/                    # ← Page section components
├── three/                       # ← Three.js / R3F components
├── lab/                         # ← Portfolio Lab + Chat UI
├── orby/                        # ← Orby companion
├── cards/                       # ← Reusable card components
├── ui/                          # ← shadcn + custom primitives
└── __tests__/                   # ← Vitest test files
```

## Section → File Mapping

| Section | File | Community |
|---------|------|-----------|
| Hero | `sections/HeroSection.tsx` | 15 |
| Hero Content | `sections/HeroContent.tsx` | 3 |
| Profile Image | `sections/ProfileImage.tsx` | 3 |
| About | `sections/AboutSection.tsx` | 12 |
| Experience | `sections/ExperienceSection.tsx` | 29 |
| Projects | `three/ProjectsSlider.tsx` | 3 |
| Skills | `sections/SkillsSection.tsx` | 7 |
| Skills (client) | `sections/SkillsSectionClient.tsx` | 3 |
| Education | `sections/EducationSection.tsx` | 23 |
| Certifications | `sections/CertificationsSection.tsx` | 13 |
| Achievements | `sections/AchievementsSection.tsx` | 7 |
| Blog | `sections/BlogSection.tsx` | 34 |
| Contact | `sections/ContactSection.tsx` | 7 |

## Quick Reference by Community

| Community | Components |
|-----------|-----------|
| 3 | HeroContent, ProfileImage, SkillsSectionClient, ProjectsSlider, ContactPanel, useIridescentEffect |
| 4 | PortfolioLab, ChatThread, ChatInputBar, PersonaSelector, SuggestedChips, PowerPromptBlock, EvidenceCard |
| 7 | PortfolioContent, SkillsSection, AchievementsSection, Footer, ContactSection |
| 9 | HeaderScrolling, NavLink, CORE_NAV |
| 12 | AboutSection, AboutTelemetry, HeroTerminal, TelemetryCard |
| 13 | CertificationsSection, CometCard, EducationEntry |
| 22 | ObsidianBackgroundCanvas (Three.js canvas) |
| 23 | EducationFlowchart, EducationSection |
| 29 | ExperienceSection, ExperienceCard |
| 32 | Orby, OrbyArrow |
| 34 | BlogSection, BlogFeed, MagneticButton |
| 37 | PanelOrby, OrbyCanvas |
| 67 | SidebarToggle, Sidebar, useSidebar |

## See Also
- [[01-page-sections|Page Sections]]
- [[02-lab-chat-ui|Lab / Chat UI]]
- [[03-orby-companion|Orby Companion]]
- [[04-three-js|Three.js / R3F]]
- [[05-ui-primitives|UI Primitives]]
