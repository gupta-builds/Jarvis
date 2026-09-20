---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: wsl
title: "Internship research loop ingestion review"
started_at: 2026-09-05T23:52:01
ended_at: 2026-09-06T01:17:21
duration_minutes: 85
exported_at: 2026-09-05T20:17:20
project: ai-job-search
cwd: '/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search'
session_id: 17f6ac23-f88c-4c39-bc2e-40b2c0213320
status: raw
turn_count: 11
tools_used:
  Agent: 1
  Artifact: 2
  Bash: 22
  Edit: 4
  mcp__jarvis__vault_list: 1
  mcp__jarvis__vault_read: 6
  Read: 17
  Skill: 1
  ToolSearch: 2
  Write: 4
tokens:
  input: 214
  output: 220314
  cache_creation: 981467
  cache_read: 21314914
  total: 22516909
cost_usd: 10.392419
model:
  - claude-sonnet-5
files_touched:
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/write-contract.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Promotion-Criteria.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/instructions/internship-research-loop/README.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Sync.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/SKILL.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/README.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/README.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/How to/tests-and-promotion.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/README.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer/2026-09-05-test-log.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/FOR-WHAT.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/ai-job-search/2026-09-05-test-log.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/.claude/skills/job-application-assistant/04-job-evaluation.md"
  - "/home/anant_gupta/projects/work/internship-research-loop/run_pipeline.py"
  - "/home/anant_gupta/projects/work/internship-research-loop/core/filter.py"
  - "/home/anant_gupta/projects/work/internship-research-loop/core/relevance.py"
  - "/home/anant_gupta/projects/work/internship-research-loop/vault_writer/validate.py"
  - "/tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/17f6ac23-f88c-4c39-bc2e-40b2c0213320/scratchpad/pipeline-blueprint.html"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/security_guards.py"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/robots_check.py"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/upstream_triage.py"
tags:
  - input
  - ai-conversation
  - claude-code
  - wsl
---

# Internship research loop ingestion review

## You

Now. let's do actual real work for internship purposes. Let's review whatr needs to be ingested, what's garbage, etc. We need a way for all of this to be reflected through the sandbox. The recent ingestion that was done includes these notes: `60_Claude/20_Distilled_Notes/Sources - Plan`, `. Many more are written down which need totracked throug. But from the github stars that I have seen and might not have idenitfied in the sanbox are these repos: "". These need to be added to the sandbox, reviewed and analyzed for further use cases. What exactlydop the provide to the existing internship-research-loop is the question? is this an essential thing? Do we really need it? Would it help our process significantly more? I need answers for all of these questions. Let's process andtest and alter these repos ingested now. We dig through them,find useful content and implement it correctly inside all the internship-research-loop folders that arer synced. This is the plan, let's do it correctly with no mistakes.

## You

Now. let's do actual real work for internship purposes. Let's review whatr needs to be ingested, what's garbage, etc. We need a way for all of this to be reflected through the sandbox. The recent ingestion that was done includes these notes: `60_Claude/20_Distilled_Notes/Sources - Plan`, `60_Claude/20_Distilled_Notes/Sources - Plan/GitHub Ingestion Implementation`, `60_Claude/20_Distilled_Notes/Sources - Plan/_Notes Created From Ingestion`, `20_Progress/Projects/AI Use/Builds & Resources`, `20_Progress/Projects/AI Use/Claude Kit`, `10_Areas/Career/Internships/Tracker/Deadline Tracker` & `20_Progress/Internship/Building System/Research Loop - Improvement Plan`. Many more are written down which need totracked throug. But from the github stars that I have seen and might not have idenitfied in the sanbox are these repos: "https://github.com/MadsLorentzen/ai-job-search, https://github.com/blader/humanizer". These need to be added to the sandbox, reviewed and analyzed for further use cases. What exactlydop the provide to the existing internship-research-loop is the question? is this an essential thing? Do we really need it? Would it help our process significantly more? I need answers for all of these questions. Let's process andtest and alter these repos ingested now. We dig through them,find useful content and implement it correctly inside all the internship-research-loop folders that arer synced. This is the plan, let's do it correctly with no mistakes.

## Claude

I'll start by reading the pipeline rules and the recently ingested notes so I don't violate the write-contract, then look at the two candidate repos.

Those ingestion notes live in the actual Jarvis vault (not this repo) — let me pull them via the Jarvis MCP.

Let me check what these two repos actually are before cloning.

Now let's get these into sandbox for real (per the write-contract: sandbox entries require a real clone + real run, not just README reading).

Good, both are real. Let me read their READMEs and understand structure quickly.

Now the ai-job-search test log — this one documents real evidence but stays in `sandbox/`, not promoted, since it fails the duplicate/fit questions.

Now update `tested-tools/README.md`'s table to reflect the new `_future/humanizer/` entry, matching the documented convention.

All the new work is in place: two real sandbox clones, real test evidence, and a documented verdict. Nothing was committed (not asked to).

## Summary

I cloned both repos into `sandbox/` for real and actually ran their tests rather than just reading READMEs:

**humanizer** (`blader/humanizer`) — a single dependency-free Markdown skill, 35 cited "de-AI-writing" patterns. Its own `validate-package.py` passed for real. It clears the promotion bar mechanically, but **internship-research-loop has nothing for it to act on right now**: discovery is deliberately zero-LLM, and the one place AI-drafted prose would appear — the `applying` agent's cover letters/outreach — is blocked because `Main Resume.md`/`Main Cover Letter.md` don't exist yet. Filed to `tested-tools/_future/humanizer/` with a `FOR-WHAT.md` naming the exact re-evaluation trigger (first real `applying` draft), not wired into any internship-loop folder since there's nothing to attach it to.

**ai-job-search** (`MadsLorentzen/ai-job-search`) — a full competing framework, not a component. 337 of its own tests pass for real. But it's the wrong fit on inspection:
- Its Danish job-board skills don't apply (US internships).
- `freehire-search` **duplicates a source internship-research-loop already polls** (`freehire.me` is named directly in its own CLAUDE.md).
- `linkedin-search` is explicitly "personal use only, ToS risk" — fine for a manual weekly run, wrong for this project's hourly *unattended* GitHub Actions pipeline.
- Its CSV/Notion tracker would split "one fact, one home" against the existing Jarvis-vault Tracker/Applying notes.
- One real, non-duplicate piece: its LaTeX CV/cover-letter compile + ATS-verification pipeline is something the `applying` agent genuinely lacks — but that agent is blocked on the same missing-profile-docs issue as humanizer's use case. Flagged, not adopted.

Stayed in `sandbox/`, not promoted — same as `gstack`'s "no" in this repo's own precedent.

**Answering your actual questions:** neither is essential, neither is needed today, and neither moves the real bottleneck. That bottleneck, confirmed directly from the Jarvis vault's own 2026-09-04 audit: `run.yml` (hourly discovery) has been disabled since 2026-08-29, and 0 Applying notes exist against 287 dossiers — the loop's problem is unattended discovery being paused and promotion/application throughput, not a missing writing-quality tool or a missing job-search framework. Worth flagging since it's more urgent than either repo.

**Tool calls:**

- `Bash` — `echo "=== sandbox ===" && ls sandbox/ 2>/dev/null && echo "=== tested-tools ===" && ls tested-tools/ 2>/dev/null && echo "=== internship-research-loop related dirs ===" && find . -maxdepth 3 -iname "*internship*" -not -path "./.git/*"`
  ```
=== sandbox ===
Agent-Reach
CL4R1T4S
OpenBB
README.md
TradingAgents
adx
agency-agents
agent-skill-simplified-technical-english
agent-skills
agentic-inbox
agentscope
andrej-karpathy-skills
autoresearch
claude-code-best-practice
claude-context
claude-mem
claude-skills-llm-council
cpr-compress-preserve-resume
ecc
gbrain
graphify
gsd-core
gstack
hiring-agent
last30days-skill
llm-council
memsearch
obsidian-mind
obsidian-second-brain
promptfoo
skills
spec-kit
system-prompts-and-models-of-ai-tools
=== tested-tools ===
README.md
_future
agents
commands
hooks
mcp-servers
skills
=== internship-research-loop related dirs ===
./context/internship-research-loop
./hooks/internship-research-loop
./instructions/internship-research-loop
./agents/internship-research-loop
./skills/internship-research-loop
./rules/internship-research-loop
./context/Jarvis/internship-research.md
./hooks/Jarvis/jarvis-internship-note-guard.ps1
./rules/internship-research-loop/internship-loop.md
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/write-contract.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Promotion-Criteria.md`
- `Bash`:
  ```bash
echo "=== check for Sources - Plan in repo ===" 
find . -iname "*Sources*Plan*" -not -path "./.git/*" 2>/dev/null
echo "=== check Builds & Resources ==="
find . -iname "*Builds*" -not -path "./.git/*" 2>/dev/null
echo "=== check Deadline Tracker ==="
find . -iname "*Deadline*" -not -path "./.git/*" 2>/dev/null
echo "=== check Research Loop Improvement Plan ==="
find . -iname "*Research Loop*" -not -path "./.git/*" 2>/dev/null
echo "=== 20_Progress exists? ==="
ls 20_Progress 2>/dev/null || echo "NOT IN THIS REPO"
echo "=== internship-research-loop dirs content ==="
for d in context/internship-research-loop hooks/internship-research-loop instructions/internship-research-loop agents/internship-research-loop skills/internship-research-loop rules/internship-research-loop; do
  echo "--- $d ---"
  ls -la "$d" 2>/dev/null
done
  ```
  ```
=== check for Sources - Plan in repo ===
=== check Builds & Resources ===
./sandbox/claude-context/node_modules/.pnpm/tree-sitter-rust@0.21.0_tree-sitter@0.21.1/node_modules/tree-sitter-rust/prebuilds
./sandbox/claude-context/node_modules/.pnpm/tree-sitter-cpp@0.22.3_tree-sitter@0.21.1/node_modules/tree-sitter-cpp/prebuilds
./sandbox/claude-context/node_modules/.pnpm/tree-sitter@0.21.1/node_modules/tree-sitter/prebuilds
./sandbox/claude-context/node_modules/.pnpm/tree-sitter-c-sharp@0.21.3_tree-sitter@0.21.1/node_modules/tree-sitter-c-sharp/prebuilds
./sandbox/claude-context/node_modules/.pnpm/tree-sitter-java@0.21.0_tree-sitter@0.21.1/node_modules/tree-sitter-java/prebuilds
./sandbox/claude-context/node_modules/.pnpm/tree-sitter-python@0.21.0_tree-sitter@0.21.1/node_modules/tree-sitter-python/prebuilds
./sandbox/claude-context/node_modules/.pnpm/tree-sitter-typescript@0.21.2_tree-sitter@0.21.1/node_modules/tree-sitter-typescript/prebuilds
./sandbox/claude-context/node_modules/.pnpm/tree-sitter-scala@0.24.0_tree-sitter@0.21.1/node_modules/tree-sitter-scala/prebuilds
./sandbox/claude-context/node_modules/.pnpm/tree-sitter-javascript@0.21.4_tree-sitter@0.21.1/node_modules/tree-sitter-javascript/prebuilds
./sandbox/claude-context/node_modules/.pnpm/tree-sitter-go@0.21.2_tree-sitter@0.21.1/node_modules/tree-sitter-go/prebuilds
./sandbox/ecc/node_modules/.bin/download-msgpackr-prebuilds
./sandbox/ecc/node_modules/msgpackr-extract/bin/download-prebuilds.js
./sandbox/gstack/node_modules/bare-os/prebuilds
./sandbox/gstack/node_modules/bare-url/prebuilds
./sandbox/gstack/node_modules/bare-fs/prebuilds
=== check Deadline Tracker ===
./sandbox/gbrain/test/cycle-patterns-deadline-budget.test.ts
./sandbox/gbrain/test/sync-hard-deadline.test.ts
./sandbox/claude-context/node_modules/.pnpm/@grpc+grpc-js@1.13.4/node_modules/@grpc/grpc-js/src/deadline.ts
./sandbox/claude-context/node_modules/.pnpm/@grpc+grpc-js@1.13.4/node_modules/@grpc/grpc-js/build/src/deadline.js.map
./sandbox/claude-context/node_modules/.pnpm/@grpc+grpc-js@1.13.4/node_modules/@grpc/grpc-js/build/src/deadline.js
./sandbox/claude-context/node_modules/.pnpm/@grpc+grpc-js@1.13.4/node_modules/@grpc/grpc-js/build/src/deadline.d.ts
./sandbox/gbrain/test/search/query-embed-deadline.test.ts
=== check Research Loop Improvement Plan ===
=== 20_Progress exists? ===
NOT IN THIS REPO
=== internship-research-loop dirs content ===
--- context/internship-research-loop ---
total 8
drwxr-xr-x 2 anant_gupta anant_gupta 4096 Sep  5 17:24 .
drwxr-xr-x 7 anant_gupta anant_gupta 4096 Sep  5 17:24 ..
-rw-r--r-- 1 anant_gupta anant_gupta    0 Sep  5 19:04 MEMORY.md
-rw-r--r-- 1 anant_gupta anant_gupta    0 Sep  5 19:04 jarvis.md
--- hooks/internship-research-loop ---
total 16
drwxr-xr-x 2 anant_gupta anant_gupta 4096 Sep  5 16:20 .
drwxr-xr-x 9 anant_gupta anant_gupta 4096 Sep  5 11:49 ..
-rwxr-xr-x 1 anant_gupta anant_gupta 2275 Sep  5 19:04 review-reminder.sh
-rwxr-xr-x 1 anant_gupta anant_gupta 1416 Sep  5 19:04 vault-write-guard.sh
--- instructions/internship-research-loop ---
total 28
drwxr-xr-x  2 anant_gupta anant_gupta  4096 Sep  5 11:03 .
drwxr-xr-x 13 anant_gupta anant_gupta  4096 Sep  5 12:26 ..
-rw-r--r--  1 anant_gupta anant_gupta 16121 Sep  5 19:04 CLAUDE.md
-rw-r--r--  1 anant_gupta anant_gupta  1515 Sep  5 19:04 README.md
--- agents/internship-research-loop ---
total 64
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Sep  5 11:03 .
drwxr-xr-x 11 anant_gupta anant_gupta 4096 Sep  5 11:49 ..
-rw-r--r--  1 anant_gupta anant_gupta 5319 Sep  5 19:04 applying.md
-rw-r--r--  1 anant_gupta anant_gupta 5880 Sep  5 19:04 contact-researcher.md
-rw-r--r--  1 anant_gupta anant_gupta 7271 Sep  5 19:04 loop-verifier.md
-rw-r--r--  1 anant_gupta anant_gupta 5786 Sep  5 19:04 program-writer.md
-rw-r--r--  1 anant_gupta anant_gupta 5156 Sep  5 19:04 promotion.md
-rw-r--r--  1 anant_gupta anant_gupta 4739 Sep  5 19:04 testing-tools.md
-rw-r--r--  1 anant_gupta anant_gupta 4962 Sep  5 19:04 tracking.md
--- skills/internship-research-loop ---
total 40
drwxr-xr-x 10 anant_gupta anant_gupta 4096 Sep  5 11:03 .
drwxr-xr-x  8 anant_gupta anant_gupta 4096 Sep  5 11:03 ..
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Sep  5 11:03 applying-rn
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Sep  5 11:03 program-write
drwxr-xr-x  3 anant_gupta anant_gupta 4096 Sep  5 11:03 promote-dossier
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Sep  5 11:03 promoting-manual-find
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Sep  5 11:03 review-loop-change
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Sep  5 11:03 tailoring-application
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Sep  5 11:03 testing
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Sep  5 11:03 tracking
--- rules/internship-research-loop ---
total 28
drwxr-xr-x 2 anant_gupta anant_gupta 4096 Sep  5 16:20 .
drwxr-xr-x 5 anant_gupta anant_gupta 4096 Sep  5 12:35 ..
-rw-r--r-- 1 anant_gupta anant_gupta 2840 Sep  5 19:04 autonomous.md
-rw-r--r-- 1 anant_gupta anant_gupta 1838 Sep  5 19:04 hooks.md
-rw-r--r-- 1 anant_gupta anant_gupta  714 Sep  5 19:04 internship-loop.md
-rw-r--r-- 1 anant_gupta anant_gupta 2344 Sep  5 19:04 jarvis.md
-rw-r--r-- 1 anant_gupta anant_gupta 1471 Sep  5 19:04 mcp-permissions.md
  ```
- `ToolSearch` — `{"query":"select:mcp__jarvis__vault_read,mcp__jarvis__search_simple,mcp__jarvis__vault_list","max_results":5}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/20_Distilled_Notes/Sources - Plan.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Internship/Building System/Research Loop - Improvement Plan.md"}`
- `mcp__jarvis__vault_read` — `{"path":"10_Areas/Career/Internships/Tracker/Deadline Tracker.md"}`
- `mcp__jarvis__vault_list` — `{"path":"60_Claude/20_Distilled_Notes/Sources - Plan"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/20_Distilled_Notes/Sources - Plan/GitHub Ingestion Implementation.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/20_Distilled_Notes/Sources - Plan/_Notes Created From Ingestion.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/20_Distilled_Notes/Sources - Plan/Maverick Skills Analysis - Cross-Reference with GitHub Repos.md"}`
- `ToolSearch` — `{"query":"select:WebFetch","max_results":3}`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/instructions/internship-research-loop/README.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Sync.md`
- `Bash` — `cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox && git clone --depth 1 https://github.com/MadsLorentzen/ai-job-search.git 2>&1 | tail -20`
  ```
Cloning into 'ai-job-search'...
  ```
