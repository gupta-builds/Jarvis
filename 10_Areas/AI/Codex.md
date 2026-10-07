---
type: evergreen
status: sprout
created: 2026-07-03
updated: 2026-10-07
tags:
  - ai
  - tool-guide
  - codex
notes:
  - "[[Claude OS]]"
  - "[[10_Areas/AI/Claude Code|Claude Code]]"
next: "Verify which Codex skills are actually invoked in real sessions — the source-command-* migration exists on disk but nothing records whether it's used"
---
# Codex
Codex (OpenAI's CLI agent) is now a working second-opinion and implementation surface alongside Claude Code and Cursor. It carries migrated slash-commands on Portfolio and can reach the Jarvis and The Plan vaults through the configured MCP servers. Keep the vault's documented integration route and note which host-specific workflows are intentionally shared versus host-specific.
Setups are snapshotted in `20_Progress/AI/Codex/` (Assisto, OpsPilot, Portfolio, Resq).
## How each project uses it
| Project | Setup | Mechanism |
| --- | --- | --- |
| Assisto | `.agents/` dir + `.codex/config.toml` | The richest Codex setup: `codex-context.md`, a codex-kiro work plan (explicit division of labor with Kiro), backend-phase-0-freeze, mcp-checklist, prompts/, skills/, hooks/. `config.toml` declares one repo-local MCP (`mcp_servers.supabase` → `https://mcp.supabase.com/mcp`) and deliberately stores no credentials, tokens, model overrides, or sandbox overrides. |
| Portfolio | `skills/source-command-*` (9) | Claude Code slash-commands migrated to Codex skills: add-project, build-fix, deploy, e2e, eval, review, sanity-push, ship-check, typecheck. Each reproduces the original command template — `source-command-deploy` runs the full gate in order (`pnpm typegen` → `pnpm typecheck` → …) and stops on any failure before the Vercel push. Same gates, either agent. |
| OpsPilot | `skills/supabase`, `skills/supabase-postgres-best-practices` | Vendor best-practice skills only. |
| Resq | `skills/supabase` | Same pattern. |
## The two patterns worth keeping
1. **Repo-local, credential-free config.** Assisto's `config.toml` opens with the rule: no bearer tokens, no model overrides, no global MCPs in the repo. GitHub access goes through the installed GitHub app, "keep GitHub writes explicitly user-scoped." This is the opposite of the Jarvis `.kiro/mcp.json` incident (exposed key, removed in `b8604279`) — Codex got it right first.
2. **Command migration, not command duplication.** The Portfolio `source-command-*` skills are ports of existing Claude commands, named to say so. When the underlying gate changes (say, a new typecheck step), the naming makes the sync target obvious. Contrast with the Cursor/Kiro steering files that silently restate vault rules.
## When to use Codex vs the others
- A deploy/check gate on Portfolio when Claude Code is mid-task on something else → Codex runs the same migrated gate.
- Cross-checking an architectural decision with a different model family → Codex, reading the same `.agents/` or `.claude/` canon.
- Anything vault-related, multi-file agentic work, or where skills/hooks/MCP depth matters → [[10_Areas/AI/Claude Code|Claude Code]]. Codex's setup here is skills-only; it has no hook layer on any project.
## Gaps
1. No usage signal. The skills exist on disk but no session log or history in the dumps shows Codex actually being driven. Before investing further, verify it's used at all — dead setups cost sync effort.
2. No hook layer anywhere — Codex sessions run unguarded on repos where Kiro and Cursor enforce canon gates. If Codex keeps write access on Assisto/Resq, it needs at least the secret-hygiene equivalent.
3. The codex-kiro work plan (`.agents/codex-kiro-work-plan.md`) is the only division-of-labor doc; Portfolio has the migrated commands but no note saying when to prefer Codex over Claude Code for the same gate.

## Codex tool surface and import decision — 2026-09-10

Codex is now a working Jarvis client. The older statement above that Codex has no Jarvis integration is stale: the live Codex configuration reaches the Jarvis and The Plan MCP servers.

### Active MCP servers

The global Codex configuration declares ten MCP servers: `sanity`, `clerk`, `obsidian`, `pencil`, `github`, `graphify`, `jarvis`, `jarvis-fs`, `the-plan`, and `the-plan-fs`.

Verified in this session: Jarvis vault tools, Jarvis filesystem tools, The Plan vault and filesystem tools, Graphify graph statistics, and Clerk SDK snippets. GitHub is configured but its current credential was rejected. Sanity and Pencil are configured in `config.toml`, but their tool namespaces were not exposed in this session. The generic Obsidian MCP is configured; Jarvis-specific work should continue through `mcp__jarvis__*` because that is the vault's documented integration route. A configured server is not the same as a healthy server; recheck the failed or unavailable surfaces before relying on them.

### Other Codex tools

The reusable tool surface also includes shell execution, scoped file editing, local image inspection, image generation, web access, goal tracking, and connector-backed app tools when a connector is available. These are capabilities of the Codex runtime rather than imported skills. The repository-local layer adds eight agents, two advisory hooks, and ten internship workflow skills under `.agents/skills`. The Claude and Cursor project files remain as source-of-truth adapters for their respective hosts.

### Import cleanup

The global `~/.agents/skills/gbrain` tree was a full 386 MB gbrain repository with a Codex plugin manifest and an unconfigured gbrain MCP definition; it was not an installed Codex plugin. The global `~/.agents/skills/gstack` tree was a full 1.5 GB multi-host repository without a Codex plugin entry. Both trees, plus 55 empty gstack shim directories, were moved to `~/.codex-archive/2026-09-10/` so they no longer flood Codex skill discovery and can be restored if needed.

The retained setup is the internship-research-loop project skills and agents, the Jarvis/The Plan/Graphify integration, the small Obsidian and second-brain operating skills, and the normal Codex runtime tools. Mass gbrain/gstack skill packs are not part of the four-month working surface. The installed gbrain CLI remains separate; its pending migrations and upgrade should be handled deliberately rather than as part of this import cleanup.

### Marketplace

Use OpenAI's curated plugin marketplace: [https://github.com/openai/plugins](https://github.com/openai/plugins). In Codex, run `/plugins`, open `Marketplaces`, choose `Add marketplace`, paste the link, and confirm. The local catalog currently shows GitHub installed and enabled; install other plugins only when a concrete workflow needs them. If the UI requires a Git URL, use `https://github.com/openai/plugins.git`.

## Two-profile operating model — 2026-10-07

Codex uses two deliberate modes, not a default strong model for every prompt.

| Profile | Model and effort | Use it for |
| --- | --- | --- |
| `base` | `gpt-6-luna` at `medium` | The routine 80 percent: bounded PKM maintenance, retrieval, tagging, explicit note transforms, small code edits, tests, triage, and well-specified coursework tasks. The prompt must state inputs, scope, constraints, acceptance criteria, and verification. |
| `deep` | `gpt-6.1-sol` at `high` | The consequential 20 percent: architecture, hard debugging, review, cross-source synthesis, important technical decisions, and difficult coursework. |

The user chooses the profile at session start: `codex --profile base` or `codex --profile deep`. Base is the global default. A task that becomes cross-cutting, ambiguous, or hard to verify should stop and request a `deep` session rather than silently spending more model capacity.

Both profiles are defined in the Windows Codex home, `C:\Users\anant\.codex\{base,deep}.config.toml`. The global `C:\Users\anant\.codex\AGENTS.md` is read before each session and enforces this routing, evidence-first execution, complete grammar, and no em dashes. Jarvis `AGENTS.md` carries the vault-local mirror.
