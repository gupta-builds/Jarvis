---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, nextjs, app-router, routes]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "layout.tsx — Root layout — fonts, Providers, ChatTokenInit" (Route Tree); "`RootLayout()` — wraps with `Providers`, `ThemeProvider`, `ChatTokenInit`" | Root layout renders `ClerkProvider` → `Providers` + Vercel `Analytics` (`src/app/layout.tsx:40,45,46`). `ChatTokenInit` is mounted in `src/app/(portfolio)/layout.tsx:58` |
> | "`Providers()` — ClerkProvider + SidebarProvider" | `Providers` = `ThemeProvider` + `ReactLenis` (`src/components/Providers.tsx:65-81`). `ClerkProvider` is in `layout.tsx:40`; `SidebarProvider` is in `(portfolio)/layout.tsx:51` |
> | "Portfolio layout — ObsidianBackground, AppSidebar, HeaderScrolling" | Layout renders `SidebarProvider`, `AppSidebar side="right"`, `SidebarToggle`, `OrbyLoader`, `ChatTokenInit`, `SanityLive` and `generateMetadata` (`(portfolio)/layout.tsx:11,51-59`). `HeaderScrolling` and `ObsidianBackground` are rendered by `PortfolioContent` (`src/components/PortfolioContent.tsx:40-41`) |
> | "Loads `ObsidianBackground` via `next/dynamic` (SSR: false)" (Portfolio Layout) | The `dynamic(..., { ssr: false })` lives in the wrapper `src/components/three/ObsidianBackground.tsx:5-9` (default export), used from `PortfolioContent.tsx:41` |
> | "Home() … No data fetching directly … Wraps in `<Suspense>` for streaming" | `Home()` awaits `sanityFetch` for `PROFILE_QUERY` and `SITE_SETTINGS_QUERY` (`page.tsx:95-96`), emits JSON-LD (`:106`); there is no `Suspense` in `page.tsx` |
> | "`PortfolioContent()` … Calls `sanityFetch()` for every section query in parallel" | Only `NAVIGATION_QUERY` + `PROJECTS_QUERY` (`PortfolioContent.tsx:25-26`); sections fetch themselves (e.g. `HeroSection.tsx:7`, `AboutSection.tsx:27-29`) |
> | "`submitContactForm()` — `src/app/actions/submit-contact-form.ts` … Writes to Sanity via `getServerClient()`" | File does not exist; `src/app/actions/` is empty; not present in `git ls-tree 89cd2c0e`; no `submitContactForm` in `src` |
> | "Two proxy files exist — only one is active: `proxy.ts` (root) … `src/proxy.ts`"; "`isPublicRoute` allows all portfolio routes" | Only `src/proxy.ts` exists; it defines `isStudioRoute` only (`:5`) — no `isPublicRoute`. `proxy()` returns `NextResponse.next()` for non-studio paths (`:24-26`) |
> | "zero metadata exports, no `sitemap.ts`, no `robots.ts`, no OpenGraph tags anywhere" (Agent-Readable Surface) | Now present: root `metadata` (`src/app/layout.tsx:24`), `generateMetadata` with canonical/openGraph/twitter (`(portfolio)/layout.tsx:11,26-36`), `src/app/privacy/page.tsx:4`, `src/app/sitemap.ts`, `src/app/robots.ts`, JSON-LD `<script>` (`page.tsx:106`) |
> | API Routes list: `chat`, `chat-token`, `draft-mode/{enable,disable}` only; no `/privacy` | Also exist: `api/orby-comment`, `api/health`, `api/error-report`, `api/revalidate`, route `/privacy`, `icon.svg`; no `error.tsx` / `loading.tsx` / `not-found.tsx` anywhere in `src/app` |

# Next.js App Router

> [[../INDEX|← Back to Index]] · [[00-overview|Architecture Overview]]

## Route Tree

