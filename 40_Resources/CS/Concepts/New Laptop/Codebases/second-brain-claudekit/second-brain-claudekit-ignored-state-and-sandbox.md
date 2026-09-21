---
created: 2026-09-21
type: project
status: active
tags:
  - laptop
  - sandbox
  - git
  - codebase-sync
related:
  - "[[second-brain-claudekit-new-laptop-directive]]"
  - "[[New Laptop Setup]]"
  - "[[Cross-Laptop Sync - Jarvis Wrap-Up]]"
---

# second-brain-claudekit — Ignored State and Sandbox

## One-Line Answer

The ignored state is not a hidden dependency of ClaudeKit. Rebuild the core repository first. Recreate machine-local secrets deliberately. Recreate sandbox clones only as a separate qualification phase; never copy their installed dependency trees or their nested `.git/` folders into the parent repository.

## Classification of current ignored material

| Material | New-laptop action |
|---|---|
| `.claude/settings.local.json` | Recreate only if the new laptop needs local overrides. Do not copy it. |
| `60_Claude/Sessions/_today-edits.md` | Do not migrate; it is a rolling generated log. |
| `.claude/scheduled_tasks.lock` | Do not migrate; it is transient lock state. |
| `sandbox/` | Recreate from upstream clones only. |
| `skills/.claude_wsl/gbrain/` and `skills/.claude_wsl/gstack/` | Do not copy; these are ignored global-tool mirrors and must be installed separately if still wanted. |
| `__pycache__/`, `.venv/`, `node_modules/`, build output, caches | Rebuild from each tool's own dependency manifest. |
| `.env`, `.mcp.json`, credentials, tokens, SSH keys | Recreate fresh per machine. Never copy values. |

## Sandbox boundary

The core codebase does not depend on any sandbox clone. Do not block the ClaudeKit installation on the sandbox.

The current sandbox contains 34 shallow external clones. The inventory below is the exact observed branch and commit state on 2026-09-21:

| Directory | Branch | Observed commit |
|---|---|---|
| Agent-Reach | main | `1221ecd` |
| CL4R1T4S | main | `75492f5` |
| OpenBB | develop | `3e071fc` |
| TradingAgents | main | `a33fd4c` |
| adx | master | `1959708` |
| agency-agents | main | `ebe9c99` |
| agent-skill-simplified-technical-english | main | `498e63a` |
| agent-skills | main | `7829ffd` |
| agentic-inbox | main | `48039ab` |
| agentscope | main | `807390b` |
| ai-job-search | master | `fd89eac` |
| andrej-karpathy-skills | main | `2c60614` |
| autoresearch | master | `228791f` |
| claude-code-best-practice | main | `e30c04a` |
| claude-context | master | `6fc318b` |
| claude-mem | main | `4702c33` |
| claude-skills-llm-council | main | `55ee36e` |
| cpr-compress-preserve-resume | main | `bbc9c1f` |
| ecc | main | `e4e4163` plus an uncommitted `yarn.lock` change |
| gbrain | master | `913d2d7`, 305 commits behind upstream |
| graphify | v8 | `ecfcd16` |
| gsd-core | next | `e705652` |
| gstack | main | `a325940` |
| hiring-agent | main | `70fd3ea` |
| humanizer | main | `e2e92e7` |
| last30days-skill | main | `0188da7` |
| llm-council | master | `92e1fcc` |
| memsearch | main | `b734a14` |
| obsidian-mind | main | `b84464b` |
| obsidian-second-brain | main | `ec7a0e8` |
| promptfoo | main | `ac8971f` |
| skills | main | `2ab9580` |
| spec-kit | main | `4803a22` |
| system-prompts-and-models-of-ai-tools | main | `2054f58` |

## Recreate sandbox clones only after the core install

```bash
cd "$HOME/projects/ai/claude/second-brain-claudekit"
mkdir -p sandbox
```

Use the upstream URLs recorded in the existing sandbox README on the old laptop. For a normal clone:

```bash
git clone --depth 1 --branch <branch> <upstream-url> sandbox/<directory>
git -C sandbox/<directory> rev-parse HEAD
```

For an exact historical snapshot, fetch and detach the observed commit after cloning:

```bash
git -C sandbox/<directory> fetch --depth=1 origin <observed-sha>
git -C sandbox/<directory> checkout --detach <observed-sha>
```

The exact upstream URLs are:

