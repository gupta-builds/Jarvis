---
type: concept
status: active
created: 2026-11-20
tags:
  - portfolio
  - cursor
related_progress:
  - "[[00 - Claude Code Build Kit — Index]]"
  - "[[ui-fixes-index]]"
---
# Cursor Agent System
Canonical executor for portfolio v2 is Cursor (`.cursor/`), not Claude Code. This note is the hierarchy + layout map. Design intent still lives in the vault; the repo is source of truth.

Related: [[00 - Claude Code Build Kit — Index]] (Claude kit) and [[ui-fixes-index]] (UI specs).

## Hierarchy
| Tier | Agent | Owns |
|---|---|---|
| Governing | `conductor` | Main chat. Splits work by spec map, one governing + one low-level, names skills and vault note, runs verify. Never edits `src/`. |
| Governing | `guardian` (readonly) | Golden files, smallest diff, ledger check before golden edits. Reviews after a low-level agent finishes. |
| Governing | `brand` | `.cosmic-card` / `.float-btn` / kickers / tokens / motion / readability. Reads `frontend/ui-fixes-design`. |
| Governing | `safety` (readonly) | Auth, `chat_token`, Turnstile, rate limits, CSP, Sanity contracts, secrets. Owns chat-runtime contracts; `orby-lab` implements. |
| Governing | `recorder` | Ledger, docs, **only writer to Jarvis** via jarvis MCP. |
| Low | `orby-lab` | Lab UI, Orby (11 states), idle commentary, chat route: router cooldown, sanitizer, 16 fixed prompts, stream protocol. |
| Low | `next-app` | Layouts, `src/proxy.ts`, SEO/AEO (metadata, robots, sitemap, JSON-LD, `llms.txt`, OG). |
| Low | `portfolio-polish` | Section layout + GSAP pin (About, Projects, Education), Lab textarea, footer/logo. |
| Low | `three-r3f` | Canvas constants, `background:mode` consumer (add `about-pin`), click scatter, hyperspace, Education blobs. |
| Low | `portfolio-cms` | Schema/query (`skill.color`, `project.summary`, optional `coverImage`, drop `visibility`, `education.logo`). No `localContent`. |
| Low | `tests-evals` | Vitest, Playwright, promptfoo (`evals/*.yaml`). |
| Low | `typescript-biome` | Types + Biome. No ESLint. |
| Low | `a11y-keyboard` | Labels, focus, keyboard, reduced motion, contrast. |
| Low | `portfolio-verify` | lint, typecheck, tests, build, QA matrix. |
| Low | `local-git` | Commit on request, no PRs, never stash. |

Nesting: Conductor launches governing agents; governing agents launch low-level agents; **low-level agents never delegate**.

## Official Cursor layout
- Subagents: `.cursor/agents/<name>.md`. Frontmatter only `name`, `description`, `model` (default inherit), `readonly`, `is_background`.
- Skills: `.cursor/skills/<name>/SKILL.md` — `name` equals folder name.
- Rules: `.cursor/rules/*.mdc` (`description`, `globs`, `alwaysApply`).
- Hooks: `.cursor/hooks.json` version 1. Exit 2 blocks; other non-zero fail open unless `failClosed`.
- MCP: `.cursor/mcp.json` with `${env:NAME}` (not Claude `${NAME}`).
- Commands: `.cursor/commands/*.md`, input is the prose after the command name.

## Source-note map
`$P` = `20_Progress/Projects/CS/Portfolio`. Paths under `$P/frontend/` unless noted.

| Area | Vault spec | Repo | State 2026-11-20 | Owner |
|---|---|---|---|---|
| Hero + background | `ui-fix-01-hero-background` | `HeroContent`, `ProfileImage`, `ObsidianBackgroundCanvas` | camera-bias uncommitted | `three-r3f` |
| About pin + 2 cards | `ui-fix-02`, `ui-fix-03` | `AboutSection*`, new `about-pin.ts` | pin not built; no `about-pin` consumer | polish + three |
| Projects | `ui-fix-04` | `ProjectsSlider`, `projects-pin.ts` | built, uncommitted | `portfolio-polish` |
| Education | `ui-fix-05` | `EducationFlowchart` | loop-restart snap open | `three-r3f` |
| Logo + footer | `ui-fix-06` | `logoGlyphPath`, `Footer` | logo 32px vs 1em | `portfolio-polish` |
| Lab input | `ui-fix-07` | `ChatInputBar` | vertical centering open | `orby-lab` |
| Carry-forward | `ui-fix-08` | Skills, Experience, Orby, dark toggle | partial | per area |
| Chat runtime | `$P/nextgen-chatbot/00-12` | `src/lib/chat-*.ts`, `model-router.ts`, `api/chat` | shipped; cooldown failover | `orby-lab` + `safety` |
| SEO/AEO | `$P/AEO & SEO/00-02` | `robots.ts`, `sitemap.ts`, `privacy` | Phase 1 uncommitted; Phase 2 not built | `next-app` |
| Sanity | `$P/data/*`, plan `sanity_render_alignment` | `src/sanity/**` | re-check todos before acting | `portfolio-cms` |
| Security | `$P/security/*` | `proxy.ts`, `next.config.ts` | many dashboard items | `safety` |

Newest-wins: 2026-11-19 callouts, then `_UI Fixes`, then `ui-fix-01..08` and the Sep trio, then July prompts.

## Human gates (do not attempt in agent sessions)
1. `.gitignore` hides `.cursor/`. User un-ignores selected paths to share the system.
2. Approve three `AGENTS.md` golden-file fixes (CometCard variants, `@react-spring/web`, Claude copy drift).
3. Check `.codex/config.toml` history on public `gupta-builds/Portfolio`; rotate keys if real.
4. Dashboards: Cerebras, Sanity CORS, Cloudflare, Clerk production, Vercel env, GSC/Bing.
5. Decisions: GPTBot/ClaudeBot, `llms.txt` source, www vs apex, dark toggle only after a light-token audit.