- `Bash` — `cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox && git clone --depth 1 https://github.com/blader/humanizer.git 2>&1 | tail -20`
  ```
Cloning into 'humanizer'...
  ```
- `Bash`:
  ```bash
echo "=== ai-job-search tree ===" 
find /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search -maxdepth 2 -not -path "*/.git*" | sort
echo
echo "=== humanizer tree ==="
find /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer -maxdepth 2 -not -path "*/.git*" | sort
  ```
  ```
=== ai-job-search tree ===
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/.agents
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/.agents/skills
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/.claude
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/.claude/agents
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/.claude/commands
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/.claude/settings.json
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/.claude/skills
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/AGENTS.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/CHANGELOG.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/CLAUDE.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/CONTRIBUTING.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/LICENSE
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/README.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/SECURITY.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/SETUP.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/assets
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/assets/mascot
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/company_research
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/cover_letters
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/cover_letters/OpenFonts
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/cover_letters/cover.cls
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/cover_letters/cover_example.tex
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/cv
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/cv/main_example.tex
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/documents
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/documents/README.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/documents/applications
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/documents/cv
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/documents/diplomas
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/documents/linkedin
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/documents/postings
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/documents/references
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/job_scraper
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/salary_lookup.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/templates
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/templates/README.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/__init__.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_apply_records_application.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_check_framework_version.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_check_upstream_updates.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_company_research_cache.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_convert_salary_excel.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_gmail_sync_command.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_html_report_command.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_latex_guidance.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_lint_skills.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_notion_sync_command.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_onboarding_privacy.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_outcome_followup.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_placeholder_integrity.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_rank_command.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_readme_assets.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_reset_command.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_robots_check.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_salary_lookup.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_scrape_contract.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_scrape_provenance.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_security_guards.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_tracker_status_vocab.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_upskill_skill.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_upstream_triage.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tests/test_verify_pdf.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/README_SALARY_TOOL.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/check_framework_version.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/check_upstream_updates.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/convert_salary_excel.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/lint_skills.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/robots_check.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/security_guards.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/upstream_triage.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/verify_pdf.py
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/upskill

=== humanizer tree ===
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/.claude-plugin
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/.claude-plugin/marketplace.json
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/.claude-plugin/plugin.json
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/AGENTS.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/LICENSE
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/README.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/SKILL.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/agents
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/agents/openai.yaml
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/scripts
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/scripts/validate-package.py
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/SKILL.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/README.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/README.md`
- `Bash` — `cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search && ls tests | head -5 && echo "---" && head -20 tests/test_verify_pdf.py 2>/dev/null && echo "---reqs---" && find . -maxdepth 1 -iname "requirement*" -o -iname "pyproject*" | head`
  ```
__init__.py
test_apply_records_application.py
test_check_framework_version.py
test_check_upstream_updates.py
test_company_research_cache.py
---
import subprocess
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from tools.verify_pdf import (
    VerificationError,
    extract_text_layer,
    parse_page_count,
    run_tool,
    verify_pdf,
)


class ParsePageCountTests(unittest.TestCase):
    def test_parses_pdfinfo_page_count(self):
        self.assertEqual(parse_page_count("Title: Example\nPages:          2\n"), 2)

    def test_rejects_output_without_page_count(self):
---reqs---
  ```
- `Bash` — `cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer && python3 scripts/validate-package.py 2>&1 | tail -30`
  ```
Humanizer package v2.11.2 is valid
  ```
- `Bash` — `cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search && python3 -m pytest tests/ -q 2>&1 | tail -40`
  ```
/usr/bin/python3: No module named pytest
  ```
- `Bash` — `python3 -m unittest discover -s tests -p 'test_*.py' -v 2>&1 | tail -60`
  ```
test_gmail_sync_references_vocabulary_block (test_tracker_status_vocab.ReadersBucketMap.test_gmail_sync_references_vocabulary_block)
gmail-sync must defer to /outcome's vocabulary block for the ... ok
test_html_report_bucket_does_not_contain_interview_only (test_tracker_status_vocab.ReadersBucketMap.test_html_report_bucket_does_not_contain_interview_only)
`interview_only` is the archive outcome.md Status: enum value, ... ok
test_html_report_bucket_includes_space_and_underscore_forms (test_tracker_status_vocab.ReadersBucketMap.test_html_report_bucket_includes_space_and_underscore_forms)
Read-tolerance: both spellings must reach the Rejected/Closed bucket. ... ok
test_html_report_bucket_map_has_catch_all (test_tracker_status_vocab.ReadersBucketMap.test_html_report_bucket_map_has_catch_all)
No tracker value may drop out of the stats silently: unrecognised values ... ok
test_notion_sync_normalises_status_before_write (test_tracker_status_vocab.ReadersBucketMap.test_notion_sync_normalises_status_before_write)
Step 4 must map legacy space spellings to canonical before setting ... ok
test_notion_sync_uses_underscore_status_spellings (test_tracker_status_vocab.ReadersBucketMap.test_notion_sync_uses_underscore_status_spellings)
Notion Status select options must match canonical tracker spellings ... ok
test_outcome_has_vocabulary_block (test_tracker_status_vocab.VocabularyBlockExists.test_outcome_has_vocabulary_block) ... ok
[REDACTED] (test_tracker_status_vocab.VocabularyBlockExists.[REDACTED])
The writer must use canonical underscore spellings, never space forms. ... ok
[REDACTED] (test_tracker_status_vocab.VocabularyBlockExists.[REDACTED])
The vocabulary block must live as its own section below Step 1's closing ... ok
test_vocabulary_block_defines_open_by_exclusion (test_tracker_status_vocab.VocabularyBlockExists.test_vocabulary_block_defines_open_by_exclusion)
Open is derived by exclusion from the one explicit Final list, so a new ... ok
test_vocabulary_block_has_read_tolerance_line (test_tracker_status_vocab.VocabularyBlockExists.test_vocabulary_block_has_read_tolerance_line) ... ok
test_vocabulary_block_lists_underscore_canonical_spellings (test_tracker_status_vocab.VocabularyBlockExists.test_vocabulary_block_lists_underscore_canonical_spellings) ... ok
test_vocabulary_block_states_equivalence_of_space_forms (test_tracker_status_vocab.VocabularyBlockExists.test_vocabulary_block_states_equivalence_of_space_forms)
The space spellings are the same statuses as the underscore forms, not ... ok
test_important_rules_cover_untrusted_data_and_no_backfill (test_upskill_skill.UpskillSkillSpec.test_important_rules_cover_untrusted_data_and_no_backfill) ... ok
test_lint_skills_passes (test_upskill_skill.UpskillSkillSpec.test_lint_skills_passes) ... ok
test_skill_file_exists_with_lint_compliant_header (test_upskill_skill.UpskillSkillSpec.test_skill_file_exists_with_lint_compliant_header) ... ok
[REDACTED] (test_upskill_skill.UpskillSkillSpec.[REDACTED])
/upskill reads the tracker, so its enumeration of the columns must ... ok
[REDACTED] (test_upskill_skill.UpskillSkillSpec.[REDACTED]) ... ok
[REDACTED] (test_upskill_skill.UpskillSkillSpec.[REDACTED]) ... ok
[REDACTED] (test_upskill_skill.UpskillSkillSpec.[REDACTED])
/outcome creates tracker rows for applications made outside the ... ok
[REDACTED] (test_upskill_skill.UpskillSkillSpec.[REDACTED]) ... ok
[REDACTED] (test_upskill_skill.UpskillSkillSpec.[REDACTED]) ... ok
test_cherry_picked_commit_drops_off_via_patch_id (test_upstream_triage.AlreadyAppliedTests.test_cherry_picked_commit_drops_off_via_patch_id) ... ok
test_missing_ref_degrades_gracefully (test_upstream_triage.MissingUpstreamRefTests.test_missing_ref_degrades_gracefully) ... ok
test_changelog_only_footprint_is_skipped (test_upstream_triage.RelevanceFilterTests.test_changelog_only_footprint_is_skipped) ... ok
test_commit_touching_kept_files_is_worth_reviewing (test_upstream_triage.RelevanceFilterTests.test_commit_touching_kept_files_is_worth_reviewing) ... ok
test_commit_touching_only_removed_files_is_skipped (test_upstream_triage.RelevanceFilterTests.test_commit_touching_only_removed_files_is_skipped) ... ok
test_reports_up_to_date_when_not_behind (test_upstream_triage.UpToDateTests.test_reports_up_to_date_when_not_behind) ... ok
test_listed_sha_is_excluded (test_upstream_triage.WontPortTests.test_listed_sha_is_excluded) ... ok
test_actions_are_sha_pinned (test_upstream_triage.WorkflowGuardTests.test_actions_are_sha_pinned) ... ok
test_workflow_is_guarded_against_upstream (test_upstream_triage.WorkflowGuardTests.test_workflow_is_guarded_against_upstream) ... ok
test_workflow_uses_builtin_token_only (test_upstream_triage.WorkflowGuardTests.test_workflow_uses_builtin_token_only) ... ok
test_parses_pdfinfo_page_count (test_verify_pdf.ParsePageCountTests.test_parses_pdfinfo_page_count) ... ok
test_rejects_output_without_page_count (test_verify_pdf.ParsePageCountTests.test_rejects_output_without_page_count) ... ok
test_reports_missing_poppler_command (test_verify_pdf.RunToolTests.test_reports_missing_poppler_command) ... ok
test_reports_unreadable_pdf (test_verify_pdf.RunToolTests.test_reports_unreadable_pdf) ... ok
test_accepts_expected_pages_and_text (test_verify_pdf.VerifyPdfTests.test_accepts_expected_pages_and_text) ... ok
test_falls_back_to_pdftotext (test_verify_pdf.VerifyPdfTests.test_falls_back_to_pdftotext) ... ok
test_pypdf_is_preferred_over_poppler (test_verify_pdf.VerifyPdfTests.test_pypdf_is_preferred_over_poppler) ... ok
test_rejects_missing_pdf (test_verify_pdf.VerifyPdfTests.test_rejects_missing_pdf) ... ok
test_rejects_missing_required_text (test_verify_pdf.VerifyPdfTests.test_rejects_missing_required_text) ... ok
test_rejects_too_little_extractable_text (test_verify_pdf.VerifyPdfTests.test_rejects_too_little_extractable_text) ... ok
test_rejects_wrong_page_count (test_verify_pdf.VerifyPdfTests.test_rejects_wrong_page_count) ... ok

----------------------------------------------------------------------
Ran 337 tests in 5.430s

OK
  ```
- `Bash` — `cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools && find . -maxdepth 3 -not -path "./.git*" | sort | head -50`
  ```
.
./README.md
./_future
./agents
./agents/native-scaffold
./agents/native-scaffold/connector.md
./agents/native-scaffold/researcher.md
./agents/native-scaffold/reviewer.md
./agents/native-scaffold/writer.md
./commands
./commands/cpr-compress-preserve-resume
./commands/cpr-compress-preserve-resume/VERDICT.md
./commands/cpr-compress-preserve-resume/compress.md
./commands/cpr-compress-preserve-resume/preserve.md
./commands/cpr-compress-preserve-resume/resume.md
./commands/native-scaffold
./commands/native-scaffold/brainstorm.md
./commands/native-scaffold/capture.md
./commands/native-scaffold/connect.md
./commands/native-scaffold/inbox-process.md
./commands/native-scaffold/journal.md
./commands/native-scaffold/research.md
./commands/native-scaffold/review.md
./commands/native-scaffold/summarize.md
./hooks
./hooks/native-scaffold
./hooks/native-scaffold/auto-link.md
./hooks/native-scaffold/daily-summary.md
./hooks/native-scaffold/post-note-create.md
./mcp-servers
./mcp-servers/gbrain
./mcp-servers/gbrain/VERDICT.md
./skills
./skills/mattpocock-engineering
./skills/mattpocock-engineering/README.md
./skills/mattpocock-engineering/ask-matt
./skills/mattpocock-engineering/code-review
./skills/mattpocock-engineering/codebase-design
./skills/mattpocock-engineering/diagnosing-bugs
./skills/mattpocock-engineering/domain-modeling
./skills/mattpocock-engineering/grill-with-docs
./skills/mattpocock-engineering/implement
./skills/mattpocock-engineering/improve-codebase-architecture
./skills/mattpocock-engineering/prototype
./skills/mattpocock-engineering/research
./skills/mattpocock-engineering/resolving-merge-conflicts
./skills/mattpocock-engineering/setup-matt-pocock-skills
./skills/mattpocock-engineering/tdd
./skills/mattpocock-engineering/to-spec
./skills/mattpocock-engineering/to-tickets
  ```