```text
Agent-Reach       https://github.com/Panniantong/Agent-Reach.git
CL4R1T4S          https://github.com/elder-plinius/CL4R1T4S.git
OpenBB             https://github.com/OpenBB-finance/OpenBB.git
TradingAgents      https://github.com/TauricResearch/TradingAgents.git
adx                https://github.com/ahnafyy/adx.git
agency-agents      https://github.com/msitarzewski/agency-agents.git
agent-skill-simplified-technical-english https://github.com/Cyberger877241/agent-skill-simplified-technical-english.git
agent-skills       https://github.com/addyosmani/agent-skills.git
agentic-inbox      https://github.com/cloudflare/agentic-inbox.git
agentscope         https://github.com/agentscope-ai/agentscope.git
ai-job-search      https://github.com/MadsLorentzen/ai-job-search.git
andrej-karpathy-skills https://github.com/multica-ai/andrej-karpathy-skills.git
autoresearch       https://github.com/karpathy/autoresearch.git
claude-code-best-practice https://github.com/shanraisshan/claude-code-best-practice.git
claude-context     https://github.com/zilliztech/claude-context.git
claude-mem         https://github.com/thedotmack/claude-mem.git
claude-skills-llm-council https://github.com/aiwithremy/claude-skills-llm-council.git
cpr-compress-preserve-resume https://github.com/EliaAlberti/cpr-compress-preserve-resume.git
ecc                https://github.com/affaan-m/everything-claude-code.git
gbrain             https://github.com/garrytan/gbrain.git
graphify           https://github.com/safishamsi/graphify.git
gsd-core           https://github.com/open-gsd/gsd-core.git
gstack             https://github.com/garrytan/gstack.git
hiring-agent       https://github.com/interviewstreet/hiring-agent.git
humanizer          https://github.com/blader/humanizer.git
last30days-skill   https://github.com/mvanhorn/last30days-skill.git
llm-council        https://github.com/karpathy/llm-council.git
memsearch          https://github.com/zilliztech/memsearch.git
obsidian-mind      https://github.com/breferrari/obsidian-mind.git
obsidian-second-brain https://github.com/eugeniughelbur/obsidian-second-brain.git
promptfoo          https://github.com/promptfoo/promptfoo.git
skills             https://github.com/mattpocock/skills.git
spec-kit           https://github.com/github/spec-kit.git
system-prompts-and-models-of-ai-tools https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools.git
```

## Installation policy for sandbox tools

Do not run a single blanket install command across all 34 repositories. Each tool has a different contract:

- Python projects: use the repository's `uv sync`, `uv pip install -e .`, or `pip install -r requirements.txt` instruction only inside that repository.
- Node projects: use the repository's documented `npm install`, `pnpm install`, or `bun install` command only inside that repository.
- Skills, prompt corpora, and reference repositories: clone and inspect; they have no runtime install.
- Plugin repositories such as gbrain, gstack, claude-mem, and ECC must be installed through their documented plugin/CLI flow, not by copying their existing `node_modules` or `.venv`.
- Secrets required by a tool are created manually from its `.env.example` or official configuration instructions. Never copy the old `.env`.

Verified command examples from the current sandbox:

```bash
cd sandbox/autoresearch && uv sync
cd sandbox/llm-council && uv sync && cd frontend && npm install
cd sandbox/agentscope && uv pip install -e .
cd sandbox/ai-job-search && bun install
cd sandbox/ai-job-search && for tool in .agents/skills/*; do [ -d "$tool/cli" ] && (cd "$tool/cli" && bun install); done
cd sandbox/claude-context && pnpm install
cd sandbox/agentic-inbox && npm install
cd sandbox/ecc && npm install
cd sandbox/gbrain && bun install
cd sandbox/hiring-agent && python -m venv .venv && .venv/bin/pip install -r requirements.txt
cd sandbox/graphify && uv tool install graphifyy
cd sandbox/memsearch && bash plugins/codex/scripts/install.sh
cd sandbox/obsidian-second-brain && bash install.sh
cd sandbox/promptfoo && npm install
```

These are evaluation commands, not ClaudeKit prerequisites. Run them only when the corresponding tool is being re-evaluated through the sandbox qualification process.

## Important exceptions

- `ecc/yarn.lock` contains an uncommitted local change. Export or consciously discard that change before calling the sandbox migration complete.
- `gbrain` is 305 commits behind upstream. Clone its recorded SHA if reproducing the current state; do not silently replace it with current `master`.
- `node_modules`, `.venv`, compiled binaries, caches, logs, databases, symlinks, and platform-specific artifacts are not migration targets.
- A cloned sandbox repository must remain read-only. Do not edit source files inside it.
- After any sandbox rebuild, rerun `./60_Claude/scripts/update-sandbox.sh --list` and compare every origin URL and branch to this inventory.
- Do not commit the sandbox into the parent repository.

## Related

- [[second-brain-claudekit-new-laptop-directive]]
- [[second-brain-claudekit-git-clone-and-bootstrap]]
- [[second-brain-claudekit-jarvis-unison-sync]]