```
src/app/
├── layout.tsx                          # Root layout — fonts, Providers, ChatTokenInit
├── (portfolio)/
│   ├── layout.tsx                      # Portfolio layout — ObsidianBackground, AppSidebar, HeaderScrolling
│   └── page.tsx                        # Home() — calls sanityFetch, renders PortfolioContent
├── studio/
│   ├── layout.tsx                      # Studio layout — Clerk-guarded
│   └── [[...tool]]/
│       ├── page.tsx                    # Studio page — server entry
│       └── StudioClient.tsx            # Client-side Sanity Studio render
├── sign-in/[[...sign-in]]/page.tsx     # Clerk sign-in
├── sign-up/[[...sign-up]]/page.tsx     # Clerk sign-up
└── api/
    ├── chat/
    │   └── route.ts                    # POST — Orby chat endpoint
    ├── chat-token/
    │   └── route.ts                    # Issues HMAC session cookie
    └── draft-mode/
        ├── enable/route.ts             # Sanity draft mode on
        └── disable/route.ts            # Sanity draft mode off
```

## Page Components

### Home() — `src/app/(portfolio)/page.tsx`
- Server component
- No data fetching directly — delegates to `PortfolioContent()`
- Wraps in `<Suspense>` for streaming

### PortfolioContent() — `src/components/PortfolioContent.tsx`
- **Community 7** — the portfolio core
- Server component that orchestrates all section fetches
- Calls `sanityFetch()` for every section query in parallel
- Renders: HeroSection → AboutSection → ExperienceSection → ProjectsSlider → SkillsSection → EducationSection → CertificationsSection → AchievementsSection → BlogSection → ContactSection → Footer

## Root Layout — `src/app/layout.tsx`
**Community 5** nodes:
- `lora` / `ubuntu` — Google font imports
- `RootLayout()` — wraps with `Providers`, `ThemeProvider`, `ChatTokenInit`
- `Providers()` — ClerkProvider + SidebarProvider
- `ChatTokenInit` — client component that fetches HMAC cookie on mount
- `ThemeProvider()` — next-themes dark mode

## Portfolio Layout — `src/app/(portfolio)/layout.tsx`
- Loads `ObsidianBackground` via `next/dynamic` (SSR: false)
- Renders `AppSidebar` + `HeaderScrolling`
- `layout.tsx` uses `SidebarProvider` context

## API Routes

### POST /api/chat — `src/app/api/chat/route.ts`
See [[../chatbot/01-api-route|Chatbot API Route]] for full detail.
Key exports: `redis`, `burstLimit`, `dailyLimit`, `isAllowedOrigin()`, `POST()`

### POST /api/chat-token — `src/app/api/chat-token/route.ts`
- Issues a short-lived HMAC-signed JWT in a cookie
- Cookie is `httpOnly`, `sameSite: strict`
- Read by the chat route to verify origin

## Server Actions

### submitContactForm() — `src/app/actions/submit-contact-form.ts`
- Server Action for the contact form
- Writes to Sanity via `getServerClient()`
- Part of Community 1 (chatbot backend cluster — shares server-client infrastructure)

## Proxy / Middleware

Two proxy files exist — only one is active:
- `proxy.ts` (root) — Community 48, contains `clerk`, `isPublicRoute`, `event`, `config`, `proxy()`
- `src/proxy.ts` — Community 57, contains `isPublicRoute`, `isStudioRoute`, `config`

`isPublicRoute` allows all portfolio routes. `isStudioRoute` gates `/studio/*` behind Clerk auth.

## Agent-Readable Surface — Currently Empty
The route tree above has **zero metadata exports, no `sitemap.ts`, no `robots.ts`, no OpenGraph tags anywhere** — confirmed by grep across this whole `architecture/` folder; the only hit for "metadata" is an unrelated Sanity image-metadata type. No route in `src/app/` calls Next.js's `metadata` API. This is the known-empty state the [[AEO & SEO/00 - Agent-Ready Infrastructure Build Plan|AEO & SEO build plan]] fills in — recorded here as fact, not yet built.

## See Also
- [[02-sanity-cms|Sanity CMS]]
- [[03-auth-clerk|Auth (Clerk)]]
- [[../chatbot/01-api-route|Chatbot API Route]]
- [[AEO & SEO/00 - Agent-Ready Infrastructure Build Plan|AEO & SEO Build Plan]]