- `Bash`:
  ```bash
cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit && find tested-tools/_future -maxdepth 2 | sort
echo "---template---"
cat 60_Claude/Templates/for-what.md 2>/dev/null
echo "---example verdict (gbrain, first 60 lines)---"
sed -n '1,60p' tested-tools/mcp-servers/gbrain/VERDICT.md 2>/dev/null
  ```
  ```
tested-tools/_future
---template---
---
created: {{date:YYYY-MM-DD}}
type: for-what
tags: [tested-tools, future]
---

# FOR-WHAT — {{repo-name}}

Filed in `tested-tools/_future/{{repo-name}}/`. This is a real "yes, this cleared the review bar" verdict with no home yet — not a "no," not a placeholder for something never actually tested. See `60_Claude/vault-rules/pipeline-conventions.md`'s `tested-tools/_future/` section and `_docs/Architecture.md`'s "Parked (future)" stage.

## Cleared, on what terms

(What was actually reviewed, and how it cleared `_docs/Promotion-Criteria.md`'s bar — cite the real commands run and their real output, same as any other promotion decision. Don't restate the source repo's README claims as if they were the evidence.)

## What's mapped here

(List what from the source repo is captured in this `_future/{{repo-name}}/` folder, and why each piece is worth remembering — e.g. `{{repo-name}}/agents/code-review.md`, `{{repo-name}}/skills/testing.md`.)

## The use case being waited for

(Name the specific, concrete use case this is parked for — a task, not a vibe. "Code review for a TypeScript monorepo project" is a use case. "Might be useful someday" is not — if this is all you have, the tool probably shouldn't be here yet.)

## Re-evaluate when

(What real, named event should trigger promoting this out of `_future/` — a specific project starting, a specific gap becoming concrete. Not "eventually.")
---example verdict (gbrain, first 60 lines)---
---
decided: 2026-08-20
decision: cleared — global promotion candidate, embedding provider now real and verified
source-repo: https://github.com/garrytan/gbrain
sandbox-path: sandbox/gbrain/
destination: global ~/.claude/ (install executed in a separate session, per _docs/Design.md — this repo only decides)
---

# Verdict — gbrain

The embedding-provider decision (`_docs/Architecture.md`'s original worked example) sat pending three weeks — Anant decided OpenAI 2026-08-20 (`AskUserQuestion`, recorded in Jarvis's `Tool Map.md`). This session executed the wiring and re-verified for real, not just re-read the prior 80/100 doctor run.

## 1. Did it actually run without a manual workaround?

**Partial-yes — the original install was a clean yes; the embedding-provider switch specifically required a real, undocumented workaround.**

Original install (2026-07-29, unchanged): `bun install` (283 packages) → `bun run src/cli.ts init --pglite --no-embedding` → `doctor` → 80/100 health, 100/100 brain score. Clean, no workaround.

**Real bug found and worked around this session:** switching the embedding provider on a brain that was initialized with `--no-embedding` does not work via any of gbrain's own documented paths:
- `gbrain config set embedding_disabled false` — reports success ("Set embedding_disabled = false") but silently writes to the DB-plane only; the file-plane `~/.gbrain/config.json` value is untouched.
- `gbrain init --force --pglite --embedding-model openai:text-embedding-3-large --embedding-dimensions 1536` — completes with exit 0, but the persisted `embedding_disabled: true` sentinel in `~/.gbrain/config.json` is silently preserved across the reinit.
- `gbrain reinit-pglite --embedding-model ... --embedding-dimensions ...` — gbrain's own docs call this "the canonical path for switching embedding providers on PGLite." It delegates internally to the same `init` code path and has the identical failure.

**Root cause, confirmed by reading `sandbox/gbrain/src/commands/init.ts` directly (not guessed):** `resolveAIOptions()` (line ~243) seeds `out.noEmbedding = true` from the persisted file-plane `embedding_disabled` sentinel *before* it processes an explicit `--embedding-model` flag (line ~313). The explicit-flag branch sets `out.embedding_model` but never clears `out.noEmbedding`, and downstream code (init.ts ~900, ~1128) treats `noEmbedding` as authoritative — so `embedding_disabled: true` is silently re-persisted on every init/reinit, and the doctor's `embedding_provider` check kept reporting `zeroentropyai:zembed-1` (the schema-pack default) with no provider credentials, regardless of what `--embedding-model` was passed. `gbrain providers test --model openai:text-embedding-3-large` (a real, isolated OpenAI API round-trip — 2946ms, 1536 dims) confirmed the OpenAI key itself was valid the entire time; the bug is purely in gbrain's config-plane merge logic for a brain that started life deferred.

**The actual workaround:** directly edit `~/.gbrain/config.json` to delete the `embedding_disabled` key (a plain JSON file edit, not a gbrain command), then run `gbrain init --force --pglite --embedding-model openai:text-embedding-3-large --embedding-dimensions 1536`. This is nowhere in gbrain's own docs.

**Verified working after the workaround, with real evidence, not just a clean exit code:**
- `~/.gbrain/config.json` now correctly carries `"embedding_model": "openai:text-embedding-3-large"` / `"embedding_dimensions": 1536` for the first time this session.
- `doctor`'s `embedding_provider` check: `openai:text-embedding-3-large ✓ 412ms, 1536 dims, DB aligned`.
- A real test page was imported (`gbrain import`), embedded (`gbrain embed --stale` / auto-embed-on-import — `doctor` confirmed `embeddings: 100% coverage, 0 missing`), and retrieved via a real semantic query: `gbrain search "second-brain-claudekit qualification pipeline" --semantic` returned it at score `0.8275` — a genuine OpenAI-embedding-backed hit, not a keyword match (the query shares no exact words with the page). The test page was then soft-deleted (`gbrain delete test-page`, recoverable 72h) to leave the personal brain clean.
- Final `doctor`, clean brain: **80/100 overall, 100/100 brain score** — same headline number as the pre-embedding baseline (component mix shifted: brain-checks 95 vs 90, ops-checks 90 vs 95 — the `subagent_capability` WARN, unrelated to embeddings, about missing `ANTHROPIC_API_KEY` accounts for the remaining ops-checks gap in both runs). The number didn't move; what changed is real: embedding search is now live and OpenAI-backed instead of disabled.

## 2. Does it solve a problem nothing else already solves?

**Yes, unchanged from the 2026-07-29 finding** (`_docs/Promotion-Criteria.md`): confirmed by elimination — adopting gbrain makes `memsearch` (auto-capture, no synthesis) and `context-sync` (thinner SQLite memory) both redundant. Its synthesis + gap-analysis layer is a capability nothing else in the current stack has. Now additionally backed by real, working semantic retrieval (see above) rather than keyword/graph-only.

## 3. Is it a duplicate of something already promoted?

**No.** Nothing in this repo's `tested-tools/` or any real project's `.claude/` currently provides personal-knowledge synthesis + gap-analysis. `memsearch` and `context-sync` were the only competing candidates and neither has been promoted.

## 4. Can the dependency it claims actually be verified, mechanically?

**Yes, both claims, mechanically:**
- `bun` — `python3 60_Claude/scripts/check_dependency.py --preset gbrain` (existing preset, `bun` only) — re-run this session, still `PASS`.
- OpenAI reachability — not a `check_dependency.py` case (it's an API key, not a binary/library on this machine), but mechanically verified anyway via `gbrain providers test --model openai:text-embedding-3-large`, a real network round-trip against the OpenAI embeddings API (2946ms, 1536 dims returned) — the same "don't trust the claim, check the fact" discipline `check_dependency.py` exists for, just via gbrain's own equivalent tool rather than the repo's script (the script has no HTTP-reachability mode).

## Decision: cleared — global promotion candidate

All four questions clear. Global-vs-project-scoped was already decided 2026-08-09 (`_docs/Design.md`'s global test — "useful with no regard to which project is open"). Per this repo's own division of labor, **this repo's role stops at the decision**; the actual global install into `~/.claude/` happens in a separate session at the Windows/WSL home directory, not here.

**Named caveat, carried forward with the promotion, not swept under it:** the embedding-provider switch bug above is real and will recur for anyone re-running `gbrain init --embedding-model` or `gbrain reinit-pglite` against a brain that was ever initialized with `--no-embedding` (or otherwise has `embedding_disabled: true` stuck in `~/.gbrain/config.json`). The fix is the manual JSON edit documented above. Worth a real upstream bug report to `garrytan/gbrain` at some point — not filed this session (out of scope for this repo's own pipeline work), flagged here so it isn't silently rediscovered.

## Convention note for `60_Claude/vault-rules/pipeline-conventions.md`

`tested-tools/`'s documented three-level convention (`README.md`) only names four artifact types — `agents/`, `commands/`, `hooks/`, `skills/`. gbrain is none of these; it's a standalone MCP server / CLI tool. This VERDICT landed at a new `tested-tools/mcp-servers/gbrain/` path (a fifth type bucket, not previously named anywhere) rather than force-fitting it into an existing one or inventing a new top-level folder. Flagging the mismatch here rather than silently resolving it — same pattern as the CPR verdict's own convention note. A future pass should either add `mcp-servers/` to `pipeline-conventions.md`'s named type list, or decide MCP-server-shaped tools belong somewhere else entirely.
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/How to/tests-and-promotion.md`
- `Bash` — `find tests -maxdepth 3 2>/dev/null | sort`
  ```
tests
tests/agents
tests/cli-tools
tests/cli-tools/promptfoo
tests/cli-tools/promptfoo/2026-08-20-test-log.md
tests/commands
tests/commands/cpr-compress-preserve-resume
tests/commands/cpr-compress-preserve-resume/2026-08-19-test-log.md
tests/hooks
tests/mcp-servers
tests/mcp-servers/claude-context
tests/mcp-servers/claude-context/2026-08-20-test-log.md
tests/skills
tests/skills/mattpocock-engineering
tests/skills/mattpocock-engineering/README.md
tests/skills/spec-kit
tests/skills/spec-kit/2026-08-20-test-log.md
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/README.md`
- `Bash`:
  ```bash
mkdir -p /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/ai-job-search /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer
echo done
  ```
  ```
done
  ```
- `Write` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer/2026-09-05-test-log.md`
  ```
# Test log — humanizer (`blader/humanizer`)

Real commands run against `sandbox/humanizer/` (cloned this session, `git clone --depth 1 https://github.com/blader/humanizer.git`), evaluated against `_docs/Promotion-Criteria.md`'s four questions specifically for whether it's needed by `internship-research-loop` (the scope of this pass — see `tested-tools/_future/humanizer/FOR-WHAT.md` for the verdict).

## 1. Did it actually run without a manual workaround?

