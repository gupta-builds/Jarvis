---
type: runbook
status: active
repository: gupta-builds/portfolio
canonical: docs/knowledge/portfolio/10 Deployment, Preview, and Operational Runbook.md
sync: managed
tags: [portfolio, deployment, operations, graphify, obsidian]
---

# 10 Deployment, Preview, and Operational Runbook

## Purpose

This runbook covers build/deploy boundaries and the curated Portfolio knowledge sync. The repository is the canonical source for these notes; Jarvis is a managed mirror with live Graphify evidence.

## Local commands

```bash
pnpm dev
pnpm lint
pnpm typecheck
pnpm test
pnpm build
pnpm eval
```

Use pnpm only. Tailwind is CSS-first, Biome is the linter/formatter, and the project uses App Router.

## Environment groups

- Public Sanity configuration selects project, dataset, and API version.
- `SANITY_API_TOKEN` enables live-content subscriptions and authenticated server reads.
- Clerk variables support authentication surfaces and browser session plumbing.
- `CHAT_TOKEN_SECRET` signs the short-lived chat cookie.
- Cerebras, Groq, and Mistral keys power the provider chain.
- Upstash Redis credentials power limits, cache, session budgets, and cooldowns.
- Public base/site URL and Vercel URL feed origin validation.

Never print or copy secret values into notes, logs, generated graphs, or client bundles.

## Build and release

`pnpm build` extracts the current Sanity schema, regenerates required-field query types, runs TypeScript, then builds Next.js. A production release should also pass deterministic tests, prompt evals, and the security review. Preview deployments must be included in origin checks via platform-provided `VERCEL_URL`, not a wildcard CSP/origin bypass.

## Curated Graphify → Jarvis sync

The Internship mirror runs `graphify update` followed by `graphify export obsidian` inside post-commit/post-checkout/post-merge hooks. That updates on Git events, not on every shell command. The Portfolio intentionally replaces the raw exporter with a curated flow:

```text
docs/knowledge/portfolio/*.md       canonical rich notes, tracked
portfolio-knowledge.json           stable ownership manifest, tracked
graphify update .                   deterministic AST refresh
graphify-out/codebase-memory/       exhaustive generated file + node memory
  files/                            one dossier per repository file
  graphify-nodes/                   native Graphify Obsidian export
  FILE_INDEX.md                     complete file inventory
  COMMUNITY_INDEX.md                clustered file map
  REVIEW_QUEUE.md                   deterministic review candidates
graphify-out/portfolio-notes/       derived notes with live graph blocks, ignored
60_Claude/40_Project_Briefs/Portfolio/  atomic Jarvis mirror
```

Run it manually:

```bash
pnpm knowledge:check
pnpm knowledge:atlas
pnpm knowledge:sync:dry
pnpm knowledge:sync
pnpm knowledge:hooks
```

`knowledge:atlas` generates one file dossier for every present tracked/unignored file, file and community indexes, a machine-readable relationship atlas, an automatic review queue, and Graphify’s native node/community Obsidian export.

`knowledge:sync` rebuilds the graph, rebuilds and validates that deep atlas, validates curated note names/links/ownership, injects subsystem-specific node/community/source snapshots into derived copies, and atomically writes only the curated managed filenames into Jarvis. `.portfolio-knowledge-manifest.json` records ownership hashes. The sync refuses to overwrite a same-named Jarvis note it does not own and never automatically deletes stale or foreign notes.

The generated bulk remains ignored because committing thousands of volatile notes would bury real source changes. The tracked generators and canonical notes are the portable source of truth: on a new laptop, install Graphify and run `pnpm knowledge:sync` to reproduce the complete memory corpus.

The hook installer adds idempotent managed blocks to post-commit, post-checkout, and post-merge. Commit/checkout hooks wait for Graphify’s official background rebuild to reach the new commit, then mirror notes. Post-merge performs a full deterministic update because Graphify’s official workflow requires an update after pull/merge. Logs land in `~/.cache/graphify-portfolio-knowledge-sync.log`.

Set `JARVIS_VAULT_ROOT` when the vault is not at the detected WSL or sibling-checkout path. Use `GRAPHIFY_PYTHON` to pin a different Graphify interpreter.

## Semantic refresh

Git hooks update code structure without LLM cost. When documentation meaning changes, run the Graphify semantic update explicitly with the configured backend, then refresh community labels if needed. Do not put paid semantic extraction into every commit hook.

## Sync recovery

1. Run `pnpm knowledge:check`.
2. Inspect `~/.cache/graphify-portfolio-knowledge-sync.log`.
3. Confirm `graphify-out/graph.json` exists and its `built_at_commit` is plausible.
4. Run `graphify diagnose multigraph --json` and `graphify benchmark` when graph health is suspect.
5. Compare the 11 canonical notes, 11 staged notes, 11 Jarvis notes, and ownership manifest.
6. Run `pnpm knowledge:check`; it verifies every file dossier against the current source hash, checks all generated file links, and reconciles the native Graphify ownership manifest.
7. Resolve collisions manually; never delete an entire vault folder as a repair tactic.
8. Re-run `pnpm knowledge:hooks` after reinstalling/upgrading Graphify because official hook paths may change.

## Graphify query recipes

```bash
graphify query "deployment build preview environment workflows scripts" --budget 3000
graphify diagnose multigraph --json
graphify benchmark
graphify check-update .
```

<!-- graphify:auto:start -->
## Live Graphify Snapshot

> Generated during `pnpm knowledge:sync`. Edit the surrounding note, not this block.

- Graph commit: `5f29675591f06f839442539f223ac151f78d9035`
- Whole graph: **1147 nodes / 2163 edges**
- This subsystem: **12 files / 229 nodes / 571 touching edges**
- Leading communities: `dependencies` (36), `portfolio-knowledge-sync.mjs` (35), `build-codebase-atlas.mjs` (34), `package.json` (27), `devDependencies` (21), `scripts` (16)

### High-connectivity symbols

- `package.json` — `package.json:L1` (degree 62)
- `react` — `package.json:L57` (degree 52)
- `vitest` — `package.json:L86` (degree 43)
- `build-codebase-atlas.mjs` — `scripts/build-codebase-atlas.mjs:L1` (degree 39)
- `dependencies` — `package.json:L29` (degree 36)
- `portfolio-knowledge-sync.mjs` — `scripts/portfolio-knowledge-sync.mjs:L1` (degree 33)
- `next` — `package.json:L54` (degree 27)
- `devDependencies` — `package.json:L66` (degree 21)
- `@testing-library/react` — `package.json:L71` (degree 19)
- `main()` — `scripts/build-codebase-atlas.mjs:L413` (degree 19)
- `lucide-react` — `package.json:L52` (degree 18)
- `motion` — `package.json:L53` (degree 16)

### Owned source files

- `.github/dependabot.yml`
- `.github/workflows/semgrep.yml`
- `scripts/build-codebase-atlas.mjs`
- `scripts/install-portfolio-knowledge-hooks.mjs`
- `scripts/portfolio-knowledge-sync.mjs`
- `.github/workflows/eval-gate.yml`
- `README.md`
- `next.config.ts`
- `package.json`
- `sanity.cli.ts`
- `scripts/patch-sanity-content.mjs`
- `scripts/set-preview-env.mjs`
<!-- graphify:auto:end -->

## Related notes

- [[00 Portfolio — Codebase Map]]
- [[05 API Security, Auth, Rate Limits, and Degraded Mode]]
- [[09 Testing, Prompt Evals, and Quality Gates]]