**Yes.** The whole tool is one Markdown skill file (`SKILL.md`, 35 cited patterns from Wikipedia's "Signs of AI writing") — no build, no runtime dependency. Its own packaging check:

```
$ cd sandbox/humanizer && python3 scripts/validate-package.py
Humanizer package v2.11.2 is valid
```

Real output, exit 0, no workaround needed.

## 2. Does it solve a problem nothing else already solves — for internship-research-loop specifically?

**Not right now.** `internship-research-loop`'s own conventions (`instructions/internship-research-loop/CLAUDE.md`) make the entire unattended discovery path zero-LLM by design — there's no AI-drafted prose in `run_pipeline.py`/`recheck.py`/`core/`/`ingestion/`/`vault_writer/` for a de-AI-writing tool to clean up. The one place AI-drafted prose *would* appear — the `applying` agent's cover-letter/outreach drafts — is currently blocked: the agent itself checks for and refuses to draft against `Main Resume.md`/`Main Cover Letter.md`, which aren't real yet (per the same CLAUDE.md's agent table). So there is no current output for humanizer to act on inside this loop.

## 3. Is it a duplicate of something already promoted?

No existing `tested-tools/` entry does this. (Outside the internship-loop scope, the wider vault's own notes floated a custom "anti-slop-editor" agent for the same job — confirmed via Jarvis vault read this session that it was never built, only planned — so humanizer would substitute for that idea if it's ever revisited, not duplicate a real promoted tool.)

## 4. Can the dependency it claims actually be verified, mechanically?

**Yes, trivially — it claims none.** No binary, no package, no network call. `validate-package.py`'s pass above is the whole verification surface.

## Verdict

Cleared on its own terms, no current internship-research-loop use case. Filed to `tested-tools/_future/humanizer/` per the write-contract's routing table, not promoted into any `internship-research-loop` staging folder (`agents/`, `skills/`, `rules/`, `context/`, `hooks/`) — there is nothing for it to attach to there yet. See `tested-tools/_future/humanizer/FOR-WHAT.md` for the re-evaluation trigger.

  ```
- `Write` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/FOR-WHAT.md`
  ```
---
created: 2026-09-05
type: for-what
tags: [tested-tools, future]
---

# FOR-WHAT — humanizer

Filed in `tested-tools/_future/humanizer/`. This is a real "cleared the review bar" verdict with no home yet, scoped to the question that prompted it — whether `blader/humanizer` is needed by `internship-research-loop` — not a "no."

## Cleared, on what terms

Reviewed against `_docs/Promotion-Criteria.md`'s four questions; full evidence in `tests/skills/humanizer/2026-09-05-test-log.md`. Summary: it's a single, dependency-free Markdown skill (35 cited patterns from Wikipedia's "Signs of AI writing"); its own `scripts/validate-package.py` passed for real (`Humanizer package v2.11.2 is valid`, exit 0). Q1 and Q4 clear cleanly. Q2/Q3 (does it solve a problem nothing else solves, is it a duplicate) don't apply yet — see below.

## What's mapped here

`SKILL.md` — the real file, copied as-is from `sandbox/humanizer/SKILL.md` (not edited; `sandbox/`'s own copy stays read-only per the write-contract).

## The use case being waited for

The `applying` agent in `internship-research-loop` (`instructions/internship-research-loop/CLAUDE.md`'s agent table) drafts cover-letter/outreach content for real applications — exactly the AI-drafted-prose shape humanizer is built to clean up before a human sends it. That agent is currently blocked: it checks for `Main Resume.md`/`Main Cover Letter.md` and refuses to draft against filler content, and neither file is real yet (confirmed live via the Jarvis vault this session — 0 Applying notes exist, and the loop's entire unattended discovery path is deliberately zero-LLM, so no other part of this pipeline produces prose to humanize).

## Re-evaluate when

The `applying` agent produces its first real cover-letter or outreach draft against a real `Main Resume.md`/`Main Cover Letter.md` — at that point, run humanizer against that real draft once, for real, before deciding whether to wire it into the `applying`/`/tailoring-application` flow permanently.

  ```
- `Bash`:
  ```bash
cp /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/SKILL.md /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/SKILL.md
echo copied
  ```
  ```
copied
  ```
- `Write` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/ai-job-search/2026-09-05-test-log.md`
  ```
# Test log — ai-job-search (`MadsLorentzen/ai-job-search`)

Real commands run against `sandbox/ai-job-search/` (cloned this session, `git clone --depth 1 https://github.com/MadsLorentzen/ai-job-search.git`), evaluated against `_docs/Promotion-Criteria.md`'s four questions for whether it belongs in `internship-research-loop`.

## 1. Did it actually run without a manual workaround?

**Partial.** The repo's own Python test suite ran for real, no workaround, stdlib only:

```
$ python3 -m unittest discover -s tests -p 'test_*.py' -v
...
Ran 337 tests in 5.430s
OK
```

**Not run**: the actual `/setup` → `/scrape` → `/apply` Claude Code workflow this framework's README centers on. That needs `bun` (for the portal-search CLIs), a LaTeX distribution with `lualatex`+`xelatex` (for CV/cover-letter compilation), and a live Claude Code session driving its own skills/commands — not a batch-scriptable install+run in the way `gbrain`'s `bun install && doctor` was. Disclosed honestly rather than assumed passing; see the verdict below for why this gap doesn't change the outcome.

## 2. Does it solve a problem nothing else already solves?

**No, for the parts that would matter to internship-research-loop; partially, for one part that's out of scope right now.**

- **Portal search skills** (`jobbank-search`, `jobdanmark-search`, `jobindex-search`, `jobnet-search`) are Danish-market only (Jobindex, Jobnet, Akademikernes Jobbank) — not relevant to a US-internship search.
- **`freehire-search`** queries `freehire.me`'s public REST API. `internship-research-loop`'s own instructions (`instructions/internship-research-loop/CLAUDE.md`, "Key internal services") already name `freehire.me` as a host this project's own ingestion contacts directly. **This is a literal duplicate of an already-live source**, confirmed by direct comparison of both projects' own documentation, not assumed.
- **`linkedin-search`** scrapes LinkedIn's public `jobs-guest` endpoints. ai-job-search's own docs flag this as "personal use only — automated access is against LinkedIn's Terms of Service, so keep volume low." `internship-research-loop` runs its discovery **hourly, unattended, via GitHub Actions** (`run.yml`) — automating a ToS-risky scrape on that cadence is a materially different (and worse) risk than the manual, occasional `/scrape` invocation this tool was actually built for. Not a fit for the unattended path; a manual one-off run isn't how this project's discovery works at all.
- **CV/cover-letter LaTeX drafting + PDF compile + ATS-parseability verification** (`05-cv-templates.md`, `[REDACTED].md`, `tools/verify_pdf.py`, the drafter-reviewer `/apply` workflow) genuinely does something `internship-research-loop` doesn't have today — its own `applying` agent is explicitly the "draft/plan half" only, with no LaTeX compile step, no PDF-layout iteration, no ATS text-layer check. This is the one real, non-duplicate capability found in this repo.
- **Tracking/outcome** (`job_search_tracker.csv`, `/outcome`, `/notion-sync`, `/gmail-sync`, `/html-report`) duplicates the role `internship-research-loop`'s own Jarvis-vault Tracker/Applying notes already fill, in a different, repo-local store (CSV + optional Notion) — adopting it would split one fact (application status) across two systems of record, which is exactly the failure class `_docs/Repo-Map.md`'s own incident log already warns about repeatedly.

## 3. Is it a duplicate of something already promoted?

**Yes, for `freehire-search` specifically** (see above — `freehire.me` is already a live internship-research-loop source). **Not fully answerable for the CV/cover-letter pipeline** — nothing currently promoted covers it, but nothing in internship-research-loop currently needs it either (the `applying` agent is blocked upstream of this gap, on missing `Main Resume.md`/`Main Cover Letter.md`, same blocker as `tested-tools/_future/humanizer/`'s finding).

## 4. Can the dependencies it claims actually be verified, mechanically?

Not checked in depth this session — `bun` and a LaTeX distribution (`lualatex`/`xelatex`) are real, named prerequisites for the parts that would need testing further, but since Q2/Q3 already answer "not a fit" for the parts that would run unattended, and the one non-duplicate part (LaTeX drafting) has no current consumer, spending the install effort here didn't clear a real decision either way. Flagged rather than skipped silently.

## Verdict

**Not adopted, in any part, right now.** Stays in `sandbox/ai-job-search/`, not promoted to `tested-tools/` — same shape as `gstack`'s "no" in `_docs/Promotion-Criteria.md`'s own worked examples (real evidence gathered, genuine blocker found, tool stays parked rather than rounded up). Nothing written into any `internship-research-loop` staging folder (`agents/`, `skills/`, `rules/`, `context/`, `hooks/`, `instructions/`) — there's no piece of this repo that both (a) solves a problem internship-research-loop doesn't already solve and (b) has a real, unblocked consumer today.

**One thing worth remembering, not acting on:** the LaTeX CV/cover-letter compile-and-verify pipeline (`tools/verify_pdf.py`, the `\needspace`/`\enlargethispage` layout-iteration pattern, the ATS text-layer check) is a real, working answer to a gap the `applying` agent will eventually hit once it unblocks. Re-evaluate then, alongside `tested-tools/_future/humanizer/`'s own "re-evaluate when" trigger — both are gated on the same event (`Main Resume.md`/`Main Cover Letter.md` becoming real).

  ```
- `Edit` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/README.md`
  ```diff
  - | `mcp-servers/gbrain/` | `sandbox/gbrain/` (`garrytan/gbrain`) | **New 2026-08-20, new type bucket.** Personal-knowledge MCP server — not an agent/command/hook/skill, so it doesn't fit the three-level convention above. Cleared all four `_docs/Promotion-Criteria.md` questions for real — see `VERDICT.md` in that folder, including a real gbrain bug found and worked around while wiring the OpenAI embedding provider (`~/.gbrain/config.json`'s `embedding_disabled` sentinel doesn't clear via any of gbrain's own documented commands). Decision: cleared, global promotion candidate — actual global install happens in a separate session, not from this repo. |
  + | `mcp-servers/gbrain/` | `sandbox/gbrain/` (`garrytan/gbrain`) | **New 2026-08-20, new type bucket.** Personal-knowledge MCP server — not an agent/command/hook/skill, so it doesn't fit the three-level convention above. Cleared all four `_docs/Promotion-Criteria.md` questions for real — see `VERDICT.md` in that folder, including a real gbrain bug found and worked around while wiring the OpenAI embedding provider (`~/.gbrain/config.json`'s `embedding_disabled` sentinel doesn't clear via any of gbrain's own documented commands). Decision: cleared, global promotion candidate — actual global install happens in a separate session, not from this repo. |
| `_future/humanizer/` | `sandbox/humanizer/` (`blader/humanizer`) | **New 2026-09-05.** First real entry in `_future/`. A single dependency-free Markdown skill (35 cited de-AI-writing patterns); cleared `_docs/Promotion-Criteria.md`'s Q1/Q4 for real (`scripts/validate-package.py` passed) but has no current consumer in `internship-research-loop` — the one place it would apply (the `applying` agent's cover-letter/outreach drafts) is blocked on `Main Resume.md`/`Main Cover Letter.md` not being real yet. See `FOR-WHAT.md` in that folder and `tests/skills/humanizer/2026-09-05-test-log.md` for the evidence. `MadsLorentzen/ai-job-search`, reviewed the same session for the same question, stayed in `sandbox/` — see `tests/skills/ai-job-search/2026-09-05-test-log.md` for why (mostly wrong-market/duplicate/ToS-risk, one flagged future capability gated on the same blocker). |
  ```
- `Bash`:
  ```bash
git status --short | grep -v '^??.*sandbox/\(ai-job-search\|humanizer\)/' | head -50
echo "---sandbox additions (top level only)---"
git status --short sandbox/ai-job-search sandbox/humanizer 2>/dev/null | head -5
du -sh sandbox/ai-job-search sandbox/humanizer 2>/dev/null
  ```
  ```
 M instructions/internship-research-loop/CLAUDE.md
 M tested-tools/README.md
?? context/OpsPilot/
?? context/Resq/
?? context/internship-research-loop/
?? hooks/internship-research-loop/vault-write-guard.sh
?? rules/internship-research-loop/
?? tested-tools/_future/
?? tests/skills/ai-job-search/
?? tests/skills/humanizer/
---sandbox additions (top level only)---
5.5M	sandbox/ai-job-search
312K	sandbox/humanizer
  ```

## You

It was paused for any reason. It's so that you can for the, a lot of things while the loop. The ingestion just turned right now. The AI jobs, which it's it's a really well process. Repo, and it's very famous for finding jobs. I want to understand misread people and compare to the discovery process of internship research loop. After everything has been compared, I want to understand the gaps between something that's so well polished. And published. Versus what I have built, and this is literally almost what I have built. But extremely better and done for LinkedIn searches as well. And keep it covered letters, writing, ATS, proofing, everything is basically what you decide to build. It even has a front end for everything to be seen. Do not focus much on the front end. Just click and back side to look at the back end. How exactly do this process run. Since we have cleaned everything and we have it clearly was due to us. We can mimic these processes and put it in the inside internship research tool. That's the main idea of you. But firstly, I want to compare the decisions provide me with the decision comparison so I can compare it with the postmortem, time to stand. Then see step two of this, which we're not gonna do. You're just gonna compare everything on screen. Do not make any mistakes. Do the job correctly. 

## Claude

Let me verify the actual internship-research-loop source (not just the vault's paraphrase of it) and pull the real ai-job-search skill/command files, so this comparison is grounded in code, not README claims.

Real internship-research-loop repo is on disk — let me read its actual source to ground this comparison in code, not the vault's paraphrase.

## First — a correction, since accuracy matters here

`run.yml` is **not** re-enabled. Checked live just now:

```
gh api repos/gupta-builds/internship-research-loop/actions/workflows
→ "run.yml": "state": "disabled_manually"
last successful run: 2026-08-29T09:33:51Z
```

Whatever "just turned on" refers to, it isn't this workflow's state — it's been off for the same ~7 days the vault's own 2026-09-04 audit found. Flagging this now so the comparison below isn't built on a false premise.

Also worth noting up front: the real repo (`~/projects/work/internship-research-loop`) is considerably more built-out than the Jarvis vault's 2026-09-04 "Improvement Plan" note described — it now has **10 direct-fetch sources** (`SimplifyJobs`, `Jose-Gael-Cruz-Lopez`, `vanshb03`, `zshah101`, `ApplyGuy`, `Greenhouse`, `Ashby`, `Lever`, `Freehire`, `AIJobs`) plus a separate Firecrawl-driven `InternDock` discovery leg (11 total), a debate-based prioritizer, and three failure-detection subsystems (debate-loss exclusion, write-gate-failure exclusion, zero-match-streak alerting) that didn't exist when that vault note was last updated. Everything below is read from the real, current source — `run_pipeline.py`, `core/filter.py`, `core/relevance.py`, `vault_writer/validate.py` — not from the vault's paraphrase of it.

Everything below is comparison only, per your instruction. No changes made to either repo.

---

## The one-sentence framing

**ai-job-search** is a human-driven, LLM-judged, per-command workflow: you type `/scrape`, `/rank`, `/apply`, an agent reads and reasons about each posting every time, and it produces polished per-application artifacts (PDFs, tracker rows).
**internship-research-loop** is an unattended, zero-LLM, scheduled pipeline: no agent reasoning runs in the hourly path at all — every gate is a regex, a set lookup, or a comparator function — and it produces raw discovery signal (dossiers) for a human to act on later, manually, outside this pipeline.

They are not the same shape of tool. One is a comparison of *when the intelligence runs*: ai-job-search spends LLM judgment on every posting, every time, live; internship-research-loop spends none, ever, in its automated path, and defers all judgment to a human at promotion time.

---

## Stage-by-stage backend comparison

| Stage | ai-job-search | internship-research-loop |
|---|---|---|
| **Trigger** | Manual: user runs `/scrape` in a live Claude Code session, whenever they choose (`.claude/skills/job-scraper/SKILL.md`) | Automated: GitHub Actions `run.yml`, hourly, no human present — currently disabled (see correction above) |
| **Sourcing** | Portal-specific CLI tools (`.agents/skills/*-search/cli`, Bun/TypeScript) for Jobindex/Jobnet/Jobbank/Jobdanmark (Denmark-only) + `linkedin-search` (public `jobs-guest` endpoints) + `freehire-search` (freehire.me REST API) — Step 1 falls back to `WebSearch` if a CLI is unavailable | 10 direct feed/API fetchers (`ingestion/sources.py` + `ingestion/freehire.py`) hitting public JSON feeds (SimplifyJobs/JGCL/vanshb03/zshah101/ApplyGuy) and per-company Greenhouse/Ashby/Lever board APIs, plus a Firecrawl-based InternDock sitemap-guide discovery leg (`ingestion/interndock.py`) — no scraping of a portal's search-results HTML anywhere |
| **Fetch & parse** | Step 2 of `job-scraper/SKILL.md`: an LLM agent reads each result page and extracts structured fields by judgment | Deterministic JSON/API parsing (`ingestion/normalize.py`); page *content* (for classification/OPT-check refinement only) is fetched via Firecrawl, but the extraction itself is regex/string-based (`ingestion/posting_page.py`), never an LLM read |
| **"Is this worth keeping" gate** | Step 3, **"Quick Fit Assessment"** — an LLM judges each result against the profile inline, no fixed scoring rubric at this stage | Two deterministic gates, in order: `core/filter.py::matches()` (per-source field matching — terms/category/degree/location, permissive-by-default: ambiguous data passes, only an affirmative negative signal like `Canada`/`UK` in a location field or an explicit `"U.S. Citizenship is Required"` sponsorship flag rejects) → `core/relevance.py`'s two-stage CS-relevance check (`stage1_reject`: cheap title-only regex reject before any fetch; `stage2_confirm`: content-based, only for adjacent-field hints like `hardware`/`robotics`/`chemical` — requires an actual software-signal keyword hit in fetched content) |
| **Fit scoring** | `/rank` and `/apply` Step 1 both invoke `04-job-evaluation.md`'s framework: an **Eligibility Gate** (citizenship/PR — hard FAIL) and a **Language Gate** (declared-language mismatch — FAIL if undeclared, FLAG if under-leveled) run first, then 5 LLM-judged 0–100 dimensions (Technical Skills 30%, Experience 25%, Behavioral Fit 15%, Career Alignment 30%, Location pass/fail) → weighted score → Strong/Good/Moderate/Weak/Poor Fit bucket | No equivalent scoring pass exists. There is no 0–100 "fit score" anywhere in this pipeline — a posting either clears the deterministic gates above or it doesn't. The closest analogue, `core/classify.py`, only buckets a *passed* posting into AI/ML / Fullstack / CyS & Finance / Other for vault routing, and does not judge fit at all |
| **Prioritization under budget** | None visible in the backend — `/rank` produces a ranked shortlist for the human to pick from, but nothing throttles how many postings get drafted per run | `run_pipeline.py::_prioritize_and_cap()` — a `debate_compare` comparator (preferred-company tier → bucket fill-need → recency) selects at most `{AI/ML: 3, Fullstack: 3, CyS & Finance: 3, Other: 1}` new writes **per hourly run**, deliberately smaller than the ~30x larger candidate volume, to protect human review bandwidth, not Firecrawl cost alone |
| **A losing candidate's fate** | Not tracked structurally — an unranked or low-scored posting simply isn't picked for `/apply` | Persisted, not discarded: `state/debate_losses.json` counts consecutive losses; a uid loses **48** consecutive hourly runs (~2 days) before being permanently excluded and logged to a human-reviewable `Excluded — Losing The Debate.md` — plus a separate, structurally different exclusion path (`state/write_gate_failures.json`) for a uid that fails the *same* write-gate check (`url_liveness`/`cross_source_duplicate`) 3 consecutive times, since a dead link deserves no benefit of the doubt the ranking-loss path exists for |
| **Write gate** | Not a discrete gate — `/apply` just drafts once fit evaluation passes | `vault_writer/validate.py::validate()` — 5 checks, fail-closed, deliberately cost-ordered: `required_fields` → `not_duplicate` → `cross_source_duplicate` (free) → `url_liveness` (a real HTTP HEAD) → `format_compliance` — first failure wins, no HEAD request wasted on an item that's already dead on cheaper grounds |
| **Output artifact** | A tailored **CV + cover letter PDF pair**, per application, drafted fresh each time `/apply` runs | A **dossier** (Markdown note with required frontmatter — `company, title, url, terms, locations, target_year, date_posted, matched_reason, preference_tier, tags`, etc.) written into the Jarvis Obsidian vault — no CV, no cover letter, no per-application document at all |
| **CV/cover-letter drafting** | Yes — `/apply` Step 2, LaTeX (`moderncv` banking-style CV, custom `cover.cls`), Step 5 **mandatory** compile with `lualatex`/`xelatex` + visual PDF inspection, iterated with `\needspace`/`\enlargethispage` until exactly 2 pages (CV) / 1 page (cover letter), no orphaned entries | None. `internship-research-loop`'s own `applying` agent (per `instructions/internship-research-loop/CLAUDE.md`) is the equivalent slot, but it's the "draft/plan half only" and is currently **blocked** — it checks for real `Main Resume.md`/`Main Cover Letter.md` and refuses to draft against filler content, which don't exist yet |
| **ATS verification** | Yes, real — `tools/verify_pdf.py` extracts the compiled PDF's actual text layer (`pypdf`, falling back to `pdftotext`) and checks contact-detail visibility, reading order, and posting-keyword coverage against what a parser actually sees (Step 5d of `apply.md`) | None exists anywhere in this pipeline |
| **Drafter-reviewer separation** | Yes — Step 3 spawns a second agent with fresh context to research the company and critique the drafts before Step 4 revises | No equivalent in the automated path (by design — zero-LLM). The closest analogue is the *human-gated* `contact-researcher`/`program-writer` agent pair, invoked manually at promotion time, not automatically per posting |
| **Company research** | `04-job-evaluation.md`'s Company Research Checklist, cached per-company for 30 days (`company_research/<company>.json`), reused by both `/apply`'s reviewer and `/interview` | `contact-researcher` agent exists for a related but narrower purpose — finding a real, sourced *contact* (recruiter/team member), not general company-culture research — and is invoked manually, not automatically |
| **Interview prep** | Yes — `/interview` builds a stage-specific prep pack from the application's own archive (exact posting, exact CV/cover letter version, prior-round feedback), maps questions to STAR examples, offers a mock-interview roleplay | No equivalent anywhere in this pipeline |
| **Outcome tracking** | `job_search_tracker.csv` + `/outcome` (archives materials, updates status) + optional `/gmail-sync` (Gmail-based status detection, batch-approved) + optional `/notion-sync` (one-way, read-only Notion mirror) | Jarvis-vault Tracker/Applying notes (`instructions/internship-research-loop/CLAUDE.md`'s note-template contracts), maintained by the `tracking` agent at defined touch-points (promotion, tailor-start, submission, outcome) — a different system of record (vault notes with a fixed frontmatter contract vs. a repo-local CSV) |
| **Skill-gap analysis** | `/upskill` — compares profile against tracked + ranked-but-untracked postings, produces a prioritized skill-gap heatmap and learning plan | No equivalent |
| **Salary benchmarking** | `salary_lookup.py`, BYO data (union stats, Glassdoor exports) | No equivalent |
| **Extension model** | `/add-portal` (generates a new job-board CLI skill, investigates ToS/robots.txt, test-runs live before registering), `/add-template` (registers a new CV/cover-letter toolchain) | Adding a source is a manual Python change (`ingestion/sources.py` + `core/filter.py` + a new `core/schema_drift.py` check + fixtures + tests) — no generator command |
| **Failure detection / self-monitoring** | None visible in the backend beyond `/outcome followup`'s stale-application nudge | Three distinct, independently-triggered alerting mechanisms, each built from a real named incident: zero-match-streak alert (a source fetches real data but nothing survives the filter for 24 straight hourly runs — built from a real 115-run Ashby incident), write-gate-failure exclusion (3 consecutive same-check fails — built from an 18-day, 186-run dead-URL incident), debate-loss exclusion-spike alert (>20 exclusions in one run — built from a real [REDACTED] burst) |
| **Human-in-the-loop point** | Every command is a human-initiated, synchronous invocation — there is no unattended path at all | Discovery/write is fully unattended; a human only enters at promotion (`/promote-dossier`), tailoring, and outcome-recording — explicitly by design, per this repo's own agent-vs-script judgment-call section |

---

## What's genuinely, verifiably better in ai-job-search — and what isn't

**Real, confirmed capabilities internship-research-loop has no equivalent for:** LaTeX CV/cover-letter drafting with mandatory PDF-compile-and-visual-inspect iteration, PDF-text-layer ATS verification, drafter-reviewer critique separation, `/interview` prep-pack generation, `/upskill` gap analysis, salary benchmarking, and a generator command for adding new portal sources (`/add-portal`) rather than a hand-written module each time. These are not marketing — I read the actual command/skill files (`apply.md`, `04-job-evaluation.md`, `job-scraper/SKILL.md`, `tools/verify_pdf.py`) and its own 337-test suite passes for real.

**Not confirmed, and worth being honest about:** I did not install `bun` + a LaTeX distribution and actually run `/setup → /scrape → /apply` end-to-end in a live Claude Code session — that's a genuinely different kind of test than internship-research-loop's scriptable, CI-run pytest suite, and I haven't done it. So "it got the author hired, 69 applications, 20 interviews" (the README's own claim) is real testimony from its author, not something I independently verified working end-to-end here.

**Where "extremely better" doesn't hold up on inspection:** its discovery/sourcing side is *not* more sophisticated than internship-research-loop's — it's LLM-judged per-posting (expensive, non-deterministic, no persisted memory of a losing candidate, no failure-detection subsystems) against a much smaller, market-specific source set. internship-research-loop's zero-LLM filter/relevance/debate/write-gate stack, its three incident-driven alerting subsystems, and its fail-closed cost-ordered validation gate are all more engineered than anything on ai-job-search's discovery side — there's no equivalent of `debate_compare`, `MAX_DEBATE_LOSSES`, `write_gate_failures.json`, or the zero-match-streak alert anywhere in ai-job-search. The two systems are strong in *opposite* halves of the same overall problem: ai-job-search on the drafting/verification/interview/outcome half, internship-research-loop on the discovery/filtering/reliability half.

That's the comparison. No step 2.

**Tool calls:**

- `Bash`:
  ```bash
find / -maxdepth 6 -iname "internship-research-loop" -not -path "*/second-brain-claudekit/*" -not -path "/proc/*" 2>/dev/null
echo "---gh check---"
gh repo view gupta-builds/internship-research-loop --json name,description,defaultBranchRef 2>&1 | head -20
  ```
  ```
/home/anant_gupta/projects/work/internship-research-loop
---gh check---
{"defaultBranchRef":{"name":"master"},"description":"24/7 internship discovery — see Jarvis vault for full spec","name":"internship-research-loop"}
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/.claude/skills/job-application-assistant/04-job-evaluation.md`
- `Bash` — `cd /home/anant_gupta/projects/work/internship-research-loop && find . -maxdepth 2 -not -path "./.git*" -not -path "./.venv*" | sort`
  ```
.
./.claude
./.claude/agents
./.claude/context
./.claude/hooks
./.claude/rules
./.claude/settings.json
./.claude/settings.local.json
./.claude/skills
./.claudeignore
./.cursor
./.cursor/rules
./.cursor/skills
./.cursorignore
./.pytest_cache
./.pytest_cache/.gitignore
./.pytest_cache/CACHEDIR.TAG
./.pytest_cache/README.md
./.pytest_cache/v
./CLAUDE.md
./PRD.md
./README.md
./__pycache__
./__pycache__/enrich.cpython-312.pyc
./__pycache__/grade_resume.cpython-312.pyc
./__pycache__/recheck.cpython-312.pyc
./__pycache__/revalidate.cpython-312.pyc
./__pycache__/run_pipeline.cpython-312.pyc
./core
./core/__pycache__
./core/classify.py
./core/debate.py
./core/filter.py
./core/git_ops.py
./core/identity.py
./core/profile.yaml
./core/relevance.py
./core/run_log.py
./core/schema_drift.py
./enrich.py
./grade_resume.py
./graphify-out
./graphify-out/.gitignore
./graphify-out/.graphify_labels.json
./graphify-out/.graphify_root
./graphify-out/2026-08-21
./graphify-out/2026-08-22
./graphify-out/2026-08-23
./graphify-out/2026-08-24
./graphify-out/2026-08-25
./graphify-out/2026-08-28
./graphify-out/2026-08-31
./graphify-out/GRAPH_REPORT.md
./graphify-out/cache
./graphify-out/graph.html
./graphify-out/graph.json
./graphify-out/manifest.json
./ingestion
./ingestion/__pycache__
./ingestion/freehire.py
./ingestion/interndock.py
./ingestion/normalize.py
./ingestion/posting_page.py
./ingestion/sources.py
./jarvis-checkout
./logs
./logs/rechecks.jsonl
./logs/runs.jsonl
./recheck.py
./requirements.txt
./revalidate.py
./run_pipeline.py
./scripts
./scripts/hooks
./state
./state/capacity_notified.json
./state/debate_losses.json
./state/dossier_uids.json
./state/excluded_uids.json
./state/interndock_seen_guides.json
./state/opt_cache.json
./state/seen_ids.json
./tests
./tests/__pycache__
./tests/fixtures
./tests/test_classify.py
./tests/test_debate.py
./tests/test_debate_losses.py
./tests/test_enrich.py
./tests/test_filter.py
./tests/test_freehire.py
./tests/test_git_ops.py
./tests/test_grade_resume.py
./tests/test_identity.py
./tests/test_interndock.py
./tests/test_posting_page.py
./tests/test_recheck.py
./tests/test_relevance.py
./tests/test_revalidate.py
./tests/test_run_log.py
./tests/test_run_pipeline.py
./tests/test_schema_drift.py
./tests/test_sources.py
./tests/test_validate.py
./tests/test_write_gate_failures.py
./tests/test_writer.py
./tests/test_zero_match_alert.py
./vault_writer
./vault_writer/__pycache__
./vault_writer/templates
./vault_writer/validate.py
./vault_writer/writer.py
Shell cwd was reset to /home/anant_gupta/projects/ai/claude/second-brain-claudekit
  ```
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/run_pipeline.py`
- `Bash`:
  ```bash
gh api repos/gupta-builds/internship-research-loop/actions/workflows --jq '.workflows[] | {name, state, path}' 2>&1
echo "---last 3 runs of run.yml---"
gh run list --repo gupta-builds/internship-research-loop --workflow=run.yml --limit 5 --json databaseId,status,conclusion,createdAt 2>&1
  ```
  ```
{"name":"recheck","path":".github/workflows/recheck.yml","state":"active"}
{"name":"revalidate","path":".github/workflows/revalidate.yml","state":"active"}
{"name":"run","path":".github/workflows/run.yml","state":"disabled_manually"}
{"name":"test","path":".github/workflows/test.yml","state":"active"}
{"name":"Dependency Graph","path":"dynamic/dependabot/update-graph","state":"active"}
---last 3 runs of run.yml---
[{"conclusion":"success","createdAt":"2026-08-29T09:33:51Z","databaseId":33245785158,"status":"completed"},{"conclusion":"success","createdAt":"2026-08-29T02:36:30Z","databaseId":33229379499,"status":"completed"},{"conclusion":"success","createdAt":"2026-08-28T19:52:13Z","databaseId":33205750096,"status":"completed"},{"conclusion":"success","createdAt":"2026-08-28T07:57:31Z","databaseId":33153423258,"status":"completed"},{"conclusion":"success","createdAt":"2026-08-27T23:21:30Z","databaseId":33125988682,"status":"completed"}]
  ```
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/core/filter.py`
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/core/relevance.py`
- `Read` — `/home/anant_gupta/projects/work/internship-research-loop/vault_writer/validate.py`
- `Bash` — `cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search && wc -l .claude/commands/apply.md .claude/commands/rank.md .claude/skills/job-scraper/SKILL.md 2>/dev/null`
  ```
  368 .claude/commands/apply.md
  168 .claude/commands/rank.md
  282 .claude/skills/job-scraper/SKILL.md
  818 total
  ```
- `Bash` — `grep -n '^#\|^##\|^###\|^Step [0-9]' .claude/commands/apply.md | head -60`
  ```
1:# /apply - Drafter-Reviewer Job Application Workflow
21:## Step 0: Parse Input
33:## Step 1: DRAFTER - Evaluate Fit
62:## Step 2: DRAFTER - Draft CV + Cover Letter
79:### Requirement coverage (both documents)
86:### CV (`cv/main_<company>_<role><CV_EXT>`)
94:### Cover Letter (`cover_letters/cover_<company>_<role><COVER_EXT>`)
107:## Step 3: REVIEWER - Research & Critique
116:## Your Tasks
118:### 0. Trust Boundary (read first)
121:### 1. Research the Company
132:### 2. Read Reference Materials (content-critique only)
143:### 3. Factual Grounding Audit
146:### 4. Drafts to Review
157:### 5. Job Posting
162:### 6. Produce Feedback
194:## Step 4: DRAFTER - Revise Based on Feedback
211:## Step 5: DRAFTER - Compile & Inspect PDFs (MANDATORY)
215:### 5a. Compile
230:### 5b. Inspect layout
245:### 5c. Iterate until clean
257:### 5d. ATS & keyword verification (CV)
301:### 5e. Clean up build artifacts
307:## Step 6: Present Final Output
311:### Verification Checklist
314:### Key Tailoring Decisions
321:### Files Created
328:### Step 6b: Record the Application
358:### Application-Form Fields (Optional Third Artifact)
366:### Next Steps
  ```
- `Bash` — `grep -n '^#\|^##\|^###' .claude/skills/job-scraper/SKILL.md | head -60`
  ```
11:# Job Scraper
15:## How It Works
22:## Invocation
37:## Execution Steps
39:### Step 0: Load State
45:### Step 1: Search
51:#### 1a. Check bun availability
59:#### 1b. Run CLI tools (primary — run these in parallel where possible)
77:#### 1c. WebSearch fallback
88:### Step 2: Fetch & Parse
123:### Step 2.5: Mass-Posting Detection (within this run)
129:### Step 3: Quick Fit Assessment
139:### Step 4: Deduplicate & Store
173:### Step 4.5: Generate Referral Contact Links (High & Medium Fit Only)
197:### Step 4.75: Portal Health Check
212:### Step 5: Present Results
229:## New Job Matches - YYYY-MM-DD
246:### High-Match Highlights
252:### Contacts
266:### Step 6: Update Tracker (Optional)
272:## Important Rules
  ```

## You

There seems many interesting especially the skillets. Let's make a dag. This skill and using a much broader perspective on my internship research. All the skills, all the main skills that you mentioned over here. What warranty is done, and we buy it to a JetBlue like a crown jewel or maybe run manually at times, like, a dose here, run manually to return the entire resource at once. So they run all the internships till they're done about ready for the day. I have something to quickly go through the research and wondering if All the recurring resources need to be fully established. And we need to make sure that the resource is known when it's from what else. Internships, when don't do a job postings have been delayed But, mainly, this cannot be treated as a fatherly proto internship research, We're doing something different. But we can mimic a lot of things over here to further expand and improve internship research, on the early runs. I want something much better. I wanna look how to do it. I wonder if you're scared about actions to its complete maximum set rules for it. We'll keep our discovery product extremely extremely low. So what I've learned from you is to come up with it. What I can use from a job search to improve internship research group and look at it. Person who is using this and needs to allow these things immediately so that the allele runs and is perfectly The internship is cleaned up and we are ready to ingest small in internships. Of anything that's been there and documents and charges inside the torturing piece. Truth. If everything and a real comparison And think of a way on how exciting and the rape will be helpful to improve my interest in the group.

## Claude

This is heavily garbled by transcription, so let me state my read before building: you want a DAG showing (1) the existing automated, zero-LLM, hourly discovery pipeline left untouched as the "crown jewel," and (2) a new, separate, manually-triggered layer — borrowing ai-job-search's drafting/ATS/interview-prep/upskill pieces — that operates only on dossiers already in the vault, never touching discovery. I'll build that as a diagram you can look at. Let me load the design skill first.

**Tool calls:**

- `Skill` — `{"skill":"artifact-design"}`

## You

Approach this as the design lead at a small studio known for their versatility, giving every client a visual identity pitched at the treatment the task actually calls for. Make deliberate choices about palette, typography, and layout that are specific to this subject, and avoid templated designs.

## Read the request first

Calibrate treatment, not whether to design. A doc deserves the same craft as a landing page - what changes is the treatment that craft is delivered in. Format is not part of this read: author HTML, and publish Markdown only when a loaded skill explicitly instructs it - a Markdown publish keeps its filename as its title and takes almost none of the craft below, and is never a way to save time.

Many requests call for a more utilitarian treatment: a plan, a memo, a demo. Make it polished: include real typographic hierarchy, considered spacing, and a proper palette, but avoid over-designing. Most pages do not need a flashy, gigantic hero. Keep flourishes tasteful and limited.

Some requests call for an editorial treatment: a landing page, a game, an app or tool they'll keep or share.

When unsure: a well-composed page is never the wrong answer; an over-designed visual identity sometimes is.

Fundamentals below apply to everything. The editorial process after that runs only when the read above says so.

## Fundamentals for every artifact

**Honor what's already there** Look for an existing design system first - CLAUDE.md, a tokens or theme file, existing component styles. When one exists, apply it; everything below fills gaps and never overrides. Precedence is always: the user's own words, then the project's existing system, then your choices.

**Ground it in the subject.** If the subject isn't already clear, pin it: one concrete subject, its audience, and the page's single job. The subject's own world - its materials, instruments, vernacular - is where distinctive choices come from. Whatever the treatment, carry at least one detail only this subject would have - its real units and scales, its document conventions, its terms of art - as content, not ornament; it costs a plain page nothing. Build with real content throughout, never lorem.

**Pair typefaces** Typography carries the page even when the page isn't about typography. Google Fonts is the one font host the Artifact CSP admits - link it directly (`<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=...&display=swap">`); a face from anywhere else must be inlined as a @font-face data URI or it falls back silently. Either way, declare a real fallback stack. Keep running text near 65 characters wide; set a type scale and stay on it; give headings `text-wrap: balance`, body text room to breathe, and uppercase labels a touch of letter-spacing.

**Load libraries, don't paste them.** When the page genuinely needs a library - React, a charting or highlighting package - load its UMD build from cdnjs (only the script - a library's stylesheet still has to be inlined) with one pinned `<script src="https://cdnjs.cloudflare.com/ajax/libs/...">` placed before the inline script that uses its global, instead of inlining the library's source or hand-writing a stand-in; the Artifact tool's description lists the few other script hosts the CSP admits. The page's own CSS and JS, its images and its data ship with the page. Most pages need no library at all - reach for one only when it carries real weight.

**Choose neutrals, don't default to them.** A pure mid-grey reads as unconsidered; a grey with a slight hue bias toward the page's accent reads as chosen. Pure white and near-black are fine grounds when they suit the subject - the point is that the neutral was picked, not inherited.

**Design both themes.** The page renders in the viewer's theme, and the viewer has three states, not two: an explicit choice stamps `data-theme="dark"` / `data-theme="light"` on the root element, and the default "system" setting stamps *nothing* - most viewers see the un-stamped document, where only `prefers-color-scheme` separates light from dark. Structure the CSS token-level for all three: the bare `:root` block defines the complete light palette (for a deliberately dark-first design, swap light and dark consistently through this whole pattern); `@media (prefers-color-scheme: dark)` redefines only the tokens, guarded as `:root:not([data-theme="light"])` so an explicit light choice beats a dark OS; `:root[data-theme="dark"]` redefines them again so the toggle also wins in the other direction. Style components through the tokens, never directly inside a media or `[data-theme]` block - a color whose only definition sits behind `[data-theme]` never applies in the un-stamped state, and the page renders one theme's text on the other theme's ground. Two more rules keep each theme resolving as a set: the artifact composites over a ground the viewer paints in *its* theme, so `body` must set an explicit `background` from a token - a transparent body silently borrows the host's ground; and every element that sets a color takes it from the same token set as the surface behind it, never a literal that only works in one theme. Declare every token in the bare `:root` block before any media or `[data-theme]` block redefines it - a color that exists only inside one of those blocks is the classic unreadable-artifact bug. Give the second theme the same care as the first - don't naively invert; keep contrast legible and the accent working on both grounds. A design that deliberately commits to one visual world (a neon arcade screen, a letterpress invitation) may stay single-theme - then skip the media query and stamps entirely but still paint the background and every color explicitly, so the page holds on either host ground; make it a choice, not an omission.

**Let layout do the spacing.** Lay out sibling groups with flex or grid and `gap`, not per-element margins that silently collapse or double. Wide content - tables, code, diagrams - gets `overflow-x: auto` on its own container so the page body never scrolls sideways. Reach for `font-variant-numeric: tabular-nums` wherever digits line up in columns.

**Compose repeated things as one object.** Cards in a row, label/value pairs down a list, badges on siblings: same edges, baselines and inner padding from one to the next, and a recurring element sits in the same place on each. Let content set a container's height and pick a column count the items fill, so nothing stretches over dead space or sits alone in a row. Text that can outgrow its track wraps or scrolls in its own container; clipped text is a bug.

**Not everything is a card.** Border, fill, radius and shadow each say "separate object" - spend them by role, lifting the one thing that needs it, instead of one radius and one shadow stamped on every block, which flattens the hierarchy. Lead with big-number tiles only when those figures are the point of the page.

**Draw charts to the scale.** One scale places marks, ticks and labels, and every label names a value the chart reaches; chart text takes its color from the theme tokens so it reads in both themes; marks, labels and edges stay clear of one another and inside the drawing's bounds - in SVG, leave room in the viewBox for the outermost labels and give every drawn shape an explicit fill.

**Show the page at rest.** Everything meant to be read is visible once the page has loaded, without scrolling to trigger it - that first still frame is what a thumbnail, a shared link, and a skimming reader all get. A section may animate in, but from a visible resting state, never parked at `opacity: 0` waiting on an observer. Size a hero to what it holds, not to the viewport; a `100vh` opener pushes the page itself out of that first frame. A tool or app opens in a realistic working state - the user's real data where it exists, otherwise example rows, a loaded sample, a form someone plausibly filled, plainly marked as examples and never passed off as the user's own figures - so the first look shows what it does; an empty shell waiting for input shows nothing.

**Avoid AI-generated design** AI-generated design currently clusters around a few looks: warm cream (#F4F1EA) with a serif display and terracotta accent; near-black with a lone acid-green or vermilion pop; broadsheet hairline rules with dense columns; a purple-to-blue gradient hero on white; Inter or Space Grotesk as the "safe" face; emoji as section markers; everything centered; `rounded-lg` everywhere; accent bar/rail on rounded cards. Where the user pins down a visual direction, follow it exactly - their words always win, including when they ask for one of these looks. Where nothing is specified, don't spend that freedom on one of these defaults.

**Build cleanly** Be cognizant of overlapping elements, cascade collisions, silent font fallbacks. Close every non-void element, double-quote attributes, give keyboard focus a visible state, respect `prefers-reduced-motion`. For generative or decorative graphics, reach for Canvas or WebGL rather than hand-authoring long SVG path data.

**CSS rules** When writing the CSS, watch your selector specificities. It is easy to generate classes that cancel each other out - a type-based selector like `.section` fighting an element-based one like `.cta` over padding and margins between sections. Structure the cascade so it doesn't silently undo your spacing.

**Writing the copy** Words are design material, not decoration. Write from the user's side of the screen - name things by what people recognize, not how the system is built (a person manages *notifications*, not *webhook config*). Active voice; a control says exactly what happens ("Publish", then a toast that says "Published"). Errors explain what went wrong and how to fix it - no apologies, no vagueness. Specific beats clever.

**Name the page like a product, not a caption.** The `<title>` is the artifact's name in the gallery and the browser tab, and it sets the reader's first impression of care. Give the page a real name: a short noun phrase, typically two to four words, specific to the subject - or, for a page that exists to answer one question, that question itself, which is then the page's name. Stop at the name - a title that carries its own explainer after a dash or colon reads as generated filler. The name must also identify the page among many: in the gallery it sits beside dozens of other artifacts, and a generic category label that could sit on any of them fails as a name just as surely as an appended explainer. When a candidate title pairs the name with a generic word - a greeting, a category, a page-type label - the name is the half to keep; a trim that drops the identity and keeps the generic word produces exactly the title that could sit on any page. And the rule removes explainers, it does not impose brevity: a multi-word title that already reads as one specific name is finished, and shortening it further only makes it generic. The one-sentence publish `description` is where the explanation belongs; the gallery shows it right under the title.

**Structure is information** Structural devices, numbering, eyebrows, dividers, labels, should encode something true about the content, not decorate it. Many generic designs use numbered markers (01 / 02 / 03), but that's only appropriate if the content actually is a sequence - like a real process or a typed timeline where order carries information the reader needs. Question if choices like numbered markers actually make sense before incorporating them.

**When it's a UI, not a document** A dashboard or tool is scanned and operated, not read top-to-bottom, so the craft shifts from typography to information design. Surface the summary before the detail; encode state in form as well as number - a pill, a chip, a severity stripe - so what needs attention reads at a glance. Semantic color (good / warning / critical) is separate from the accent hue and doesn't count as your accent. Give sparklines and charts the same care as type: an area fill, a faint grid, an emphasized endpoint. What's interactive should look interactive.



## Process

Start with what the viewer should be able to do on the page, not only what they will read: if it should take input, keep what people change for whoever opens it next, show live data, or ask Claude something, load the `artifact-capabilities` skill now and design around what it makes available to this user; a page that is only read needs none of that.

Before writing code, sketch a short design plan - a compact token system with color, type, and layout:
- **Color**: describe the palette as 4-6 named hex values.
- **Type**: typefaces for 2+ roles - a characterful display face used with restraint, a complementary body face, and a utility face for captions or data if needed.
- **Layout**: a layout concept in one or two sentences.

Then build, following the plan and deriving every color and type decision from it.

**Write, look once, publish.** Before publishing you may look at the rendered page once - one screenshot of the local file, or the Artifact tool's preview where it offers one - then one pass of edits for what it shows, without a second look. For a page that charts real numbers, take that look rather than skip it, and spend it on the chart. Don't build a test loop around your own file: no repeated screenshots, no pulling the script out to run it through node, no scripts that probe the DOM. That loop spends the session re-checking what a careful write already settled, while the user waits for a link. Then publish, check once any `window.claude` call the preview couldn't run, and stop: the live page is the review surface, and further polish is the user's to ask for. If the user reports something visibly broken - a clipped column, unreadable text, a control that does nothing - fix that and republish once.

## When the request is editorial

The stance shifts: the client has already rejected proposals that felt templated, and is paying for a distinctive point of view. Make opinionated calls, and take one real aesthetic risk where it serves the work.

Review the design plan against the subject before building: if any part of it reads like the generic default you would produce for any similar page, revise that part, and note what you changed and why. Only after you've confirmed the plan's uniqueness do you write the code, following the revised plan exactly.

**Principles** 

- The hero is a thesis: open with the most characteristic thing in the subject's world - headline, image, live demo, interactive moment. 
- Typography carries the personality of the page. Pair the display and body faces deliberately, not the same families you would reach for on any other project, and set a clear type scale with intentional weights, widths, and spacing. Make the type treatment itself a memorable part of the design, not a neutral delivery vehicle for the content. 
- Leverage motion deliberately. Think about where and if animation can serve the subject: a page-load sequence, hover micro-interactions, ambient atmosphere. An orchestrated moment usually lands harder than scattered effects; choose what the direction calls for. However, sometimes less is more, and extra animation contributes to the feeling that the design is AI-generated. 
- Match complexity to the vision. Maximalist directions need elaborate execution; minimal directions need precision in spacing, type, and detail. Elegance is executing the chosen vision well.
- Spend your boldness in one place; keep everything around it quiet. If the accent fights the ground, shift it toward analogous or drop saturation rather than replacing it.


## Claude

Let me fix a leftover broken CSS line I noticed before publishing.

Now publishing.

**Pipeline Blueprint** is published: https://claude.ai/code/artifact/[REDACTED]

Two rails, kept deliberately separate:

**A — Discovery Engine** (automated, hourly, zero-LLM, unchanged): every real gate from `run_pipeline.py`/`core/filter.py`/`core/relevance.py`/`vault_writer/validate.py` — the 10 direct sources + InternDock, the match/stage-1 gate, dedup against `seen_ids.json`/`excluded_uids.json`, the debate-and-budget prioritizer (48 losses → excluded), the content/OPT check, the 5-check write gate (3× same failure → excluded), push, and the daily `recheck.yml` staleness pass. This is the half you asked me to keep "extremely low" — nothing in it changes.

**B — Application Bench** (manual, on-demand, LLM-judged, proposed): starts only after a human runs the existing `/promote-dossier`, then a new batch-trigger command would process every queued Serious program in one pass — drafting CV/cover letter and ATS-verifying it (both **dashed = blocked** today, waiting on real `Main Resume.md`/`Main Cover Letter.md`), company-research caching and the periodic upskill pass (both **solid = buildable now**, no dependency), interview prep (blocked transitively), and outcome tracking into the existing Tracker note. Each borrowed node cites the real ai-job-search file it's modeled on.

Two things it also settles directly: dossier provenance is already tracked (`source`/`matched_reason` are required frontmatter fields), and a closed/delayed posting is already handled by the daily recheck — neither needs new work.

Nothing was implemented — this is the comparison only, per your instruction.

**Tool calls:**

- `Write` — `/tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/17f6ac23-f88c-4c39-bc2e-40b2c0213320/scratchpad/pipeline-blueprint.html`
  ```
<title>Pipeline Blueprint</title>
<style>
  :root{
    --bg: #eef2f6;
    --paper: #ffffff;
    --ink: #16324a;
    --ink-soft: #52697c;
    --ink-faint: #8199ab;
    --line: #c3d2dd;
    --line-strong: #9db3c2;
    --auto: #a8631c;
    --auto-soft: #f3e3cf;
    --manual: #0f7d8c;
    --manual-soft: #d9eef0;
    --blocked: #a4413c;
    --blocked-soft: #f3ded d;
    --blocked-soft: #f6e3e1;
    --shadow: 0 1px 2px rgba(22,50,74,0.06), 0 6px 20px rgba(22,50,74,0.05);
  }
  @media (prefers-color-scheme: dark){
    :root:not([data-theme="light"]){
      --bg: #0c2032;
      --paper: #10293e;
      --ink: #dfeaf2;
      --ink-soft: #a9c0cf;
      --ink-faint: #7994a6;
      --line: #2c4a60;
      --line-strong: #3d5f78;
      --auto: #e0a44e;
      --auto-soft: #3a2f1c;
      --manual: #55d3df;
      --manual-soft: #123338;
      --blocked: #e2908c;
      --blocked-soft: #3a2222;
      --shadow: 0 1px 2px rgba(0,0,0,0.3), 0 8px 24px rgba(0,0,0,0.35);
    }
  }
  :root[data-theme="dark"]{
    --bg: #0c2032;
    --paper: #10293e;
    --ink: #dfeaf2;
    --ink-soft: #a9c0cf;
    --ink-faint: #7994a6;
    --line: #2c4a60;
    --line-strong: #3d5f78;
    --auto: #e0a44e;
    --auto-soft: #3a2f1c;
    --manual: #55d3df;
    --manual-soft: #123338;
    --blocked: #e2908c;
    --blocked-soft: #3a2222;
    --shadow: 0 1px 2px rgba(0,0,0,0.3), 0 8px 24px rgba(0,0,0,0.35);
  }

  *{ box-sizing: border-box; }
  body{
    background: var(--bg);
    color: var(--ink);
    font-family: 'IBM Plex Sans', system-ui, -apple-system, sans-serif;
    padding: 28px 20px 64px;
  }
  h1,h2,h3{ text-wrap: balance; margin: 0; }
  .mono{ font-family: 'IBM Plex Mono', ui-monospace, 'SF Mono', monospace; }
  .sheet{ max-width: 1320px; margin: 0 auto; }

  /* ---------- title block ---------- */
  .titleblock{
    display: flex; justify-content: space-between; gap: 32px;
    align-items: flex-end;
    background: var(--paper);
    border: 1px solid var(--line);
    border-radius: 10px;
    padding: 22px 26px;
    box-shadow: var(--shadow);
    margin-bottom: 22px;
    flex-wrap: wrap;
  }
  .tb-eyebrow{
    font-family: 'Barlow Condensed', sans-serif;
    font-weight: 600;
    letter-spacing: 0.14em;
    text-transform: uppercase;
    font-size: 0.78rem;
    color: var(--ink-faint);
    margin-bottom: 6px;
  }
  .titleblock h1{
    font-family: 'Barlow Condensed', sans-serif;
    font-weight: 700;
    font-size: clamp(1.6rem, 2.4vw, 2.3rem);
    letter-spacing: 0.01em;
    color: var(--ink);
  }
  .titleblock h1 .vs{ color: var(--ink-faint); font-weight: 500; padding: 0 6px; }
  .tb-sub{ color: var(--ink-soft); font-size: 0.95rem; margin-top: 8px; max-width: 60ch; }
  .tb-meta{ display: flex; flex-direction: column; gap: 9px; margin: 0; min-width: 260px; }
  .tb-meta > div{ display: flex; justify-content: space-between; gap: 16px; font-size: 0.82rem; border-bottom: 1px dotted var(--line); padding-bottom: 6px; }
  .tb-meta dt{ color: var(--ink-faint); font-family: 'Barlow Condensed', sans-serif; letter-spacing: 0.08em; text-transform: uppercase; font-weight: 600; }
  .tb-meta dd{ margin: 0; text-align: right; color: var(--ink); font-weight: 500; }
  .flag-off{ color: var(--blocked); }
  .flag-rule{ color: var(--auto); }

  /* ---------- panels ---------- */
  .panel{
    background: var(--paper);
    border: 1px solid var(--line);
    border-radius: 10px;
    padding: 22px 26px 26px;
    box-shadow: var(--shadow);
    margin-bottom: 20px;
  }
  .panel-head{ display: flex; align-items: baseline; gap: 12px; margin-bottom: 6px; flex-wrap: wrap; }
  .panel-head h2{
    font-family: 'Barlow Condensed', sans-serif;
    font-weight: 700;
    font-size: 1.5rem;
    letter-spacing: 0.01em;
  }
  .panel-head small{
    font-family: 'Barlow Condensed', sans-serif;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    font-size: 0.78rem;
    color: var(--ink-faint);
    font-weight: 600;
  }
  .tag-letter{
    display: inline-flex; align-items: center; justify-content: center;
    width: 26px; height: 26px; border-radius: 6px;
    font-family: 'Barlow Condensed', sans-serif; font-weight: 700; font-size: 1rem;
  }
  .panel-auto .tag-letter{ background: var(--auto-soft); color: var(--auto); }
  .panel-manual .tag-letter{ background: var(--manual-soft); color: var(--manual); }
  .panel-note{ color: var(--ink-soft); font-size: 0.88rem; max-width: 90ch; margin: 4px 0 18px; }

  .lane-wrap{ overflow-x: auto; padding-bottom: 4px; }
  .lane{ display: flex; align-items: flex-start; gap: 0; min-width: max-content; }

  .arrow{
    color: var(--ink-faint);
    font-size: 1.1rem;
    margin: 30px 6px 0;
    flex-shrink: 0;
  }
  .panel-auto .arrow{ color: color-mix(in srgb, var(--auto) 55%, var(--ink-faint)); }
  .panel-manual .arrow{ color: color-mix(in srgb, var(--manual) 55%, var(--ink-faint)); }

  .cell{ display: flex; flex-direction: column; align-items: center; gap: 6px; flex-shrink: 0; width: 196px; }

  .node{
    width: 100%;
    border-radius: 8px;
    border: 1.5px solid var(--line-strong);
    background: var(--bg);
    padding: 10px 12px 11px;
    min-height: 78px;
  }
  .node.blocked{ border-style: dashed; border-color: var(--blocked); background: var(--blocked-soft); }
  .node-title{
    display: flex; align-items: center; gap: 6px;
    font-weight: 600; font-size: 0.86rem; line-height: 1.2;
  }
  .gate-mark{
    width: 8px; height: 8px; flex-shrink: 0;
    transform: rotate(45deg);
    border-radius: 1px;
  }
  .panel-auto .gate-mark{ background: var(--auto); }
  .panel-manual .gate-mark{ background: var(--manual); }
  .node-detail{ font-size: 0.74rem; color: var(--ink-soft); margin-top: 5px; line-height: 1.35; }
  .node-cite{
    font-size: 0.68rem; color: var(--ink-faint); margin-top: 6px;
    padding-top: 5px; border-top: 1px dotted var(--line);
  }
  .node.blocked .node-cite{ color: var(--blocked); }

  .branch{ display: flex; flex-direction: column; align-items: center; gap: 3px; }
  .branch-line{ width: 1px; height: 12px; background: var(--line-strong); }
  .state-tag{
    font-family: 'IBM Plex Mono', monospace;
    font-size: 0.66rem;
    padding: 3px 8px;
    border: 1px dashed var(--line-strong);
    border-radius: 5px;
    color: var(--ink-soft);
    background: var(--paper);
    white-space: nowrap;
  }
  .alert-tag{
    font-size: 0.66rem;
    padding: 3px 8px;
    border-radius: 5px;
    background: var(--auto-soft); color: var(--auto);
    font-weight: 600; white-space: nowrap;
  }
  .panel-manual .alert-tag{ background: var(--manual-soft); color: var(--manual); }

  .sources-cell{ width: 226px; }
  .source-grid{
    display: grid; grid-template-columns: 1fr 1fr; gap: 4px;
  }
  .source-chip{
    font-family: 'IBM Plex Mono', monospace; font-size: 0.68rem;
    padding: 4px 6px; border-radius: 5px;
    background: var(--auto-soft); color: var(--auto);
    text-align: center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
  }
  .source-chip.alt{ background: var(--manual-soft); color: var(--manual); }

  /* ---------- legend + closing note ---------- */
  .bottom-grid{ display: grid; grid-template-columns: 1.1fr 1fr; gap: 20px; align-items: start; }
  @media (max-width: 880px){ .bottom-grid{ grid-template-columns: 1fr; } }

  .legend-grid{ display: grid; grid-template-columns: 1fr 1fr; gap: 10px 22px; margin-top: 14px; }
  .legend-item{ display: flex; align-items: center; gap: 9px; font-size: 0.82rem; color: var(--ink-soft); }
  .swatch{ width: 30px; height: 3px; flex-shrink: 0; border-radius: 2px; }
  .swatch.solid-auto{ background: var(--auto); }
  .swatch.solid-manual{ background: var(--manual); }
  .swatch.dashed{ background: none; border-top: 2px dashed var(--blocked); height: 0; }
  .legend-shape{ width: 14px; height: 14px; flex-shrink: 0; }
  .legend-shape.gate{ transform: rotate(45deg); background: var(--ink-faint); border-radius: 2px; }
  .legend-shape.state{ border: 1px dashed var(--line-strong); border-radius: 3px; }

  .note-list{ list-style: none; margin: 14px 0 0; padding: 0; display: flex; flex-direction: column; gap: 14px; }
  .note-list li{ font-size: 0.86rem; color: var(--ink-soft); padding-left: 16px; border-left: 2px solid var(--line-strong); }
  .note-list strong{ color: var(--ink); font-weight: 600; }

  .foot{ text-align: center; color: var(--ink-faint); font-size: 0.78rem; margin-top: 26px; font-family: 'IBM Plex Mono', monospace; }
</style>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@500;600;700&family=IBM+Plex+Sans:wght@400;500;600&family=IBM+Plex+Mono:wght@400;500&display=swap">

<div class="sheet">

  <header class="titleblock">
    <div>
      <div class="tb-eyebrow">Schematic comparison — not a merge proposal</div>
      <h1>internship&#8209;research&#8209;loop <span class="vs">×</span> ai&#8209;job&#8209;search</h1>
      <p class="tb-sub">Two different machines for the same goal. This sheet keeps them on separate rails and shows exactly where one could lend the other a part &mdash; without asking discovery to change what it is.</p>
    </div>
    <dl class="tb-meta">
      <div><dt>run.yml</dt><dd class="flag-off">disabled_manually since 2026&#8209;08&#8209;29</dd></div>
      <div><dt>Standing rule</dt><dd class="flag-rule">discovery stays zero&#8209;LLM</dd></div>
      <div><dt>Sheet</dt><dd>1 of 1 &middot; read only</dd></div>
    </dl>
  </header>

  <section class="panel panel-auto">
    <div class="panel-head">
      <span class="tag-letter">A</span>
      <h2>Discovery Engine</h2>
      <small>automated &middot; hourly &middot; zero&#8209;LLM &middot; unchanged</small>
    </div>
    <p class="panel-note">Every gate below is a regex, a set lookup, or a comparator function &mdash; no agent reads a posting in this half. This is the half already doing more real engineering than ai&#8209;job&#8209;search's own discovery side.</p>

    <div class="lane-wrap">
      <div class="lane">

        <div class="cell sources-cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>10 sources + InternDock</div>
            <div class="source-grid">
              <span class="source-chip">SimplifyJobs</span>
              <span class="source-chip">JGCL</span>
              <span class="source-chip">vanshb03</span>
              <span class="source-chip">zshah101</span>
              <span class="source-chip">ApplyGuy</span>
              <span class="source-chip">Greenhouse</span>
              <span class="source-chip">Ashby</span>
              <span class="source-chip">Lever</span>
              <span class="source-chip">Freehire</span>
              <span class="source-chip">AIJobs</span>
            </div>
            <div class="node-cite mono">InternDock &mdash; Firecrawl leg, own state</div>
          </div>
          <div class="branch">
            <span class="branch-line"></span>
            <span class="alert-tag">halt + GH issue on schema drift</span>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Match + Stage 1</div>
            <div class="node-detail">core/filter.py::matches() &mdash; permissive by default, only an affirmative negative signal rejects</div>
            <div class="node-cite mono">stage1_reject() &mdash; title only</div>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Dedup</div>
            <div class="node-detail">already&#8209;seen and permanently&#8209;excluded uids drop here, before a Firecrawl credit is spent</div>
          </div>
          <div class="branch">
            <span class="branch-line"></span>
            <span class="state-tag">seen_ids.json</span>
            <span class="state-tag">excluded_uids.json</span>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Debate &amp; Budget</div>
            <div class="node-detail">preferred&#8209;tier &rarr; bucket fill&#8209;need &rarr; recency &middot; 3 / 3 / 3 / 1 per bucket, per run</div>
          </div>
          <div class="branch">
            <span class="branch-line"></span>
            <span class="state-tag">debate_losses.json</span>
          </div>
          <div class="branch">
            <span class="alert-tag">48 losses &rarr; excluded &amp; logged</span>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Content + OPT check</div>
            <div class="node-detail">stage2_confirm on fetched content &middot; OPT / PhD&#8209;only exclusion</div>
          </div>
          <div class="branch">
            <span class="branch-line"></span>
            <span class="state-tag">opt_cache.json</span>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Write Gate</div>
            <div class="node-detail">5 checks, cost&#8209;ordered, fail&#8209;closed: fields &rarr; not&#8209;dup &rarr; cross&#8209;source &rarr; url&#8209;live &rarr; format</div>
          </div>
          <div class="branch">
            <span class="alert-tag">3&times; same fail &rarr; excluded</span>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Dossier + Push</div>
            <div class="node-detail">bucket folder in the Jarvis vault &middot; seen_ids only updates after a confirmed push</div>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Daily recheck</div>
            <div class="node-detail">recheck.yml removes a dossier once its posting closes upstream</div>
          </div>
        </div>

      </div>
    </div>
  </section>

  <section class="panel panel-manual">
    <div class="panel-head">
      <span class="tag-letter">B</span>
      <h2>Application Bench</h2>
      <small>manual &middot; on&#8209;demand &middot; LLM&#8209;judged &middot; proposed</small>
    </div>
    <p class="panel-note">Never touches discovery. Starts only once a human has already picked a dossier. Parts borrowed from ai&#8209;job&#8209;search are cited on each node &mdash; solid border means it could be built today, dashed means it waits on one real, named thing.</p>

    <div class="lane-wrap">
      <div class="lane">

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>/promote&#8209;dossier</div>
            <div class="node-detail">human picks one dossier &middot; already live</div>
          </div>
          <div class="branch">
            <span class="branch-line"></span>
            <span class="state-tag">Program / Contact / Tracker notes</span>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Batch trigger <em>(new)</em></div>
            <div class="node-detail">one manual command &middot; runs every Serious program with no draft yet, in one pass</div>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node blocked">
            <div class="node-title"><span class="gate-mark"></span>Draft CV + Letter</div>
            <div class="node-detail">LaTeX, moderncv + cover.cls pattern</div>
            <div class="node-cite mono">needs: Main Resume.md, Main Cover Letter.md</div>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node blocked">
            <div class="node-title"><span class="gate-mark"></span>ATS + PDF verify</div>
            <div class="node-detail">text&#8209;layer extraction, keyword coverage vs. the posting</div>
            <div class="node-cite mono">cf. ai&#8209;job&#8209;search tools/verify_pdf.py</div>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Company research cache</div>
            <div class="node-detail">30&#8209;day TTL, one file per company &middot; buildable now, no dependency</div>
            <div class="node-cite mono">cf. ai&#8209;job&#8209;search company_research/*.json</div>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node blocked">
            <div class="node-title"><span class="gate-mark"></span>Interview prep pack</div>
            <div class="node-detail">stage&#8209;specific, built from the actual submitted materials</div>
            <div class="node-cite mono">cf. ai&#8209;job&#8209;search /interview</div>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Outcome &rarr; Tracker</div>
            <div class="node-detail">tracking agent updates the existing Tracker note</div>
          </div>
        </div>

        <span class="arrow">&rarr;</span>

        <div class="cell">
          <div class="node">
            <div class="node-title"><span class="gate-mark"></span>Upskill (periodic)</div>
            <div class="node-detail">runs weekly, not per posting &middot; buildable now</div>
            <div class="node-cite mono">cf. ai&#8209;job&#8209;search /upskill</div>
          </div>
        </div>

      </div>
    </div>
  </section>

  <section class="panel bottom-grid">
    <div>
      <div class="panel-head"><h2 style="font-size:1.15rem">Key</h2></div>
      <div class="legend-grid">
        <div class="legend-item"><span class="legend-shape gate"></span> deterministic gate / check</div>
        <div class="legend-item"><span class="legend-shape state"></span> persisted state file</div>
        <div class="legend-item"><span class="swatch solid-auto"></span> automated, zero&#8209;LLM path</div>
        <div class="legend-item"><span class="swatch solid-manual"></span> manual, on&#8209;demand path</div>
        <div class="legend-item"><span class="swatch dashed"></span> blocked on a named dependency</div>
        <div class="legend-item"><span style="color:var(--auto); font-weight:600;">amber tag</span> &nbsp;alert &rarr; files a GitHub issue</div>
      </div>
    </div>
    <div>
      <div class="panel-head"><h2 style="font-size:1.15rem">Two things this already answers</h2></div>
      <ul class="note-list">
        <li><strong>Provenance is already tracked.</strong> Every dossier's frontmatter requires <span class="mono">source</span> and <span class="mono">matched_reason</span> (<span class="mono">vault_writer/validate.py</span>'s required fields) &mdash; there's no missing "where did this come from" gap to close.</li>
        <li><strong>Closed postings are already handled.</strong> <span class="mono">recheck.yml</span> runs daily and removes a dossier once its posting closes upstream &mdash; a delayed or dead listing doesn't need a new mechanism, it needs Panel A's own <span class="mono">run.yml</span> turned back on.</li>
      </ul>
    </div>
  </section>

</div>
<div class="foot">read&#8209;only sheet &middot; no files were changed to produce this comparison</div>

  ```
- `Edit` — `/tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/17f6ac23-f88c-4c39-bc2e-40b2c0213320/scratchpad/pipeline-blueprint.html`
  ```diff
  -     --blocked: #a4413c;
    --blocked-soft: #f3ded d;
    --blocked-soft: #f6e3e1;
    --shadow: 0 1px 2px rgba(22,50,74,0.06), 0 6px 20px rgba(22,50,74,0.05);
  +     --blocked: #a4413c;
    --blocked-soft: #f6e3e1;
    --shadow: 0 1px 2px rgba(22,50,74,0.06), 0 6px 20px rgba(22,50,74,0.05);
  ```
- `Artifact` — `{"file_path":"/tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/scratchpad/pipeline-blueprint.html","title":"Pipeline Blueprint","description":"A schematic comparing internship-research-loop's automated zero-LLM discovery engine against a proposed manual, on-demand application bench borrowed from ai-job-search.","favicon":"📐"}`

## You

he artifact createdis just some fancy diagrams with less content in it. Make sure to add rich content to the artifact created regarding how exactly is the ai-job-search useful to us and ways we can steal content from it for our use. Make much better content laid out and perfect our process to be something much better? we need to steals skills and a lot of other things about this repo which is extremely useful for us. he things that really do the work. So, the pipeline artifact created right now is extremely thin. But we are going to fix that by adding good extensive information over here. Let's divide this in two manners now. Everything that we need from the sandbox for the internship-research-loop setup. The other session inside here will focus on reviewing everything from the internship research loop already existing. How to further enhance each and every other process. How to write skills,agents, commands, hooks, etc. i detail. Refer to the official anthropic docs for extreme detail on this one. After coming up good source of information we will be establishing those ideas and executions as notes. How to make the best skills? How to make the skills to be self improving at all times? How exactly do the agents monitor over the skills at all times? How can we registyer the information on each skill run for useful purposes?How do we note down the thinking and output providing format? I want to completely understand how exactly to operate with everything in this second session. Because that is going to be doing a lot of research on writing the templatyes, how to's ..., etc. A lot of ground work will be laid out in this pass so that we always write excellent, well formatted and beautiful tools.

## Claude

Two tracks, as you said. I'll expand the artifact with real substance myself (Track 1), and spin up a background research pass for Track 2 — reviewing internship-research-loop's own `.claude/` and the official Anthropic docs to write real authoring Standards/Templates. Let me pull a few more real ai-job-search tool files first so the artifact content is grounded, not guessed.

Now the content section itself, inserted between Panel B and the Key/legend section.

Republishing to the same URL with the new content.

Artifact updated at the same link with the full Steal List (13 real items, sourced, tiered, no marketing claims).

Now launching Track 2 in the background — reviewing internship-research-loop's real `.claude/` setup against official Anthropic docs to produce authoring Standards/Templates. This is a substantial research pass, so I'm forking rather than blocking on it.

Both tracks are moving:

**Track 1 (done, on-screen now):** The artifact at the same link now has real substance — a "Steal List" of 13 items from ai-job-search, each cited to its real source file, sorted into:
- **Featured pick** — a `/add-source` generator modeled on `/add-portal`, since it targets internship-research-loop's own most-repeated manual chore (six sources hand-written so far) without adding any LLM judgment to the hourly path.
- **Tier 2 (buildable now, no dependency):** permission/hook allowlist guard, skill/command lint, a "did you bump it" convention-drift gate, company-research cache.
- **Tier 3 (real, parked):** ATS/PDF verify, drafter-reviewer critique, interview prep, upskill gap analysis — each named against its actual blocker, not lumped together.
- **Not applicable, said plainly:** upstream-triage tooling (no upstream to track) and the robots.txt retry gate (nothing here raw-scrapes).

**Track 2 (running in the background):** a fork is reading internship-research-loop's real `.claude/` setup, pulling Anthropic's live docs per this repo's own `anthropic-docs-reference.md` convention, and writing grounded Standards/Templates/Patterns notes on skill/agent authoring, self-improvement, monitoring, run-logging, and thinking/output-format conventions — saying plainly wherever the docs are silent rather than inventing an answer. I'll report back when it finishes.

**Tool calls:**

- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/security_guards.py`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/robots_check.py`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search/tools/upstream_triage.py`
- `Bash` — `sed -n '1,40p' tools/lint_skills.py && echo "---check_framework_version---" && sed -n '1,30p' tools/check_framework_version.py`
  ```
#!/usr/bin/env python3
"""Lint the repo's skill, command, and settings files.

Run from anywhere: python tools/lint_skills.py

Checks:
- Every SKILL.md (.claude/skills/*, .agents/skills/*) has YAML frontmatter that
  parses, with non-empty `name` and `description` keys
- `allowed-tools` entries of the form `Bash(bun run <path> *)` point at files
  that exist (skill paths resolve relative to the repo root and to .agents/)
- Every .claude/commands/*.md starts with a `# /<name>` title
- .claude/settings.json is valid JSON with a permissions.allow list

Exit code 0 on success, 1 with a failure list otherwise.
"""

import json
import re
import sys
from pathlib import Path

try:
    import yaml
except ImportError:
    sys.exit("lint_skills.py requires PyYAML: pip install pyyaml")

ROOT = Path(__file__).resolve().parent.parent
errors: list[str] = []


def rel(path: Path) -> str:
    return str(path.relative_to(ROOT))


def check_skill(path: Path) -> None:
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        errors.append(f"{rel(path)}: missing YAML frontmatter (file must start with ---)")
        return
    end = text.find("\n---", 4)
---check_framework_version---
#!/usr/bin/env python3
"""CI check: ensure that modified framework files have updated version markers.

Fails if any markdown file under .claude/skills/job-application-assistant/ is
modified in git without a change/bump to its 'framework_version' frontmatter key.
Also ensures all framework files have a valid 'framework_version' frontmatter key.
"""

from __future__ import annotations
import os
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKILL_DIR = ROOT / ".claude/skills/job-application-assistant"
FRAMEWORK_FILES = sorted(SKILL_DIR.glob("*.md"))

# Add root AGENTS.md if it exists
root_agents = ROOT / "AGENTS.md"
if root_agents.exists():
    FRAMEWORK_FILES.append(root_agents)

def run_git(args: list[str]) -> tuple[int, str, str]:
    res = subprocess.run(["git"] + args, cwd=str(ROOT), capture_output=True, text=True)
    return res.returncode, res.stdout, res.stderr

def get_base_commit() -> str | None:
    # If in GitHub Actions PR, use the target branch's base ref
  ```
- `Edit` — `/tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/17f6ac23-f88c-4c39-bc2e-40b2c0213320/scratchpad/pipeline-blueprint.html`
  ```diff
  -   .foot{ text-align: center; color: var(--ink-faint); font-size: 0.78rem; margin-top: 26px; font-family: 'IBM Plex Mono', monospace; }
</style>
  +   .foot{ text-align: center; color: var(--ink-faint); font-size: 0.78rem; margin-top: 26px; font-family: 'IBM Plex Mono', monospace; }

  /* ---------- steal list ---------- */
  :root{ --na: #5b6b78; --na-soft: #e4e9ec; }
  @media (prefers-color-scheme: dark){ :root:not([data-theme="light"]){ --na: #93a6b3; --na-soft: #1d2f3b; } }
  :root[data-theme="dark"]{ --na: #93a6b3; --na-soft: #1d2f3b; }

  .steal-intro{ color: var(--ink-soft); font-size: 0.92rem; max-width: 92ch; margin: 4px 0 20px; }
  .steal-intro strong{ color: var(--ink); }

  .featured{
    display: flex; gap: 18px; align-items: flex-start;
    background: var(--manual-soft);
    border: 1.5px solid var(--manual);
    border-radius: 10px;
    padding: 18px 20px;
    margin-bottom: 26px;
  }
  .featured-mark{
    font-family: 'Barlow Condensed', sans-serif; font-weight: 700; font-size: 1.6rem;
    color: var(--manual); line-height: 1; flex-shrink: 0; padding-top: 2px;
  }
  .featured h3{ font-family: 'Barlow Condensed', sans-serif; font-weight: 700; font-size: 1.25rem; color: var(--ink); }
  .featured .cite{ font-family: 'IBM Plex Mono', monospace; font-size: 0.72rem; color: var(--ink-faint); margin: 3px 0 10px; }
  .featured p{ font-size: 0.88rem; color: var(--ink-soft); line-height: 1.55; margin: 0 0 8px; max-width: 82ch; }
  .featured .why{ font-size: 0.85rem; color: var(--ink); border-left: 2px solid var(--manual); padding-left: 12px; margin-top: 10px; }

  .tier{ margin-bottom: 28px; }
  .tier:last-child{ margin-bottom: 6px; }
  .tier-head{ display: flex; align-items: baseline; gap: 10px; margin-bottom: 4px; flex-wrap: wrap; }
  .tier-head h3{ font-family: 'Barlow Condensed', sans-serif; font-weight: 700; font-size: 1.15rem; }
  .tier-head span{ color: var(--ink-faint); font-size: 0.82rem; }

  .steal-grid{ display: grid; grid-template-columns: repeat(auto-fill, minmax(258px, 1fr)); gap: 14px; margin-top: 12px; }
  .steal-card{
    background: var(--bg); border: 1px solid var(--line); border-radius: 8px;
    padding: 13px 15px 14px; display: flex; flex-direction: column; gap: 7px;
  }
  .steal-card.na{ opacity: 0.82; }
  .steal-row{ display: flex; justify-content: space-between; align-items: flex-start; gap: 8px; }
  .steal-card h4{ font-family: 'Barlow Condensed', sans-serif; font-weight: 700; font-size: 1rem; line-height: 1.2; }
  .pill{
    font-family: 'IBM Plex Mono', monospace; font-size: 0.62rem; font-weight: 500;
    padding: 3px 8px; border-radius: 20px; white-space: nowrap; flex-shrink: 0;
  }
  .pill.buildable{ background: var(--manual-soft); color: var(--manual); }
  .pill.blocked{ background: var(--blocked-soft); color: var(--blocked); }
  .pill.na{ background: var(--na-soft); color: var(--na); }
  .steal-card .cite{ font-family: 'IBM Plex Mono', monospace; font-size: 0.66rem; color: var(--ink-faint); }
  .steal-card .mech{ font-size: 0.8rem; color: var(--ink-soft); line-height: 1.45; }
  .steal-card .adapt{
    font-size: 0.77rem; color: var(--ink-soft); line-height: 1.4;
    background: var(--paper); border: 1px dashed var(--line-strong); border-radius: 6px;
    padding: 8px 10px;
  }
  .steal-card .adapt b{ color: var(--ink); font-weight: 600; }
</style>
  ```
- `Edit` — `/tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/17f6ac23-f88c-4c39-bc2e-40b2c0213320/scratchpad/pipeline-blueprint.html`
  ```diff
  -   <section class="panel bottom-grid">
  +   <section class="panel">
    <div class="panel-head"><h2 style="font-size:1.5rem">The Steal List</h2></div>
    <p class="steal-intro">Thirteen real things in <span class="mono">sandbox/ai-job-search/</span>, each read from its actual source file, not its README. Sorted by what actually pays rent: <strong>Tier 1</strong> targets internship&#8209;research&#8209;loop's own most-repeated manual chore and never touches the hourly path. <strong>Tier 2</strong> is pure infrastructure &mdash; buildable this week, no dependency on anything else. <strong>Tier 3</strong> is real and worth parking, but has nothing to run against until <span class="mono">Main Resume.md</span> / <span class="mono">Main Cover Letter.md</span> exist. <strong>Not applicable</strong> means exactly that &mdash; forcing a fit would be the same mistake the ai&#8209;job&#8209;search review already flagged once.</p>

    <div class="featured">
      <div class="featured-mark">01</div>
      <div>
        <h3>A source generator, modeled on <span class="mono">/add&#8209;portal</span></h3>
        <div class="cite">cf. ai&#8209;job&#8209;search <span class="mono">.claude/commands/add-portal.md</span></div>
        <p><span class="mono">/add-portal</span> investigates a new job board live (search&#8209;URL shape, result structure, robots.txt), scaffolds a CLI skill matching the exact contract every shipped portal already follows, then test&#8209;runs a real query before registering anything.</p>
        <p>internship&#8209;research&#8209;loop has done the equivalent task by hand roughly six times already &mdash; <span class="mono">vanshb03</span>, <span class="mono">zshah101</span>, Greenhouse, Ashby, Lever, AIJobs each needed a new <span class="mono">fetch_&lt;source&gt;</span>, a new <span class="mono">_matches_&lt;source&gt;</span>, a new <span class="mono">core/schema_drift.py</span> check, and a new fixture, written fresh every time.</p>
        <div class="why">A <span class="mono">/add-source</span> command that investigates a candidate feed's real schema, drafts all four pieces against the existing pattern, and runs the new source once in dry&#8209;run before it ever touches <span class="mono">seen_ids.json</span> would cut the single most repeated authoring task in this codebase &mdash; without adding one line of LLM judgment to the thing that runs hourly. The command drafts once, by hand&#8209;invocation; the code it produces is exactly as zero&#8209;LLM as every other source.</div>
      </div>
    </div>

    <div class="tier">
      <div class="tier-head"><h3>Tier 2 &mdash; infrastructure, buildable now</h3><span>no dependency on anything else in this repo</span></div>
      <div class="steal-grid">

        <div class="steal-card">
          <div class="steal-row"><h4>Permission &amp; hook allowlist guard</h4><span class="pill buildable">buildable</span></div>
          <div class="cite">cf. <span class="mono">tools/security_guards.py</span></div>
          <div class="mech">Every entry in <span class="mono">.claude/settings.json</span>'s <span class="mono">permissions.allow</span> and every hook command must appear in an explicit, checked&#8209;in allowlist &mdash; a widened permission or a new hook fails CI instead of silently landing. Cites the real August 2026 Shai&#8209;Hulud worm, which planted a <span class="mono">SessionStart</span> hook to execute on clone.</div>
          <div class="adapt"><b>Adapt as:</b> a small stdlib script checking internship&#8209;research&#8209;loop's own <span class="mono">.claude/settings.json</span> the same way &mdash; a repo with 7 agents, 8 skills, and 2 hooks already has real settings surface worth guarding.</div>
        </div>

        <div class="steal-card">
          <div class="steal-row"><h4>Skill / command lint</h4><span class="pill buildable">buildable</span></div>
          <div class="cite">cf. <span class="mono">tools/lint_skills.py</span></div>
          <div class="mech">Every <span class="mono">SKILL.md</span> must parse valid frontmatter with a real <span class="mono">name</span>/<span class="mono">description</span>; every <span class="mono">allowed-tools</span> path reference must point at a file that actually exists; every command file must open with a <span class="mono">#&nbsp;/&lt;name&gt;</span> title.</div>
          <div class="adapt"><b>Adapt as:</b> a lint pass over this repo's own <span class="mono">.claude/skills/</span> (8 skills) and <span class="mono">.claude/agents/</span> (7 agents) &mdash; catches a broken skill file before it fails silently at invocation, not after.</div>
        </div>

        <div class="steal-card">
          <div class="steal-row"><h4>"Did you bump it" version gate</h4><span class="pill buildable">buildable</span></div>
          <div class="cite">cf. <span class="mono">tools/check_framework_version.py</span></div>
          <div class="mech">CI fails if a load&#8209;bearing framework file changes without its <span class="mono">framework_version</span> frontmatter moving &mdash; a lightweight tripwire against silent semantic drift in a convention doc.</div>
          <div class="adapt"><b>Adapt as:</b> a gate on the four load&#8209;bearing conventions internship&#8209;research&#8209;loop's own <span class="mono">CLAUDE.md</span> already names (zero&#8209;LLM, permissive&#8209;by&#8209;default, fail&#8209;closed write&#8209;gate order, cite&#8209;the&#8209;real&#8209;data rule) &mdash; flag a PR that touches that section without touching a test.</div>
        </div>

        <div class="steal-card">
          <div class="steal-row"><h4>Company research cache</h4><span class="pill buildable">buildable</span></div>
          <div class="cite">cf. ai&#8209;job&#8209;search <span class="mono">04-job-evaluation.md</span> Company Research Cache</div>
          <div class="mech">One JSON file per company (<span class="mono">company_research/&lt;name&gt;.json</span>), 30&#8209;day TTL, schema mirrors a fixed checklist (website, reviews, LinkedIn, media). A cache hit is a lead, never a substitute for re&#8209;confirming a specific claim before it lands in a final artifact.</div>
          <div class="adapt"><b>Adapt as:</b> a shared cache the <span class="mono">contact-researcher</span> agent reads and writes, so researching the same company twice (once at promotion, again if a second dossier for it appears) doesn't repeat the same web search from zero.</div>
        </div>

      </div>
    </div>

    <div class="tier">
      <div class="tier-head"><h3>Tier 3 &mdash; real, parked, waiting on one thing</h3><span>blocked on Main Resume.md / Main Cover Letter.md, or a candidate&#8209;skills profile that doesn't exist yet</span></div>
      <div class="steal-grid">

        <div class="steal-card">
          <div class="steal-row"><h4>ATS / PDF text&#8209;layer verify</h4><span class="pill blocked">blocked</span></div>
          <div class="cite">cf. <span class="mono">tools/verify_pdf.py</span></div>
          <div class="mech"><span class="mono">pypdf</span> first, <span class="mono">pdftotext</span> fallback &mdash; extracts what an ATS parser actually sees and checks contact details are literal text, reading order matches the visual page, and posting keywords the profile genuinely supports are covered.</div>
          <div class="adapt"><b>Adapt as:</b> copy the tool itself into <span class="mono">tested-tools/_future/</span> now &mdash; it needs no internship&#8209;research&#8209;loop context to work, only a compiled CV, so it's ready the day <span class="mono">applying</span> unblocks.</div>
        </div>

        <div class="steal-card">
          <div class="steal-row"><h4>Drafter&#8209;reviewer critique pass</h4><span class="pill blocked">blocked</span></div>
          <div class="cite">cf. ai&#8209;job&#8209;search <span class="mono">apply.md</span> Steps 2&ndash;4</div>
          <div class="mech">A second agent, spawned with fresh context, researches the company and critiques the draft before a revision pass &mdash; catches missed keywords and generic framing a single pass leaves in.</div>
          <div class="adapt"><b>Adapt as:</b> a design decision to record now for the <span class="mono">applying</span> agent &mdash; give it a fresh&#8209;context reviewer step once it drafts against real content, rather than shipping single&#8209;pass output.</div>
        </div>

        <div class="steal-card">
          <div class="steal-row"><h4>Interview prep pack</h4><span class="pill blocked">blocked</span></div>
          <div class="cite">cf. ai&#8209;job&#8209;search <span class="mono">/interview</span></div>
          <div class="mech">Builds a stage&#8209;specific pack from the application's own real archive &mdash; the exact posting, the exact CV/letter version submitted, prior&#8209;round feedback &mdash; and maps likely questions to STAR examples.</div>
          <div class="adapt"><b>Adapt as:</b> downstream of a real submitted application existing at all &mdash; transitively blocked behind the same dependency as the two rows above.</div>
        </div>

        <div class="steal-card">
          <div class="steal-row"><h4>Upskill gap analysis</h4><span class="pill blocked">blocked</span></div>
          <div class="cite">cf. ai&#8209;job&#8209;search <span class="mono">/upskill</span></div>
          <div class="mech">Diffs a candidate&#8209;skills profile against tracked and ranked postings, returns a prioritized gap heatmap with study&#8209;time estimates.</div>
          <div class="adapt"><b>A different blocker than the rows above:</b> internship&#8209;research&#8209;loop's <span class="mono">core/profile.yaml</span> is a discovery filter (terms, categories, locations, degrees), not a candidate&#8209;skills profile &mdash; this needs that profile shape to exist first, independent of the resume/letter blocker.</div>
        </div>

      </div>
    </div>

    <div class="tier">
      <div class="tier-head"><h3>Not applicable &mdash; named, not forced</h3><span>real ai&#8209;job&#8209;search mechanisms with no honest home here</span></div>
      <div class="steal-grid">

        <div class="steal-card na">
          <div class="steal-row"><h4>Upstream triage / patch&#8209;id dedup</h4><span class="pill na">n/a</span></div>
          <div class="cite">cf. <span class="mono">tools/upstream_triage.py</span>, <span class="mono">check_upstream_updates.py</span></div>
          <div class="mech">Sorts a fork's behind&#8209;upstream commits into worth&#8209;reviewing vs. skip, using git patch&#8209;ids to catch already&#8209;cherry&#8209;picked changes.</div>
          <div class="adapt">internship&#8209;research&#8209;loop is not a fork of anything &mdash; there is no upstream to triage against. Forcing this in would be manufacturing a use case, the exact mistake the earlier ai&#8209;job&#8209;search review flagged for <span class="mono">freehire-search</span>.</div>
        </div>

        <div class="steal-card na">
          <div class="steal-row"><h4>robots.txt retry gate</h4><span class="pill na">n/a</span></div>
          <div class="cite">cf. <span class="mono">tools/robots_check.py</span></div>
          <div class="mech">RFC 9309 gate distinguishing a WAF's default 403 from an actual policy decline, before allowing a browser&#8209;header retry.</div>
          <div class="adapt">internship&#8209;research&#8209;loop fetches through Firecrawl (a managed service) and public JSON/API feeds &mdash; no raw scrape&#8209;with&#8209;retry path exists to gate. Worth revisiting only if a real block is ever hit, not before.</div>
        </div>

      </div>
    </div>
  </section>

  <section class="panel bottom-grid">
  ```
- `Artifact` — `{"file_path":"/tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/scratchpad/pipeline-blueprint.html","description":"The zero-LLM discovery engine vs. a proposed manual application bench, plus a sourced, tiered list of what's actually worth stealing from ai-job-search."}`
- `Agent` — `{"subagent_type":"fork","description":"Anthropic-docs research: skill/agent authoring standards","prompt":"Track 2 of the split the user just asked for. Track 1 (already done, in the parent session) was expanding the \"Pipeline Blueprint\" artifact with a sourced steal-list from ai-job-search. Track 2 — your job — is separate and does NOT touch that artifact, ai-job-search, or the internship-research-loop pipeline comparison at all.\n\n## What you're doing\n\n1. **Review what already exists.** Read every file in `~/projects/work/internship-research-loop/.claude/` — `agents/`, `skills/`, `commands/` (if present), `hooks/`, `context/`, `rules/`, `settings.json`. This is the real repo, not the vault's paraphrase of it — you already have some of it summarized in this conversation's history (the 7 agents, 8 skills, 5 rules files, 2 hooks named in `instructions/internship-research-loop/CLAUDE.md`), but read the actual files, don't rely on that summary alone.\n\n2. **Research official Anthropic documentation for real**, not from training-data memory. This repo (`second-brain-claudekit`, at `/home/anant_gupta/projects/ai/claude/second-brain-claudekit`) has a standing convention for exactly this: read `60_Claude/vault-rules/anthropic-docs-reference.md` FIRST — it names the mechanism (a live `llms.txt`, never a local mirror) for fetching current Anthropic docs on agents/skills/commands/hooks. Follow that mechanism, not a guess at a URL.\n\n3. **Answer these, with real citations to what you actually read (doc section or file+line), not invented best practices:**\n   - What does Anthropic's own documentation say makes a well-structured Skill (frontmatter shape, `allowed-tools`, description-triggering, when a Skill is the right tool vs. a Command vs. a subagent)?\n   - Is there an official mechanism for a skill to \"self-improve\" over time (e.g., versioning, feedback loops, evals), or is that not something Anthropic's docs describe at all — if the latter, say so plainly rather than inventing one.\n   - What's documented about an agent supervising/monitoring another skill or subagent's behavior over time (this repo's own `loop-verifier` agent in internship-research-loop is a real existing example worth reading and comparing against whatever the docs say).\n   - Is there a documented pattern for logging/registering each skill invocation (a run log, telemetry, structured output) for later analysis? internship-research-loop's own `core/run_log.py` (real file, read it) already does something like this for the *pipeline*, not for skill/agent invocations specifically — note the difference precisely.\n   - What does Anthropic document about a skill/agent stating its own \"thinking process\" and output-format contract explicitly (this repo's own `.claude/skills/*/SKILL.md` files and `tested-tools/skills/mattpocock-engineering/` are real local examples to compare against).\n\n4. **Write the findings as real Standards/Templates/Patterns notes in THIS repo** (`second-brain-claudekit`), following its existing conventions:\n   - Read `60_Claude/vault-rules/write-contract.md` and `60_Claude/vault-rules/pipeline-conventions.md` first — full routing table, golden rules, never-write-to list.\n   - Check what already exists in `60_Claude/Standards/`, `60_Claude/Templates/`, `60_Claude/Patterns/` BEFORE writing anything — extend/correct existing files rather than duplicate (golden rule: \"search before creating\").\n   - A new Standard = \"what correct looks like, checkable\" → `60_Claude/Standards/`. A new authoring template (skill/agent/command/hook skeleton) → `60_Claude/Templates/`. A reusable checklist/framework distilled from this research → `60_Claude/Patterns/`.\n   - Every claim in these notes must be traceable to something you actually read this session (a real Anthropic doc section, or a real file in this repo or in `~/projects/work/internship-research-loop/`) — never a fabricated \"best practice.\" Where the docs are silent on something the user asked about (e.g. self-improving skills), say so explicitly in the note rather than inventing a mechanism and presenting it as Anthropic's own guidance.\n\n## Explicit boundaries\n\n- Do NOT touch `sandbox/`, `ai-job-search`, `humanizer`, or the Pipeline Blueprint artifact — unrelated to this track.\n- Do NOT edit anything under `instructions/` in this repo (live-synced one-way, read-only per the write-contract).\n- Do NOT edit anything inside `~/projects/work/internship-research-loop/` itself — you're reading it for reference only, this task's writes all land in `second-brain-claudekit`.\n- This is real research + real writing, not a plan — actually fetch the docs, actually read the real files, actually write the notes.\n\n## When you're done\n\nReport back a short summary: which Standards/Templates/Patterns files you created or extended (with paths), and, for each of the 5 questions above, one line saying what the docs actually said (or that they were silent on it)."}`

## Actions Taken
- Files created: /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer/2026-09-05-test-log.md, /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/FOR-WHAT.md, /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/ai-job-search/2026-09-05-test-log.md, /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/17f6ac23-f88c-4c39-bc2e-40b2c0213320/scratchpad/pipeline-blueprint.html
- Files modified: /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/README.md, /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/17f6ac23-f88c-4c39-bc2e-40b2c0213320/scratchpad/pipeline-blueprint.html
- Files deleted: (none)
- Commands run: echo "=== sandbox ===" && ls sandbox/ 2>/dev/null && echo "=== tested-tools ===" && ls tested-tools/ 2>/dev/null && echo "=== internship-research-loop related dirs ===" && find . -maxdepth 3 -iname "*internship*" -not -path "./.git/*", echo "=== check for Sources - Plan in repo ===" find . -iname "*Sources*Plan*" -not -path "./.git/*" 2>/dev/null echo "=== check Builds & Resources ===" find . -iname "*Builds*" -not -path "./.git/*" 2>/dev/null echo "=== check Deadline Tracker ===" find . -iname "*Deadline*" -not -path "./.git/*" 2>/dev/null echo "=== check Research Loop Improvement Plan ===" find . -iname "*Research Loop*" -not -path "./.git/*" 2>/dev/null echo "=== 20_Progress exists? ===" ls 20_Progress 2>/dev/null || echo "NOT IN THIS REPO" echo "=== internship-research-loop dirs content ===" for d in context/internship-research-loop hooks/internship-research-loop instructions/internship-research-loop agents/internship-research-loop skills/internship-research-loop rules/internship-research-loop; do echo "--- $d ---" ls -la "$d" 2>/dev/null done, cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox && git clone --depth 1 https://github.com/MadsLorentzen/ai-job-search.git 2>&1 | tail -20, cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox && git clone --depth 1 https://github.com/blader/humanizer.git 2>&1 | tail -20, echo "=== ai-job-search tree ===" find /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search -maxdepth 2 -not -path "*/.git*" | sort echo echo "=== humanizer tree ===" find /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer -maxdepth 2 -not -path "*/.git*" | sort, cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search && ls tests | head -5 && echo "---" && head -20 tests/test_verify_pdf.py 2>/dev/null && echo "---reqs---" && find . -maxdepth 1 -iname "requirement*" -o -iname "pyproject*" | head, cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer && python3 scripts/validate-package.py 2>&1 | tail -30, cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search && python3 -m pytest tests/ -q 2>&1 | tail -40, python3 -m unittest discover -s tests -p 'test_*.py' -v 2>&1 | tail -60, cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools && find . -maxdepth 3 -not -path "./.git*" | sort | head -50, cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit && find tested-tools/_future -maxdepth 2 | sort echo "---template---" cat 60_Claude/Templates/for-what.md 2>/dev/null echo "---example verdict (gbrain, first 60 lines)---" sed -n '1,60p' tested-tools/mcp-servers/gbrain/VERDICT.md 2>/dev/null, find tests -maxdepth 3 2>/dev/null | sort, mkdir -p /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/ai-job-search /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer echo done, cp /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/SKILL.md /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/SKILL.md echo copied, git status --short | grep -v '^??.*sandbox/\(ai-job-search\|humanizer\)/' | head -50 echo "---sandbox additions (top level only)---" git status --short sandbox/ai-job-search sandbox/humanizer 2>/dev/null | head -5 du -sh sandbox/ai-job-search sandbox/humanizer 2>/dev/null, find / -maxdepth 6 -iname "internship-research-loop" -not -path "*/second-brain-claudekit/*" -not -path "/proc/*" 2>/dev/null echo "---gh check---" gh repo view gupta-builds/internship-research-loop --json name,description,defaultBranchRef 2>&1 | head -20, cd /home/anant_gupta/projects/work/internship-research-loop && find . -maxdepth 2 -not -path "./.git*" -not -path "./.venv*" | sort, gh api repos/gupta-builds/internship-research-loop/actions/workflows --jq '.workflows[] | {name, state, path}' 2>&1 echo "---last 3 runs of run.yml---" gh run list --repo gupta-builds/internship-research-loop --workflow=run.yml --limit 5 --json databaseId,status,conclusion,createdAt 2>&1, cd /home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ai-job-search && wc -l .claude/commands/apply.md .claude/commands/rank.md .claude/skills/job-scraper/SKILL.md 2>/dev/null, grep -n '^#\|^##\|^###\|^Step [0-9]' .claude/commands/apply.md | head -60, grep -n '^#\|^##\|^###' .claude/skills/job-scraper/SKILL.md | head -60, sed -n '1,40p' tools/lint_skills.py && echo "---check_framework_version---" && sed -n '1,30p' tools/check_framework_version.py
- Tool call tally: Agent (1), Artifact (2), Bash (22), Edit (4), mcp__jarvis__vault_list (1), mcp__jarvis__vault_read (6), Read (17), Skill (1), ToolSearch (2), Write (4)

