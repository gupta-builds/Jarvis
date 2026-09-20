---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: wsl
title: "Jarvis home directory session setup"
started_at: 2026-09-05T06:36:33
ended_at: 2026-09-06T00:21:22
duration_minutes: 1065
exported_at: 2026-09-05T20:15:03
project: second-brain-claudekit
cwd: '/home/anant_gupta/projects/ai/claude/second-brain-claudekit'
session_id: ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e
status: raw
turn_count: 6
tools_used:
  Bash: 59
  Edit: 2
  mcp__jarvis__search_simple: 12
  mcp__jarvis__vault_get_document_map: 8
  mcp__jarvis__vault_list: 8
  mcp__jarvis__vault_patch: 20
  mcp__jarvis__vault_read: 18
  mcp__jarvis__vault_write: 8
  Read: 6
  ToolSearch: 4
tokens:
  input: 526
  output: 271646
  cache_creation: 1430228
  cache_read: 62390805
  total: 64093205
cost_usd: 20.916585
model:
  - claude-sonnet-5
files_touched:
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Jarvis.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Design.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/linking-strategy.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/naming-conventions.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/tagging-system.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/write-contract.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - wsl
---

# Jarvis home directory session setup

## You

There needs to be session working on the home directory for this particular builthat we are doing for jarvis. There is going to be simulataneous build running alongside for the windows hoem directory build. Way too many things need to be done here for that to be done. So, from another session here is a more detailed prompt on what do: Read this repo's own _docs/Architecture.md, _docs/Design.md, _docs/Promotion-Criteria.md, _docs/Jarvis.md before anything else. Confirm Round 9 (2026-09-05, the prior prompt in this same file) actually landed and is committed — git log, git status — before starting; if it's still mid-flight or has unexplained dirty paths, stop and report that rather than building on top of an unfinished round.

## Task 1 — Cite the vault's ingestion trail in this repo's own docs

Read, in full, in the Jarvis vault (reachable via /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis or the jarvis MCP tools):
- 40_Resources/CS/Repos.md (the master 95-repo index, tiered Implement>Knowledge markers, each entry annotated with a real or provisional status)
- 60_Claude/10_Source_Summaries/Github Ingestion/{How Anant Uses Each Repo,Useful Repos - Shortlist,Claude Kit Implementation}.md
- 60_Claude/20_Distilled_Notes/Sources - Plan/{GitHub Ingestion Implementation,00_Execution,_Notes Created From Ingestion}.md
- 20_Progress/Projects/AI Use/Claude Kit/ in full (Tool Map.md, Log.md, Source of Truth/The Qualification Pipeline.md, Claude Code/Claudekit Session Context.md, and the rest) — you likely already half-know this from Round 9, re-confirm rather than assume it's unchanged.

Add an explicit, named citation to this list — where the sandbox/tested-tools/Promotion-Criteria decision trail actually started, and where the per-repo "why" for every real decision in Tool Map.md ultimately traces back to — into _docs/Design.md and _docs/Jarvis.md, next to wherever each already cites Tool Map.md/Log.md. Follow the exact citation pattern Claudekit Session Context.md's own "What to check in Jarvis before reviewing or improving any tool" table already uses (a path, then what it answers) — don't invent a new citation style. This is documentation only — no new manifest entry, no new sync folder.

## Task 2 — Re-audit sandbox/ and tested-tools/ with fresh eyes

Per Anant's own instruction: figure out, concretely, what's in the sandbox now, what should be removed, what's already in real use, and what's actively being tested for a real use case — building on top of the 2026-08-20 triage (32 repos, 13 dropped, 10 "still worth evaluating," 5 already tracked elsewhere) recorded in Tool Map.md, not redoing it.

1. Re-list sandbox/ (a fresh `ls -d sandbox/*/ | wc -l` — compare against the 32 last confirmed; if it's grown, the new arrivals need the same one-line keep/drop/still-evaluating treatment the 2026-08-20 pass gave the others).
2. For every item Tool Map.md marks "still worth evaluating" with a named next step that Round 9 didn't already execute (obsidian-mind, obsidian-second-brain, claude-mem, agentic-inbox, TradingAgents, OpenBB — the last two explicitly deferred to a TradingView-side session, don't attempt here), check whether its named next step has actually happened since 2026-08-20 (Round 9 may have touched some of these — verify, don't assume either way) and execute it for real if not.
3. Anything in tested-tools/ that cleared Promotion-Criteria.md's four gates but was never actually promoted anywhere (gbrain is the clearest case — cleared 2026-08-20, still not globally installed as of Round 9's own report) is a real, standing gap — name every one you find, don't just re-confirm gbrain's.
4. Apply the WSL-vs-Windows split Anant has stated as the standing principle for any promotion decision from here on: WSL gets more project-specific tooling (real code projects live there), Windows gets more Jarvis/Obsidian-specific tooling (the vault lives there). A tool like obsidian-mind or graphify's own extensions belongs Windows-side; a tool like claude-context (BOOM) or TradingAgents (TradingView) belongs WSL-side. State this explicitly against every promotion decision this task makes, don't leave it implicit.

## Task 3 — Write the real usage docs, retire the stale ones

For each repo in the "already established" coverage list above (verified/extended per this prompt's own instruction, not treated as final):
1. Write one usage note per repo (or a small number of tools per note where they're genuinely paired, e.g. gstack+gbrain — Tool Map.md already documents them as a matched pair from the same author) into 40_Resources/CS/AI/ — real, current "how Anant actually uses this now" content: the real install state (installed/blocked/tested/dropped, cited to Tool Map.md's row), the real command(s) that actually worked (not the speculative `npx`/`bunx` guesses the May/July docs carried), and what it's actually for in Anant's real workflow today, not a generic README summary.
2. Cross-link every new note from 40_Resources/CS/Repos.md's matching entry (the `→ [[note]]` convention that file already uses) and from Tool Map.md's matching row.
3. Once real coverage exists for everything on the list, mark How Anant Uses Each Repo.md and Useful Repos - Shortlist.md `status: retired` (frontmatter change only — content stays, per this vault's own retirement convention), with a one-line pointer at the top of each to where the real content now lives. Update every live wikilink to either file across the vault to point at the new notes instead — grep for both filenames first, don't guess at what references them.
4. Do not write a usage note for anything not on the verified coverage list — an undecided, still-just-starred repo gets left alone, not filled in with plausible-sounding speculation to look complete.

## Report back

- Task 1: the exact citation lines added, in which two files.
- Task 2: sandbox's real current count, every keep/drop/still-evaluating decision made this round (not re-litigating 2026-08-20's), every tested-tools/ item found cleared-but-unpromoted, and the WSL/Windows split applied explicitly per decision.
- Task 3: the real coverage list as actually verified (name any repo added or removed from this prompt's starting list, and why), every new note written, both retirement edits, and the grep-and-fix result for stale wikilinks.
- Anything in this prompt that turned out wrong when checked directly against the live repo or vault — state it plainly, same discipline every prior round in this file has used.

## Claude

I'll start by checking whether the prior round (Round 9) actually landed and is committed, as the prompt requires before doing anything else.

Working tree is now clean and 33 commits ahead of origin — the dirty paths from the conversation-start snapshot have since been committed (likely by the parallel Windows-side session). Let me check the timestamps to confirm these are today's work and see what Round 9 actually consisted of.

Now I need to find where "Round 9" is documented — likely the Claudekit Session Context.md file mentioned in the prompt's reading list, which seems to be where these numbered round-prompts get appended. Let me check the Jarvis vault directly.

This file doesn't have the round history — it points to "Prompts.md" as the file holding pasteable prompts. Let me check that.

Let me read the full Round 9 prompt text to check every task against what's actually in git log/repo state.

Round 9 gate confirmed: working tree is clean, and commits from today's session (up to 11:52) cover Round 9's Task 1 (Jarvis agents + hooks bucket), Task 2 (WSL/Windows), and Task 3 (internship-research-loop onboarding). Round 10 itself says not to relitigate Round 9, so I'll proceed to the actual work.

Let me gather the vault reading list for Task 1 in parallel.

Now let me make the Task 1 edits. First Design.md, adding the citation next to its existing Tool Map.md reference.

Now Jarvis.md, adding the citation next to its Tool Map.md bullet, following the same "path — what it answers" pattern Claudekit Session Context.md's table uses.

Task 1 done. Now Task 2 — let me check sandbox's current count against the 32 baseline.

32 — unchanged from the 2026-08-20 baseline, no new arrivals. Let me check what "skills" actually is (likely mattpocock-engineering) and look at tested-tools/.

Now let's execute the named next steps for the 4 "still worth evaluating" items. First, let's look at the actual sandbox contents.

Now let me update the frontmatter `updated` date and add the Log.md entry.

Now let me write the usage notes. I'll batch them.

Now let me prepend a pointer to each retired file's top-level heading.

Both docs edits are still clean (only `Design.md`/`Jarvis.md` touched, 2 lines total) — the parallel Windows-side session is doing unrelated work in `context/` and `rules/`, no conflicts. Here's the full report.

## Round 9 gate check
`git log`/`git status` confirmed clean and committed: today's WSL commits (`167d563`, `e2c27b9`, `0db6c75`, `491a0c6`, `e21ff9e`) cover Round 9's Jarvis-agent, WSL-path, and internship-research-loop work, and Log.md carries matching 2026-09-05 entries. Proceeded per Round 10's own instruction not to re-litigate it.

## Task 1 — citations added
- **`_docs/Design.md`**, next to its existing `Tool Map.md` citation (the "Real evidence accumulates" line): added a parenthetical naming `40_Resources/CS/Repos.md` as where the trail actually starts.
- **`_docs/Jarvis.md`**: added a new bullet immediately *before* the existing `Tool Map.md` bullet under "this repo's decision tracker," citing `40_Resources/CS/Repos.md` by the same "path — what it answers" pattern `Claudekit Session Context.md`'s table uses.
Both uncommitted (2 lines total) — not committed, since committing wasn't requested and a parallel session is actively working in this repo.

## Task 2 — sandbox/tested-tools re-audit
- **Count: still 32**, unchanged since 2026-08-20. Nothing new to triage.
- **The 4 held-open items, resolved for real** (written into `Tool Map.md` + a new `Log.md` entry): **obsidian-mind** — 2 of 5 North Star hooks now match Jarvis's real hooks, 3 still unbuilt, narrowed not closed. **obsidian-second-brain** — 3 real adoptable vault-rule gaps named (anti-fabrication rule, typed relation edges, sentinel-safe regen markers). **claude-mem** — hold correctly still applies (gbrain still not installed). **agentic-inbox** — **dropped**: it's a Cloudflare *email client*, zero note-triage logic; this file's own 2026-08-20 framing didn't survive checking the real repo.
- **Cleared-but-unpromoted gap, beyond gbrain**: **cpr-compress-preserve-resume**'s blend verdict (cleared 2026-08-19) also never made it into `.claude/commands/` — confirmed by direct listing.
- **WSL/Windows split, applied explicitly**: gbrain doesn't fit the split cleanly (genuine global memory layer, needs both homes); gstack is WSL-side (Linux-lib blocker); CPR is WSL-side (repo-scoped to this WSL codebase); mattpocock/ECC/spec-kit/claude-context/promptfoo are all WSL-side (real code-project tooling); the live `/llm-council` skill is the clear Windows-side case (lives in Jarvis's real vault).

## Task 3 — usage docs
**Verified coverage list (narrowed from the prompt's floor, with reasons):** gbrain+gstack, mattpocock-engineering, cpr-compress-preserve-resume, ECC, spec-kit, claude-context, promptfoo, llm-council (+ its 2 dropped alternatives) — **8 new notes**, all in `40_Resources/CS/AI/`, cross-linked from both `Repos.md` and `Tool Map.md`. Graphify already had a real note — left as-is, just added the missing `Tool Map.md` cross-link.
**Excluded, with evidence**: **bumblebee** (only `QUEUED` in `Repos.md`, never actually cloned/run — writing a usage note would be the exact fabrication this pipeline exists to prevent). **hiring-agent** (still never run — Round 9 didn't touch it either). **Firecrawl** (the prompt's framing conflates two different things: ~30 Windows-side Claude Code skill junctions confirmed **not adopted** into real workflows per this vault's own `Claude Code.md`/`What Global.md`, versus a real, working Firecrawl **API** integration inside `internship-research-loop`'s job-posting fetch code — a different project's dependency that never went through this pipeline at all, no `Tool Map.md` row exists for it).
**Retirement**: both `How Anant Uses Each Repo.md` and `Useful Repos - Shortlist.md` set to `status: retired` with a pointer blockquote at the top.
**Link fixes**: checked all non-clipping backlinks to both files. Most turned out to be generic "see also" mentions for *other* repos (n8n, bumblebee, system-prompts-and-models-of-ai-tools) not in the new coverage — rewriting those would misattribute the link, so they were left for the retirement pointer to handle. One genuine hit: `Maverick Skills Mode-to-Repo Mapping.md`'s CPR/gbrain line was rewritten to point at the two new notes directly. `Claude Kit Implementation.md`'s frontmatter `notes:` list got the new pointers appended.

Everything above lives in the Jarvis vault (Tool Map.md, Log.md, Repos.md, the 8 new notes, the 2 retirements) except the 2-line `_docs/` edit in `second-brain-claudekit`, which is uncommitted and waiting for you to review.

**Tool calls:**

- `Bash` — `echo "=== git log -20 ===" && git log --oneline -20 && echo "=== git status ===" && git status && echo "=== git diff --stat ===" && git diff --stat`
  ```
=== git log -20 ===
e21ff9e Populate Windows's global .claude/ with agents, commands, and 2 hooks
491a0c6 Fix 6 stale pre-reorg vault paths in WSL global agents/commands
167d563 Copy the 7 agent files into Jarvis's real .claude/agents/ (third hop)
59ebdef Add historical raw edit log for 2026-08-22
e2c27b9 Write real purpose statements for Jarvis's 6 empty agents
0db6c75 Onboard internship-research-loop; close the hooks/Jarvis sync gap
c830fff Add historical raw edit logs for 2026-08-20 and 2026-08-21
63bc406 Sync snapshot: initial commit of Jarvis agents/skills mirror
ca54bc1 Sync snapshot: update .claude_wsl mirror from live WSL home
9097f07 Add PreToolUse hook nudging toward live Anthropic docs before authoring artifacts
42fa621 Relocate Architecture.md and PRD.md from _docs/ to repo root
ff59f4f Document the final instructions/<repo>/ rule: explicit main files only, ever
1c95223 Rebuild instructions/second-brain-claudekit/ to hold only the 4 main files
f6cafb3 Fix second-brain-claudekit's manifest entry: explicit files, not "_docs"
b48480c Revert sync-all.sh: remove directory-flattening, fail loudly on a directory entry instead
73714af Document the definitive instructions/<repo>/ flat-structure rule
8794ff3 Rebuild instructions/second-brain-claudekit/ flat, per the corrected sync logic
9911d5b Fix sync-all.sh: flatten directory-shaped instructions_paths instead of nesting them
75e93d0 Close the loop: Gaps.md/Repo-Map.md reflect the real, complete 10-entry state
2424d71 Populate agents/commands/hooks/skills/instructions for all 10 sync entries
=== git status ===
On branch main
Your branch is ahead of 'origin/main' by 33 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
=== git diff --stat ===
  ```
- `Bash` — `git log --format='%h %ad %s' --date=format:'%Y-%m-%d %H:%M' -30`
  ```
e21ff9e 2026-09-05 11:52 Populate Windows's global .claude/ with agents, commands, and 2 hooks
491a0c6 2026-09-05 11:52 Fix 6 stale pre-reorg vault paths in WSL global agents/commands
167d563 2026-09-05 11:18 Copy the 7 agent files into Jarvis's real .claude/agents/ (third hop)
59ebdef 2026-09-05 11:10 Add historical raw edit log for 2026-08-22
e2c27b9 2026-09-05 11:10 Write real purpose statements for Jarvis's 6 empty agents
0db6c75 2026-09-05 11:09 Onboard internship-research-loop; close the hooks/Jarvis sync gap
c830fff 2026-09-05 01:38 Add historical raw edit logs for 2026-08-20 and 2026-08-21
63bc406 2026-09-05 01:38 Sync snapshot: initial commit of Jarvis agents/skills mirror
ca54bc1 2026-09-05 01:38 Sync snapshot: update .claude_wsl mirror from live WSL home
9097f07 2026-09-05 01:37 Add PreToolUse hook nudging toward live Anthropic docs before authoring artifacts
42fa621 2026-09-05 01:37 Relocate Architecture.md and PRD.md from _docs/ to repo root
ff59f4f 2026-08-21 17:28 Document the final instructions/<repo>/ rule: explicit main files only, ever
1c95223 2026-08-21 17:28 Rebuild instructions/second-brain-claudekit/ to hold only the 4 main files
f6cafb3 2026-08-21 17:27 Fix second-brain-claudekit's manifest entry: explicit files, not "_docs"
b48480c 2026-08-21 17:27 Revert sync-all.sh: remove directory-flattening, fail loudly on a directory entry instead
73714af 2026-08-21 15:21 Document the definitive instructions/<repo>/ flat-structure rule
8794ff3 2026-08-21 15:21 Rebuild instructions/second-brain-claudekit/ flat, per the corrected sync logic
9911d5b 2026-08-21 15:21 Fix sync-all.sh: flatten directory-shaped instructions_paths instead of nesting them
75e93d0 2026-08-20 17:38 Close the loop: Gaps.md/Repo-Map.md reflect the real, complete 10-entry state
2424d71 2026-08-20 17:38 Populate agents/commands/hooks/skills/instructions for all 10 sync entries
e4b3202 2026-08-20 17:38 Extend sync-all.sh: agents/commands/hooks/skills get the instructions/ treatment
b5cf0ed 2026-08-20 17:37 Fix sync-manifest.json: drop settings.json, add README.md/_docs coverage
cea5ab0 2026-08-20 14:47 Archive resolved Repo-Map.md history
4427ea7 2026-08-20 14:47 Archive resolved Gaps.md history; report the edit-log hook's real content bug
31cecff 2026-08-20 14:47 Backfill tests/ for spec-kit, promptfoo, and claude-context
ef6fa60 2026-08-20 14:10 Close the loop: gbrain, 3 dormant-clone next steps, and the docs/<Project> decision
434a78c 2026-08-20 14:10 gbrain: wire OpenAI embedding provider, record cleared promotion decision
9896d08 2026-08-20 11:18 Adversarial-review fixes: claudeMdExcludes gap, docs/ naming error, self-consistency
d519d9c 2026-08-20 11:16 Add 60_Claude/Standards/, write-contract.md, and artifact-authoring templates
ac29824 2026-08-20 11:15 Build tests/, rebuild instructions/ on the correct premise, wire live sync
  ```
- `ToolSearch` — `{"query":"select:mcp__jarvis__vault_read,mcp__jarvis__vault_list,mcp__jarvis__search_simple","max_results":5}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Claude Code/Claudekit Session Context.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Claude Code/Prompts.md"}`
- `Bash`:
  ```bash
python3 -c "
import json
with open('/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/tool-results/toolu_01JgBrx6bC2ZKgTiQDUsxRRj.json') as f:
    data = json.load(f)
text = data[0]['text']
obj = json.loads(text)
content = obj['content']
with open('/tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/scratchpad/prompts.md', 'w') as f:
    f.write(content)
print(len(content))
"

  ```
  ```
62052
  ```
- `Bash` — `grep -n "^## Round" /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/scratchpad/prompts.md`
  ```
(Bash completed with no output)
  ```
- `Bash` — `grep -n -i "round 9\|round9\|Round 8\|^##\|^# " /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/scratchpad/prompts.md | head -80`
  ```
19:# Claude Kit — Build Prompts
21:## Sequencing
24:# Claudekit
26:**Round 9, 2026-09-05 — the first real "third hop" attempt.** Everything before this round built and proved the pipeline (`sandbox/` → `tested-tools/` → an explicit per-item decision → `agents/<Project>/`+siblings in this repo → a read-only Jarvis-side mirror) but explicitly left one thing "not attempted, not scheduled" per [[20_Progress/Projects/AI Use/Claude Kit/Log]]'s 2026-08-21 entry: whether/how staged content ever flows into a real project's *actual live* `.claude/`. This round is the first real attempt at that hop — for Jarvis (most-built real `.claude/`, several genuinely empty stubs both there and in this repo's mirror of it), for both global home directories (WSL populated but stale in places, Windows nearly bare), and for `internship-research-loop` (fully built this same week directly in the vault session, per [[20_Progress/Internship/Building System/System - Build Log]]'s 2026-09-04 entries — but never onboarded into this repo's sync pipeline at all; no manifest entry exists for it).
33:## What's already established, cited so you don't re-derive it
43:## Step 0 — clean workspace, a real precondition, not a formality
47:## Procedure for anything genuinely new you write this round
51:## Task 1 — Jarvis: close the 6-agent gap and the missing hooks bucket
60:## Task 2 — Global homes: WSL cleanup, Windows bootstrap, gbrain install
66:## Task 3 — Onboard internship-research-loop into the pipeline
73:## Task 4 — This repo's own `.claude/`
78:## Sandbox review — classify what's sitting there, using Promotion-Criteria.md's own four gates
92:## After the ingestion work — review and tighten
98:## Report back
109:**Round 10, 2026-09-05 — cite the vault's real ingestion trail, re-audit sandbox with fresh eyes, then write the real usage docs.** Round 9 (above) onboarded Jarvis's 6 empty agents and internship-research-loop into the pipeline — confirmed done and committed by Anant's own report. This round doesn't touch that work again. It closes a different gap: this repo's `_docs/` never explicitly cites the vault's own pre-existing ingestion research (`40_Resources/CS/Repos.md`, `60_Claude/10_Source_Summaries/Github Ingestion/How Anant Uses Each Repo.md` + `Useful Repos - Shortlist.md`, `60_Claude/20_Distilled_Notes/Sources - Plan/{GitHub Ingestion Implementation,00_Execution,_Notes Created From Ingestion}.md`, `20_Progress/Projects/AI Use/Claude Kit/` — the whole project folder with `Tool Map.md`/`Log.md`), even though every real decision this pipeline has ever made (gbrain, gstack, mattpocock-skills, ECC, spec-kit, claude-context, promptfoo, bumblebee, and the 32-repo sandbox triage) traces directly back to that trail. Three tasks, in order, ending in the actual "how to use it now that it's real" docs Anant asked for.
119:Read this repo's own _docs/Architecture.md, _docs/Design.md, _docs/Promotion-Criteria.md, _docs/Jarvis.md before anything else. Confirm Round 9 (2026-09-05, the prior prompt in this same file) actually landed and is committed — git log, git status — before starting; if it's still mid-flight or has unexplained dirty paths, stop and report that rather than building on top of an unfinished round.
121:## Task 1 — Cite the vault's ingestion trail in this repo's own docs
127:- 20_Progress/Projects/AI Use/Claude Kit/ in full (Tool Map.md, Log.md, Source of Truth/The Qualification Pipeline.md, Claude Code/Claudekit Session Context.md, and the rest) — you likely already half-know this from Round 9, re-confirm rather than assume it's unchanged.
131:## Task 2 — Re-audit sandbox/ and tested-tools/ with fresh eyes
136:2. For every item Tool Map.md marks "still worth evaluating" with a named next step that Round 9 didn't already execute (obsidian-mind, obsidian-second-brain, claude-mem, agentic-inbox, TradingAgents, OpenBB — the last two explicitly deferred to a TradingView-side session, don't attempt here), check whether its named next step has actually happened since 2026-08-20 (Round 9 may have touched some of these — verify, don't assume either way) and execute it for real if not.
137:3. Anything in tested-tools/ that cleared Promotion-Criteria.md's four gates but was never actually promoted anywhere (gbrain is the clearest case — cleared 2026-08-20, still not globally installed as of Round 9's own report) is a real, standing gap — name every one you find, don't just re-confirm gbrain's.
140:## Task 3 — Write the real usage docs, retire the stale ones
148:## Report back
156:**Round 8, 2026-08-21 — fresh session.** Round 7 fixed the self-nesting bug but kept the wrong scope: `_docs` as a directory-shaped `instructions_paths` entry, flattened wholesale into `instructions/second-brain-claudekit/`. That was never the intent. `instructions/<repo>/` is a small, curated set of main files only — `CLAUDE.md`, `AGENTS.md`, `README.md`, `PRD.md`, `Architecture.md` (now confirmed at this repo's root, not in `_docs/`) — never an entire internal-documentation directory. This is the fourth time this folder's scope has needed correcting; this round makes the mechanism itself incapable of the mistake, not just the current data.
163:## 1. Simplify sync-all.sh: remove directory-flattening entirely
167:## 2. Fix second-brain-claudekit's own entry
171:## 3. Audit all 10 entries for the same mistake
175:## 4. Rebuild every affected instructions/<repo>/ folder
179:## 5. Write the definitive, final rule -- for real this time
183:## 6. Close the loop
190:# Jarvis
192:**Round 8, 2026-08-21.** Short and verification-only — the sync-build phase is closing out and the next real work is `tests/`. Don't add new scope here.
208:# Cursor — Grok 4.6 → Sonnet 5
214:## Prompt 1 — Grok 4.6, planning only
253:## Prompt 2 — Sonnet 5, execution only
291:# Windows Home Directory — base layout, official-docs-verified
  ```
- `Bash` — `sed -n '19,108p' /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/scratchpad/prompts.md`
  ```
# Claude Kit — Build Prompts
==Only prompts live in this note, each inside a fenced block, ready to paste into a fresh session. Everything else — context, background, open questions — lives in [[20_Progress/Projects/AI Use/Claude Kit/Claude Code/Claudekit Session Context]]. Rewritten 2026-08-19; this note's prior content (dated 2026-08-11) is preserved there, not lost.==
## Sequencing
**Run `# Claudekit` first.** It lays out the repo's own structural base — nothing in `# Jarvis` should be attempted until that base is real, because `# Jarvis`'s job is to document what the base actually became, not what it was planned to become. Read the Claudekit session's final report (or its `git log`/diff) before starting `# Jarvis`.

# Claudekit

**Round 9, 2026-09-05 — the first real "third hop" attempt.** Everything before this round built and proved the pipeline (`sandbox/` → `tested-tools/` → an explicit per-item decision → `agents/<Project>/`+siblings in this repo → a read-only Jarvis-side mirror) but explicitly left one thing "not attempted, not scheduled" per [[20_Progress/Projects/AI Use/Claude Kit/Log]]'s 2026-08-21 entry: whether/how staged content ever flows into a real project's *actual live* `.claude/`. This round is the first real attempt at that hop — for Jarvis (most-built real `.claude/`, several genuinely empty stubs both there and in this repo's mirror of it), for both global home directories (WSL populated but stale in places, Windows nearly bare), and for `internship-research-loop` (fully built this same week directly in the vault session, per [[20_Progress/Internship/Building System/System - Build Log]]'s 2026-09-04 entries — but never onboarded into this repo's sync pipeline at all; no manifest entry exists for it).

Paste into a fresh Claude Code session, cwd = `~/projects/ai/claude/second-brain-claudekit`, `high` or `xhigh` effort. Do not start this until git status is clean or every dirty path below has an explicit decision — see Step 0.

```
You're picking up second-brain-claudekit with no memory of prior sessions. Read _docs/Architecture.md, _docs/Design.md, _docs/Promotion-Criteria.md, _docs/Jarvis.md, and _docs/Sync.md in full before doing anything else — this prompt cites them throughout and assumes you've actually read them, not skimmed the summary below. Also read sync-manifest.json directly (don't trust any note's paraphrase of its schema) and 20_Progress/Projects/AI Use/Claude Kit/{Tool Map,Log,Claude Code/Claudekit Session Context}.md in the Jarvis vault (reachable via /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis or the jarvis MCP tools) for the dated narrative behind the current state.

## What's already established, cited so you don't re-derive it

- **The pipeline**: `sandbox/<repo>/` (bare clone) → clears `_docs/Promotion-Criteria.md`'s four gates → `tested-tools/<type>/<use-case>/<repo>/` → an explicit, per-item human decision → lands in exactly one of: `agents/<Project>/`, `commands/<Project>/`, `hooks/<Project>/`, `skills/<Project>/`, `instructions/<Project>/` in this repo (real destination names today: CausalOps, Jarvis, Portfolio, Trading View, Resq, OpsPilot, The Plan, second-brain-claudekit, `.claude_windows`, `.claude_wsl` — ten manifest entries, confirmed all `status: live` as of 2026-08-21).
- **Two different things populate the same `<Project>/` folders and you must not conflate them**: (a) for the eight *real, already-existing* projects, Unison syncs each project's actual live `.claude/{agents,commands,hooks}` + main instruction files into this repo's matching `<Project>/` folder — the project's real config is the source, this repo's copy is a mirror (see `_docs/Jarvis Environment` notes — actually check `sync-manifest.json`'s per-entry `direction`/`force_source` fields directly, since two Jarvis-side notes describe this differently and you need the real schema, not a paraphrase); (b) for a *newly promoted* sandbox tool, a human manually places files into the matching `<Project>/` folder as a one-time decision, per Design.md. **Verify which direction actually applies to each entry before writing anything** — don't assume (a) or (b) uniformly.
- **The still-open "third hop"**, per Log.md's 2026-08-21 entry verbatim: "whether/how staged content... ever flows into a real project's actual live `.claude/` config — is an open question, not attempted, not scheduled." This round is attempting it for the first time, deliberately, not stumbling into it by accident — treat every write into a real project's `.claude/` as a decision worth its own line in Log.md, not a mechanical copy.
- **Jarvis's real `.claude/`** (`/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/`) is the most built of any destination — confirmed this week: `skills/` holds real, structured folders (SKILL.md + reference.md/examples.md where needed), `agents/` holds 11 files, 6 of them **genuinely empty on both sides** (`daily-operator.md`, `human-operator.md`, `ingestion.md`, `llm-council.md`, `note-to-actions.md`, `professor.md` — confirmed 0 lines in both Jarvis's real file and this repo's `agents/Jarvis/` mirror, checked directly 2026-09-05, not assumed from either side alone), the other 5 (`anti-slop-editor`, `career-operator`, `learning-agent`, `research-distiller`, `vault-curator`) real and substantial (33–207 lines). `rules/` has `human-writing.md` (real) plus two empty stubs (`what-to-read.md`, `how-to-write.md`); `context/workspace-context.md` is real, `context/MEMORY.md` is empty. **No `hooks/Jarvis/` bucket exists in this repo at all** — Jarvis's three real, tested PowerShell hooks (`jarvis-write-guard.ps1`, `jarvis-session-continuity.ps1`, and a brand-new `jarvis-internship-note-guard.ps1` added 2026-09-04, all registered in Jarvis's real `.claude/settings.json`) have never been staged into this pipeline at all.
- **`internship-research-loop`** (`~/projects/work/internship-research-loop`) got a full `.claude/` build this week, directly in a vault session, never through this pipeline: 7 agents (`contact-researcher`, `loop-verifier` pre-existing; `program-writer`, `tracking`, `promotion`, `applying`, `testing-tools` new), 4 skills (`promote-dossier`, `review-loop-change` pre-existing; `promoting-manual-find`, `tailoring-application` new), 3 `rules/` files, an extended `CLAUDE.md`, and a `settings.json` with a new `PostToolUse` convention-reminder hook (`review-reminder.sh`). **No sync-manifest.json entry exists for this project** — it's real, live, committed to nothing yet (working tree, not pushed), and completely outside this pipeline's visibility.
- **Global homes**: WSL (`~/.claude`) is populated — 3 agents, 7 commands, 3 hooks, 28 skills — but per Log.md's 2026-08-20 entry, the WSL agents/commands reference **pre-reorg vault paths that no longer exist** (`10_UMN/`, `00_Inbox/Headway/`, `50_Archive/copilot/`), not fixed at the time because editing them syncs into a live home a real session depends on — that's exactly the kind of fix this round should actually make, carefully. Windows (`C:\Users\Anant Gupta\.claude`) is **confirmed bare 2026-09-05, re-verified directly**: zero agents, zero commands, zero hooks, skills/ holding only `export-ai-session/` plus ~30 firecrawl-* plugin skills (untouched, not this pipeline's concern). `gbrain` cleared all four Promotion-Criteria gates for global promotion back on 2026-08-20 (`tested-tools/mcp-servers/gbrain/VERDICT.md`) and **still isn't installed on either home** — the single most concrete, already-decided, ready-to-execute action available to this round.
- **This repo's own git status is dirty in a way that predates this round** — `git status --short` shows ~53 changed paths as of 2026-09-05, including a known, already-logged, ~2-week-old unresolved item: `_docs/Architecture.md`/`_docs/PRD.md` show as deleted, `Architecture.md`/`PRD.md` show as new at repo root, uncommitted since the 2026-08-21 `instructions/` fix round explicitly flagged this as "a separate, pre-existing decision this fix didn't touch." Also present: several `M` changes under `commands/.claude_wsl/`, `hooks/.claude_wsl/`, `skills/.claude_wsl/` (real drift between this repo's WSL-home mirror and the live WSL home — check which side is actually newer before resolving either direction), a new untracked `.claude/hooks/pre-artifact-edit-check.sh` that also appears staged at `hooks/second-brain-claudekit/pre-artifact-edit-check.sh` (confirm these are meant to be the same file before assuming one is stale), and the full `agents/Jarvis/`+`skills/Jarvis/` trees showing as untracked (never committed since the sync started populating them).

## Step 0 — clean workspace, a real precondition, not a formality

Before any of the tasks below: run `git status`, read every one of the ~53 (or however many, re-count, don't trust this prompt's number) changed paths, and for each one either (a) commit it as part of a coherent, explained change, (b) explicitly decide and record "leave dirty, here's why" (e.g. an actively-syncing mirror folder that's expected to show as untracked between Unison runs), or (c) flag it as something you can't safely resolve without asking Anant. Do not proceed to Task 1 with unexplained dirty paths. The `Architecture.md`/`PRD.md` relocation is the oldest, most important one to actually close out — it's been open since 2026-08-21.

## Procedure for anything genuinely new you write this round

Per Anant's explicit instruction: **skills first, then hooks, then agents — and when you write an agent, write its matching command in the same pass.** Don't write an agent with no way to invoke it deliberately, and don't build hook automation before the skill it supports actually exists in a reviewable form.

## Task 1 — Jarvis: close the 6-agent gap and the missing hooks bucket

1. For each of the 6 empty agents (`daily-operator`, `human-operator`, `ingestion`, `llm-council`, `note-to-actions`, `professor`): figure out, from the name and from what it's apparently replacing (the old roster was `research-distiller`, `vault-curator`, `career-operator`, `anti-slop-editor`, `learning-agent` — some of these new names look like renames/consolidations of the old ones, some look genuinely new; don't assume which without checking whether the old agent is still referenced anywhere live — CLAUDE.md's skills table, `.claude/commands/*.md`, AGENTS.md) what each one is actually supposed to do. Ask Anant directly if the intent isn't recoverable from context — don't invent a plausible-sounding purpose for a name alone.
2. Write real content for each, in this repo's `agents/Jarvis/` staging first (per "drafted here, promoted from here"), following Jarvis's own build standard (`Jarvis OS — North Star.md` Part 5.2: frontmatter `name`+`description` in the "Use proactively for… MUST BE USED for…" pattern, a tight `tools` allowlist, `model`).
3. Do the same for `rules/what-to-read.md` and `rules/how-to-write.md` (empty) and `context/MEMORY.md` (empty) — check what `rules/human-writing.md` and `context/workspace-context.md` (both real) actually do first, so the two new rules files fill a genuinely different, non-duplicate role, same discipline the internship-research-loop `rules/` files used this week (each one either a real addition or a thin pointer, never a restatement).
4. Create the missing `hooks/Jarvis/` bucket and stage Jarvis's three real hook scripts into it (copy, don't move — the real scripts stay in Jarvis's `.claude/hooks/`), plus a short per-hook note (what it does, what event it's registered on) mirroring `_docs/`'s existing per-tool documentation depth.
5. **Execute the third hop, carefully, for the first time**: once the 6 agents + 2 rules + MEMORY.md have real, reviewed content in this repo's staging, copy them into Jarvis's actual `.claude/agents/`, `.claude/rules/`, `.claude/context/` — show the diff before writing, confirm with Anant before the first one lands (this is a new kind of write this pipeline has never done; don't assume the green light extends to all 9 files just because it's granted for the first one).
6. Log every promotion decision as its own line in this repo's own commit history and in the Jarvis vault's [[20_Progress/Projects/AI Use/Claude Kit/Log]] (same file, same append-only dated-entry convention already established there) — cite exactly what changed and why, per that file's own standard (see any 2026-08-20/21 entry for the expected density).

## Task 2 — Global homes: WSL cleanup, Windows bootstrap, gbrain install

1. **WSL**: fix the confirmed stale vault-path references in `~/.claude/agents/*.md` and `~/.claude/commands/*.md` (the pre-reorg paths named in this repo's own Log.md 2026-08-20 entry) — read each file, confirm the real current path for whatever it references, fix in place. This edits a live global home a real session depends on; show the diff, confirm before writing.
2. **Windows**: this is closer to a blank slate than a merge job, per this repo's own `.claude_windows` manifest entry and `Windows Environment.md`. Before writing a global `CLAUDE.md`/agents/commands there, re-run the WSL-side global-scope test from `_docs/Design.md` ("useful with no regard to which project is open") against whatever you're about to add — don't copy WSL's agents/commands over wholesale; several are Obsidian-vault-specific in a way that's arguably fine for WSL's actual usage pattern but shouldn't be assumed to transfer. If a 2026-08-22 Cursor/Grok+Sonnet session (see this file's own prior round) already produced a `_global-config-plan.md` on either home and executed it, find and read that evidence first (check both homes for a leftover plan file, check git-adjacent history/backups) — don't redo work that already happened; if no evidence it ran, say so plainly and proceed as if starting fresh.
3. **gbrain**: cleared for global promotion since 2026-08-20, still not installed on either home. This is the single most concrete, already-decided action available — do it now on whichever home(s) make sense (check `tested-tools/mcp-servers/gbrain/VERDICT.md` for the exact install steps already verified working), and update Tool Map.md's gbrain row the moment it's actually running on a real home, not before.

## Task 3 — Onboard internship-research-loop into the pipeline

1. Add a new `sync-manifest.json` entry for `internship-research-loop` (`~/projects/work/internship-research-loop`), matching the schema the other 8 real-project entries use — confirm the schema by reading 2-3 existing entries directly, don't guess the field names.
2. Create `agents/internship-research-loop/`, `commands/internship-research-loop/` (if this project has any — check; it may not), `hooks/internship-research-loop/`, `skills/internship-research-loop/`, `instructions/internship-research-loop/` and let the first sync run populate them from the real repo's current `.claude/` (7 agents, 4 skills, 3 rules, `CLAUDE.md`, `settings.json`) — or, if the sync direction for a brand-new entry needs a manual first population before Unison picks it up (check `_docs/Sync.md` for the actual bootstrap procedure for a new entry, don't assume), do that manually once.
3. This project's `settings.json` also has proposed-but-not-yet-applied permission entries and a hook that were written by hand this week (python execution permissions, MCP vault-tool allow/ask split, `review-reminder.sh` on `PostToolUse`) — confirm the real repo's `settings.json` already has them (it should — they were applied directly, not just proposed, as of 2026-09-04) before assuming this task still needs to add them.
4. Cross-reference `sandbox/hiring-agent/` (InterviewStreet's hiring agent, cloned 2026-07-30, explicitly tied to "evaluate usefulness for the internship research loop" per this repo's own Tool Map row, real next step never attempted) — now that internship-research-loop's own `.claude/` is genuinely built out, actually run hiring-agent once against a real internship-search pass and compare its output to what `program-writer`/`promotion`/`tracking` already do. Record a real keep/drop/blend verdict, same rigor as the `cpr-compress-preserve-resume` blend decision — don't leave this as another "still worth evaluating" entry that sits idle for weeks.

## Task 4 — This repo's own `.claude/`

1. Resolve the `pre-artifact-edit-check.sh` duplication (`.claude/hooks/` vs. staged `hooks/second-brain-claudekit/`) — confirm whether these are meant to be identical (this repo self-mirrors, per the manifest's `second-brain-claudekit` entry) and if so which is the real source; if they've diverged, reconcile deliberately, not by picking one arbitrarily.
2. Review this repo's own 3 agents (`research-distiller`, `vault-curator`, `weekly-reviewer`) and 10 commands against the same North Star Part 5 build standard Jarvis's are held to — this repo has never been audited against that standard itself, only used it as a design reference for others.

## Sandbox review — classify what's sitting there, using Promotion-Criteria.md's own four gates

Do not re-clone or re-triage the 13 already-dropped repos (agent-skills, andrej-karpathy-skills, claude-skills-llm-council, llm-council, last30days-skill, claude-code-best-practice, system-prompts-and-models-of-ai-tools, CL4R1T4S, agentscope, autoresearch, gsd-core, agency-agents, agent-skill-simplified-technical-english, Agent-Reach) or the 2 out-of-scope-here special cases (adx, memsearch) — those decisions are recorded and stand. Focus on what's actually still open, one real next action each:
- **hiring-agent** — see Task 3.4 above, now has a real, ready use case.
- **obsidian-mind** — read its procedural-vs-content split and five-hook lifecycle against `Jarvis OS — North Star.md` Part 5 (which already cites it as a design model) and note explicitly what Jarvis's real hooks already match vs. what's still missing (the `PostToolUse`-validate-frontmatter pattern and the `UserPromptSubmit`-classify-and-route pattern from North Star Part 5.3 are both still unbuilt in Jarvis as of 2026-09-04 — check whether obsidian-mind's real implementation of either is worth adapting directly rather than building from scratch).
- **obsidian-second-brain** — diff its vault-rules against `60_Claude/vault-rules/` (this repo's own) once; note real disagreements, don't just skim.
- **claude-mem** — hold per its own recorded reasoning (overlaps gbrain + `jarvis-memory` MCP) until gbrain is actually running (Task 2.3) — re-check only after that, don't jump ahead.
- **agentic-inbox** — compare its triage logic against this repo's own `commands/inbox-process.md` (confirmed zero-provenance native scaffold, currently unused) — a real improvement-or-not verdict, not another deferral.
- **spec-kit, claude-context, promptfoo** — each already had a real install/run step executed 2026-08-20 (10 skill files scaffolded; 108 files/1369 chunks indexed at 4/4 correct semantic queries; 1-of-2 promptfoo eval pass with a genuine rubric-caught weakness in `/challenge`). None promotion-decided yet — for at least one of the three, walk it through Promotion-Criteria.md's four gates for real and record an actual verdict in Tool Map.md, don't leave all three open again.
- **gstack** — still blocked on missing WSL libs (`libnss3.so` etc.) per its own documented fix command in Tool Map.md. If this session has a real interactive terminal, run the fix and retry `./setup`; if not, say so plainly and leave it blocked rather than guessing at success.
- **mattpocock-engineering** — 0 of 17 skills individually tested, a real dated backlog table exists (`tests/skills/mattpocock-engineering/README.md`). Test at least 2-3 of the 17 for real this round rather than leaving the backlog at zero again.

For anything genuinely new found in `sandbox/` beyond the 32 already tracked (re-run `ls -d sandbox/*/ | wc -l` and compare against 32 — if it's grown, the new ones need the same one-line keep/drop/still-worth-evaluating treatment the 2026-08-20 triage gave the prior 32, not silent omission).

## After the ingestion work — review and tighten

1. Read `_All-Projects-Sync-Log.md` for the real, current sync-task health (it has failed silently before, per this repo's own 2026-08-20/21 history) before trusting that anything you just staged will actually propagate.
2. Update [[20_Progress/Projects/AI Use/Claude Kit/Tool Map]] and [[20_Progress/Projects/AI Use/Claude Kit/Log]] with every real state change this round produced — new manifest entry, every promotion, every sandbox verdict, per those files' own established append-only, cited-evidence convention. Do not summarize loosely; cite exact paths, exact line/file counts, exact commit hashes, the same density every prior round in this file used.
3. Make further improvements to this repo's own `.claude/` folder and documentation/procedure only *after* the above — name anything real you find (a stale doc, a convention that should be tightened, a genuine second-brain-claudekit-scoped gap), don't invent busywork to fill this step.

## Report back

- Step 0: the real dirty-path count, and the decision made on each category.
- Task 1: which of the 6 agents got real content, what each does, whether the third hop actually landed in Jarvis's real `.claude/` (and if Anant didn't confirm past the first file, say exactly where you stopped).
- Task 2: WSL path fixes made, Windows's real starting state re-confirmed or corrected, gbrain's install status on each home.
- Task 3: the new manifest entry, its first sync result, the hiring-agent verdict.
- Task 4: the pre-artifact-edit-check.sh resolution, the self-audit finding.
- Sandbox: one line per item above — verdict and evidence.
- Anything in this prompt's own "already established" section that turned out wrong when you checked it directly — state that plainly, same discipline every prior round in this file has used.
```
  ```
- `mcp__jarvis__vault_read` — `{"path":"40_Resources/CS/Repos.md"}`
- `mcp__jarvis__vault_list` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion"}`
- `mcp__jarvis__vault_list` — `{"path":"60_Claude/20_Distilled_Notes/Sources - Plan"}`
- `mcp__jarvis__vault_list` — `{"path":"20_Progress/Projects/AI Use/Claude Kit"}`
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && echo "--- Design.md ---" && cat -n _docs/Design.md | sed -n '1,400p' | grep -n "Tool Map\|Log\.md" && echo "--- Jarvis.md ---" && grep -n "Tool Map\|Log\.md" _docs/Jarvis.md`
  ```
--- Design.md ---
26:    26	2. **Real evidence accumulates** — dated, tested, decided rows in `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md`, not intentions.
--- Jarvis.md ---
21:| `sandbox/<repo>/` — real clone, real install attempt | `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md` — one row, stage = `sandbox` |
26:| `tested-tools/_future/<repo>/` — cleared `tested-tools/` review but earns no spot in any current project, parked for a future use case named in a sibling `FOR-WHAT.md` | New 2026-08-19, no Jarvis-side row shape decided yet — same `Tool Map.md` row, stage = `parked (future)`, is the natural extension but this has not been confirmed with Anant. Flagged, not assumed. |
27:| `tests/` — the actual test(s) proving a specific piece of tooling is useful | New 2026-08-19, no Jarvis-side equivalent exists. Likely referenced from the same `Tool Map.md` row (what test proved this tool's "closes a named gap" claim) once built — not yet decided. |
29:| — | `20_Progress/Projects/AI Use/Claude Kit/Log.md` — one dated entry every time a `Tool Map.md` row changes, following the `60_Claude/07_AI_Information/Session Logs/log.md` convention (`## [YYYY-MM-DD] tag \| title` heading, then bullets) |
51:- **`Tool Map.md`** — the living, per-tool ingestion record for this repo. One row per tool, updated the same session its pipeline stage changes. **As of 2026-08-09 this is more current than this repo's own docs used to be** — it already has ECC's real test results (3378/3388 tests passing) and the 17-repo 2026-07-30 sandbox batch. Per Jarvis's own "one fact, one home" principle (`Jarvis OS — North Star.md`), **`Tool Map.md` is the sole source of truth for tool-by-tool pipeline state** — this repo's own docs point here instead of keeping a second, driftable copy (see `_docs/PRD.md`).
52:- **`Log.md`** — one dated entry every time a `Tool Map.md` row changes, `## [YYYY-MM-DD] tag | title` heading, following `60_Claude/07_AI_Information/Session Logs/log.md`'s convention.
53:- **`Toolkit/`** — moved here from `40_Resources/CS/AI/Toolkit/` during the 2026-08 reorganization (confirmed: that old path no longer exists). Holds `Agents/`, `Commands/`, `Hooks/`, `MCPs/`, `Skills/` subfolders and a `Claude Code.md` reference note — a catalog of what's available/known, distinct from `Tool Map.md`'s pipeline-stage tracking. `Claude Code.md` states its own job precisely: "`Tool Map` answers 'is this tool trustworthy yet'; the Toolkit answers 'given a real task right now, what do I actually type.'"
62:`GitHub Ingestion Implementation.md`, `_Notes Created From Ingestion.md`, `00_Execution.md`, and `PDF's Ingestion Implementation.md` — the notes this repo's `_docs/PRD.md` and `_docs/Design.md` cite as the origin of the three-week-unexecuted-plan failure mode this repo exists to prevent. **The literal "Tier 1: INSTALL NOW" table itself lives in `PDF's Ingestion Implementation.md`'s Matrix section, not `GitHub Ingestion Implementation.md`** (corrected 2026-08-19 in `_docs/PRD.md` and `_docs/Repo-Map.md` — `GitHub Ingestion Implementation.md` has its own, separate, unlabeled 4-item "Priority 1" list). Historical record, not a live tracker — `Tool Map.md` is where current state lives now.
97:- `30_Order/Templates/Capability/AI Tools Weekly Review Template.md` and `.../AI Tools Monthly Review Template.md` — both real, Templater-driven, matching the Standard's required sections (Period Covered, Sources Reviewed, What Ran This Period, Sync & Capture Health, Findings, Decided Fixes, Open Questions, Next Period's Watch List; Monthly adds a Tool Map Health Check that names anything stuck at one pipeline stage for over a month).
125:`20_Progress/AI/Claude Code/<Project>/` answers "what is this project's Claude Code setup **right now**" — hand-maintained, per-project, mirror-of-reality snapshots for every project except `second-brain-claudekit`, which is genuinely live. `20_Progress/Projects/AI Use/Claude Kit/` answers an earlier, different question: "what has `second-brain-claudekit` ingested, and what stage is each thing at, regardless of whether it's reached any project's real `.claude/` yet." Most of what `Tool Map.md` tracks (gbrain, gstack, mattpocock-engineering, ECC, the 2026-07-30 batch) hasn't reached any project's `.claude/` — there's nothing yet to add to a per-project folder. The two layers connect at exactly one point: the day a tool crosses from tracked in `Tool Map.md` into an actual project's real `.claude/skills/`, that project's own snapshot gets updated too, and the `Tool Map.md` row notes which project(s) received it.
129:`20_Progress/Projects/AI Use/Claude Kit/Log.md` deliberately reuses the exact heading shape already established in `60_Claude/07_AI_Information/Session Logs/log.md` (`## [YYYY-MM-DD] tag | title`, followed by narrative bullets) rather than inventing a new format. Consistency across the vault's logging layers matters more than a locally "nicer" format — the same principle behind this repo's own dated-amendment convention in `_docs/`.
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Jarvis.md`
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && echo "--- grep Repos.md ---" && grep -rn "Repos\.md\|40_Resources" _docs/*.md Architecture.md PRD.md 2>/dev/null; echo "--- grep Tool Map / Log.md across all _docs ---" && grep -n "Tool Map\|Log\.md" _docs/*.md`
  ```
--- grep Repos.md ---
_docs/Jarvis.md:53:- **`Toolkit/`** — moved here from `40_Resources/CS/AI/Toolkit/` during the 2026-08 reorganization (confirmed: that old path no longer exists). Holds `Agents/`, `Commands/`, `Hooks/`, `MCPs/`, `Skills/` subfolders and a `Claude Code.md` reference note — a catalog of what's available/known, distinct from `Tool Map.md`'s pipeline-stage tracking. `Claude Code.md` states its own job precisely: "`Tool Map` answers 'is this tool trustworthy yet'; the Toolkit answers 'given a real task right now, what do I actually type.'"
_docs/Jarvis.md:112:### `40_Resources/CS/AI/` — the AI-knowledge reference layer
_docs/Jarvis.md:121:The single place every AI-related note in the vault ultimately maps into — deliberately kept light (short notes, heavy interlinking) rather than duplicating detail that belongs in `40_Resources/CS/AI/` or `60_Claude/`. Explains, in real detail, what each AI-related folder is *for*. This file and `_docs/Repo-Map.md` are this repo's own equivalent instinct applied to its own filesystem.
_docs/Design.md:11:The generic `00_Daily/10_Areas/20_Projects/30_Knowledge/40_Career/50_Claude/` folder scheme in this repo's root is deliberately *not* Jarvis's actual, much richer scheme (`00_Dashboard/10_Areas/20_Progress/30_Order/40_Resources/50_Archive/60_Claude/`). Verified directly by fetching the real repo during the 2026-07-29 GitHub ingestion pass (`60_Claude/20_Distilled_Notes/Sources - Plan/00_Execution.md`, `# Github` section, "Testing methodology" entry) — this repo's folder scheme is a generic reference shape, kept separate on purpose so that testing a tool here never risks touching Jarvis's real structure.
_docs/Design.md:17:**Resolved (2026-08-09), directly from Anant:** the rename was deliberate, done by him, intentionally matching Jarvis's own `60_Claude/` name — "plainly just a joke or reference. It does not mean anything." So the separation this section originally argued for (generic scheme, kept unlike Jarvis's on purpose) is *narrower* than first written: it holds for the daily-note/PARA folders (`00_Daily/10_Areas/20_Projects/30_Knowledge/40_Career/`, still deliberately generic and un-converged with Jarvis's `00_Dashboard/10_Areas/20_Progress/30_Order/40_Resources/50_Archive/`), but not for `60_Claude/`, which converges on purpose and carries no functional significance beyond the name match. No further action needed — just recognize `60_Claude/` consistently as this repo's own folder (not Jarvis's) wherever it's referenced, the same care any shared name needs.
_docs/Design.md:59:> Install only what closes a *named* gap, reference everything else, test in one session before committing, mark every repo `(*INSTALLED*)`/`(*SKIP*)`/`(*EVAL: DATE*)` in `Repos.md` once decided.
_docs/Design.md:65:- Reference-only tools (Awesome MCP Servers, claude-code-best-practice, system-prompts-and-models-of-ai-tools) never enter `sandbox/` at all — they're read, cited, and left in `40_Resources/CS/Repos.md`. `sandbox/` is reserved for things that might actually run.
PRD.md:39:- This does not track every starred GitHub repo — `40_Resources/CS/Repos.md` in the Jarvis vault already does that job as a discovery/triage layer. This repo and its Jarvis-side tracking (`20_Progress/Projects/AI Use/Claude Kit/`) only start once a repo is actually cloned into `sandbox/`.
--- grep Tool Map / Log.md across all _docs ---
_docs/Repo-Map-Archive.md:51:**Symptom:** `_docs/Sync.md` and Jarvis's own `Setup.md` both describe the 15-minute Windows Scheduled Task (`SecondBrainClaudekit-JarvisSync`) as live. Windows `Get-ScheduledTask`/`Get-ScheduledTaskInfo` agreed — `State: Ready`, `LastTaskResult: 0`, firing every 15 minutes. But the Jarvis-side mirror (`20_Progress/AI/Claude Code/second-brain-claudekit/`) was frozen at 2026-07-30: `Sync-Log.md` hadn't grown since `2026-08-06 16:31`, and the mirrored hook script still carried the old, since-fixed `50_Claude` bug from earlier in this same 2026-08-08/09 session.
_docs/Repo-Map-Archive.md:55:**Fix applied:** Updated the path in both `.vbs` copies to `60_Claude/scripts/sync-jarvis.sh`, re-ran `register-jarvis-sync-task.ps1` (re-copies the fixed launcher to the Windows-side location and re-registers the task), then ran `sync-jarvis.sh` manually to confirm end-to-end: it created a correct `.claude/` folder in the Jarvis mirror (this repo's mirror previously only had a differently-named `Da Shit/` folder), the synced hook now carries the `60_Claude` fix, and `Sync-Log.md` got a genuine new entry (`2026-08-09 00:39:04 OK exit=0`).
_docs/Repo-Map-Archive.md:63:- [x] `_docs/PRD.md` rewritten 2026-08-09 — state table dropped, points to `Tool Map.md` as sole source of truth; dual-purpose statement added; project list corrected against `MOC.md`.
_docs/Current-Setup.md:3:Written up 2026-08-09 from a direct `/config`-style capture of this session's Claude Code environment. This is what's actually wired in, not a wishlist — treat it the same way `_docs/PRD.md` treats `Tool Map.md`: a live snapshot, refresh it when the setup changes rather than letting it drift.
_docs/Current-Setup.md:21:| `graphify` | 7 | Connected | Knowledge-graph construction from content — the same tool tracked as a "to use" candidate in `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md`, and the basis of the planned `60_Claude/40_Project_Briefs/Claude Kit/` integration (`_docs/Jarvis.md`). |
_docs/Current-Setup.md:63:The `ecc` marketplace is a separate connection point from `sandbox/ecc/` (the real clone of `affaan-m/everything-claude-code` this repo's pipeline is evaluating, per `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md`) — worth checking both stay consistent as ECC's evaluation progresses, not assumed to already be in sync.
_docs/Gaps-Archive.md:47:**Terminology drift between this repo and Jarvis was never reconciled** — Jarvis's own `Tool Map.md` called the second pipeline stage `tested-skills` while this repo (post-2026-08-09 rename) called it `tested-tools`, tracked as open through 2026-08-19. **Resolved, confirmed 2026-08-20 (fifth pass):** Jarvis's `Tool Map.md` frontmatter itself now reads "this vault's own vocabulary was still calling it `tested-skills` until the 2026-08-19 pass caught the drift, and this terminology has held correctly since (re-verified 2026-08-20 by direct read of this file — no `tested-skills` reference remains outside historical mentions of the rename itself)" — read directly from the live file, not assumed. This finding is fully closed.
_docs/Design.md:26:2. **Real evidence accumulates** — dated, tested, decided rows in `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md`, not intentions.
_docs/Repo-Map.md:33:| `tested-tools/` | Structure: `<type>/<use-case>/<source-repo>/` — artifact type at the top (`agents/`, `commands/`, `hooks/`, `skills/`, plus **`mcp-servers/`, new 2026-08-20**), then the specific use case a piece serves (only assigned once *individually* tested), then the source repo. Current contents: `skills/mattpocock-engineering/` (17 files, ungrouped, real backlog in `tests/skills/mattpocock-engineering/README.md`), `commands/cpr-compress-preserve-resume/` (verdict: blend), `agents\|commands\|hooks/native-scaffold/` (15 zero-provenance files), `mcp-servers/gbrain/` (verdict: cleared, global candidate — see `VERDICT.md`). | See `tested-tools/README.md`. Jarvis's own `Tool Map.md` frontmatter confirms the `tested-skills`/`tested-tools` terminology drift is resolved as of 2026-08-19 (re-verified 2026-08-20 by direct read). |
_docs/Repo-Map.md:35:| `instructions/` | `instructions/<Name>/` holds **only explicit main files** — `CLAUDE.md`/`AGENTS.md`/`README.md`/`PRD.md`/`Architecture.md`/real equivalents — for **all 10** `sync-manifest.json` entries as of 2026-08-20 (`.claude_windows` omitted — it has no real `CLAUDE.md`/`README.md` today, not a scope exclusion). **Never a directory's contents, no matter how relevant — confirmed by Anant 2026-08-21, the fourth and final correction to this folder's scope.** `instructions_paths` in the manifest may only name explicit files; `sync-all.sh` does not, and deliberately will not, handle a directory-shaped entry gracefully — `cp -f` (never `cp -r`) makes one fail loudly (`FAIL` in the entry's `Sync-Log.md`) instead of being flattened, nested, or otherwise silently mishandled. `second-brain-claudekit`'s prior self-exclusion ("one fact, one home") stays reversed — every entry gets consistent treatment — but its own entry now names its 4 real root files explicitly (`CLAUDE.md`, `README.md`, `PRD.md`, `Architecture.md`) instead of the directory `"_docs"` it used to list; `instructions/second-brain-claudekit/` holds exactly those 4 files, byte-confirmed against their root sources. Where a root and a nested file share a basename (Resq/OpsPilot's root `README.md` + nested `.claude/README.md`), the nested one is prefixed `claude-` to avoid a silent overwrite. **History:** a 2026-08-21 part-1 fix mistakenly built directory-flatten logic to accommodate the `"_docs"` entry (fixing the resulting `_docs/_docs/` nesting bug, but at the wrong layer); a same-day part-2 correction removed that logic entirely and fixed the manifest entry itself, which is the actual, final rule. | Convention: never a `sandbox/` candidate — per `instructions/README.md`. Full build history (four corrected premises now, most recent 2026-08-21 part 2): `_docs/Repo-Map-Archive.md`, `instructions/README.md`, `_docs/Sync.md`'s 2026-08-21 amendments (parts 1 and 2). |
_docs/Gaps.md:5:**Archived 2026-08-20 (fifth pass):** everything previously marked `[RESOLVED ...]` was moved to `_docs/Gaps-Archive.md`, per Anant's explicit choice via `AskUserQuestion` ("archive resolved sections now" over "keep everything in place as a permanent audit trail"). Nothing was deleted — the archive holds the full original text. This file now holds only what's still genuinely open or standing, so it stops growing indefinitely with settled history. Two real corrections were made in the process, not just a mechanical move: the "10+ days uncommitted work" finding was stale (the repo has been committed since 2026-08-20, `git log`/`git status` re-verified directly) and the "tested-skills vs tested-tools terminology drift" finding was stale (Jarvis's own `Tool Map.md` frontmatter now confirms it's been resolved since 2026-08-19) — both corrected and archived as resolved rather than carried forward as open when they no longer are.
_docs/Gaps.md:37:**Reverted and simplified:** the recursive-flatten/parent-folder-prefix logic is deleted from `sync-all.sh`. The `instructions_paths` loop is back to its original simple shape (one file in, one file out, `cp -f` by basename, literal `claude-` collision prefix for a nested-vs-root name clash) — with one hardening kept: `cp -f`, never `cp -r`, so a directory entry that somehow lands in the manifest again fails loudly (`FAIL` in the entry's `Sync-Log.md`) instead of being handled at all. Verified directly that `cp -f` against a real directory reproduces this loud failure.
_docs/Sync.md:110:- Every run appends a line to `20_Progress/AI/Claude Code/second-brain-claudekit/Sync-Log.md` (timestamp, OK/CONFLICTS/ERRORS/FATAL label, exit code, and full Unison output on anything other than a clean run) — this is a real log with a real failure and a real success already in it from this session's testing.
_docs/Sync.md:112:- **Trigger (wired 2026-07-30):** Windows Scheduled Task `SecondBrainClaudekit-JarvisSync` runs every 15 minutes via a hidden `wscript` launcher (`50_Claude/scripts/sync-jarvis-silent.vbs`, Windows copy under `30_Order/System/claude-workflow/scripts/`) so no console pops up. Re-register with `50_Claude/scripts/register-jarvis-sync-task.ps1` (same script also lives next to the Windows VBS copy). Sync behavior is unchanged — only the window is hidden; `Sync-Log.md` still records every run.
_docs/Sync.md:119:**Root cause, confirmed by direct inspection:** `sync-jarvis-silent.vbs` (both this repo's copy, now at `60_Claude/scripts/sync-jarvis-silent.vbs`, and the live Windows-side copy at `30_Order/System/claude-workflow/scripts/sync-jarvis-silent.vbs`, which Task Scheduler actually executes) hardcoded the pre-rename path `.../50_Claude/scripts/sync-jarvis.sh`. That path stopped existing once the repo's `50_Claude/` became `60_Claude/`. The launcher's `sh.Run(cmd, 0, False)` call is fire-and-forget — `False` means it does not wait for or check the launched command's result — so `wscript.exe` itself always exited 0 regardless of whether the inner `wsl.exe bash -lc "<nonexistent path>"` command succeeded. Every 15 minutes, the task fired, the bash command failed instantly on a path that didn't exist, and nothing was ever logged, because the failure happened before `sync-jarvis.sh`'s own log-writing logic ever got a chance to run. Direct evidence of how long this had been broken: `Sync-Log.md` had no entries between `2026-08-06 16:31:36` and `2026-08-09 00:39:04`, and the Jarvis-side mirror's hook script still carried a bug (the old `50_Claude` hardcoded session-log path, itself a near-identical class of stale-path bug — see `_docs/Repo-Map.md`'s Incident section) that had already been fixed in the real repo hours earlier the same session.
_docs/Sync.md:121:**Fixed 2026-08-09:** both `.vbs` copies updated to the `60_Claude` path; `register-jarvis-sync-task.ps1` re-run (copies the fixed launcher to the Windows side and re-registers the task); `sync-jarvis.sh` run manually to confirm end-to-end — it created a correct `.claude/` folder in the Jarvis mirror and `Sync-Log.md` received a genuine new entry. Verified, not assumed.
_docs/Sync.md:169:2. **New `sync-all.sh` logic, additive, after the existing per-entry Unison block:** for each name in `instructions_paths`, resolve `$SOURCE/<path>`, and if it exists, `cp -f` it to `$REPO_ROOT/instructions/<Name>/<basename of path>` (creating the directory if needed). If the source file is missing, log a warning line to the entry's own `Sync-Log.md` and continue — never abort the whole entry's run over one missing instruction file, matching the script's existing per-entry-failure-doesn't-block-others design. `$REPO_ROOT` is `$SCRIPT_DIR/../..`, resolved the same self-locating way `SCRIPT_DIR`/`MANIFEST` already are — never hardcoded, per this script's own stated design lesson at the top of the file.
_docs/Sync.md:209:**`sync-all.sh` reverted and simplified:** the directory-resolution/flatten logic (recursive `find -name '*.md'`, per-item parent-folder tracking, sanitized-prefix derivation) is deleted. The `instructions_paths` loop is back to the simple 2026-08-19 shape — one file in, one file out, `cp -f` by basename — with one deliberate hardening: `cp -f` (never `cp -r`) means a directory-shaped entry, should one ever land in the manifest again, **fails loudly** (`cp: -r not specified; omitting directory ...`, non-zero exit) and is logged as `FAIL` in the entry's `Sync-Log.md`, rather than being silently flattened or silently nested. That is the intended failure mode: a directory in `instructions_paths` is a data error in the manifest to go fix, not a shape the script tries to accommodate. Verified directly: `cp -f` against a real directory source reproduces this exact loud failure.
_docs/Jarvis.md:21:| `sandbox/<repo>/` — real clone, real install attempt | `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md` — one row, stage = `sandbox` |
_docs/Jarvis.md:26:| `tested-tools/_future/<repo>/` — cleared `tested-tools/` review but earns no spot in any current project, parked for a future use case named in a sibling `FOR-WHAT.md` | New 2026-08-19, no Jarvis-side row shape decided yet — same `Tool Map.md` row, stage = `parked (future)`, is the natural extension but this has not been confirmed with Anant. Flagged, not assumed. |
_docs/Jarvis.md:27:| `tests/` — the actual test(s) proving a specific piece of tooling is useful | New 2026-08-19, no Jarvis-side equivalent exists. Likely referenced from the same `Tool Map.md` row (what test proved this tool's "closes a named gap" claim) once built — not yet decided. |
_docs/Jarvis.md:29:| — | `20_Progress/Projects/AI Use/Claude Kit/Log.md` — one dated entry every time a `Tool Map.md` row changes, following the `60_Claude/07_AI_Information/Session Logs/log.md` convention (`## [YYYY-MM-DD] tag \| title` heading, then bullets) |
_docs/Jarvis.md:51:- **`Tool Map.md`** — the living, per-tool ingestion record for this repo. One row per tool, updated the same session its pipeline stage changes. **As of 2026-08-09 this is more current than this repo's own docs used to be** — it already has ECC's real test results (3378/3388 tests passing) and the 17-repo 2026-07-30 sandbox batch. Per Jarvis's own "one fact, one home" principle (`Jarvis OS — North Star.md`), **`Tool Map.md` is the sole source of truth for tool-by-tool pipeline state** — this repo's own docs point here instead of keeping a second, driftable copy (see `_docs/PRD.md`).
_docs/Jarvis.md:52:- **`Log.md`** — one dated entry every time a `Tool Map.md` row changes, `## [YYYY-MM-DD] tag | title` heading, following `60_Claude/07_AI_Information/Session Logs/log.md`'s convention.
_docs/Jarvis.md:53:- **`Toolkit/`** — moved here from `40_Resources/CS/AI/Toolkit/` during the 2026-08 reorganization (confirmed: that old path no longer exists). Holds `Agents/`, `Commands/`, `Hooks/`, `MCPs/`, `Skills/` subfolders and a `Claude Code.md` reference note — a catalog of what's available/known, distinct from `Tool Map.md`'s pipeline-stage tracking. `Claude Code.md` states its own job precisely: "`Tool Map` answers 'is this tool trustworthy yet'; the Toolkit answers 'given a real task right now, what do I actually type.'"
_docs/Jarvis.md:62:`GitHub Ingestion Implementation.md`, `_Notes Created From Ingestion.md`, `00_Execution.md`, and `PDF's Ingestion Implementation.md` — the notes this repo's `_docs/PRD.md` and `_docs/Design.md` cite as the origin of the three-week-unexecuted-plan failure mode this repo exists to prevent. **The literal "Tier 1: INSTALL NOW" table itself lives in `PDF's Ingestion Implementation.md`'s Matrix section, not `GitHub Ingestion Implementation.md`** (corrected 2026-08-19 in `_docs/PRD.md` and `_docs/Repo-Map.md` — `GitHub Ingestion Implementation.md` has its own, separate, unlabeled 4-item "Priority 1" list). Historical record, not a live tracker — `Tool Map.md` is where current state lives now.
_docs/Jarvis.md:97:- `30_Order/Templates/Capability/AI Tools Weekly Review Template.md` and `.../AI Tools Monthly Review Template.md` — both real, Templater-driven, matching the Standard's required sections (Period Covered, Sources Reviewed, What Ran This Period, Sync & Capture Health, Findings, Decided Fixes, Open Questions, Next Period's Watch List; Monthly adds a Tool Map Health Check that names anything stuck at one pipeline stage for over a month).
_docs/Jarvis.md:125:`20_Progress/AI/Claude Code/<Project>/` answers "what is this project's Claude Code setup **right now**" — hand-maintained, per-project, mirror-of-reality snapshots for every project except `second-brain-claudekit`, which is genuinely live. `20_Progress/Projects/AI Use/Claude Kit/` answers an earlier, different question: "what has `second-brain-claudekit` ingested, and what stage is each thing at, regardless of whether it's reached any project's real `.claude/` yet." Most of what `Tool Map.md` tracks (gbrain, gstack, mattpocock-engineering, ECC, the 2026-07-30 batch) hasn't reached any project's `.claude/` — there's nothing yet to add to a per-project folder. The two layers connect at exactly one point: the day a tool crosses from tracked in `Tool Map.md` into an actual project's real `.claude/skills/`, that project's own snapshot gets updated too, and the `Tool Map.md` row notes which project(s) received it.
_docs/Jarvis.md:129:`20_Progress/Projects/AI Use/Claude Kit/Log.md` deliberately reuses the exact heading shape already established in `60_Claude/07_AI_Information/Session Logs/log.md` (`## [YYYY-MM-DD] tag | title`, followed by narrative bullets) rather than inventing a new format. Consistency across the vault's logging layers matters more than a locally "nicer" format — the same principle behind this repo's own dated-amendment convention in `_docs/`.
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Design.md`
- `Edit` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Design.md`
  ```diff
  - 2. **Real evidence accumulates** — dated, tested, decided rows in `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md`, not intentions.
  + 2. **Real evidence accumulates** — dated, tested, decided rows in `20_Progress/Projects/AI Use/Claude Kit/Tool Map.md`, not intentions. (`Tool Map.md`'s own trail starts further back, at `40_Resources/CS/Repos.md` — the master ~95-repo starred index, tiered `Implement > Knowledge`, where every repo gets a real decision marker — `(*INSTALL: QUEUED*)`/`(*SKIP*)`/`(*EVAL: DATE*)`/`(*DEFERRED*)` — before it's ever cloned into `sandbox/`. Every per-repo "why" behind a `Tool Map.md` row ultimately traces back to this file; see `_docs/Jarvis.md`'s citation of the same file for the full chain.)
  ```
- `Edit` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Jarvis.md`
  ```diff
  - ### `20_Progress/Projects/AI Use/Claude Kit/` — this repo's decision tracker

- **`Tool Map.md`**
  + ### `20_Progress/Projects/AI Use/Claude Kit/` — this repo's decision tracker

- **`40_Resources/CS/Repos.md`** (Jarvis, upstream of this whole folder — cited here because everything below traces back to it) — the master ~95-repo GitHub-stars index, organized by star list, tiered `Implement > Knowledge`, each entry annotated `(*INSTALL: QUEUED*)`/`(*SKIP*)`/`(*EVAL: DATE*)`/`(*DEFERRED*)`. This is where the `sandbox/` → `tested-tools/` → `Promotion-Criteria.md` decision trail actually starts: a repo only gets a `Tool Map.md` row once it's been triaged here and cloned into `sandbox/`. Every real decision's per-repo "why" in `Tool Map.md` ultimately traces back to this file's markers — and, one layer further back, to the Implement>Knowledge principle itself, sourced from `PDF's Ingestion Implementation.md`'s Matrix (see the `Sources - Plan/` section below).
- **`Tool Map.md`**
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && ls -d sandbox/*/ | wc -l && echo "---" && ls -d sandbox/*/ | sed 's|sandbox/||; s|/$||' | sort`
  ```
32
---
Agent-Reach
CL4R1T4S
OpenBB
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
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && echo "--- sandbox/skills remote ---" && git -C sandbox/skills remote -v 2>/dev/null; ls sandbox/skills 2>/dev/null | head -5; echo "--- tested-tools tree ---" && find tested-tools -maxdepth 3 -type d | sort`
  ```
--- sandbox/skills remote ---
origin	https://github.com/mattpocock/skills.git (fetch)
origin	https://github.com/mattpocock/skills.git (push)
AGENTS.md
CHANGELOG.md
CLAUDE.md
CONTEXT.md
LICENSE
--- tested-tools tree ---
tested-tools
tested-tools/_future
tested-tools/agents
tested-tools/agents/native-scaffold
tested-tools/commands
tested-tools/commands/cpr-compress-preserve-resume
tested-tools/commands/native-scaffold
tested-tools/hooks
tested-tools/hooks/native-scaffold
tested-tools/mcp-servers
tested-tools/mcp-servers/gbrain
tested-tools/skills
tested-tools/skills/mattpocock-engineering
tested-tools/skills/mattpocock-engineering/ask-matt
tested-tools/skills/mattpocock-engineering/code-review
tested-tools/skills/mattpocock-engineering/codebase-design
tested-tools/skills/mattpocock-engineering/diagnosing-bugs
tested-tools/skills/mattpocock-engineering/domain-modeling
tested-tools/skills/mattpocock-engineering/grill-with-docs
tested-tools/skills/mattpocock-engineering/implement
tested-tools/skills/mattpocock-engineering/improve-codebase-architecture
tested-tools/skills/mattpocock-engineering/prototype
tested-tools/skills/mattpocock-engineering/research
tested-tools/skills/mattpocock-engineering/resolving-merge-conflicts
tested-tools/skills/mattpocock-engineering/setup-matt-pocock-skills
tested-tools/skills/mattpocock-engineering/tdd
tested-tools/skills/mattpocock-engineering/to-spec
tested-tools/skills/mattpocock-engineering/to-tickets
tested-tools/skills/mattpocock-engineering/triage
tested-tools/skills/mattpocock-engineering/wayfinder
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && echo "=== _future ===" && find tested-tools/_future -maxdepth 2 && echo "=== gbrain VERDICT ===" && cat tested-tools/mcp-servers/gbrain/VERDICT.md 2>/dev/null | head -60 && echo "=== native-scaffold dirs listing ===" && ls tested-tools/agents/native-scaffold tested-tools/commands/native-scaffold tested-tools/hooks/native-scaffold 2>/dev/null && echo "=== cpr VERDICT ===" && find tested-tools/commands/cpr-compress-preserve-resume -maxdepth 1`
  ```
=== _future ===
tested-tools/_future
=== gbrain VERDICT ===
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
=== native-scaffold dirs listing ===
tested-tools/agents/native-scaffold:
connector.md
researcher.md
reviewer.md
writer.md

tested-tools/commands/native-scaffold:
brainstorm.md
capture.md
connect.md
inbox-process.md
journal.md
research.md
review.md
summarize.md

tested-tools/hooks/native-scaffold:
auto-link.md
daily-summary.md
post-note-create.md
=== cpr VERDICT ===
tested-tools/commands/cpr-compress-preserve-resume
tested-tools/commands/cpr-compress-preserve-resume/preserve.md
tested-tools/commands/cpr-compress-preserve-resume/resume.md
tested-tools/commands/cpr-compress-preserve-resume/compress.md
tested-tools/commands/cpr-compress-preserve-resume/VERDICT.md
  ```
- `Bash`:
  ```bash
echo "=== gbrain install check ===" && which gbrain 2>/dev/null; ls -la ~/.gbrain 2>/dev/null; echo "exit: $?"
echo "=== WSL global .claude mcp config ===" && cat ~/.claude.json 2>/dev/null | grep -i gbrain
echo "=== CPR VERDICT ===" && tail -40 ~/projects/ai/claude/second-brain-claudekit/tested-tools/commands/cpr-compress-preserve-resume/VERDICT.md 2>/dev/null
echo "=== is cpr promoted anywhere (commands dirs)? ===" && find ~/projects/ai/claude/second-brain-claudekit -iname "*compress*" -o -iname "*preserve*" -o -iname "*resume*" 2>/dev/null | grep -v tested-tools | grep -v "\.git"
  ```
  ```
<persisted-output>
Output too large (34.5KB). Full output saved to: /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/bk0jwq5sg.txt

Preview (first 2KB):
=== gbrain install check ===
total 24
drwxr-xr-x  4 anant_gupta anant_gupta 4096 Aug 20 04:28 .
drwxr-x--- 40 anant_gupta anant_gupta 4096 Sep  5 12:14 ..
-rw-------  1 anant_gupta anant_gupta    2 Jul 29 11:38 .gitignore
drwxr-xr-x  2 anant_gupta anant_gupta 4096 Aug 20 04:30 audit
drwxr-xr-x 19 anant_gupta anant_gupta 4096 Aug 20 04:30 brain.pglite
-rw-------  1 anant_gupta anant_gupta  396 Aug 20 04:28 config.json
exit: 0
=== WSL global .claude mcp config ===
=== CPR VERDICT ===
**Yes, of this repo's own hand-authored CPR commands** — see above. The question that actually matters here isn't "adopt or reject," it's "does the real repo's implementation do anything the hand-authored one doesn't, worth pulling in."

Real, concrete differences found by reading both side by side:

| Aspect | Hand-authored (this repo) | Real repo (EliaAlberti) |
|---|---|---|
| User prompts | Free-text ("Ask: ...") | Structured `AskUserQuestion` multi-select, with an explicit "no plain-text fallback" contract |
| Tool scope | Unrestricted | `allowed-tools:` frontmatter (Read/Write/Bash/AskUserQuestion only) |
| Model | Unpinned (inherits session default) | Pinned `model: opus` in all three files |
| Session log location | Fixed `60_Claude/Sessions/{{date}}-session.md` (one per day) | Per-project-root `CC-Session-Logs/DD-MM-YYYY-HH_MM-{topic}.md` (many per day, topic-named) |
| Session log content | Structured summary only | Structured summary **plus full raw conversation**, with an explicit "resume reads summary-only, stop before `## Raw Session Log`" token-efficiency contract |
| `/preserve` archiving | Vague ("if a section grows beyond 10 rules, suggest consolidating") | Concrete 280-line budget, auto-archive rules (session notes >7 days, `## Completed Projects`), dedicated `CLAUDE-Archive.md` |
| `/resume` search | None — always just "5 most recent files" | Topic keyword search via `grep`, log-count-scaled strategy (direct listing <100 logs, grep-only >=100) |

...
</persisted-output>
  ```
- `Bash`:
  ```bash
echo "=== bun global installs ===" && bun pm ls -g 2>/dev/null; ls ~/.bun/install/global/node_modules 2>/dev/null
echo "=== gbrain in PATH? ===" && command -v gbrain; command -v gb
echo "=== WSL ~/.claude structure ===" && ls -la ~/.claude/ 2>/dev/null
echo "=== mcp config files ===" && find ~ -maxdepth 2 -iname "*.mcp.json" -o -maxdepth 2 -iname ".claude.json" 2>/dev/null
echo "=== grep gbrain across home configs ===" && grep -rl "gbrain" ~/.claude ~/.mcp.json ~/.claude.json 2>/dev/null
  ```
  ```
=== bun global installs ===
=== gbrain in PATH? ===
=== WSL ~/.claude structure ===
total 928
drwxr-xr-x  24 anant_gupta anant_gupta   4096 Sep  5 12:13 .
drwxr-x---  40 anant_gupta anant_gupta   4096 Sep  5 12:14 ..
-rw-------   1 anant_gupta anant_gupta   2417 Sep  5 11:27 .credentials.json
-rw-r--r--   1 anant_gupta anant_gupta     24 Sep  5 12:00 .last-cleanup
-rw-r--r--   1 anant_gupta anant_gupta    161 Sep  4 15:47 .last-update-result.json
-rw-------   1 anant_gupta anant_gupta   1006 Aug 25 06:37 .mcp.json
-rw-r--r--   1 anant_gupta anant_gupta      4 Sep  5 12:11 .ponytail-active
-rw-r--r--   1 anant_gupta anant_gupta    226 May  8 22:35 CLAUDE.md
-rw-r--r--   1 anant_gupta anant_gupta   2891 Aug 25 03:45 _mcp_migrate_win_desktop.py
-rw-r--r--   1 anant_gupta anant_gupta    790 Aug 25 05:31 _wrap_desktop_servers.py
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Sep  5 11:43 agents
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Sep  5 12:14 backups
-rw-r--r--   1 anant_gupta anant_gupta  35306 Jul 30 04:16 bash-commands.log
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Mar 23 13:50 cache
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Sep  5 11:43 commands
-rw-r--r--   1 anant_gupta anant_gupta  39086 Jul 30 04:16 cost-tracker.log
drwxr-xr-x   2 anant_gupta anant_gupta   4096 May 27 01:38 debug
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Mar 23 13:50 downloads
drwxr-xr-x  30 anant_gupta anant_gupta   4096 Sep  5 12:16 file-history
-rw-------   1 anant_gupta anant_gupta 662482 Sep  5 12:13 history.jsonl
drwxr-xr-x   3 anant_gupta anant_gupta   4096 Jun  9 14:15 homunculus
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Aug 11 03:12 hooks
drwx------   2 anant_gupta anant_gupta   4096 Sep  5 01:01 ide
-rw-r--r--   1 anant_gupta anant_gupta   5912 Jun 13 04:35 keybindings.json
-rw-r--r--   1 anant_gupta anant_gupta    371 Apr  3 17:34 mcp-health-cache.json
-rw-r--r--   1 anant_gupta anant_gupta    454 Sep  5 11:27 mcp-needs-auth-cache.json
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Jul 30 04:02 metrics
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Sep  5 12:13 paste-cache
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Aug 26 11:41 plans
drwxr-xr-x   5 anant_gupta anant_gupta   4096 Sep  5 11:46 plugins
drwxr-xr-x  10 anant_gupta anant_gupta   4096 Aug 29 05:13 projects
-rw-r--r--   1 anant_gupta anant_gupta    411 Jul 30 04:29 session-aliases.json
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Jul 30 04:01 session-data
drwxr-xr-x 106 anant_gupta anant_gupta  12288 Sep  5 12:00 session-env
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Sep  5 00:04 session-logs
drwx------   2 anant_gupta anant_gupta   4096 Sep  5 11:40 sessions
-rw-r--r--   1 anant_gupta anant_gupta   5171 Sep  5 11:32 settings.json
-rw-r--r--   1 anant_gupta anant_gupta     71 Jun 11 11:29 settings.local.json
drwxr-xr-x   2 anant_gupta anant_gupta   4096 Sep  5 12:13 shell-snapshots
drwxr-xr-x  19 anant_gupta anant_gupta   4096 Aug 22 06:55 skills
-rw-------   1 anant_gupta anant_gupta   6217 Jun 11 11:42 stats-cache.json
-rwxr-xr-x   1 anant_gupta anant_gupta  13023 Jul 25 10:00 statusline.sh
drwxr-xr-x   5 anant_gupta anant_gupta   4096 Sep  5 12:00 tasks
=== mcp config files ===
/home/anant_gupta/.claude.json
/home/anant_gupta/.mcp.json
/home/anant_gupta/.claude/.mcp.json
=== grep gbrain across home configs ===
/home/anant_gupta/.claude/paste-cache/34a28ef98374b594.txt
/home/anant_gupta/.claude/history.jsonl
/home/anant_gupta/.claude/paste-cache/98dc9b71cd950f89.txt
/home/anant_gupta/.claude/paste-cache/d0b952c8a5d1c981.txt
/home/anant_gupta/.claude/paste-cache/ee5eec276f80112a.txt
/home/anant_gupta/.claude/paste-cache/51d0cc5263b14630.txt
/home/anant_gupta/.claude/paste-cache/f5443fcce11dcda7.txt
/home/anant_gupta/.claude/paste-cache/f2cec4272b8a96a3.txt
/home/anant_gupta/.claude/paste-cache/5c3f62ffbf64a1e9.txt
/home/anant_gupta/.claude/paste-cache/a17d5640fd86631c.txt
/home/anant_gupta/.claude/paste-cache/1a58e75326e4c53c.txt
/home/anant_gupta/.claude/file-history/[REDACTED]/5810a8cad25a5588@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/f0e808756fdfe8bb@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/c73faa1bee33fd6e@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/b8c71337b3f5d2d3@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/f0e808756fdfe8bb@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/c73faa1bee33fd6e@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/8ffa6608886713c4@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/b24572003fbf7906@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/91931457231173d0@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/e98f36482f38dbc0@v4
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/b8c71337b3f5d2d3@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v3
/home/anant_gupta/.claude/file-history/[REDACTED]/91931457231173d0@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/27e56550f207b144@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/27e56550f207b144@v3
/home/anant_gupta/.claude/file-history/[REDACTED]/8ffa6608886713c4@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/e98f36482f38dbc0@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/2937af7ead2ff1c8@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/91931457231173d0@v3
/home/anant_gupta/.claude/file-history/[REDACTED]/b27d0f11da57d4fa@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v4
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v10
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v6
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v9
/home/anant_gupta/.claude/file-history/[REDACTED]/e98f36482f38dbc0@v3
/home/anant_gupta/.claude/file-history/[REDACTED]/91931457231173d0@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/91931457231173d0@v3
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v4
/home/anant_gupta/.claude/file-history/[REDACTED]/91931457231173d0@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v7
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v3
/home/anant_gupta/.claude/file-history/[REDACTED]/27e56550f207b144@v4
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v8
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v7
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v9
/home/anant_gupta/.claude/file-history/[REDACTED]/2f8bc028157f08a4@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v10
/home/anant_gupta/.claude/file-history/[REDACTED]/3308a0d81869c266@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/2937af7ead2ff1c8@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/130f65776070de1f@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v8
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v6
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v4
/home/anant_gupta/.claude/file-history/[REDACTED]/b27d0f11da57d4fa@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/27e56550f207b144@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v5
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v5
/home/anant_gupta/.claude/file-history/[REDACTED]/9c5ab522cf523e9d@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/b27d0f11da57d4fa@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/27e56550f207b144@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/130f65776070de1f@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/2f8bc028157f08a4@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/130f65776070de1f@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/e3616b49bdaaf614@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/b27d0f11da57d4fa@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/53de9090f69a6ad7@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/91931457231173d0@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/3308a0d81869c266@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/53de9090f69a6ad7@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/130f65776070de1f@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/8e9a31bcc318323a@v2
/home/anant_gupta/.claude/file-history/[REDACTED]/8e9a31bcc318323a@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/2f8bc028157f08a4@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/2f8bc028157f08a4@v4
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/file-history/[REDACTED]/2f8bc028157f08a4@v3
/home/anant_gupta/.claude/file-history/[REDACTED]/e98f36482f38dbc0@v1
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/file-history/[REDACTED]/2f8bc028157f08a4@v1
/home/anant_gupta/.claude/file-history/[REDACTED]/91931457231173d0@v1
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/file-history/[REDACTED]/b27d0f11da57d4fa@v2
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/subagents/agent-a7bbec5f21418404f.jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/subagents/agent-a3e20551c60f48bf7.jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/bomzx92s9.txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/subagents/agent-ab4c08c5f63c77fed.jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/subagents/agent-ac9c210ec284ec19e.jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/subagents/agent-a8da5a547e32dab94.jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/subagents/agent-abce433fbfa2ae048.jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/subagents/agent-a263f530ae98eab14.jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].json
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/bi0jfvf04.txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/subagents/agent-a782b30d6bad31499.jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].json
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/bk0jwq5sg.txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-hub-portfolio/[REDACTED].jsonl
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-work-internship-research-loop/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-hub-portfolio/[REDACTED]/tool-results/[REDACTED].txt
/home/anant_gupta/.claude/plugins/cache/ecc/ecc/2.1.0/tests/lib/control-pane-state.test.js
/home/anant_gupta/.claude/plugins/marketplaces/ecc/tests/lib/control-pane-state.test.js
  ```
- `Bash`:
  ```bash
echo "=== .mcp.json (WSL) ===" && cat ~/.mcp.json 2>/dev/null
echo "=== .claude/.mcp.json ===" && cat ~/.claude/.mcp.json 2>/dev/null
echo "=== git show e21ff9e --stat ===" && git -C ~/projects/ai/claude/second-brain-claudekit show e21ff9e --stat | head -30
echo "=== git show 491a0c6 --stat ===" && git -C ~/projects/ai/claude/second-brain-claudekit show 491a0c6 --stat | head -30
  ```
  ```
=== .mcp.json (WSL) ===
{
  "mcpServers": {
    "jarvis": {
      "type": "http",
      "url": "http://127.0.0.1:27123/mcp/",
      "headers": {
        "Authorization": "Bearer ${JARVIS_OBSIDIAN_API_KEY}"
      }
    },
    "the-plan": {
      "type": "http",
      "url": "http://127.0.0.1:27124/mcp/",
      "headers": {
        "Authorization": "Bearer ${THE_PLAN_OBSIDIAN_API_KEY}"
      }
    },
    "jarvis-fs": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis"
      ]
    },
    "the-plan-fs": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/mnt/d/Users/_Anant/10_Areas/Documents/The Plan"
      ]
    },
    "github": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-github"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}"
      }
    }
  }
}
=== .claude/.mcp.json ===
{
  "mcpServers": {
    "jarvis": {
      "url": "http://127.0.0.1:27123/mcp/",
      "headers": {
        "Authorization": "Bearer ${JARVIS_OBSIDIAN_API_KEY}"
      },
      "type": "http"
    },
    "the-plan": {
      "url": "http://127.0.0.1:27124/mcp/",
      "headers": {
        "Authorization": "Bearer ${THE_PLAN_OBSIDIAN_API_KEY}"
      },
      "type": "http"
    },
    "jarvis-fs": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis"
      ]
    },
    "the-plan-fs": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/mnt/d/Users/_Anant/10_Areas/Documents/The Plan"
      ]
    },
    "github": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-github"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}"
      }
    }
  }
}
=== git show e21ff9e --stat ===
commit [REDACTED]
Author: Anant Gupta <anantmahi721@gmail.com>
Date:   Sat Sep 5 11:52:22 2026 -0500

    Populate Windows's global .claude/ with agents, commands, and 2 hooks
    
    Windows was genuinely bare (confirmed 2026-08-10, 2026-08-20, and
    again just now) - no agents/ or hooks/ directory at all, empty
    commands/. Populated at Anant's direct request with WSL's corrected
    obsidian-vault/second-brain content (3 agents, 7 commands, 2 of 3
    hooks) - genuinely global content, not project-specific, and portable
    across both homes since the hooks are already cross-platform
    PowerShell and the vault they operate on lives on the D: drive,
    reachable identically from WSL or native Windows.
    
    wsl-session-export.ps1 (WSL's 3rd hook, ~700 lines) deliberately not
    ported - it's WSL-specific by design (hardcoded WSL vault path,
    source_os: wsl baked into its own output, reads WSL's
    $env:HOME/.claude/projects), references a Windows counterpart that
    doesn't exist anywhere on the real Windows filesystem, and writing a
    replacement blind with no Windows pwsh to test in was judged too
    risky. WSL's global CLAUDE.md (a single /graphify trigger) also not
    copied - graphify isn't installed in Windows's skills/.
    
    Registered the 2 new hooks directly in the real Windows
    .claude/settings.json (not tracked in this repo - see Jarvis's
    Setup.md for the actual diff) as new PostToolUse/Stop entries
    alongside the existing merget plugin hooks, untouched. Windows
    PowerShell 5.1 doesn't set $env:HOME (and pwsh isn't installed at all
    on this machine) so both hooks get a $env:USERPROFILE fallback not
=== git show 491a0c6 --stat ===
commit [REDACTED]
Author: Anant Gupta <anantmahi721@gmail.com>
Date:   Sat Sep 5 11:52:10 2026 -0500

    Fix 6 stale pre-reorg vault paths in WSL global agents/commands
    
    Full sweep beyond the 3 files previously known stale (2026-08-20
    finding) found 3 more: obsidian-session-review.md, obsidian-daily-review.md,
    second-brain-review.md. All 6 fixed in place on the live WSL home,
    each replacement confirmed against the real current vault structure
    first, not guessed:
    
    - 10_UMN/[Course]/Concepts/ -> 20_Progress/Degree/[Course]/Concepts/
    - 00_Inbox/Headway/Enumerate/{Daily,Weekly}/ -> 10_Areas/Life/Enumerate/{Daily,Weekly}/
    - 00_Inbox/Headway/Habits.md (doesn't exist) -> 10_Areas/Life/Habits/
    - 10_Areas/Life/Habits/Daily Habit Board.md (doesn't exist) -> 10_Areas/Life/Habits/Habit Tracker Board.md
    - 30_Order/Templates/Metadata/For Thoughts.md -> 30_Order/Templates/Frontmatter/For Thoughts.md
    - 60_Claude/50_Reviews/ (doesn't exist) -> 60_Claude/30_Reviews/
    
    Done as a direct prerequisite to populating Windows's .claude/ with
    the same content, so Windows doesn't inherit the staleness on day one.
    
    Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
    Claude-Session: https://claude.ai/code/[REDACTED]

 agents/.claude_wsl/obsidian-architect.md         |  4 ++--
 agents/.claude_wsl/obsidian-researcher.md        |  8 ++++----
 agents/.claude_wsl/obsidian-session-archivist.md |  2 +-
 commands/.claude_wsl/obsidian-daily-review.md    |  2 +-
 commands/.claude_wsl/obsidian-session-review.md  | 10 +++++-----
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && echo "=== Promotion-Criteria.md ===" && cat _docs/Promotion-Criteria.md
echo "=== cpr VERDICT full ===" && cat tested-tools/commands/cpr-compress-preserve-resume/VERDICT.md | tail -60
  ```
  ```
=== Promotion-Criteria.md ===
# Promotion Criteria — what "cleared the qualification bar" actually means

`_docs/Architecture.md` names four pipeline stages and says a tool moves between them when it "clears the qualification bar." This doc spells out what that bar is. The literal, mechanically-checkable version of this lives in `60_Claude/Qualification-Checklist.md` — this doc is the reasoning behind that checklist, with the three real 2026-07-29 outcomes (gbrain, gstack, mattpocock-skills) as worked examples of the bar actually being applied, not a hypothetical rubric.

## The four questions, in order

Adapted directly from the **Implement > Knowledge** principle already established in the Jarvis vault (`60_Claude/20_Distilled_Notes/Sources - Plan/PDF's Ingestion Implementation.md`) — see `_docs/Design.md` for the full citation. Each question is a hard gate: a "no" stops the tool at its current stage, it doesn't get rounded up to a "maybe."

### 1. Did it actually run without a manual workaround?

Not "does the README claim it works" — did a real command, executed in `sandbox/<repo>/`, actually complete or fail on its own terms?

- **gbrain: yes for the original install** — `bun install` → `bun run src/cli.ts init --pglite --no-embedding` → `doctor` returned real output (80/100 health) against a real database file. No workaround needed. **Update, 2026-08-20:** wiring the OpenAI embedding provider (the decision that had been pending since this Q1 line was written) turned up a real, undocumented gbrain bug — none of `gbrain config set embedding_disabled false`, `gbrain init --embedding-model`, or `gbrain reinit-pglite` (gbrain's own documented switch path) actually clear a stuck `embedding_disabled: true` sentinel in `~/.gbrain/config.json`; only a direct JSON-file edit does. Root-caused by reading `src/commands/init.ts` directly, not guessed. Full account: `tested-tools/mcp-servers/gbrain/VERDICT.md`. Verified working afterward with a real imported+embedded+semantically-searched test page (0.8275 similarity score) — the tool clears Q1 in substance, but not "without a workaround" in the letter, and that distinction is worth keeping visible rather than rounding up to a clean yes.
- **gstack: no.** `./setup` ran real work (compiled binaries, generated 55 skills, downloaded Chromium) but the final Playwright launch check failed on a genuinely missing system dependency. The honest failure is why this tool stays in `sandbox/`, blocked, rather than being marked done because "most of it worked."
- **mattpocock-skills: partial-yes.** The installer ran and discovered 41 real skills; its interactive picker doesn't complete non-interactively, so the workaround (copying `engineering/` by hand) was a deliberate, disclosed scope decision, not a technical failure — this is why it advanced to `tested-tools/` rather than staying in `sandbox/`, but only for the reviewed subset.

### 2. Does it solve a problem nothing else already solves?

Checked against what's already adopted or already decided, not against the tool's own marketing.

- **gbrain: yes**, confirmed by elimination — adopting it made `memsearch` (auto-capture without synthesis) and `context-sync` (thinner SQLite memory) both redundant. Its synthesis + gap-analysis layer, benchmarked +31.4 points over vector-only RAG, is a capability nothing else in the current stack has.
- **gstack: yes, if unblocked** — its `/setup-gbrain` companion command and 55-skill library aren't duplicated elsewhere; the blocker is infrastructure, not redundancy.
- **mattpocock-skills' `engineering/` category: mostly yes, unconfirmed in detail** — `code-review`, `tdd`, `diagnosing-bugs` etc. don't obviously duplicate anything already installed, but this is exactly what the `tested-tools/` second-look stage exists to confirm skill-by-skill before promotion, not something to assume from the category name.

### 3. Is it a duplicate of something already promoted?

The inverse framing of question 2, asked again at the moment of promotion (not just discovery), because the answer can change between when a tool enters `sandbox/` and when it's considered for promotion — something else might get promoted first.

- Before gbrain existed in `sandbox/`, `context-sync` and `memsearch` were both live candidates. Once gbrain cleared the bar, both became duplicates. This is why the qualification pass happens per-decision, not once per tool.

### 4. Can the dependency it claims actually be verified, mechanically, not by re-reading the README?

This is the one question worth a script instead of a judgment call — see `60_Claude/scripts/check_dependency.py`. A tool's own docs claiming "requires bun" or "requires Chromium system libs" is a claim; whether that dependency is actually on `PATH` (or actually installed, actually the right version) in *this* environment is a fact, and facts are cheap to check mechanically before trusting them.

- `bun` — verified on `PATH` after gstack's setup script installed it (checksum-pinned to 1.3.10, resolved to 1.3.14). This is exactly the kind of claim the script formalizes: don't trust "bun is a prerequisite," check that `which bun` actually returns something before believing an install succeeded because of it.
- Chromium's shared library dependencies (`libnss3`, `libatk1.0-0`, etc.) — this is the gstack blocker, and it's exactly the failure mode question 4 exists to catch *before* wasting the setup script's runtime rediscovering it. `60_Claude/scripts/check_dependency.py` includes this exact check as its worked example.

## What "cleared the bar" does NOT mean

- It does not mean "compiles" or "installs without error" alone — question 2 and 3 still have to be answered honestly, not skipped because question 1 was a clean yes.
- It does not mean permanent. A tool can be un-promoted if a later, better-fitting tool makes it redundant (memsearch's fate once gbrain existed) — the bar is evaluated at each promotion decision, not locked in once passed.
- It does not require unanimous confidence. gstack's `engineering/`-style partial promotion (mattpocock-skills) shows the bar can be cleared for a *subset* of a repo while the rest stays unreviewed — "cleared the bar" is a per-decision, not always per-repo, judgment.
=== cpr VERDICT full ===
## 1. Did it actually run without a manual workaround?

**Yes**, with a disclosed scope limit. `cpr-compress-preserve-resume` is three markdown instruction files with no separate runtime — there is no `npm install`/`bun run` to execute. "Running it for real" here means installing the files where the README says to and exercising their documented step logic against a real project, not re-reading the README.

Done, in `/tmp/.../scratchpad/cpr-test/`:
- Installed `commands/*.md` into a scratch project's `.claude/commands/` (the README's "per-project install" path).
- Created a real `CLAUDE.md` there.
- Executed `compress.md`'s Step 5 project-root detection (`.claude/commands/compress.md`) and `mkdir -p CC-Session-Logs/` — real folder created.
- Wrote a real session log against `compress.md`'s Step 4 template, describing this actual test (not fabricated content).
- Ran `resume.md`'s Step 3 log-listing (`ls ... | wc -l` → 1) and Step 4/9 "summary-only, stop before `## Raw Session Log`" contract via `awk` — confirmed it correctly reads 26 of 29 lines, excluding the raw-log placeholder.
- Ran `preserve.md`'s Step 6 line-count check (`wc -l CLAUDE.md` → 8, under the 280-line budget) and Step 3 structure scan (`grep -c '^##'`).

**Scope limit, disclosed:** the AskUserQuestion-driven interactive steps (compress.md Steps 1-3, preserve.md Step 2) were not separately invoked as a synthetic demo — they call a documented, already-verified Claude Code primitive (AskUserQuestion), so re-testing the primitive itself would test the platform, not this tool. What was tested is CPR's own logic: file I/O, path detection, filename generation, the line-budget/archive threshold, and the summary-only read discipline — the parts that are actually CPR-specific.

## 2. Does it solve a problem nothing else already solves?

**No — this repo already has a working version of the same pattern.** `commands/compress.md`, `commands/preserve.md`, `commands/resume.md` (added commit `726f6de`, 2026-04-03) implement the identical Compress→Preserve→Resume idea, already wired into this repo's own `CLAUDE.md` ("Session Memory (CPR Pattern)") and actively used (`60_Claude/Sessions/`). The real repo isn't closing a gap — it's a second implementation of a pattern already adopted.

## 3. Is it a duplicate of something already promoted?

**Yes, of this repo's own hand-authored CPR commands** — see above. The question that actually matters here isn't "adopt or reject," it's "does the real repo's implementation do anything the hand-authored one doesn't, worth pulling in."

Real, concrete differences found by reading both side by side:

| Aspect | Hand-authored (this repo) | Real repo (EliaAlberti) |
|---|---|---|
| User prompts | Free-text ("Ask: ...") | Structured `AskUserQuestion` multi-select, with an explicit "no plain-text fallback" contract |
| Tool scope | Unrestricted | `allowed-tools:` frontmatter (Read/Write/Bash/AskUserQuestion only) |
| Model | Unpinned (inherits session default) | Pinned `model: opus` in all three files |
| Session log location | Fixed `60_Claude/Sessions/{{date}}-session.md` (one per day) | Per-project-root `CC-Session-Logs/DD-MM-YYYY-HH_MM-{topic}.md` (many per day, topic-named) |
| Session log content | Structured summary only | Structured summary **plus full raw conversation**, with an explicit "resume reads summary-only, stop before `## Raw Session Log`" token-efficiency contract |
| `/preserve` archiving | Vague ("if a section grows beyond 10 rules, suggest consolidating") | Concrete 280-line budget, auto-archive rules (session notes >7 days, `## Completed Projects`), dedicated `CLAUDE-Archive.md` |
| `/resume` search | None — always just "5 most recent files" | Topic keyword search via `grep`, log-count-scaled strategy (direct listing <100 logs, grep-only >=100) |

## 4. Can the dependency it claims actually be verified, mechanically?

The only claimed "dependency" is Claude Code itself with `autoCompact` disabled — already true in this repo (`CLAUDE.md`: "Do not auto-compact sessions. `autoCompact` is disabled."). No binary, no package, nothing for `check_dependency.py` to check.

## Decision: blend

Neither "adopt wholesale" nor "keep as-is" fits cleanly:

- **Adopting wholesale is wrong for this repo** because `CC-Session-Logs/` at each project's root conflicts with this repo's own established, vault-anchored convention (`60_Claude/Sessions/`, stated in `CLAUDE.md`'s three-layers-of-memory section) — walking up from `pwd` for a project root is the right design for a tool meant to be dropped into arbitrary projects, but this repo's CPR commands are deliberately anchored to one fixed vault location.
- **Keeping the hand-authored version unchanged is wrong** because three real, verified improvements exist and were confirmed to work in the test above: the AskUserQuestion contract (removes free-text ambiguity), the concrete 280-line/archive-file budget in `/preserve` (replaces a vague "suggest consolidating" with a testable rule), and topic-named, searchable filenames in the session log (removes the one-log-per-day collision risk).

**What's actually adopted, into `commands/compress.md`, `commands/preserve.md`, `commands/resume.md` in this folder** (the versions to promote from):
1. `AskUserQuestion` multi-select for the preserve-selection and topic-confirmation steps, replacing free-text prompts.
2. `allowed-tools:` frontmatter, scoped per command.
3. `preserve.md`'s 280-line budget and archive-to-file logic, adapted to archive into `60_Claude/Sessions/_archive/` rather than a bare `CLAUDE-Archive.md` at project root (keeping this repo's existing `60_Claude/` anchoring).
4. Topic-named session log filenames (`{{date}}-{{time}}-{{topic}}.md`), still inside `60_Claude/Sessions/` (not `CC-Session-Logs/`).
5. `resume.md`'s topic-keyword grep search across `60_Claude/Sessions/*.md`.

**What's deliberately NOT adopted:**
- `model: opus` pinning — this repo's other commands don't pin models; forcing Opus on every `/compress`/`/preserve`/`/resume` call has a real cost implication nobody asked to accept. Left unpinned.
- Full raw-conversation logging in session logs — this repo's session logs are deliberately structured-summary-only (`CLAUDE.md`'s own "Progressive summarisation" principle); adding a full raw transcript would make every log much larger for a searchability benefit this repo hasn't asked for. The "stop before Raw Session Log" resume contract is therefore moot here and not carried over.
- Per-project root detection (`CC-Session-Logs/` walking up from `pwd`) — superseded by the fixed `60_Claude/Sessions/` path, as above.

## Convention note for `60_Claude/vault-rules/pipeline-conventions.md`

Per `60_Claude/Qualification-Checklist.md`, a piece that has individually cleared the bar earns its own `<use-case>/` folder (e.g. `tested-tools/commands/session-continuity/cpr-compress-preserve-resume/`). This folder was created at the literal path given for this session's Phase 1 instructions instead (`tested-tools/commands/cpr-compress-preserve-resume/`, no use-case layer). Flagging the mismatch here rather than silently resolving it — a future pass should either rename this folder under a `session-continuity/` use-case layer for consistency with `tested-tools/README.md`'s stated three-level convention, or explicitly amend that convention to allow a two-level shape when a single tool IS the use case.
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && echo "=== .claude/commands ===" && ls .claude/commands/ 2>/dev/null
echo "=== .claude/agents ===" && ls .claude/agents/ 2>/dev/null
echo "=== .claude/hooks ===" && ls .claude/hooks/ 2>/dev/null
echo "=== hooks/second-brain-claudekit ===" && ls hooks/second-brain-claudekit/ 2>/dev/null
echo "=== diff pre-artifact-edit-check ===" && diff .claude/hooks/pre-artifact-edit-check.sh hooks/second-brain-claudekit/pre-artifact-edit-check.sh && echo IDENTICAL
  ```
  ```
=== .claude/commands ===
challenge.md
closeday.md
context.md
drift.md
emerge.md
ghost.md
graduate.md
ideas.md
schedule.md
today.md
trace.md
=== .claude/agents ===
research-distiller.md
vault-curator.md
weekly-reviewer.md
=== .claude/hooks ===
after-edit-log.md
after-edit-log.ps1
pre-artifact-edit-check.sh
session-wrapup.md
session-wrapup.ps1
=== hooks/second-brain-claudekit ===
after-edit-log.md
after-edit-log.ps1
pre-artifact-edit-check.sh
session-wrapup.md
session-wrapup.ps1
=== diff pre-artifact-edit-check ===
IDENTICAL
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && echo "=== mattpocock test backlog ===" && cat tests/skills/mattpocock-engineering/README.md 2>/dev/null | head -60
echo "=== tests dir tree ===" && find tests -maxdepth 3 -type d
  ```
  ```
=== mattpocock test backlog ===
---
created: 2026-08-19
type: test-backlog
tags: [tests, mattpocock-engineering]
---

# Test backlog — mattpocock-engineering

Real state as of 2026-08-19, per `60_Claude/vault-rules/pipeline-conventions.md`: **0 of the 17 skills in `tested-tools/skills/mattpocock-engineering/` have been individually tested.**

This is not an oversight this file is fixing — it's the honest, current backlog, written down because `_docs/Promotion-Criteria.md`'s bar requires each piece to be individually run and judged before it earns its own `<use-case>/` folder, and `tested-tools/README.md` already says explicitly that none of the 17 has cleared that bar yet. A test file claiming otherwise would be exactly the kind of fabrication this repo's docs are built to avoid.

## What "individually tested" would mean here

Each skill is a `SKILL.md` (Claude Code skill format) — no separate install/build step, so "ran it for real" means: invoke the skill against a real task in a real project, and judge the output against `_docs/Promotion-Criteria.md`'s four questions, the same way `tested-tools/commands/cpr-compress-preserve-resume/`'s test log (`tests/commands/cpr-compress-preserve-resume/`) exercised CPR's step logic against a real scratch project.

## The 17, untested

| Skill | Tested? |
|---|---|
| `ask-matt` | No |
| `code-review` | No |
| `codebase-design` | No |
| `diagnosing-bugs` | No |
| `domain-modeling` | No |
| `grill-with-docs` | No |
| `implement` | No |
| `improve-codebase-architecture` | No |
| `prototype` | No |
| `research` | No |
| `resolving-merge-conflicts` | No |
| `setup-matt-pocock-skills` | No |
| `tdd` | No |
| `to-spec` | No |
| `to-tickets` | No |
| `triage` | No |
| `wayfinder` | No |

Update this table's "Tested?" column, one row at a time, as each skill is actually run against a real task — never batch-mark rows from an assumption that "the category is probably fine."
=== tests dir tree ===
tests
tests/mcp-servers
tests/hooks
tests/cli-tools
tests/agents
tests/commands
tests/skills
tests/mcp-servers/claude-context
tests/cli-tools/promptfoo
tests/commands/cpr-compress-preserve-resume
tests/skills/spec-kit
tests/skills/mattpocock-engineering
  ```
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Log.md","targetType":"heading","target":["[2026-09-05]"]}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/05_Clippings/AI Conversations/WSL/Claude Code/second-brain-claudekit/09-05 Second-brain-claudekit workspace cleanup and promotion pipeline.md"}`
- `Bash`:
  ```bash
F="/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/tool-results/mcp-jarvis-vault_read-1788628730472.txt"
wc -l "$F"
echo "--- grep Tool Map ---" && grep -o ".\{80\}Tool Map.\{80\}" "$F" | head -20
echo "--- grep gbrain ---" && grep -oi ".\{60\}gbrain.\{60\}" "$F" | head -20
  ```
  ```
126 /home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt
--- grep Tool Map ---
ny note's paraphrase of its schema) and 20_Progress/Projects/AI Use/Claude Kit/{Tool Map,Log,Claude Code/Claudekit Session Context}.md in the Jarvis vault (reachable vi
n/VERDICT.md` for the exact install steps already verified working), and update Tool Map.md's gbrain row the moment it's actually running on a real home, not before.\n\
to \"evaluate usefulness for the internship research loop\" per this repo's own Tool Map row, real next step never attempted) — now that internship-research-loop's own 
ugh Promotion-Criteria.md's four gates for real and record an actual verdict in Tool Map.md, don't leave all three open again.\n- **gstack** — still blocked on missing 
ed will actually propagate.\n2. Update [[20_Progress/Projects/AI Use/Claude Kit/Tool Map]] and [[20_Progress/Projects/AI Use/Claude Kit/Log]] with every real state chan
econd-brain-claudekit/Setup]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n  - \"[[20_Progress/AI/Claude Code/Management]]\"\n  - \"[[20_Progress/Pro
ernship-research-loop/Setup]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n  - \"[[20_Progress/AI/Claude Code/Management]]\"\n  - \"[[20_Progress/Pro
ills/JS ecosystem) without checking the parent repo's git remote. Reverted in [[Tool Map|Tool Map]] and in `second-brain-claudekit/CLAUDE.md`'s do-not-touch list (remov
laudekit made self-documenting — Docs/ folder, 50_Claude qualification ruleset, Tool Map + Log created\n- Real hands-on testing from earlier the same session got its fi
moved within the same session — nothing left behind.\n- Created this file and [[Tool Map|Tool Map]] — first real entries: GBrain, gstack, mattpocock-skills (`engineerin
--- grep gbrain ---
-* plugin skills (untouched, not this pipeline's concern). `gbrain` cleared all four Promotion-Criteria gates for global promo
\n## Task 2 — Global homes: WSL cleanup, Windows bootstrap, gbrain install\n\n1. **WSL**: fix the confirmed stale vault-path r
ran, say so plainly and proceed as if starting fresh.\n3. **gbrain**: cleared for global promotion since 2026-08-20, still not
ichever home(s) make sense (check `tested-tools/mcp-servers/gbrain/VERDICT.md` for the exact install steps already verified wo
laude-mem** — hold per its own recorded reasoning (overlaps gbrain + `jarvis-memory` MCP) until gbrain is actually running (Ta
e, Windows's real starting state re-confirmed or corrected, gbrain's install status on each home.\n- Task 3: the new manifest 
andbox/cpr-compress-preserve-resume/\nsandbox/ecc/\nsandbox/gbrain/\nsandbox/graphify/\nsandbox/gsd-core/\nsandbox/gstack/\nsa
-decided items\",\"description\":\"WSL stale-path fixes and gbrain install — both fully specified already — defer everything e
line (`sandbox/` → `tested-skills/` → promoted) grounded in gbrain (cleared sandbox, pending an embedding-key decision), gstac
ipts/check_dependency.py` — the latter actually run against gbrain (`bun` on PATH — pass) and gstack (`libnss3.so` missing — f
d this file and [[Tool Map|Tool Map]] — first real entries: GBrain, gstack, mattpocock-skills (`engineering/` category), and E
an interactive `sudo apt-get install` from Anant directly), gbrain's embedding-provider choice, and the remaining 24 mattpococ
/` agents/commands/hooks. Also still pending from before: **gbrain install** (cleared for global promotion weeks ago, not yet
  ```
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Log.md","targetType":"frontmatter","target":"updated"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Log.md","targetType":"heading","target":["﻿[2026-09-05] jarvis-agents | Third hop: 6 agents into Jarvis's real .claude/, WSL path fixes, Windows bootstrap, internship-research-loop onboarded"]}`
- `ToolSearch` — `{"query":"select:mcp__jarvis__vault_get_document_map","max_results":3}`
- `mcp__jarvis__vault_get_document_map` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Log.md"}`
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && echo "=== obsidian-mind structure ===" && find sandbox/obsidian-mind -maxdepth 3 -type f | grep -v "\.git/" | sort
echo "=== obsidian-second-brain structure ===" && find sandbox/obsidian-second-brain -maxdepth 3 -type f | grep -v "\.git/" | sort | head -40
echo "=== agentic-inbox structure ===" && find sandbox/agentic-inbox -maxdepth 3 -type f | grep -v "\.git/" | sort
  ```
  ```
=== obsidian-mind structure ===
sandbox/obsidian-mind/.claude-plugin/marketplace.json
sandbox/obsidian-mind/.claude-plugin/plugin.json
sandbox/obsidian-mind/.claude/agents/brag-spotter.md
sandbox/obsidian-mind/.claude/agents/context-loader.md
sandbox/obsidian-mind/.claude/agents/cross-linker.md
sandbox/obsidian-mind/.claude/agents/people-profiler.md
sandbox/obsidian-mind/.claude/agents/review-fact-checker.md
sandbox/obsidian-mind/.claude/agents/review-prep.md
sandbox/obsidian-mind/.claude/agents/slack-archaeologist.md
sandbox/obsidian-mind/.claude/agents/vault-librarian.md
sandbox/obsidian-mind/.claude/agents/vault-migrator.md
sandbox/obsidian-mind/.claude/commands/om-capture-1on1.md
sandbox/obsidian-mind/.claude/commands/om-dump.md
sandbox/obsidian-mind/.claude/commands/om-humanize.md
sandbox/obsidian-mind/.claude/commands/om-incident-capture.md
sandbox/obsidian-mind/.claude/commands/om-intake.md
sandbox/obsidian-mind/.claude/commands/om-meeting.md
sandbox/obsidian-mind/.claude/commands/om-peer-scan.md
sandbox/obsidian-mind/.claude/commands/om-prep-1on1.md
sandbox/obsidian-mind/.claude/commands/om-project-archive.md
sandbox/obsidian-mind/.claude/commands/om-review-brief.md
sandbox/obsidian-mind/.claude/commands/om-review-peer.md
sandbox/obsidian-mind/.claude/commands/om-self-review.md
sandbox/obsidian-mind/.claude/commands/om-slack-scan.md
sandbox/obsidian-mind/.claude/commands/om-standup.md
sandbox/obsidian-mind/.claude/commands/om-tidy.md
sandbox/obsidian-mind/.claude/commands/om-vault-audit.md
sandbox/obsidian-mind/.claude/commands/om-vault-upgrade.md
sandbox/obsidian-mind/.claude/commands/om-weekly.md
sandbox/obsidian-mind/.claude/commands/om-wrap-up.md
sandbox/obsidian-mind/.claude/memory-template.md
sandbox/obsidian-mind/.claude/scripts/.gitignore
sandbox/obsidian-mind/.claude/scripts/charcount.ts
sandbox/obsidian-mind/.claude/scripts/classify-message.ts
sandbox/obsidian-mind/.claude/scripts/generate-memory-index.ts
sandbox/obsidian-mind/.claude/scripts/om-mcp.mjs
sandbox/obsidian-mind/.claude/scripts/om-mcp.ts
sandbox/obsidian-mind/.claude/scripts/package.json
sandbox/obsidian-mind/.claude/scripts/pre-compact.ts
sandbox/obsidian-mind/.claude/scripts/qmd-mcp.d.mts
sandbox/obsidian-mind/.claude/scripts/qmd-mcp.mjs
sandbox/obsidian-mind/.claude/scripts/qmd-refresh-run.ts
sandbox/obsidian-mind/.claude/scripts/session-start.ts
sandbox/obsidian-mind/.claude/scripts/stop-checklist.ts
sandbox/obsidian-mind/.claude/scripts/tidy-fix.ts
sandbox/obsidian-mind/.claude/scripts/tsconfig.json
sandbox/obsidian-mind/.claude/scripts/validate-write.ts
sandbox/obsidian-mind/.claude/settings.json
sandbox/obsidian-mind/.claude/update-skills.ts
sandbox/obsidian-mind/.codex/hooks.json
sandbox/obsidian-mind/.gemini/settings.json
sandbox/obsidian-mind/.gitattributes
sandbox/obsidian-mind/.github/FUNDING.yml
sandbox/obsidian-mind/.github/pull_request_template.md
sandbox/obsidian-mind/.github/scripts/generate-changelog.ts
sandbox/obsidian-mind/.github/scripts/manifest-check.ts
sandbox/obsidian-mind/.github/scripts/package.json
sandbox/obsidian-mind/.github/workflows/manifest-check.yml
sandbox/obsidian-mind/.github/workflows/pr-title.yml
sandbox/obsidian-mind/.github/workflows/release.yml
sandbox/obsidian-mind/.github/workflows/test.yml
sandbox/obsidian-mind/.gitignore
sandbox/obsidian-mind/.mcp.json
sandbox/obsidian-mind/.obsidian/app.json
sandbox/obsidian-mind/.scripts/package.json
sandbox/obsidian-mind/.scripts/qmd-bootstrap.ts
sandbox/obsidian-mind/.shardmind/hooks/bootstrap.ts
sandbox/obsidian-mind/.shardmind/hooks/package.json
sandbox/obsidian-mind/.shardmind/hooks/personalize.ts
sandbox/obsidian-mind/.shardmind/hooks/post-update.ts
sandbox/obsidian-mind/.shardmind/shard-schema.yaml
sandbox/obsidian-mind/.shardmind/shard.yaml
sandbox/obsidian-mind/.shardmindignore
sandbox/obsidian-mind/AGENTS.md
sandbox/obsidian-mind/ARCHITECTURE.md
sandbox/obsidian-mind/CHANGELOG.md
sandbox/obsidian-mind/CLAUDE.md
sandbox/obsidian-mind/CONTRIBUTING.md
sandbox/obsidian-mind/GEMINI.md
sandbox/obsidian-mind/Home.md
sandbox/obsidian-mind/LICENSE
sandbox/obsidian-mind/README.ja.md
sandbox/obsidian-mind/README.ko.md
sandbox/obsidian-mind/README.md
sandbox/obsidian-mind/README.zh-CN.md
sandbox/obsidian-mind/bases/1-1 History.base
sandbox/obsidian-mind/bases/Competency Map.base
sandbox/obsidian-mind/bases/Incidents.base
sandbox/obsidian-mind/bases/Memories.base
sandbox/obsidian-mind/bases/People Directory.base
sandbox/obsidian-mind/bases/Recently Touched.base
sandbox/obsidian-mind/bases/Review Evidence.base
sandbox/obsidian-mind/bases/Templates.base
sandbox/obsidian-mind/bases/Work Dashboard.base
sandbox/obsidian-mind/brain/Gotchas.md
sandbox/obsidian-mind/brain/Key Decisions.md
sandbox/obsidian-mind/brain/Memories.md
sandbox/obsidian-mind/brain/North Star.md
sandbox/obsidian-mind/brain/Patterns.md
sandbox/obsidian-mind/brain/Skills.md
sandbox/obsidian-mind/obsidian-mind-demo.gif
sandbox/obsidian-mind/obsidian-mind-logo.png
sandbox/obsidian-mind/org/People & Context.md
sandbox/obsidian-mind/org/people/.gitkeep
sandbox/obsidian-mind/org/teams/.gitkeep
sandbox/obsidian-mind/perf/Brag Doc.md
sandbox/obsidian-mind/perf/brag/.gitkeep
sandbox/obsidian-mind/perf/competencies/README.md
sandbox/obsidian-mind/perf/evidence/.gitkeep
sandbox/obsidian-mind/reference/.gitkeep
sandbox/obsidian-mind/templates/Competency Note.md
sandbox/obsidian-mind/templates/Decision Record.md
sandbox/obsidian-mind/templates/Review Template.md
sandbox/obsidian-mind/templates/Thinking Note.md
sandbox/obsidian-mind/templates/Work Note.md
sandbox/obsidian-mind/thinking/README.md
sandbox/obsidian-mind/vault-manifest.json
sandbox/obsidian-mind/work/1-1/.gitkeep
sandbox/obsidian-mind/work/Index.md
sandbox/obsidian-mind/work/active/.gitkeep
sandbox/obsidian-mind/work/archive/.gitkeep
sandbox/obsidian-mind/work/incidents/.gitkeep
sandbox/obsidian-mind/work/meetings/README.md
=== obsidian-second-brain structure ===
sandbox/obsidian-second-brain/.claude-plugin/marketplace.json
sandbox/obsidian-second-brain/.claude-plugin/plugin.json
sandbox/obsidian-second-brain/.env.example
sandbox/obsidian-second-brain/.gitattributes
sandbox/obsidian-second-brain/.github/FUNDING.yml
sandbox/obsidian-second-brain/.github/ISSUE_TEMPLATE/bug_report.yml
sandbox/obsidian-second-brain/.github/ISSUE_TEMPLATE/config.yml
sandbox/obsidian-second-brain/.github/ISSUE_TEMPLATE/feature_request.yml
sandbox/obsidian-second-brain/.github/PULL_REQUEST_TEMPLATE.md
sandbox/obsidian-second-brain/.github/dependabot.yml
sandbox/obsidian-second-brain/.github/workflows/ci.yml
sandbox/obsidian-second-brain/.github/workflows/scorecard.yml
sandbox/obsidian-second-brain/.gitignore
sandbox/obsidian-second-brain/AI-FIRST.md
sandbox/obsidian-second-brain/CHANGELOG.md
sandbox/obsidian-second-brain/CITATION.cff
sandbox/obsidian-second-brain/CLAUDE.md
sandbox/obsidian-second-brain/CODE_OF_CONDUCT.md
sandbox/obsidian-second-brain/CONTRIBUTING.md
sandbox/obsidian-second-brain/DEMOS.md
sandbox/obsidian-second-brain/ECOSYSTEM.md
sandbox/obsidian-second-brain/FORK_INSIGHTS.md
sandbox/obsidian-second-brain/LICENSE
sandbox/obsidian-second-brain/README.md
sandbox/obsidian-second-brain/SECURITY.md
sandbox/obsidian-second-brain/SKILL.md
sandbox/obsidian-second-brain/_config.yml
sandbox/obsidian-second-brain/_includes/head_custom.html
sandbox/obsidian-second-brain/adapters/OWNERS.md
sandbox/obsidian-second-brain/adapters/agent-skills/adapter.sh
sandbox/obsidian-second-brain/adapters/claude-code/adapter.sh
sandbox/obsidian-second-brain/adapters/codex-cli/adapter.sh
sandbox/obsidian-second-brain/adapters/gemini-cli/adapter.sh
sandbox/obsidian-second-brain/adapters/hermes/adapter.sh
sandbox/obsidian-second-brain/adapters/lib.sh
sandbox/obsidian-second-brain/adapters/opencode/adapter.sh
sandbox/obsidian-second-brain/adapters/pi/adapter.sh
sandbox/obsidian-second-brain/architecture.md
sandbox/obsidian-second-brain/commands/create-command.md
sandbox/obsidian-second-brain/commands/idea-discovery.md
=== agentic-inbox structure ===
sandbox/agentic-inbox/.dev.vars.example
sandbox/agentic-inbox/.gitignore
sandbox/agentic-inbox/LICENSE
sandbox/agentic-inbox/README.md
sandbox/agentic-inbox/app/components/AgentPanel.tsx
sandbox/agentic-inbox/app/components/AgentSidebar.tsx
sandbox/agentic-inbox/app/components/ComposeEmail.tsx
sandbox/agentic-inbox/app/components/ComposePanel.tsx
sandbox/agentic-inbox/app/components/EmailAttachmentList.tsx
sandbox/agentic-inbox/app/components/EmailIframe.tsx
sandbox/agentic-inbox/app/components/EmailPanel.tsx
sandbox/agentic-inbox/app/components/Header.tsx
sandbox/agentic-inbox/app/components/MCPPanel.tsx
sandbox/agentic-inbox/app/components/MailboxSplitView.tsx
sandbox/agentic-inbox/app/components/RichTextEditor.tsx
sandbox/agentic-inbox/app/components/Sidebar.tsx
sandbox/agentic-inbox/app/entry.server.tsx
sandbox/agentic-inbox/app/hooks/useComposeForm.ts
sandbox/agentic-inbox/app/hooks/useUIStore.ts
sandbox/agentic-inbox/app/index.css
sandbox/agentic-inbox/app/lib/search-parser.ts
sandbox/agentic-inbox/app/lib/utils.ts
sandbox/agentic-inbox/app/queries/emails.ts
sandbox/agentic-inbox/app/queries/folders.ts
sandbox/agentic-inbox/app/queries/keys.ts
sandbox/agentic-inbox/app/queries/mailboxes.ts
sandbox/agentic-inbox/app/queries/search.ts
sandbox/agentic-inbox/app/root.tsx
sandbox/agentic-inbox/app/routes.ts
sandbox/agentic-inbox/app/routes/email-list.tsx
sandbox/agentic-inbox/app/routes/home.tsx
sandbox/agentic-inbox/app/routes/mailbox-index.tsx
sandbox/agentic-inbox/app/routes/mailbox.tsx
sandbox/agentic-inbox/app/routes/not-found.tsx
sandbox/agentic-inbox/app/routes/search-results.tsx
sandbox/agentic-inbox/app/routes/settings.tsx
sandbox/agentic-inbox/app/services/api.ts
sandbox/agentic-inbox/app/types/index.ts
sandbox/agentic-inbox/demo_app.png
sandbox/agentic-inbox/package-lock.json
sandbox/agentic-inbox/package.json
sandbox/agentic-inbox/public/favicon.ico
sandbox/agentic-inbox/public/favicon.svg
sandbox/agentic-inbox/react-router.config.ts
sandbox/agentic-inbox/shared/dates.ts
sandbox/agentic-inbox/shared/folders.ts
sandbox/agentic-inbox/tsconfig.cloudflare.json
sandbox/agentic-inbox/tsconfig.json
sandbox/agentic-inbox/tsconfig.node.json
sandbox/agentic-inbox/vite.config.ts
sandbox/agentic-inbox/workers/agent/index.ts
sandbox/agentic-inbox/workers/app.ts
sandbox/agentic-inbox/workers/db/schema.ts
sandbox/agentic-inbox/workers/durableObject/index.ts
sandbox/agentic-inbox/workers/durableObject/migrations.ts
sandbox/agentic-inbox/workers/email-sender.ts
sandbox/agentic-inbox/workers/index.ts
sandbox/agentic-inbox/workers/lib/ai.ts
sandbox/agentic-inbox/workers/lib/attachments.ts
sandbox/agentic-inbox/workers/lib/email-helpers.ts
sandbox/agentic-inbox/workers/lib/mailbox.ts
sandbox/agentic-inbox/workers/lib/schemas.ts
sandbox/agentic-inbox/workers/lib/tools.ts
sandbox/agentic-inbox/workers/mcp/index.ts
sandbox/agentic-inbox/workers/routes/reply-forward.ts
sandbox/agentic-inbox/workers/types.ts
sandbox/agentic-inbox/wrangler.jsonc
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && echo "=== agentic-inbox README (first 60 lines) ===" && head -60 sandbox/agentic-inbox/README.md
echo "=== workers/lib/tools.ts (the 'agent triage' logic, if any) — first 80 lines ===" && head -80 sandbox/agentic-inbox/workers/lib/tools.ts 2>/dev/null
  ```
  ```
=== agentic-inbox README (first 60 lines) ===
<div align="center">
  <h1>Agentic Inbox</h1>
  <p><em>A self-hosted email client with an AI agent, running entirely on Cloudflare Workers</em></p>
</div>

Agentic Inbox lets you send, receive, and manage emails through a modern web interface -- all powered by your own Cloudflare account. Incoming emails arrive via [Cloudflare Email Routing](https://developers.cloudflare.com/email-routing/), each mailbox is isolated in its own [Durable Object](https://developers.cloudflare.com/durable-objects/) with a SQLite database, and attachments are stored in [R2](https://developers.cloudflare.com/r2/).

An **AI-powered Email Agent** can read your inbox, search conversations, and draft replies -- built with the [Cloudflare Agents SDK](https://developers.cloudflare.com/agents/) and [Workers AI](https://developers.cloudflare.com/workers-ai/).

![Agentic Inbox screenshot](./demo_app.png)


Read the blog post to learn more about Cloudflare Email Service and how to use it with the Agents SDK, MCP, and from the Wrangler CLI: [Email for Agents](https://blog.cloudflare.com/email-for-agents/).

## How to setup

**Important**: Clicking the 'Deploy to Cloudflare' button is only one part of the setup. You must follow the **After deploying** steps as well. For a full step-by-step guide with screenshots, refer to this comment: 
https://github.com/cloudflare/agentic-inbox/issues/4#issuecomment-4269118513

### To set up

1. Deploy to Cloudflare. The deploy flow will automatically provision R2, Durable Objects, and Workers AI. You'll be prompted for **DOMAINS**, which is the domain (yourdomain.com) you want to receive emails for (email@yourdomain.com).

     [![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/cloudflare/agentic-inbox)

2. **Configure Cloudflare Access** -- Enable [one-click Cloudflare Access](https://developers.cloudflare.com/changelog/post/[REDACTED]/) on your Worker under Settings > Domains & Routes. The modal will show your `POLICY_AUD` and `TEAM_DOMAIN` values. `TEAM_DOMAIN` can be either your Access team URL or the full `.../cdn-cgi/access/certs` URL. **You must set these as secrets for your Worker.**
3. **Set up Email Routing** -- In the Cloudflare dashboard, go to your domain > Email Routing and create a catch-all rule that forwards to this Worker
4. **Enable Email Service** -- The worker needs the `send_email` binding to send outbound emails. See [Email Service docs](https://developers.cloudflare.com/email-routing/email-workers/send-email-workers/)
5. **Create a mailbox** -- Visit your deployed app and create a mailbox for any address on your domain (e.g. `hello@example.com`)

### Troubleshooting Access

1. If you see `Invalid or expired Access token`, that usually means `POLICY_AUD` or `TEAM_DOMAIN` secrets are incorrect.
   * Resolution: [turn Access off and back on for the Worker to get the Access modal again](https://developers.cloudflare.com/changelog/post/[REDACTED]/), then reset your Worker secrets to the latest `POLICY_AUD` and `TEAM_DOMAIN` values shown there.
2. If you see `Cloudflare Access must be configured in production`, this application is intentionally enforcing Cloudflare Access so your inbox is not exposed to anyone on the internet.
   * Resolution: enable Access using [one-click Cloudflare Access for Workers](https://developers.cloudflare.com/changelog/post/[REDACTED]/), then set the `POLICY_AUD` and `TEAM_DOMAIN` Worker secrets from the modal values.

## Features

- **Full email client** — Send and receive emails via Cloudflare Email Routing with a rich text composer, reply/forward threading, folder organization, search, and attachments
- **Per-mailbox isolation** — Each mailbox runs in its own Durable Object with SQLite storage and R2 for attachments
- **Built-in AI agent** — Side panel with 9 email tools for reading, searching, drafting, and sending
- **Auto-draft on new email** — Agent automatically reads inbound emails and generates draft replies, always requiring explicit confirmation before sending
- **Configurable and persistent** — Custom system prompts per mailbox, persistent chat history, streaming markdown responses, and tool call visibility

## Stack

- **Frontend:** React 19, React Router v7, Tailwind CSS, Zustand, TipTap, `@cloudflare/kumo`
- **Backend:** Hono, Cloudflare Workers, Durable Objects (SQLite), R2, Email Routing
- **AI Agent:** Cloudflare Agents SDK (`AIChatAgent`), AI SDK v6, Workers AI (`@cf/moonshotai/kimi-k2.5`), `react-markdown` + `remark-gfm`
- **Auth:** Cloudflare Access JWT validation (required outside local development)

## Getting Started

```bash
npm install
npm run dev
```

### Configuration
=== workers/lib/tools.ts (the 'agent triage' logic, if any) — first 80 lines ===
// Copyright (c) 2026 Cloudflare, Inc.
// Licensed under the Apache 2.0 license found in the LICENSE file or at:
//     https://opensource.org/licenses/Apache-2.0

/**
 * Shared tool business logic for the Agent and MCP server.
 *
 * Each function takes an `env: Env` (or a DO stub) and tool-specific params,
 * performs the business logic (DO calls, data fetching, formatting), and
 * returns a plain object. The Agent and MCP server wrap these results in
 * their own response formats.
 *
 * Functions that already exist in email-helpers.ts (getFullEmail, getFullThread)
 * are reused directly — this module covers the remaining shared operations.
 */

import type { EmailFull } from "./schemas";
import {
	getMailboxStub,
	getFullEmail,
	getFullThread,
	buildQuotedReplyBlock,
	textToHtml,
	listMailboxes,
	generateMessageId,
	buildReferencesChain,
	buildThreadingHeaders,
} from "./email-helpers";
import { verifyDraft } from "./ai";
import { sendEmail } from "../email-sender";
import { Folders } from "../../shared/folders";
import type { Env } from "../types";

// ── Type casts for DO methods not on the base stub type ────────────
type MailboxSearchStub = {
	searchEmails: (options: {
		query: string;
		folder?: string;
	}) => Promise<unknown>;
};

type RateLimitStub = {
	checkSendRateLimit: () => Promise<string | null>;
};

// ── list_mailboxes ─────────────────────────────────────────────────

export async function toolListMailboxes(env: Env) {
	return listMailboxes(env.BUCKET);
}

// ── list_emails ────────────────────────────────────────────────────

export async function toolListEmails(
	env: Env,
	mailboxId: string,
	params: { folder: string; limit: number; page: number },
) {
	const stub = getMailboxStub(env, mailboxId);
	return stub.getEmails({
		folder: params.folder,
		limit: params.limit,
		page: params.page,
		sortColumn: "date",
		sortDirection: "DESC",
	});
}

// ── get_email ──────────────────────────────────────────────────────

export async function toolGetEmail(
	env: Env,
	mailboxId: string,
	emailId: string,
) {
	const stub = getMailboxStub(env, mailboxId);
	const email = await getFullEmail(stub, emailId);
	if (!email) return { error: "Email not found" };
	return email;
}
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && cat tested-tools/commands/native-scaffold/inbox-process.md 2>/dev/null | head -60`
  ```
---
description: Process every note in 00_Daily/ one at a time, routing each to its permanent home
---

Work through the `00_Daily/` folder with me, deciding the fate of each note.

Steps:
1. List all files currently in `00_Daily/` (excluding `_session-context.md`).
2. For each file, one at a time:
   a. Show me the note title and first 3 lines.
   b. Suggest one of these actions and explain why:
      - **Promote** → move to `30_Knowledge/` as a literature or reference note
      - **Atomise** → split into 2+ atomic notes (if multiple ideas present)
      - **Develop** → move to `20_Projects/` as a project seed
      - **Integrate** → fold content into an existing note (show me which one)
      - **Archive** → move to `_archive/` (not actionable, not reference-worthy right now)
      - **Delete** → truly redundant or noise
   c. Wait for my decision before moving on.
   d. If I choose Promote, Atomise, or Develop: apply the right template, fill in frontmatter, and add backlinks.
3. When inbox is empty, report:
   - Notes processed
   - Notes promoted / archived / deleted
   - New links created
4. Celebrate briefly. An empty inbox is a win.
  ```
- `mcp__jarvis__search_simple` — `{"query":"Jarvis OS North Star Part 5"}`
- `mcp__jarvis__search_simple` — `{"query":"North Star Part 5"}`
- `mcp__jarvis__vault_list` — `{"path":"10_Areas/AI/Setup"}`
- `mcp__jarvis__search_simple` — `{"query":"Jarvis OS North Star"}`
- `mcp__jarvis__vault_list` — `{"path":"60_Claude/07_AI_Information"}`
- `mcp__jarvis__vault_get_document_map` — `{"path":"60_Claude/07_AI_Information/Jarvis OS — North Star.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/07_AI_Information/Jarvis OS — North Star.md","targetType":"heading","target":["Jarvis OS — North Star","Part 5 — The build standard for skills, agents, hooks, and MCP","5.3 The hook standard"]}`
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && find hooks/Jarvis -type f 2>/dev/null && echo "---" && for f in hooks/Jarvis/*.ps1; do echo "=== $f ==="; head -15 "$f"; echo; done 2>/dev/null
echo "=== settings.json hook registrations, if staged ===" && find . -path ./sandbox -prune -o -iname "settings.json" -print 2>/dev/null | grep -i jarvis
  ```
  ```
hooks/Jarvis/jarvis-write-guard.ps1
hooks/Jarvis/jarvis-internship-note-guard.ps1
hooks/Jarvis/jarvis-session-continuity.ps1
---
=== hooks/Jarvis/jarvis-internship-note-guard.ps1 ===
param()

# PostToolUse validator for the internship system's five governed note types.
# Fires after every Write/Edit/MultiEdit; a no-op for anything outside
# 10_Areas/Career/Internships/ or 20_Progress/Internship/Applying/.
#
# What it checks: the required-frontmatter-field lists already stated in
# 30_Order/Standards/Internship/Internship Notes Standard.md (dossiers),
# CLAUDE.md's Program/Contact/Tracker contract (mirrored in
# internship-research-loop's own CLAUDE.md), and
# 30_Order/Standards/Internship/Applying Standard.md (Applying notes).
# A missing field is surfaced via additionalContext (informational, never
# blocking - PostToolUse can't undo a write that already happened) and one
# line is appended to logs/internship-note-guard.jsonl, per the North Star's
# Part 5.3 invariant: every automatic action logs a trace.

=== hooks/Jarvis/jarvis-session-continuity.ps1 ===
param()

$ErrorActionPreference = "Stop"

$rawInput = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($rawInput)) {
    exit 0
}

try {
    $hookInput = $rawInput | ConvertFrom-Json
} catch {
    exit 0
}


=== hooks/Jarvis/jarvis-write-guard.ps1 ===
param()

# PreToolUse write guard for the Jarvis vault.
# Enforces the Write Contract negative constraints from AGENTS.md:
#   - never create files at the vault root (only the four contract files may live there)
#   - never write into 50_Archive/, 60_Claude/05_Clippings/ (raw sources are read-only)
#   - never write notes into .obsidian/, .cursor/, .kiro/, .git/
# An allowlist of daily-operations paths (daily notes, plans, templates, skills,
# agents, dashboard, session log, Claude OS) is checked before any denial so the
# /startday-/closeday loop can never be blocked. Fails open (exit 0) on any
# parsing problem so it can never block legitimate work by accident.

$ErrorActionPreference = "Stop"

$raw = [Console]::In.ReadToEnd()

=== settings.json hook registrations, if staged ===
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && wc -l hooks/Jarvis/jarvis-session-continuity.ps1 && sed -n '1,60p' hooks/Jarvis/jarvis-session-continuity.ps1`
  ```
158 hooks/Jarvis/jarvis-session-continuity.ps1
param()

$ErrorActionPreference = "Stop"

$rawInput = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($rawInput)) {
    exit 0
}

try {
    $hookInput = $rawInput | ConvertFrom-Json
} catch {
    exit 0
}

$eventName = [string]$hookInput.hook_event_name
$cwd = [string]$hookInput.cwd
$jarvisRoot = "D:\Users\_Anant\10_Areas\Documents\Jarvis"

function Test-IsInsideJarvis {
    param([string]$Path)

    if ([string]::IsNullOrWhiteSpace($Path)) {
        return $false
    }

    $normalizedPath = $Path.TrimEnd('\', '/').ToLowerInvariant()
    $normalizedRoot = $jarvisRoot.TrimEnd('\', '/').ToLowerInvariant()
    return ($normalizedPath -eq $normalizedRoot -or $normalizedPath.StartsWith($normalizedRoot + "\"))
}

if ($eventName -eq "SessionStart" -and (Test-IsInsideJarvis -Path $cwd)) {
    $context = @"
Jarvis context-pack policy:
- Read first: 60_Claude/07_AI_Information/Jarvis OS — North Star.md (strategy spine), then AGENTS.md (write contract + routing), then 40_Resources/Obsidian/Jarvis Vault Architecture.md (folder placement).
- Before writing any note: read 30_Order/ (Templates + Workflows for the note type).
- For current state: 60_Claude/07_AI_Information/AI_CONTEXT.md, 00_Dashboard.md, then tail of 60_Claude/07_AI_Information/Session Logs/log.md.
- If unsure where a note goes: write it to 60_Claude/00_Inbox/. Never invent a folder.
- Load task-specific notes only after the task is clear. Do not dump the vault.
- Skill directories live at .claude/skills/<gerund-name>/SKILL.md — load SKILL.md first, reference.md only if needed.
- Use Sonnet for normal work, reserve Opus for hard planning or stuck debugging.
- Desktop is read-first planning/review; Claude Code is the implementation surface; mobile is capture only.
"@

    @{
        hookSpecificOutput = @{
            hookEventName = "SessionStart"
            additionalContext = $context
        }
    } | ConvertTo-Json -Depth 5 -Compress

    exit 0
}

if ($eventName -eq "SessionEnd" -or $eventName -eq "Stop") {
    # Stop fires after every turn (far more reliable than SessionEnd, which
    # depends on a clean process exit that doesn't always happen). Running
    # the same export path on both events means a session is never lost to
    # an ungraceful exit - the last Stop-triggered export already has it,
    # and export-claude-session.ps1's marker-staleness check (2026-08-11)
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && find sandbox/obsidian-second-brain -maxdepth 2 -type d | grep -v "\.git" 
echo "--- rules-like files ---"
find sandbox/obsidian-second-brain -iname "*rule*" -o -iname "*convention*" -o -iname "*standard*" | grep -v "\.git"
echo "--- architecture.md head ---"
head -50 sandbox/obsidian-second-brain/architecture.md
  ```
  ```
sandbox/obsidian-second-brain
sandbox/obsidian-second-brain/.claude-plugin
sandbox/obsidian-second-brain/integrations
sandbox/obsidian-second-brain/hooks
sandbox/obsidian-second-brain/adapters
sandbox/obsidian-second-brain/media
sandbox/obsidian-second-brain/examples
sandbox/obsidian-second-brain/scripts
sandbox/obsidian-second-brain/_includes
sandbox/obsidian-second-brain/tests
sandbox/obsidian-second-brain/docs
sandbox/obsidian-second-brain/commands
sandbox/obsidian-second-brain/references
sandbox/obsidian-second-brain/docs/commands
sandbox/obsidian-second-brain/references/bases
sandbox/obsidian-second-brain/integrations/obsidian-plugin
sandbox/obsidian-second-brain/integrations/telegram-journal
sandbox/obsidian-second-brain/integrations/obsidian-mcp-server
sandbox/obsidian-second-brain/adapters/claude-code
sandbox/obsidian-second-brain/adapters/opencode
sandbox/obsidian-second-brain/adapters/gemini-cli
sandbox/obsidian-second-brain/adapters/pi
sandbox/obsidian-second-brain/adapters/agent-skills
sandbox/obsidian-second-brain/adapters/hermes
sandbox/obsidian-second-brain/adapters/codex-cli
sandbox/obsidian-second-brain/examples/sample-vault
sandbox/obsidian-second-brain/scripts/research
sandbox/obsidian-second-brain/scripts/eval
--- rules-like files ---
sandbox/obsidian-second-brain/tests/test_eval_ruler.py
sandbox/obsidian-second-brain/references/write-rules.md
sandbox/obsidian-second-brain/references/ai-first-rules.md
--- architecture.md head ---
# obsidian-second-brain - architecture

How the layers fit together. This document describes the system: its components, how they connect, and how data flows from a slash command to a vault note. For the per-command operating manual see `SKILL.md`; for the contributor rules see `CLAUDE.md`.

Last reviewed against commit `ff0319c` (2026-06-05).

---

## System overview

obsidian-second-brain is a cross-CLI **skill** (not a plugin, not a hosted service) that turns any Obsidian vault into an AI-first second brain. One platform-neutral command source compiles to seven AI CLIs - Claude Code, Codex CLI, Gemini CLI, OpenCode, Antigravity, Hermes, Pi - through a build-time adapter pattern. At runtime a slash command reads and writes the user's vault as plain markdown; commands shell out to Python helpers for anything deterministic (vault health, research fetches, codebase scans).

- **46 commands**, grouped by `category:` frontmatter: vault 16, thinking 14, research 8, meta 8.
- **45 commands are cross-platform.** Only `/obsidian-calendar` carries `exclude: [codex-cli, gemini-cli, opencode, hermes, pi, agent-skills]` because it depends on the Google Calendar MCP, so it ships on Claude Code only. The Codex / Gemini / OpenCode / Hermes / Pi / Agent Skills builds ship 45.
- A research toolkit that is key-less by default (free public sources) and uses Grok + Perplexity + Gemini when keys are present.
- An opt-in background agent plus optional user-scheduled agents.
- MIT licensed.

The AI-first vault rule ties it all together: every note a command writes is designed for future-Claude retrieval, not human reading. The canonical spec is `references/ai-first-rules.md`, referenced from `_CLAUDE.md` Section 0 and from every command that writes to the vault.

---

## The adapter pattern (the core idea)

`commands/` is the single source of truth. The build compiles it per platform instead of maintaining seven command sets.

- `commands/<name>.md` uses Claude Code's slash-command shape and declares `description:`, `category:`, `triggers_en:`, and optional `exclude:` frontmatter.
- `scripts/build.sh` orchestrates the `adapters/` layer. `bash scripts/build.sh` builds all platforms; `--platform <name>` builds one.
- The **Claude Code adapter is an identity copy**. The other six adapters translate per platform: `codex-cli`, `hermes`, and `agent-skills` emit **native skills** (one `SKILL.md` per command; `agent-skills` is a single spec-compliant `.agents/skills/` tree that Codex CLI, OpenCode, and Google Antigravity all read, with a shared `obsidian-core` engine skill), `pi` emits a Pi package (`.pi/prompts/` + `.pi/skills/`), and `gemini-cli` / `opencode` emit a dispatcher file (`GEMINI.md` / `AGENTS.md`) with an auto-generated routing table built from each command's `description:`, grouped by `category:` then language, plus the command bodies under `.gemini/` / `.opencode/`.
- Claude-specific wording is neutralized for the other CLIs (for example `Read tool` becomes `read files`).
- Output lands in `dist/<platform>/`, which is gitignored and regenerated - never hand-edited.

**Consequence for contributors:** to add or change a command, edit only `commands/<name>.md`. The adapters pick it up on the next build. No adapter change is needed.

---

## Repo layout

| Path | Role |
|---|---|
| `commands/` | 45 slash-command definitions, one `.md` each. The platform-neutral source and the product surface. |
| `references/` | Shared specs the commands link to. `ai-first-rules.md` is the canonical, non-negotiable vault-write spec. |
| `scripts/` | Python and Shell engine: build orchestrator, vault tooling, research toolkit, codebase scanner. |
| `adapters/` | Platform translation layer. `lib.sh` plus one `adapter.sh` per CLI. |
| `hooks/` | Claude Code hooks: AI-first write validation, session-start context injection, opt-in background agent. |
| `dist/` | Build output, one tree per platform. Gitignored. Regenerate with `scripts/build.sh`. |
| `tests/` | Smoke tests and fixtures, run in CI. |
| `examples/sample-vault/` | Fictional AI-first notes that show what good output looks like. |
| `SKILL.md` | Full operating manual loaded when the skill activates. |
| `architecture.md` | This document. |
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && ls 60_Claude/vault-rules/
echo "=== write-rules.md (obsidian-second-brain) ===" && cat sandbox/obsidian-second-brain/references/write-rules.md
echo "=== ai-first-rules.md (obsidian-second-brain), first 80 lines ===" && head -80 sandbox/obsidian-second-brain/references/ai-first-rules.md
  ```
  ```
anthropic-docs-reference.md
folder-structure.md
linking-strategy.md
naming-conventions.md
pipeline-conventions.md
tagging-system.md
write-contract.md
=== write-rules.md (obsidian-second-brain) ===
# Write Rules

How Claude writes, links, formats, and updates notes in an Obsidian vault.

> **Read `references/ai-first-rules.md` first.** Every note Claude writes must follow the AI-first rule (preamble, rich frontmatter, recency markers, mandatory wikilinks, sources verbatim, confidence levels). The rules below are operational details on top of that foundation.

---

## The Propagation Rule

**Never create a note in isolation.** Every write has ripple effects.

When you create or update something, trace forward: what other notes need to know about this?

```
New project created
  → Add card to kanban board (Backlog column)
  → Link from today's daily note
  → If it has a person involved, link from their note

Task completed
  → Move card in kanban (to ✅ Done, with strikethrough)
  → Update project note (Recent Activity or Delivered section)
  → Log in today's daily note

Person note updated
  → If interaction happened today, log in daily note
  → If they made a mention/shoutout, add to Mentions Log

Dev log created
  → Link from project note (Recent Activity section)
  → Link from today's daily note (Work / Work Log section)

Decision made
  → Log in project note (Key Decisions section)
  → Log in today's daily note

Deal moved forward
  → Update deal file (status, probability, notes)
  → Update Side Biz kanban board
  → Reflect in daily note
```

---

## Internal Linking

Use `[[Note Name]]` syntax. Always link:
- People mentioned in a note → `[[Jane Smith]]`
- Projects referenced → `[[My Project Name]]`
- Jobs/companies → `[[Acme Corp]]`
- Related tasks → `[[Task Name]]`

**Never hardcode paths** unless necessary. Obsidian resolves `[[Name]]` by filename.

If the linked note doesn't exist yet, create it (stub is fine - frontmatter + title + one line of context).

---

## Date Formatting

| Context | Format | Example |
|---|---|---|
| Frontmatter `date` field | `YYYY-MM-DD` | `2026-03-24` |
| Frontmatter `due` field | `YYYY-MM-DD` | `2026-03-28` |
| Kanban due date tag | `@{YYYY-MM-DD}` | `@{2026-03-28}` |
| Body text references | Human format | `March 24` or `Mar 24` |
| File names (dated) | `YYYY-MM-DD` | `2026-03-24.md` |

---

## Kanban Board Format

Boards use the `kanban-plugin: board` YAML frontmatter.
Columns are H2 headings. Items are task checkboxes with optional indented description.

**Active item:**
```markdown
- [ ] 🔴 **Task Title** · @{2026-03-28}
	One-line description. [[Related Project]] [[Person]]
```

**Waiting item:**
```markdown
- [ ] 🟡 **Task Title** · @{2026-04-07}
	Context for why it's blocked. [[Person responsible]]
```

**Completed item** (move to `## ✅ Done` column):
```markdown
- [x] ~~🔴 **Task Title**~~ ✅ Mar 24
	Brief note on outcome.
```

**Priority emoji convention:**
- 🔴 Critical / blocking
- 🟡 Important / this week
- 🟢 Nice to have / low urgency

**Never delete done items** - move them to the Done column with strikethrough. Done items are the changelog.

---

## Status Values

Use these consistently across all note types:

**Projects:**
`active` | `planning` | `completed` | `archived` | `on-hold`

**Tasks:**
`in-progress` | `done` | `waiting` | `cancelled`

**Deals:**
`prospect` | `negotiating` | `confirmed` | `completed` | `lost`

**Goals:**
`active` | `completed` | `paused` | `abandoned`

**Content:**
`draft` | `scheduled` | `published`

---

## Writing Style Calibration

Before writing a new note in a folder you haven't written in before:
1. Read 1-2 existing notes in that folder
2. Match: heading structure, frontmatter fields present, tone (formal vs casual), emoji usage, list style (bullet vs numbered), section names

Don't introduce new patterns - extend what's there.

---

## Archiving

**Soft archive** (preferred): Add `_archived_` prefix to filename.
`Old Project.md` → `_archived_Old Project.md`

**Update frontmatter**: set `status: archived`

Never delete vault notes - archive them. The vault is a permanent record.

---

## Template Usage

When creating notes from templates, strip all Templater syntax (`<% ... %>`) and replace with actual values. Never leave template placeholders in saved notes.

---

## Stub Notes

When a link target doesn't exist yet, create a minimal stub:
```yaml
---
date: 2026-03-24
tags:
  - person    # or project, task, etc.
---

# Person Name

<!-- Note created as stub. Expand when more info is available. -->
```

---

## Section Injection

When updating an existing note (vs creating new), use targeted section injection:

1. Read the full file
2. Find the target section heading
3. Append content below the last item in that section (before the next `---` or next `##`)
4. Write back the full file with `write_file`

For kanban boards: find the correct column heading, insert the new item above the last item in that column (or at top if empty).

---

## Sentinel-safe regeneration

For notes that a command generates AND a human may hand-edit (architecture docs, dashboards, any note meant to be refreshed by re-running a command), use sentinel markers so a refresh never destroys human edits:

```
<!-- @generated:start -->
...machine-generated content - safe to overwrite on the next run...
<!-- @generated:end -->

<!-- @user:start -->
...human notes - NEVER overwritten by a refresh...
<!-- @user:end -->
```

Rules on refresh:
1. Read the existing note.
2. Replace ONLY the content between `@generated:start` and `@generated:end`.
3. Never touch `@user` blocks, and never touch anything outside the markers (treat it as human-owned).
4. On the first run (no markers yet), wrap the content you generate in `@generated` markers so future refreshes are safe.

This lets a command be idempotent and re-runnable without the user fearing it will wipe their additions. Used by `/obsidian-architect`; available to any command that maintains a regenerable note.

---

## Search Before Write

Before creating any note:
```
search(query="keyword from title")
```

If a match is found:
- Same concept → update the existing note, don't create new
- Different concept, similar name → proceed with creation but choose a distinct name

Duplicate detection is especially important for: people (same person, different name formats), projects (same project, different working title), deals (same client, multiple files).

**Never claim absence from memory.** Before writing "no note exists" or creating a note because you believe none exists, search exhaustively - by every plausible name, alias, and folder, listing and grepping rather than relying on one query. False absence (under-reporting, or "nothing found" when something does exist) is the most common failure mode. When unsure, over-include and label the uncertainty. See the anti-fabrication and search-completeness hard rules in `ai-first-rules.md`.
=== ai-first-rules.md (obsidian-second-brain), first 80 lines ===
# AI-First Note Rules

The vault is designed for **future-Claude** to read and reason over, not for human review. The owner rarely opens notes directly - they call Claude to retrieve, synthesize, and connect dots across years of accumulated knowledge. **Every command that writes to the vault must produce notes that follow these rules.**

This document is the canonical specification. It lives at `references/ai-first-rules.md` in the obsidian-second-brain repo and is referenced from `_CLAUDE.md` Section 0, every slash command, and `references/write-rules.md`.

---

## The 7 Rules

### 1. Self-contained context
Each note must explain itself. Future-Claude may pull this single note via `/obsidian-find` or vault scan with no surrounding context. Don't rely on backlinks alone for meaning. State the *what*, the *why*, and the *when* inside the note itself.

### 2. "For future Claude" preamble
Every note begins with a 2-3 sentence summary in plain English under a `## For future Claude` header (immediately after the frontmatter). Future-Claude reads this to decide relevance in 10 seconds before parsing the rest. State what's in the note, why it was saved, and any temporal/staleness caveat.

```markdown
## For future Claude
This note is a [type] about [topic] saved on [date]. It [main purpose].
[Optional caveat about staleness, confidence, or scope.]
```

### 3. Rich, consistent frontmatter
Filterable metadata. Different note types have different schemas (see below) but every note has machine-readable frontmatter.

**Universal fields (every note):**
```yaml
---
date: YYYY-MM-DD              # creation or update date
type: <note-type>             # see Type Schemas below
tags: [...]                   # always include the type as a tag
ai-first: true                # explicit flag
---
```

### 4. Recency markers per claim
When stating external facts, attach the date inline:

```markdown
- Mem0 raised $24M Series A (as of 2026-04, mem0.ai/blog/series-a)
- Anthropic released native memory tool (as of 2026-02, anthropic.com/news/memory)
```

So future-Claude knows what to verify before trusting individual facts.

This extends to internal fast facts via the freshness policy (`references/freshness-policy.md`): every stored fact must be **timeless, dated, or a pointer**. A fact that can change within ~7 days (counts, statuses, balances, ticket states) is never written bare - it carries an `as of` stamp, links to the system where truth lives, or sits inside a dated note. The illegal form is the undated present-tense claim ("the pipeline has 13 deals") - true today, a lie next week, still reading as truth. `scripts/freshness_lint.py` enforces this; `/obsidian-health` runs it.

### 5. Sources preserved verbatim
Every external claim has its source URL inline. Don't paraphrase a citation - keep the actual URL so the claim can be re-verified or refreshed years later.

### 6. Cross-links are mandatory
Every person, project, idea, decision, or concept referenced uses `[[wikilinks]]` so the graph is traversable by future-Claude:

```markdown
Sarah at [[People/Sarah Chen]] decided to ship the [[Projects/Dashboard Refactor]] by Friday.
```

If a linked note doesn't exist, create a stub (per `references/write-rules.md` § Stub Notes).

**Typed edges (optional, for relationships that carry meaning).** A plain `[[wikilink]]` says two notes are related; it does not say *how*. When the relationship is one future-Claude will need to reason over - a decision that replaces another, a project that depends on a system, an incident that caused an outage - record it as a typed edge in a `relations:` frontmatter block instead of (or in addition to) an inline link:

```yaml
relations:
  supersedes: ["[[Knowledge/ADR-006 - Use Redis]]"]
  depends_on:
    - "[[Projects/Tide Gateway]]"
  caused_by: ["[[Incidents/Redis outage 2026-03]]"]
```

Known relation types (each has an inverse so the graph reads both ways):

| Type | Inverse | Use for |
|---|---|---|
| `supersedes` | `superseded_by` | this note replaces an older decision/claim |
| `depends_on` | `required_by` | this note needs the target to hold |
| `caused` | `caused_by` | causal chains (incident to outcome) |
| `decided_by` | `decides` | a decision and who/what made it |
| `relates_to` | `relates_to` | generic, symmetric (only when nothing sharper fits) |
| `contradicts` | `contradicts` | this note conflicts with the target |
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && wc -l 60_Claude/vault-rules/*.md`
  ```
   34 60_Claude/vault-rules/anthropic-docs-reference.md
   89 60_Claude/vault-rules/folder-structure.md
   46 60_Claude/vault-rules/linking-strategy.md
   35 60_Claude/vault-rules/naming-conventions.md
   59 60_Claude/vault-rules/pipeline-conventions.md
   63 60_Claude/vault-rules/tagging-system.md
   74 60_Claude/vault-rules/write-contract.md
  400 total
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/linking-strategy.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/naming-conventions.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/tagging-system.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/write-contract.md`
- `mcp__jarvis__vault_get_document_map` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md"}`
- `ToolSearch` — `{"query":"select:mcp__jarvis__vault_patch","max_results":3}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Sandbox triage, completed — 2026-08-20 (round 2: the 15 clones the first pass didn't cover)"],"operation":"append","scope":"markerAndContent","ifMatch":"a5120d","content":"# Round 10 (2026-09-05) — sandbox re-audit; the 4 held-open items from round 2, resolved\n\nPer `second-brain-claudekit/20_Progress/Projects/AI Use/Claude Kit/Claude Code/Prompts.md`'s Round 10 prompt — Round 9 (same day, earlier) onboarded Jarvis's 6 empty agents + `internship-research-loop`, confirmed committed (`git log`: `167d563`, `e2c27b9`, `0db6c75`, `491a0c6`, `e21ff9e`, all 2026-09-05; `git status` clean), and is not re-litigated here. `ls -d sandbox/*/ | wc -l` **still 32** — no new arrivals since the round-2 count above; nothing new to triage.\n\n- **obsidian-mind** — reference-pattern review done, not an install. Read its five-hook lifecycle (`.claude/settings.json` + `.claude/scripts/{session-start,pre-compact,stop-checklist,validate-write,classify-message}.ts`) against `Jarvis OS — North Star.md` Part 5.3 (which already names obsidian-mind as the model). **Real match, 2 of 5**: SessionStart context-pack injection is built (`jarvis-session-continuity.ps1`'s SessionStart branch, staged into `second-brain-claudekit/hooks/Jarvis/` 2026-09-05 by Round 9) — reads as the same pattern as obsidian-mind's `session-start.ts`. A narrow, project-scoped precedent for PostToolUse frontmatter validation exists (`jarvis-internship-note-guard.ps1`, scoped to 5 internship note types only, not vault-wide). **Still genuinely unbuilt, 3 of 5**: UserPromptSubmit classify-and-route (obsidian-mind's `classify-message.ts` — nothing equivalent exists in Jarvis), a vault-wide PostToolUse frontmatter/wikilink validator (only the narrow internship-scoped one exists), and PreCompact transcript backup (obsidian-mind's `pre-compact.ts`; Jarvis's conversation-capture layer solves a related but different problem via `Stop`/`SessionEnd`, not `PreCompact`). obsidian-mind's procedural-vs-content split (`.claude/` vs. `brain/`/`work/`/`org/`/`perf/`) is already mirrored by Jarvis's own `.claude/` vs. PARA-folder separation — nothing new to adopt there. **Verdict: still worth evaluating, narrowed** — if picked up next, the concrete target is `classify-message.ts`'s UserPromptSubmit pattern specifically, not a repeat of this review.\n- **obsidian-second-brain** — vault-rules diff done, real disagreements found, not a skim. Compared `references/write-rules.md` + `references/ai-first-rules.md` against `second-brain-claudekit/60_Claude/vault-rules/{linking-strategy,naming-conventions,tagging-system,write-contract}.md`. Real, adoptable gaps neither this repo's nor Jarvis's own rules currently cover: (1) an explicit anti-fabrication rule (\"never claim absence from memory... false absence is the most common failure mode\") — `write-contract.md` names no equivalent rule today, despite this repo's own `_docs/Repo-Map.md` incident log showing the same failure shape more than once; (2) typed relation edges (`relations: supersedes/depends_on/caused_by`, each with a stated inverse) — `linking-strategy.md` only has plain `[[wikilinks]]` + MOCs, no way to mark a directional relationship, even though this very Log.md's own \"correction\" entries are exactly this relationship shape today, expressed only in prose; (3) sentinel-safe regeneration markers (`@generated:start/end` vs. `@user:start/end`) for a note that's both machine-refreshed and human-edited — no equivalent convention exists here. **Not a gap**: this repo's own `write-contract.md` \"Automated mechanisms must be failure-visible\" section (5 named incidents) is more rigorous than anything in obsidian-second-brain's rules on that specific axis — nothing to adopt there. **Verdict: comparison complete, no promotion** — these 3 are candidate additions to `60_Claude/vault-rules/` or Jarvis's own write-contract equivalent, named here so they aren't lost, not queued as unrequested work.\n- **claude-mem** — hold confirmed to still apply, correctly not re-opened. Its own recorded condition (\"hold until gbrain's promotion lands\") is unmet: gbrain is still not actually installed on either home as of this round — no `gbrain` on WSL `PATH`, no MCP registration in `~/.claude.json`, `~/.mcp.json`, or `~/.claude/.mcp.json` (checked directly), only leftover `~/.gbrain/` data on disk from the 2026-08-20 sandbox test run. No action taken — re-check after gbrain actually installs, not before.\n- **agentic-inbox** — comparison done, real verdict, not a deferral, and it corrects this file's own prior framing. The real repo (`cloudflare/agentic-inbox`) is a self-hosted **email client** (React Router + Cloudflare Workers, Durable Objects per mailbox, R2 attachments, Cloudflare Email Routing) with an AI agent that reads/searches/drafts/sends *email* — confirmed directly from its README and `workers/lib/tools.ts`. It has no note-triage logic of any kind. `second-brain-claudekit`'s own `commands/inbox-process.md` (`tested-tools/commands/native-scaffold/inbox-process.md`) triages *vault notes* in `00_Daily/` (promote/atomise/develop/integrate/archive/delete) — a different domain entirely. **Correction:** this file's 2026-08-20 entry's premise (\"directly relevant to Jarvis's `00_Daily/` capture-then-process flow... compare its triage logic against `inbox-process.md`\") doesn't hold up against the real repo — there is no triage-logic overlap to compare. **Verdict: drop.** Deploying it (a real Cloudflare Workers domain, Email Routing, Access) would be disproportionate to a use case it doesn't actually serve.\n\n**Also found this round, a standing gap distinct from the above**: two `tested-tools/` items have cleared all four `Promotion-Criteria.md` gates but were never actually promoted anywhere — **gbrain** (cleared 2026-08-20 for global promotion, still not installed on WSL or Windows as of 2026-09-05, confirmed directly per above) and **cpr-compress-preserve-resume** (blend verdict, cleared 2026-08-19, the blended `compress.md`/`preserve.md`/`resume.md` still sit only in `tested-tools/commands/cpr-compress-preserve-resume/`, not in `second-brain-claudekit/.claude/commands/` — confirmed by direct listing, 2026-09-05). Both are ready-to-execute, no further review needed, just the actual copy/install step.\n"}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"frontmatter","target":"updated","operation":"replace","value":"2026-09-05"}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Log.md","targetType":"heading","target":["Claude Kit — Log","[2026-09-05] global | Windows home populated for real (agents/commands/hooks), 5 more stale WSL paths found and fixed"],"operation":"append","scope":"markerAndContent","ifMatch":"a03f9a","content":"# [2026-09-05] pipeline | Ingestion-trail citation added to second-brain-claudekit's docs; sandbox re-audited (4 held-open items resolved); 2 cleared-but-unpromoted gaps named\n\nRound 10 of `second-brain-claudekit/20_Progress/Projects/AI Use/Claude Kit/Claude Code/Prompts.md`, same day as the two entries above (Round 9) but a separate task, not touching that work again.\n\n- **Docs citation**: `second-brain-claudekit/_docs/Design.md` (next to its existing `Tool Map.md` citation, point 2 of the self-improvement sequence) and `_docs/Jarvis.md` (a new bullet immediately before the existing `Tool Map.md` bullet under \"this repo's decision tracker\") now both explicitly cite `[[40_Resources/CS/Repos]]` as where the `sandbox/` → `tested-tools/` → `Promotion-Criteria.md` decision trail actually starts — neither file named it explicitly before, despite both already depending on it.\n- **Sandbox re-audit**: `sandbox/` still 32 clones, unchanged since the 2026-08-20 round-2 count — nothing new to triage. The 4 items round 2 left \"still worth evaluating\" all got their named next step executed for real this round — see the new \"Round 10\" subsection under [[Tool Map]]'s round-2 heading for the full account: obsidian-mind (2 of 5 North-Star hooks now match Jarvis's real hooks, 3 still unbuilt — narrowed, not closed), obsidian-second-brain (3 real, adoptable vault-rule gaps named: anti-fabrication rule, typed relation edges, sentinel-safe regeneration markers), claude-mem (hold correctly still applies — gbrain still isn't actually installed), agentic-inbox (**dropped** — it's a Cloudflare email client with zero note-triage logic; this file's 2026-08-20 framing of it as comparable to `inbox-process.md` didn't survive checking the real repo).\n- **New standing gap named**: `cpr-compress-preserve-resume`'s blend verdict (cleared 2026-08-19) is cleared-but-unpromoted the same way gbrain's global candidacy is — the blended `compress.md`/`preserve.md`/`resume.md` still sit only in `tested-tools/commands/cpr-compress-preserve-resume/`, never copied into `second-brain-claudekit/.claude/commands/`. Both gbrain and CPR are ready-to-execute with no further review needed.\n"}`
- `Bash`:
  ```bash
grep -i "bumblebee" /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/scratchpad/prompts.md
cd ~/projects/ai/claude/second-brain-claudekit && grep -ri "bumblebee" _docs/*.md CLAUDE.md 2>/dev/null
  ```
  ```
**Round 10, 2026-09-05 — cite the vault's real ingestion trail, re-audit sandbox with fresh eyes, then write the real usage docs.** Round 9 (above) onboarded Jarvis's 6 empty agents and internship-research-loop into the pipeline — confirmed done and committed by Anant's own report. This round doesn't touch that work again. It closes a different gap: this repo's `_docs/` never explicitly cites the vault's own pre-existing ingestion research (`40_Resources/CS/Repos.md`, `60_Claude/10_Source_Summaries/Github Ingestion/How Anant Uses Each Repo.md` + `Useful Repos - Shortlist.md`, `60_Claude/20_Distilled_Notes/Sources - Plan/{GitHub Ingestion Implementation,00_Execution,_Notes Created From Ingestion}.md`, `20_Progress/Projects/AI Use/Claude Kit/` — the whole project folder with `Tool Map.md`/`Log.md`), even though every real decision this pipeline has ever made (gbrain, gstack, mattpocock-skills, ECC, spec-kit, claude-context, promptfoo, bumblebee, and the 32-repo sandbox triage) traces directly back to that trail. Three tasks, in order, ending in the actual "how to use it now that it's real" docs Anant asked for.
- Coverage is the ~15-20 repos with an actual real decision (installed, tested, blocked-with-a-real-attempt, or explicitly dropped-with-reason) — not all 95 in `Repos.md`. Writing "how to use X" for a repo that's still just starred and undecided is exactly the kind of invented-ahead-of-a-real-decision content this whole pipeline exists to prevent. Compile the real list yourself from `Tool Map.md`'s rows + `Repos.md`'s non-blank status markers — the starting set below is what's visible as of 2026-09-05, treat it as a floor to verify and extend, not a final list: gbrain, gstack, mattpocock-engineering (the 17-skill subset), cpr-compress-preserve-resume, ECC, spec-kit, claude-context, promptfoo, bumblebee, graphify (already live, has its own note at `40_Resources/CS/Concepts/Helpful Tools/Graphify`), Firecrawl (already adopted, in daily use, never individually ingested as a repo summary — the most-used real tool with the least real documentation), the Claude Council/llm-council skill, hiring-agent (check Prompt 9's actual outcome first — Anant's own report didn't confirm it ran).
  ```
- `mcp__jarvis__search_simple` — `{"query":"bumblebee"}`
- `Bash`:
  ```bash
python3 -c "
import json
with open('/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/tool-results/toolu_01XWohTtrDhSqLeBi2HDQm3S.json') as f:
    data = json.load(f)
text = data[0]['text']
obj = json.loads(text)
content = obj['content']
import re
idx = content.lower().find('bumblebee')
print(idx)
print(content[max(0,idx-400):idx+400] if idx!=-1 else 'NOT FOUND in Repos.md')
"

  ```
  ```
18263
https://github.com/pmndrs/react-three-fiber) — 30K-star React renderer for Three.js; declarative 3D in React with full Three.js access *not useful* → no relations
- [Pocketbase](https://github.com/pocketbase/pocketbase) — 59K-star open source realtime backend in one Go binary: auth, SQLite DB, file storage, realtime subscriptions; pre-v1.0.0, no compat guarantee yet → [[pocketbase (github)]]
- [Bumblebee](https://github.com/perplexityai/bumblebee) — read-only developer endpoint scanner from Perplexity: checks on-disk packages/extensions for known supply-chain compromises; Go (*INSTALL: QUEUED — run first, before any other repo on this page installs*) → [[bumblebee]]
- [Modern JS Cheatsheet](https://github.com/mbeaudru/modern-js-cheatsheet) — comprehensive modern JavaScript reference; ES
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && find . -path ./sandbox -prune -o -iname "*archive*" -type d -print 2>/dev/null | grep -v "\.git"
echo "---" && find .claude -maxdepth 3 -type d
  ```
  ```
./.claude/_archive
---
.claude
.claude/hooks
.claude/_archive
.claude/agents
.claude/commands
.claude/_archive/session-logs
.claude/_archive/superseded-commands
  ```
- `Bash`:
  ```bash
echo "=== ECC plugin marketplace ===" && ls ~/.claude/plugins/marketplaces/ 2>/dev/null
cat ~/.claude/plugins/config.json 2>/dev/null | head -40
echo "=== ecc in settings/plugins enabled? ===" && grep -A3 -B3 "ecc" ~/.claude/settings.json 2>/dev/null | head -30
echo "=== llm-council skill in this repo? ===" && find ~/projects/ai/claude/second-brain-claudekit -iname "*llm-council*" | grep -v sandbox | grep -v "\.git"
find ~/.claude/skills -iname "*llm*council*" -maxdepth 2 2>/dev/null
  ```
  ```
=== ECC plugin marketplace ===
claude-plugins-official
ecc
ponytail
=== ecc in settings/plugins enabled? ===
        "repo": "DietrichGebert/ponytail"
      }
    },
    "ecc": {
      "source": {
        "source": "git",
        "url": "https://github.com/affaan-m/ECC.git"
=== llm-council skill in this repo? ===
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/commands/Jarvis/llm-council.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/agents/Jarvis/llm-council.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/skills/Jarvis/llm-council
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/skills/Jarvis/llm-council.md
/home/anant_gupta/projects/ai/claude/second-brain-claudekit/skills/Jarvis/llm-council/llm-council.md
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && ls .claude/skills 2>/dev/null; echo "no .claude/skills or empty above"
find ~/.claude/skills -maxdepth 1 -iname "*council*" 2>/dev/null
echo "--- check this repo's own top-level skills/ dir (non-Jarvis) ---"
ls skills/ 2>/dev/null | grep -v "\.claude_wsl\|Jarvis"
  ```
  ```
no .claude/skills or empty above
--- check this repo's own top-level skills/ dir (non-Jarvis) ---
The Plan
Trading View
internship-research-loop
  ```
- `Bash`:
  ```bash
find /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills -maxdepth 1 -iname "*council*" 2>/dev/null
ls /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills 2>/dev/null | head -30
  ```
  ```
/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills/llm-council
challenge
class-csci4041
closeday
distill-note
ideas
ingesting-clipping
llm-council
mcp-hub
mentorship
note-to-actions
ops
plan-it
project-career
remove-ai-slop
startday
tag-monthly
trace-goal
transcript-to-brief
weekly-review
  ```
- `mcp__jarvis__vault_list` — `{"path":"40_Resources/CS/AI"}`
- `mcp__jarvis__vault_list` — `{"path":"40_Resources/CS/Concepts/Helpful Tools"}`
- `mcp__jarvis__search_simple` — `{"query":"How Anant Uses Each Repo"}`
- `mcp__jarvis__search_simple` — `{"query":"Useful Repos - Shortlist"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/How Anant Uses Each Repo.md"}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/Useful Repos - Shortlist.md"}`
- `Bash`:
  ```bash
python3 -c "
import json
with open('/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/tool-results/toolu_01XcuF8GR5yuGKVGh5fFzHsw.json') as f:
    data = json.load(f)
text = data[0]['text']
obj = json.loads(text)
print('BACKLINKS:', obj.get('backlinks'))
print('LEN content:', len(obj['content']))
"

  ```
  ```
BACKLINKS: ['20_Progress/Projects/AI Use/Builds & Resources/Maverick Skills Mode-to-Repo Mapping.md', '40_Resources/CS/AI/Gen AI Meeting.md', '40_Resources/CS/Repos.md', '60_Claude/05_Clippings/AI Conversations/Windows/Claude Code/Jarvis/07-27 Audit and organize Claude folder ingestions and implementations.md', '60_Claude/05_Clippings/AI Conversations/Windows/Claude Code/Jarvis/07-29 Execute PDF ingestion verdicts across vault.md', '60_Claude/07_AI_Information/Session Logs/log.md', '60_Claude/10_Source_Summaries/Github Ingestion/Claude Kit Implementation.md', '60_Claude/10_Source_Summaries/Github Ingestion/How Anant Uses Each Repo.md', '60_Claude/20_Distilled_Notes/Ingestion Pipeline Audit — Clippings, Summaries & Implementation (2026-07-27).md', '60_Claude/20_Distilled_Notes/Sources - Plan/00_Execution.md', '60_Claude/20_Distilled_Notes/Sources - Plan/GitHub Ingestion Implementation.md', '60_Claude/20_Distilled_Notes/Sources - Plan/_Notes Created From Ingestion.md']
LEN content: 49607
  ```
- `mcp__jarvis__vault_read` — `{"path":"40_Resources/CS/Concepts/Helpful Tools/Graphify.md"}`
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit
echo "=== firecrawl skills installed (WSL) ===" && ls ~/.claude/skills | grep -i firecrawl
echo "=== firecrawl skills (Windows global, via this repo's mirror) ===" && ls skills/.claude_windows 2>/dev/null | grep -i firecrawl
echo "=== llm-council skill content (Jarvis real) ===" && wc -l /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills/llm-council/SKILL.md 2>/dev/null
find /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills/llm-council -type f
  ```
  ```
=== firecrawl skills installed (WSL) ===
=== firecrawl skills (Windows global, via this repo's mirror) ===
=== llm-council skill content (Jarvis real) ===
/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills/llm-council/llm-council.md
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && ls skills/.claude_windows 2>/dev/null | grep -i firecrawl | head -5
echo "count:" && ls skills/.claude_windows 2>/dev/null | grep -ci firecrawl
echo "=== sample one skill ===" && ls skills/.claude_windows 2>/dev/null | grep -i firecrawl | head -1 | xargs -I{} find "skills/.claude_windows/{}" -type f 2>/dev/null
  ```
  ```
count:
0
=== sample one skill ===
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && find . -maxdepth 2 -iname "*.claude_windows*"
echo "---" && find . -iname "*firecrawl*" 2>/dev/null | grep -v "\.git" | head -20
  ```
  ```
./agents/.claude_windows
./context/.claude_windows
./hooks/.claude_windows
./instructions/.claude_windows
./commands/.claude_windows
./skills/.claude_windows
./rules/.claude_windows
---
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && ls skills/.claude_windows/ 2>/dev/null
echo "--- sync manifest windows entry ---"
python3 -c "
import json
d = json.load(open('sync-manifest.json'))
for e in d.get('projects', d if isinstance(d, list) else []):
    pass
print(json.dumps(d, indent=2)[:200])
"
grep -A 20 "claude_windows" sync-manifest.json | head -40
  ```
  ```
export-ai-session
--- sync manifest windows entry ---
Traceback (most recent call last):
  File "<string>", line 3, in <module>
FileNotFoundError: [Errno 2] No such file or directory: 'sync-manifest.json'
ugrep: warning: sync-manifest.json: No such file or directory
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && find . -maxdepth 1 -iname "sync-manifest*"; find . -iname "sync-manifest.json" | grep -v "\.git"`
  ```
./60_Claude/scripts/sync-manifest.json
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && git status --short | head -50`
  ```
 M CLAUDE.md
 M _docs/Design.md
 M _docs/Jarvis.md
  ```
- `mcp__jarvis__search_simple` — `{"query":"firecrawl","contextLength":150}`
- `Bash`:
  ```bash
F="/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/tool-results/mcp-jarvis-search_simple-1788629418949.txt"
grep -o '"filename": "[^"]*"' "$F" | sort -u | grep -vi "05_Clippings" | head -40
  ```
  ```
"filename": "10_Areas/AI/Claude Code.md"
"filename": "10_Areas/Career/Internships/Contacts/Each One/Ongoing/Analytics and Quantitative Modeling Intern - Analytics & Quantitative Modeling - KeyBank.md"
"filename": "10_Areas/Career/Internships/Contacts/Outreach Discovery & Automation Status.md"
"filename": "20_Progress/AI/Claude Code/internship-research-loop/CLAUDE.md"
"filename": "20_Progress/AI/Claude Code/second-brain-claudekit/_docs/Design.md"
"filename": "20_Progress/AI/Claude Code/second-brain-claudekit/_docs/Repo-Map.md"
"filename": "20_Progress/AI/Claude Code/second-brain-claudekit/_docs/Sync.md"
"filename": "20_Progress/Internship/Building System/Research Loop - Improvement Plan.md"
"filename": "20_Progress/Internship/Building System/Runs/Claude Code Prompts — Archive.md"
"filename": "20_Progress/Internship/Building System/Runs/Discovery Step Postmortem — Write-Starvation Incident (2026-08-26).md"
"filename": "20_Progress/Internship/Building System/Runs/Phases Run.md"
"filename": "20_Progress/Internship/Building System/Runs/Research Loop - Phase 7 Coverage Expansion.md"
"filename": "20_Progress/Internship/Building System/Source of Truth.md"
"filename": "20_Progress/Internship/Building System/System - Build Log.md"
"filename": "20_Progress/Internship/Companies giving OPT & CPT.md"
"filename": "20_Progress/Mentorship Program/Meetings/Action/2026-07-14 Mentor Meeting — Actions.md"
"filename": "20_Progress/Projects/AI Use/Claude Kit/Claude Code/Prompts.md"
"filename": "20_Progress/Projects/AI Use/Claude Kit/Claude Code/WSL Environment.md"
"filename": "20_Progress/Projects/AI Use/Claude Kit/Claude Code/Windows Environment.md"
"filename": "20_Progress/Projects/AI Use/Claude Kit/Log.md"
"filename": "20_Progress/Projects/AI Use/Claude Kit/Tool Map.md"
"filename": "20_Progress/Projects/AI Use/Claude Kit/Toolkit/Global/What Global.md"
"filename": "40_Resources/CS/Repos.md"
"filename": "60_Claude/07_AI_Information/How to Use Claude/Claude OS.md"
"filename": "60_Claude/07_AI_Information/Session Logs/log.md"
"filename": "60_Claude/10_Source_Summaries/Github Ingestion/Claude Starred/awesome-mcp-servers.md"
"filename": "60_Claude/10_Source_Summaries/Github Ingestion/Claude Starred/gstack.md"
"filename": "60_Claude/10_Source_Summaries/Github Ingestion/Claude Starred/last30days-skill.md"
"filename": "60_Claude/10_Source_Summaries/Github Ingestion/Learning Starred/ai-engineering-hub.md"
"filename": "60_Claude/10_Source_Summaries/Github Ingestion/Security Starred/keyhacks.md"
"filename": "60_Claude/20_Distilled_Notes/Ingestion Pipeline Audit — Clippings, Summaries & Implementation (2026-07-27).md"
"filename": "60_Claude/20_Distilled_Notes/Sources - Plan/00_Execution.md"
"filename": "60_Claude/20_Distilled_Notes/Sources - Plan/Maverick Skills Analysis - Cross-Reference with GitHub Repos.md"
"filename": "60_Claude/20_Distilled_Notes/Sources - Plan/PDF's Ingestion Implementation.md"
"filename": "60_Claude/40_Project_Briefs/Internship/Discovery-time posting-page fetch one Firecrawl call per NEW match serves both.md"
"filename": "60_Claude/40_Project_Briefs/Internship/Firecrawl-fetches one candidate URL and parses it. Returns  both on     fetch.md"
"filename": "60_Claude/40_Project_Briefs/Internship/Page markdown via Firecrawl (JS-rendered — ATS pages are SPAs).     Raises reque.md"
"filename": "60_Claude/40_Project_Briefs/Internship/_COMMUNITY_fetch_posting_markdown.md"
"filename": "60_Claude/40_Project_Briefs/Internship/_COMMUNITY_interndock.py.md"
"filename": "60_Claude/40_Project_Briefs/Internship/_COMMUNITY_posting_page.py.md"
  ```
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/07_AI_Information/How to Use Claude/Claude OS.md","targetType":"heading","target":["Firecrawl"]}`
- `Bash`:
  ```bash
F="/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/tool-results/mcp-jarvis-search_simple-1788629418949.txt"
python3 -c "
import json
with open('$F') as f:
    data=json.load(f)
for item in data:
    if item['filename'] in ('60_Claude/07_AI_Information/How to Use Claude/Claude OS.md','20_Progress/Projects/AI Use/Claude Kit/Toolkit/Global/What Global.md','10_Areas/AI/Claude Code.md'):
        print('===', item['filename'], '===')
        for m in item['matches'][:5]:
            print(m['context'])
        print()
"

  ```
  ```
=== 60_Claude/07_AI_Information/How to Use Claude/Claude OS.md ===
` |
| everything-claude-code | ~240 | `WSL Home/plugins/marketplaces/everything-claude-code/skills/` (not Windows Home — corrected 2026-07-03) |

### Firecrawl Skills (active in Windows Home)

```dataview
TABLE file.mtime AS "Updated"
FROM "20_Progress/AI/Claude Code/Windows Home/skills"
WHERE contains(file.
 (active in Windows Home)

```dataview
TABLE file.mtime AS "Updated"
FROM "20_Progress/AI/Claude Code/Windows Home/skills"
WHERE contains(file.name, "firecrawl")
SORT file.name ASC
```

---

## second-brain-claudekit — overlap vs gap (fetched from gupta-builds/second-brain-claudekit, 2026-07-03)

The kit shi

=== 20_Progress/Projects/AI Use/Claude Kit/Toolkit/Global/What Global.md ===
sky for this pass. Real, open gap — not attempted.
- **Skills:** unchanged — still exactly one real skill, `export-ai-session/SKILL.md`, plus the 31 `firecrawl-*` junctions (not part of Claude Code's own config, per the original 2026-08-20 finding below).
- **`CLAUDE.md`:** still does not exist, deliberately

=== 10_Areas/AI/Claude Code.md ===
w relevance triage lives in [[Claude OS]]
- Windows home additionally carries `addy-agent-skills` and `claude-plugins-official` marketplaces plus ~30 firecrawl skills
The failure mode here is width: three marketplaces installed, near-zero adopted into actual workflows. Installing a skill is capture; adopting
  ```
- `ToolSearch` — `{"query":"select:mcp__jarvis__vault_write","max_results":3}`
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && cat 60_Claude/vault-rules/pipeline-conventions.md | head -20`
  ```
---
created: 2026-08-19
type: vault-rule
tags: [pipeline, conventions]
---

# Pipeline conventions

`60_Claude/vault-rules/` otherwise covers the generic PARA note-taking layer (`folder-structure.md`, `naming-conventions.md`, `linking-strategy.md`, `tagging-system.md`) — none of it says anything about how this repo's actual reason for existing, the qualification pipeline (`_docs/Architecture.md`), is organized on disk. This file is that missing piece, named as a gap in `_docs/Gaps.md` section 4 and written up here 2026-08-19. Read this before drafting anything in `sandbox/`, `tested-tools/`, `instructions/`, `tests/`, or the top-level `agents/`, `commands/`, `hooks/` staging folders.

## `sandbox/<repo-name>/`

Flat: `sandbox/<repo-name>/` is a real `git clone` of the upstream repo, named exactly as `git clone` produces it — no renaming, no prefixing. `<repo-name>` is the repo's own name, not the org/repo pair (`sandbox/gbrain/`, not `sandbox/garrytan-gbrain/`) — matches `sandbox/README.md`'s existing inventory table, which is the source of truth for what's here and why. Shallow clones (`--depth 1`) are the default; deepen with `git -C sandbox/<name> fetch --unshallow` only if history is actually needed. Update the inventory table in `sandbox/README.md` the same session a repo is cloned.

## `tested-tools/<type>/<use-case>/<repo-name>/`

Three levels, in order:

1. **`<type>/`** — `agents/`, `commands/`, `hooks/`, or `skills/`. Matches the four artifact shapes Claude Code itself recognizes.
2. **`<use-case>/`** — the specific task the piece serves, named as a task ("code-review", "session-continuity"), never a vibe ("generally useful for engineering"). **Only assigned once that specific piece has individually cleared `_docs/Promotion-Criteria.md`'s bar on its own** — never inherited from the source repo's category name or assumed because the repo as a whole cleared `sandbox/`. Until that individual test happens, the piece sits ungrouped one level up, directly under `<type>/<repo-name>/` — an honest "reviewed as a batch, not yet split" state (see `tested-tools/skills/mattpocock-engineering/`, and `tested-tools/agents|commands|hooks/native-scaffold/`, both currently ungrouped for this reason).
  ```
- `mcp__jarvis__vault_write` — `{"path":"40_Resources/CS/AI/GBrain and gstack.md","content":"---\ntype: evergreen\nstatus: sprout\ncreated: 2026-09-05\nupdated: 2026-09-05\ntags: [evergreen, ai, tooling, second-brain-claudekit]\nnotes:\n  - \"[[40_Resources/CS/Repos]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n---\n# GBrain and gstack\n\nDocumented together because they are, per [[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]]'s own words, \"a matched pair, not two independent tools\" — same author (`garrytan`), gstack's own `/setup-gbrain` command exists specifically to install GBrain.\n\n## For future Claude\nReal \"how Anant actually uses this now\" content, written after `second-brain-claudekit`'s Round 10 pipeline-doc pass (2026-09-05). Neither tool is live in Anant's day-to-day workflow yet — both are qualified but not installed/unblocked. Read this before assuming either is running.\n\n## GBrain — personal-knowledge MCP with synthesis + gap-analysis\n\n**Install state: cleared for global promotion, not yet installed.** Cited to `Tool Map.md`'s \"GBrain\" row (updated 2026-08-20) and `tested-tools/mcp-servers/gbrain/VERDICT.md` in `second-brain-claudekit`. All four `_docs/Promotion-Criteria.md` gates cleared 2026-08-20. Re-verified directly 2026-09-05: no `gbrain` binary on WSL `PATH`, no MCP entry in `~/.claude.json`, `~/.mcp.json`, or `~/.claude/.mcp.json` — only leftover `~/.gbrain/` data (config + PGLite DB) from the sandbox test run. **This is second-brain-claudekit's clearest \"cleared but unpromoted\" gap** — the decision is made, only the actual `~/.claude/` install (a separate session, per `_docs/Design.md`) hasn't happened.\n\n**Real commands that worked** (from the sandbox test, not a README paraphrase):\n```bash\nbun install                                                    # 283 packages\nbun run src/cli.ts init --pglite --no-embedding                # → 80/100 health, 100/100 brain score\ngbrain doctor\ngbrain init --force --pglite --embedding-model openai:text-embedding-3-large --embedding-dimensions 1536\ngbrain search \"<query>\" --semantic                              # 0.8275 similarity on a real, non-keyword-overlapping query\n```\n**Real, undocumented bug found and worked around:** none of gbrain's own documented embedding-provider switch paths (`config set embedding_disabled false`, `init --embedding-model`, `reinit-pglite`) actually clear a stuck `embedding_disabled: true` sentinel in `~/.gbrain/config.json` — only a direct edit of that JSON file does. Root-caused by reading `src/commands/init.ts` directly. Full account: the VERDICT.md above.\n\n**What it's for, once installed:** a personal-knowledge layer usable from any project (Jarvis, BOOM, Portfolio, TradingView, CausalOps) with synthesis + gap-analysis, not just retrieval — makes `memsearch` and `context-sync` both redundant once adopted.\n\n**WSL vs. Windows split:** GBrain is a genuine global, project-agnostic memory layer — per `_docs/Design.md`'s own global test, it doesn't fit the \"WSL = project-specific / Windows = Jarvis-specific\" split cleanly, because a memory layer needs to be visible from *every* Claude Code entry point, WSL and Windows alike, not routed to one side. Its data (`~/.gbrain/`) currently only exists on WSL because that's where the sandbox test ran; both homes are the real target.\n\n## gstack — ~34 commands + 55 generated skills (Playwright-based)\n\n**Install state: blocked.** Cited to `Tool Map.md`'s \"gstack\" row. `./setup` compiled binaries, generated 55 skills, downloaded a 278MB Chromium build, then failed: `gstack setup failed: Playwright Chromium could not be launched` — missing WSL system libraries (`libnss3.so` confirmed missing via `60_Claude/scripts/check_dependency.py --preset gstack`, everything else present). Neither `~/.claude/skills/gstack` nor `~/.claude/commands/gstack*` exist — setup aborted before its own registration step.\n\n**Fix, not yet run (needs an interactive terminal with `sudo`):**\n```bash\nsudo apt-get update && sudo apt-get install -y libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libasound2\ncd ~/projects/ai/claude/second-brain-claudekit/sandbox/gstack && ./setup\n```\n\n**What it's for, once unblocked:** global by design (its own `./setup` targets Claude Code, Codex, Factory, and OpenCode simultaneously) — Playwright-based browse/design/PDF tooling, 55 skills.\n\n**WSL vs. Windows split:** gstack's blocker (`libnss3.so`, a Linux shared library) is WSL-specific — this is squarely a WSL-side install once unblocked, not a Windows one; the same Chromium/Playwright dependency chain would need a different fix path on native Windows.\n\n## Links\n[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the authoritative, dated pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for where both sit in the wider inventory.\n"}`
- `mcp__jarvis__vault_write` — `{"path":"40_Resources/CS/AI/Mattpocock Engineering Skills.md","content":"---\ntype: evergreen\nstatus: sprout\ncreated: 2026-09-05\nupdated: 2026-09-05\ntags: [evergreen, ai, tooling, second-brain-claudekit]\nnotes:\n  - \"[[40_Resources/CS/Repos]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n---\n# Mattpocock Engineering Skills\n\n## For future Claude\nReal \"how Anant actually uses this now\" content, written 2026-09-05. Short answer: **not yet in real use** — reviewed as a batch, individually untested, sitting in the second-look stage. Don't cite this as a live tool without checking the \"Install state\" section below first, it may have moved.\n\n## What it is\n41 skills total from `mattpocock/skills` (not the 18 originally assumed — a real correction from actually running the installer), targeting common agent failure modes. Only the `engineering/` category (17 skills — `code-review`, `tdd`, `diagnosing-bugs`, `implement`, `research`, `to-spec`, `to-tickets`, `codebase-design`, `domain-modeling`, `improve-codebase-architecture`, `resolving-merge-conflicts`, `triage`, `wayfinder`, `ask-matt`, `grill-with-docs`, `prototype`, `setup-matt-pocock-skills`) has been looked at; `personal`, `productivity`, `misc`, `in-progress`, `deprecated` haven't.\n\n## Install state\n**Cleared `sandbox/`, sitting in `tested-tools/skills/mattpocock-engineering/` (batch-reviewed, ungrouped — no `<use-case>/` layer yet, per `60_Claude/vault-rules/pipeline-conventions.md`'s \"reviewed as a batch, not yet split\" convention). Not promoted to any rigid folder.** Cited to `Tool Map.md`'s \"mattpocock-skills (`engineering/` category)\" row. As of 2026-09-05, **still 0 of the 17 skills individually tested** — `second-brain-claudekit/tests/skills/mattpocock-engineering/README.md`'s dated backlog table (created 2026-08-19, re-checked 2026-09-05) has every row marked `No`, unchanged.\n\n## The real command that worked (and the one that didn't)\nThe interactive picker doesn't complete non-interactively:\n```bash\nbunx skills@latest add mattpocock/skills   # picker hangs waiting for interactive input — doesn't work headless\n```\nThe actual workaround, disclosed rather than hidden: the whole `engineering/` category was copied by hand for manual review instead of cherry-picked live through the picker.\n\n## What it's for, if promoted\nLikely global (generic engineering-process skills, not tied to a specific stack) — `code-review`, `tdd`, `diagnosing-bugs` etc. don't obviously duplicate anything already installed, but per `_docs/Promotion-Criteria.md` that's exactly what individual testing exists to confirm before promotion, not something to assume from the category name.\n\n## WSL vs. Windows split\nThese are generic software-engineering skills (code review, TDD, merge-conflict resolution) — squarely WSL-side once any are individually tested and promoted, since WSL is where Anant's real code projects (BOOM, Portfolio, CausalOps) live. Nothing here is Jarvis/Obsidian-specific.\n\n## Links\n[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.\n"}`
- `mcp__jarvis__vault_write` — `{"path":"40_Resources/CS/AI/CPR - Compress Preserve Resume.md","content":"---\ntype: evergreen\nstatus: sprout\ncreated: 2026-09-05\nupdated: 2026-09-05\ntags: [evergreen, ai, tooling, second-brain-claudekit]\nnotes:\n  - \"[[40_Resources/CS/Repos]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n---\n# CPR — Compress, Preserve, Resume (EliaAlberti)\n\n## For future Claude\nReal \"how Anant actually uses this now\" content, written 2026-09-05. Important, non-obvious state: **`/compress`, `/preserve`, `/resume` are NOT currently live slash commands in `second-brain-claudekit` at all** — the old hand-authored trio was archived, the new blended trio was never promoted. Don't assume `second-brain-claudekit/CLAUDE.md`'s \"Session Memory (CPR Pattern)\" section describes a working command today without checking `.claude/commands/` directly.\n\n## What it is\nThree markdown slash commands (`compress`, `preserve`, `resume`) implementing the same Compress→Preserve→Resume session-continuity idea `second-brain-claudekit` had already hand-built (added commit `726f6de`, 2026-04-03).\n\n## Install state: cleared, blend verdict, unpromoted\nCited to `Tool Map.md`'s \"cpr-compress-preserve-resume (EliaAlberti)\" row and `tested-tools/commands/cpr-compress-preserve-resume/VERDICT.md`. This is `second-brain-claudekit`'s **first individually-tested, evidence-backed promotion decision** (2026-08-19) — verdict: **blend**, not adopt-wholesale or keep-as-is. Confirmed directly 2026-09-05: the blended `compress.md`/`preserve.md`/`resume.md` sit only in `tested-tools/commands/cpr-compress-preserve-resume/`; `second-brain-claudekit/.claude/commands/` has neither the old nor the new trio (the old one is archived at `.claude/_archive/superseded-commands/`). **This is the second \"cleared but unpromoted\" gap this pipeline has, alongside GBrain** — ready to execute, no further review needed, just the copy step into `.claude/commands/`.\n\n## What was adopted into the blend (the version to promote from)\n1. `AskUserQuestion` multi-select, replacing free-text prompts.\n2. `allowed-tools:` frontmatter, scoped per command.\n3. The real repo's concrete 280-line `/preserve` budget + archive-file logic — adapted to archive into `60_Claude/Sessions/_archive/`, not the source repo's bare `CLAUDE-Archive.md`.\n4. Topic-named session-log filenames (`{{date}}-{{time}}-{{topic}}.md`), still inside `60_Claude/Sessions/` (not the source repo's per-project-root `CC-Session-Logs/`).\n5. `/resume`'s topic-keyword grep search across `60_Claude/Sessions/*.md`.\n\n## Deliberately NOT adopted\n`model: opus` pinning (this repo's other commands don't pin models), full raw-conversation logging in session logs (conflicts with `CLAUDE.md`'s \"Progressive summarisation\" principle — this repo's logs are structured-summary-only), and per-project-root detection via `CC-Session-Logs/` (superseded by the fixed `60_Claude/Sessions/` anchor this repo already uses).\n\n## What it's for\nSession-lifecycle commands scoped to `second-brain-claudekit` itself, not a general promotion candidate elsewhere — per the VERDICT's own `destination:` field.\n\n## WSL vs. Windows split\nThis is a repo-scoped command set for `second-brain-claudekit`, a real code project that lives in WSL — squarely WSL-side, not a Windows/Jarvis-vault concern.\n\n## Links\n[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.\n"}`
- `mcp__jarvis__vault_write` — `{"path":"40_Resources/CS/AI/ECC - Everything Claude Code.md","content":"---\ntype: evergreen\nstatus: sprout\ncreated: 2026-09-05\nupdated: 2026-09-05\ntags: [evergreen, ai, tooling, second-brain-claudekit]\nnotes:\n  - \"[[40_Resources/CS/Repos]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n---\n# ECC — everything-claude-code (affaan-m)\n\n## For future Claude\nReal \"how Anant actually uses this now\" content, written 2026-09-05. Non-obvious fact this note exists to fix: **ECC exists in three separate, unmerged places on this machine** — don't assume one implies the other two are in the same state.\n\n## The three ECC manifestations, checked directly 2026-09-05\n1. **A real, live Claude Code plugin marketplace on WSL** — `~/.claude/plugins/marketplaces/ecc/` (source: `affaan-m/ECC.git`), with cached files at `~/.claude/plugins/cache/ecc/ecc/2.1.0/`. This is genuinely installed and available to any WSL Claude Code session today.\n2. **A pre-existing plain `git clone`** at `~/projects/ai/claude/everything-claude-code/` — the real ECC 2.0 Rust-based control-plane scaffold (`ecc2/`), confirmed 2026-07-30 via `git remote -v` (`affaan-m/everything-claude-code`). Alpha quality per its own README.\n3. **`second-brain-claudekit`'s own qualification clone** at `sandbox/ecc/` — deliberately kept separate from #2 rather than reused, per this repo's \"nothing skips `sandbox/`\" rule.\n\n## Install state (of #3, the pipeline's own qualification clone)\n**Undetermined at the whole-repo level — real testing started, no promotion decision made.** Cited to `Tool Map.md`'s \"ECC\" row. `npm install --no-audit --no-fund` completed clean (210 packages). `node tests/run-all.js` (the repo's own documented test command): **3378/3388 passed (99.7%), 10 failed, exit 0** — all 10 failures isolated to two files (9 in `integration/plan-canvas-e2e.test.js`, environment-specific per a local server never coming up in this sandboxed WSL; 1 in `lib/dry-run.test.js`, not yet root-caused).\n\n**Real finding new to this pipeline:** merely cloning ECC into `sandbox/ecc/` caused Claude Code to auto-load its `CLAUDE.md`, `.claude/rules/*.md`, and register a `.claude/skills/everything-claude-code` skill — no explicit install step required. This falsified `_docs/Architecture.md`'s original assumption that `sandbox/` is inert until deliberately run, for any tool shipping its own config; the doc was corrected 2026-08-20.\n\n## What it's for, if a real gap is ever named\n67 agents, 281 skills, 94 legacy command shims, AgentShield security scanning, a Memory Vault. Scope discipline per `_docs/Design.md`'s Implement > Knowledge principle: wholesale install (`./install.sh --profile full`) would itself be the anti-pattern this pipeline exists to prevent. **Not yet decided which 2-4 specific components (if any) close a real gap** nothing already-adopted (GBrain, mattpocock-engineering, this repo's own `/challenge`/`/ideas`/`/llm-council` skills) already closes.\n\n## WSL vs. Windows split\nAll three manifestations above are WSL-only today. If a specific ECC component is ever promoted, apply the split per-component: a code-review/engineering agent → WSL-side (real code projects); nothing in ECC's catalog is Jarvis/Obsidian-specific, so a Windows-side promotion is unlikely to apply here.\n\n## Links\n[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.\n"}`
- `mcp__jarvis__vault_write` — `{"path":"40_Resources/CS/AI/Spec Kit.md","content":"---\ntype: evergreen\nstatus: sprout\ncreated: 2026-09-05\nupdated: 2026-09-05\ntags: [evergreen, ai, tooling, second-brain-claudekit]\nnotes:\n  - \"[[40_Resources/CS/Repos]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n---\n# Spec Kit (github/spec-kit)\n\n## For future Claude\nReal \"how Anant actually uses this now\" content, written 2026-09-05. Short answer: **installed and run once, for real, but not yet compared against this repo's own workflow or promotion-decided.**\n\n## What it is\nGitHub's spec-driven development tooling: `constitution` → `specify` → `clarify` → `plan` → `tasks` → `implement`, forcing alignment before code is written. Previously listed as a \"Tier-1, unexecuted\" item in this repo's own docs history (`_docs/Design.md`'s Minimal-Footprint section) before this run.\n\n## Install state\n**Real next step executed, 2026-08-20** — cited to `Tool Map.md`'s sandbox-triage section. Not promoted, not yet compared feature-by-feature against anything.\n\n## The real commands that worked\n```bash\nuv tool install specify-cli                                          # real, from PyPI\nspecify init spec-kit-test --integration claude --non-interactive    # in a scratch project\n```\nResult: **10 skill files scaffolded for real** into `.claude/skills/speckit-{constitution,specify,plan,tasks,implement,converge,clarify,analyze,checklist,taskstoissues}` — a genuine success, not a README claim.\n\n## What it's for, if promoted\nSpec-driven workflow for non-trivial feature work — the framing use case is \"use before writing code on anything real,\" but this hasn't been weighed against `second-brain-claudekit`'s own (currently non-live) brainstorming/planning workflow yet, and that comparison is the actual next decision, not another install.\n\n## WSL vs. Windows split\n`uv`/Python CLI tooling scaffolding into a project's `.claude/skills/` — WSL-side, tied to real code projects. Not Jarvis/Obsidian-specific.\n\n## Links\n[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.\n"}`
- `mcp__jarvis__vault_write` — `{"path":"40_Resources/CS/AI/Claude Context (Zilliz).md","content":"---\ntype: evergreen\nstatus: sprout\ncreated: 2026-09-05\nupdated: 2026-09-05\ntags: [evergreen, ai, tooling, second-brain-claudekit]\nnotes:\n  - \"[[40_Resources/CS/Repos]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n---\n# Claude Context (Zilliz)\n\n## For future Claude\nReal \"how Anant actually uses this now\" content, written 2026-09-05. Short answer: **run once, for real, against Anant's own Zilliz Cloud cluster — genuinely works — but not yet promotion-decided or compared against plain Grep/Glob.** See [[Graphify]]'s own \"Contrast With Nearby Tools\" section for how this differs from graphify (structure/graph vs. semantic/embeddings — complementary, not competing, per that note).\n\n## What it is\nAn MCP server that crawls a codebase, chunks it, embeds it into Milvus, and exposes semantic code search to Claude Code.\n\n## Install state\n**Real next step executed, 2026-08-20** — cited to `Tool Map.md`'s sandbox-triage section, `sandbox/claude-context/`. Not promotion-decided.\n\n## The real commands that worked (and the real blocker hit along the way)\n```bash\npnpm install\npnpm build:core\n```\nThe real `examples/basic-usage` index+search run hit Anant's existing Zilliz Cloud cluster (`in03-b8880982a4d3a16`) in `STOPPED` state on the first attempt — a named, specific blocker, same discipline as gstack's Chromium blocker. Anant resumed the cluster; the retry succeeded for real: **108 files, 1369 code chunks indexed**, 4 semantic queries all returned topically correct top hits (e.g. \"embedding generation\" → `packages/core/src/embedding/openai-embedding.ts`).\n\n## What it's for, if promoted\nClaims 40% token reduction over full-file loading by letting an agent fetch relevant chunks instead — the framing use case is large codebases (`_docs/Design.md` names it project-scoped to BOOM specifically, blocked there on Milvus/Docker). Whether this beats Grep/Glob for real `second-brain-claudekit`-scale work is still open, not yet tested.\n\n## WSL vs. Windows split\nProject-scoped to BOOM (a real code project) per `_docs/Design.md`'s own confirmed decision — WSL-side, not Jarvis/Obsidian-specific.\n\n## Links\n[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[Graphify]] for the complementary structure-vs-embeddings comparison. [[40_Resources/CS/Repos|Repos]] for the wider inventory.\n"}`
- `mcp__jarvis__vault_write` — `{"path":"40_Resources/CS/AI/Promptfoo.md","content":"---\ntype: evergreen\nstatus: sprout\ncreated: 2026-09-05\nupdated: 2026-09-05\ntags: [evergreen, ai, tooling, second-brain-claudekit]\nnotes:\n  - \"[[40_Resources/CS/Repos]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n---\n# Promptfoo\n\n## For future Claude\nReal \"how Anant actually uses this now\" content, written 2026-09-05. Short answer: **run once, for real, against a real second-brain-claudekit command — found a genuine weakness — but not yet promotion-decided or run again since.**\n\n## What it is\nA prompt/agent evaluation and red-teaming toolkit, with an `llm-rubric` grader for automated, structured judgment of an LLM's output against a stated rubric — used internally by OpenAI and Anthropic per its own docs.\n\n## Install state\n**Real next step executed, 2026-08-20** — cited to `Tool Map.md`'s sandbox-triage section, `sandbox/promptfoo/`. Not promotion-decided.\n\n## The real command that worked, and what it actually found\n```bash\nnpx promptfoo@latest eval   # against second-brain-claudekit's own /challenge command prompt\n```\nModel: `openai:gpt-4o-mini` (reused the same key wired for GBrain, with Anant's explicit go-ahead), grader: `llm-rubric`. **Result: 1 of 2 test cases passed.** The failure is a genuine finding, not a fluke: the rubric grader caught that `/challenge`'s counter-evidence for a \"daily journaling\" test idea was generic rather than a concrete counter-example — a structural weakness manual review likely wouldn't have flagged. Real evidence that promptfoo's automated grading adds something a skim doesn't.\n\n## What it's for, if adopted\nRegression-testing this repo's own `CLAUDE.md` and skills after edits — likely global if it clears the bar (per `Tool Map.md`'s own note), since prompt/agent quality isn't tied to any one project.\n\n## WSL vs. Windows split\nA CLI eval tool run against prompts/commands, not tied to the vault itself — WSL-side, alongside the other code-project tooling. If it's ever pointed at Jarvis-side skills (e.g. `/challenge`, `/llm-council`) specifically, that run would still be executed from WSL; the target being Jarvis-authored content doesn't move the tool itself Windows-side.\n\n## Links\n[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.\n"}`
- `mcp__jarvis__vault_write` — `{"path":"40_Resources/CS/AI/LLM Council Skill.md","content":"---\ntype: evergreen\nstatus: sprout\ncreated: 2026-09-05\nupdated: 2026-09-05\ntags: [evergreen, ai, tooling, second-brain-claudekit]\nnotes:\n  - \"[[40_Resources/CS/Repos]]\"\n  - \"[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]\"\n---\n# LLM Council Skill\n\n## For future Claude\nReal \"how Anant actually uses this now\" content, written 2026-09-05. This is one of the few tools on this list that's **actually live and in real, routine use today** — most of this pipeline's tracked tools aren't there yet.\n\n## Install state: live\nConfirmed by direct filesystem check 2026-09-05: `/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills/llm-council/llm-council.md` exists in Jarvis's **real, live** `.claude/skills/`. `second-brain-claudekit` stages a copy at `skills/Jarvis/llm-council/` (per-destination-project staging, not the live copy — see `_docs/Jarvis.md`'s division of labor). Cited to `Tool Map.md`'s \"claude-skills-llm-council + llm-council (Karpathy original)\" entry, which is where the real decision to keep this and drop the alternatives is recorded.\n\n## What it's for\nMulti-model council deliberation as a Claude Code skill — invoked as `/llm-council`.\n\n## The real decision this pipeline made around it\nTwo sandbox candidates were cloned 2026-07-30 specifically to compare against the already-live skill: `aiwithremy/claude-skills-llm-council` and `karpathy/llm-council` (the original). **Verdict, 2026-08-20: drop both.** Reasoning, verbatim from `Tool Map.md`'s sandbox-triage section: \"This repo's own `/llm-council` skill is live and in routine use; three weeks with zero side-by-side comparison is itself the signal that this isn't a real priority. Revisit only if the existing skill shows a concrete limitation worth comparing against.\" Both clones remain on disk in `sandbox/` (dropped means off the active evaluation list, not erased), unreviewed.\n\n## WSL vs. Windows split\nThe live skill lives in Jarvis's real `.claude/skills/` on the Windows-side vault (`D:\\Users\\_Anant\\...`) — genuinely Jarvis/Obsidian-specific tooling, the clear Windows-side case per Anant's stated split. `second-brain-claudekit`'s own WSL-side staging copy (`skills/Jarvis/llm-council/`) is a draft/review artifact, not a second live install.\n\n## Links\n[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.\n"}`
- `Bash`:
  ```bash
python3 -c "
import json
with open('/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/tool-results/toolu_01XWohTtrDhSqLeBi2HDQm3S.json') as f:
    data = json.load(f)
text = data[0]['text']
obj = json.loads(text)
content = obj['content']
with open('/tmp/repos_full.md','w') as f:
    f.write(content)
print(len(content))
"
grep -n -i "gbrain\|gstack\|mattpocock\|cpr\b\|compress.*preserve\|everything-claude-code\|spec-kit\|claude-context\|promptfoo\|llm-council" /tmp/repos_full.md
  ```
  ```
31896
19:- [ECC](https://github.com/affaan-m/ECC) — agent harness for Claude Code: skills, instincts, persistent memory, and a security layer in a single install (*RE-CORRECTED: 2026-07-30 — the 2026-07-29 "unrelated Rust project" call on `ecc2` was itself wrong: `git remote -v` confirms `ecc2` is `affaan-m/everything-claude-code`'s own in-tree ECC 2.0 Rust control-plane scaffold (`git ls-files` confirms it's tracked, not a stray clone), not an unrelated repo. Real testing has now happened: cloned into `second-brain-claudekit/sandbox/ecc/`, `npm install` clean (210 packages), full test suite run — 3378/3388 passing (99.7%), 10 failures isolated to the experimental Plan Canvas feature (environment-specific `ETIMEDOUT`, likely this sandbox's networking, not a confirmed ECC bug) and one dry-run edge case. Catalog is large (67 agents/281 skills/94 commands) — per Implement > Knowledge, still deciding which specific named gap(s) it closes rather than installing wholesale; cross-harness-portability angle evaluated 2026-07-30, see [[Tool Map]]*) → [[ECC]]
20:- [gstack](https://github.com/garrytan/gstack) — 13 cognitive-mode skills (founder review, eng review, paranoid QA) plus a Playwright browser for Claude Code (*BLOCKED: 2026-07-29 — cloned + `./setup` run for real in `second-brain-claudekit/sandbox`; now 55 skills (~893K tokens), compiled fine, but fails at Chromium launch (missing WSL system libs, needs interactive `sudo apt install`); nothing registered yet — see [[Claude Kit Implementation]]*) → [[gstack]]
21:- [Skills (mattpocock)](https://github.com/mattpocock/skills) — 18 skills targeting the four main agent failure modes: misalignment, verbosity, broken feedback loops, entropy. (*PARTIAL: 2026-07-29 — now 41 skills; `engineering/` category (17 skills) copied into `second-brain-claudekit/tested-skills/` for review, not yet promoted to global — see [[Claude Kit Implementation]]*) → [[mattpocock-skills]]
26:- [Claude Skills LLM Council](https://github.com/aiwithremy/claude-skills-llm-council) — [Original Karpathy Repo](https://github.com/karpathy/llm-council): skill that runs 5 expert advisors on a question and synthesizes a verdict. Use for hard decisions. Multiple resources listed in vault. (*BUILT: 2026-07-29 — installed as `.claude/skills/llm-council.md`, see [[Claude Council (LLM Council Skill Install)]]*) → [[LLM Council skills]], [[Claude Council (LLM Council Skill Install)]]
31:- [Spec Kit](https://github.com/github/spec-kit) — GitHub's spec-driven development CLI: constitution → specify → clarify → plan → tasks → implement. (*INSTALL: GLOBALLY — QUEUED, Tier-1, agreed across both master triage docs, still not run as of 2026-07-29*) → [[spec-kit]]
38:- [Claude Context](https://github.com/zilliztech/claude-context) — MCP server that indexes a codebase into Milvus for semantic code search; claims ~40% token reduction. (*INSTALL: QUEUED — BOOM project-scoped only, not global; complementary to Graphify (structure) not competing, real blocker is the Milvus/Docker dependency*) → [[claude-context]]
60:- [Promptfoo](https://github.com/promptfoo/promptfoo) — test prompts, agents, RAGs; red teaming + vulnerability scanning; used by OpenAI and Anthropic internally; now part of OpenAI (still MIT-licensed, open source) → [[promptfoo (github)]], [[04 - Eval Harness — promptfoo]] (already the real eval gate for Orby, see [[10 - Orby Golden Eval Dataset (Grounding Cases)]])
82:- [LLM Council](https://github.com/karpathy/llm-council) — Karpathy's research: ensemble multiple LLM judges for evaluation; Python → [[LLM Council skills]] (the Claude-skill adaptation of this original repo, now built as `.claude/skills/llm-council.md` — see [[Claude Council (LLM Council Skill Install)]])
84:- [memsearch](https://github.com/zilliztech/memsearch) — auto-captures every Claude Code session to markdown, indexes with ONNX embeddings + Milvus, exposes /memory-recall (*SKIP: 2026-07-29 — superseded by GBrain, which duplicates the auto-capture without GBrain's synthesis layer*) → [[memsearch]]
85:- [GBrain](https://github.com/garrytan/gbrain) — personal-knowledge MCP with synthesis + gap-analysis (not just retrieval), benchmarked +31.4 points over vector-only RAG on a rich-prose corpus; PGLite, no Docker. (*INSTALLED + TESTED: 2026-07-29 — real `bun install` + `gbrain init --pglite --no-embedding` in `second-brain-claudekit/sandbox`; `doctor` reports 80/100 health, working PGLite brain; needs an embedding API key (Voyage/ZeroEntropy free tier or OpenAI paid) for full semantic search, not yet chosen; also makes context-sync unnecessary as a separate install — see [[Claude Kit Implementation]]*) → [[gbrain]]
199:- **Odysseus** — self-hosted AI workspace (chat/agents/research/email/calendar); fully redundant with Jarvis + gbrain + the ECC harness already being adopted — a second personal-AI-workspace platform fragments rather than helps.
200:- **OpenHuman** — same reasoning as Odysseus: a second "private personal AI assistant" framework competes with, rather than extends, Jarvis + gbrain + jarvis-memory. Drop, not build a parallel system.
  ```
- `Bash`:
  ```bash
grep -n -i "^\- \[CPR\]\|CPR —\|CPR:" /tmp/repos_full.md
grep -n "CPR" /tmp/repos_full.md
  ```
  ```
(Bash completed with no output)
  ```
- `Bash` — `grep -n -i "eliaalberti\|preserve-resume\|session.continuity\|compress.*resume" /tmp/repos_full.md`
  ```
(Bash completed with no output)
  ```
- `mcp__jarvis__vault_get_document_map` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md"}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","GBrain"],"operation":"append","ifMatch":"a0c4eb","content":"- **Real usage note (2026-09-05):** [[40_Resources/CS/AI/GBrain and gstack]]."}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","gstack"],"operation":"append","content":"- **Real usage note (2026-09-05):** [[40_Resources/CS/AI/GBrain and gstack]]."}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","mattpocock-skills (`engineering/` category)"],"operation":"append","content":"- **Real usage note (2026-09-05):** [[40_Resources/CS/AI/Mattpocock Engineering Skills]]."}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","cpr-compress-preserve-resume (EliaAlberti)"],"operation":"append","content":"- **Real usage note (2026-09-05):** [[40_Resources/CS/AI/CPR - Compress Preserve Resume]] — also notes this repo has no `Repos.md` entry for CPR to cross-link from (it entered the pipeline via `Useful Repos - Shortlist.md` instead, never the master 95-repo index)."}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","ECC (affaan-m/everything-claude-code)"],"operation":"append","content":"- **Real usage note (2026-09-05):** [[40_Resources/CS/AI/ECC - Everything Claude Code]] — also documents the 3 separate, unmerged ECC manifestations on this machine (WSL plugin marketplace, pre-existing clone, this repo's own sandbox clone)."}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","ECC (affaan-m/everything-claude-code)","spec-kit"],"operation":"append","content":"- **Real usage note (2026-09-05):** [[40_Resources/CS/AI/Spec Kit]]."}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","ECC (affaan-m/everything-claude-code)","claude-context (Zilliz)"],"operation":"append","content":"- **Real usage note (2026-09-05):** [[40_Resources/CS/AI/Claude Context (Zilliz)]]."}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","ECC (affaan-m/everything-claude-code)","promptfoo"],"operation":"append","content":"- **Real usage note (2026-09-05):** [[40_Resources/CS/AI/Promptfoo]]."}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","ECC (affaan-m/everything-claude-code)","claude-skills-llm-council + llm-council (Karpathy original)"],"operation":"append","content":"- **Real usage note (2026-09-05):** [[40_Resources/CS/AI/LLM Council Skill]] — documents the live skill these two were compared against and dropped in favor of."}`
- `mcp__jarvis__vault_get_document_map` — `{"path":"40_Resources/CS/Repos.md"}`
- `mcp__jarvis__vault_patch` — `{"path":"40_Resources/CS/Repos.md","targetType":"heading","target":["Removed"],"operation":"append","scope":"markerAndContent","ifMatch":"a70f3b","content":"# Real usage notes (added 2026-09-05, second-brain-claudekit Round 10)\n\nCross-links to real \"how Anant actually uses this now\" notes, added alongside (not replacing) each repo's existing `→` deep-dive link above — these document actual install state, real commands, and current workflow use, written after the tool was actually run through `second-brain-claudekit`'s pipeline. Not added inline on each bullet above to avoid touching this file's dense, CRLF-formatted per-repo lines by partial-string edit; listed here instead, same `→` convention:\n\n- **GBrain** (line 85 above) → also [[40_Resources/CS/AI/GBrain and gstack]]\n- **gstack** (line 20 above) → also [[40_Resources/CS/AI/GBrain and gstack]]\n- **Skills (mattpocock)** (line 21 above) → also [[40_Resources/CS/AI/Mattpocock Engineering Skills]]\n- **ECC** (line 19 above) → also [[40_Resources/CS/AI/ECC - Everything Claude Code]]\n- **Spec Kit** (line 31 above) → also [[40_Resources/CS/AI/Spec Kit]]\n- **Claude Context** (line 38 above) → also [[40_Resources/CS/AI/Claude Context (Zilliz)]]\n- **Promptfoo** (line 60 above) → also [[40_Resources/CS/AI/Promptfoo]]\n- **Claude Skills LLM Council / LLM Council** (lines 26, 82 above) → also [[40_Resources/CS/AI/LLM Council Skill]] (the live skill these were compared against and dropped in favor of)\n- **CPR (Compress/Preserve/Resume)** — no entry exists on this page for it (confirmed by direct search, 2026-09-05); it only appears in [[Useful Repos - Shortlist]], now retired — see [[40_Resources/CS/AI/CPR - Compress Preserve Resume]] for its real usage note directly.\n"}`
- `mcp__jarvis__vault_patch` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/How Anant Uses Each Repo.md","targetType":"frontmatter","target":"status","operation":"replace","value":"retired"}`
- `mcp__jarvis__vault_patch` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/Useful Repos - Shortlist.md","targetType":"frontmatter","target":"status","operation":"replace","value":"retired"}`
- `mcp__jarvis__vault_get_document_map` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/How Anant Uses Each Repo.md"}`
- `mcp__jarvis__vault_get_document_map` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/Useful Repos - Shortlist.md"}`
- `mcp__jarvis__vault_patch` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/How Anant Uses Each Repo.md","targetType":"heading","target":["GitHub Stars — How Anant Uses Each Repo"],"operation":"prepend","ifMatch":"40f62d","content":"> **Retired 2026-09-05.** Content preserved below as historical record, per this vault's retirement convention — not deleted, not live. Real, current \"how Anant actually uses this now\" content for every repo that reached an actual decision now lives in `40_Resources/CS/AI/` (see [[40_Resources/CS/Repos]]'s \"Real usage notes\" section for the full list, or [[20_Progress/Projects/AI Use/Claude Kit/Tool Map]] for the per-tool pipeline record). This note's own install commands were speculative `npx`/`bunx` guesses, mostly never actually verified — the new notes carry only commands that were actually run."}`
- `mcp__jarvis__vault_patch` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/Useful Repos - Shortlist.md","targetType":"heading","target":["Repos Deep Analysis — Action File"],"operation":"prepend","ifMatch":"3a8505","content":"> **Retired 2026-09-05.** Content preserved below as historical record, per this vault's retirement convention — not deleted, not live. Real, current \"how Anant actually uses this now\" content for every repo that reached an actual decision now lives in `40_Resources/CS/AI/` (see [[40_Resources/CS/Repos]]'s \"Real usage notes\" section for the full list, or [[20_Progress/Projects/AI Use/Claude Kit/Tool Map]] for the per-tool pipeline record). This note's own install commands were speculative `npx`/`bunx` guesses, mostly never actually verified — the new notes carry only commands that were actually run."}`
- `mcp__jarvis__search_simple` — `{"query":"How Anant Uses Each Repo","contextLength":150}`
- `mcp__jarvis__search_simple` — `{"query":"Useful Repos - Shortlist","contextLength":150}`
- `mcp__jarvis__search_simple` — `{"query":"How Anant Uses Each Repo","contextLength":150}`
- `mcp__jarvis__vault_list` — `{"path":""}`
- `mcp__jarvis__search_simple` — `{"query":"How Anant Uses Each Repo","contextLength":150}`
- `mcp__jarvis__vault_read` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/Claude Kit Implementation.md"}`
- `mcp__jarvis__vault_read` — `{"path":"40_Resources/CS/AI/Gen AI Meeting.md"}`
- `mcp__jarvis__vault_read` — `{"path":"10_Areas/Career/Engineer Edge Roadmap.md"}`
- `mcp__jarvis__search_simple` — `{"query":"[[How Anant Uses Each Repo]]","contextLength":120}`
- `Bash`:
  ```bash
F="/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/ebe4c31e-69cf-4dfd-a5a2-cbfc1760594e/tool-results/mcp-jarvis-search_simple-1788630081455.txt"
python3 -c "
import json
with open('$F') as f:
    data=json.load(f)
targets = [
 '60_Claude/07_AI_Information/Session Logs/log.md',
 '60_Claude/20_Distilled_Notes/Sources - Plan/00_Execution.md',
 '60_Claude/20_Distilled_Notes/Sources - Plan/GitHub Ingestion Implementation.md',
 '60_Claude/20_Distilled_Notes/Sources - Plan/_Notes Created From Ingestion.md',
 '20_Progress/Projects/AI Use/Builds & Resources/Maverick Skills Mode-to-Repo Mapping.md',
 '60_Claude/20_Distilled_Notes/Ingestion Pipeline Audit — Clippings, Summaries & Implementation (2026-07-27).md',
]
for item in data:
    if item['filename'] in targets:
        print('===', item['filename'], '===')
        for m in item['matches'][:6]:
            print('-', m['context'].replace(chr(10),' '))
        print()
"

  ```
  ```
=== 20_Progress/Projects/AI Use/Builds & Resources/Maverick Skills Mode-to-Repo Mapping.md ===
- -skills + spec-kit | ⚠️ Queued, not yet installed (see [[40_Resources/CS/Repos]]) | | **Learning & Skill Building** | /teachme, /eli5, /drill, GAPFINDER, /mentor | `learning-agent` (in vault) + mattpocock-skills | ⚠️ Partial — learning-agent bu
- 30% light composition. - **Power Commands** — 100% covered — CPR (`/preserve`/`/compress`/`/resume`) is Jarvis-only per [[How Anant Uses Each Repo]]'s status marker; gbrain supersedes the memsearch/context-sync half. ## What This Changes Now Tha
- ght composition. - **Power Commands** — 100% covered — CPR (`/preserve`/`/compress`/`/resume`) is Jarvis-only per [[How Anant Uses Each Repo]]'s status marker; gbrain supersedes the memsearch/context-sync half. ## What This Changes Now That Both
- mposition. - **Power Commands** — 100% covered — CPR (`/preserve`/`/compress`/`/resume`) is Jarvis-only per [[How Anant Uses Each Repo]]'s status marker; gbrain supersedes the memsearch/context-sync half. ## What This Changes Now That Both Gaps
- tion. - **Power Commands** — 100% covered — CPR (`/preserve`/`/compress`/`/resume`) is Jarvis-only per [[How Anant Uses Each Repo]]'s status marker; gbrain supersedes the memsearch/context-sync half. ## What This Changes Now That Both Gaps Are 
-  - **Power Commands** — 100% covered — CPR (`/preserve`/`/compress`/`/resume`) is Jarvis-only per [[How Anant Uses Each Repo]]'s status marker; gbrain supersedes the memsearch/context-sync half. ## What This Changes Now That Both Gaps Are Closed 

=== 60_Claude/20_Distilled_Notes/Ingestion Pipeline Audit — Clippings, Summaries & Implementation (2026-07-27).md ===
-   - "[[Web Ingestion Implementation]]"   - "[[Video Ingestion Implementation]]"   - "[[Useful Repos - Shortlist]]"   - "[[How Anant Uses Each Repo]]"   - "[[Maverick Skills Analysis - Cross-Reference with GitHub Repos]]"   - "[[Internship Tracki
- [Web Ingestion Implementation]]"   - "[[Video Ingestion Implementation]]"   - "[[Useful Repos - Shortlist]]"   - "[[How Anant Uses Each Repo]]"   - "[[Maverick Skills Analysis - Cross-Reference with GitHub Repos]]"   - "[[Internship Tracking Das
- ngestion Implementation]]"   - "[[Video Ingestion Implementation]]"   - "[[Useful Repos - Shortlist]]"   - "[[How Anant Uses Each Repo]]"   - "[[Maverick Skills Analysis - Cross-Reference with GitHub Repos]]"   - "[[Internship Tracking Dashboar
- ion Implementation]]"   - "[[Video Ingestion Implementation]]"   - "[[Useful Repos - Shortlist]]"   - "[[How Anant Uses Each Repo]]"   - "[[Maverick Skills Analysis - Cross-Reference with GitHub Repos]]"   - "[[Internship Tracking Dashboard — 2
- mplementation]]"   - "[[Video Ingestion Implementation]]"   - "[[Useful Repos - Shortlist]]"   - "[[How Anant Uses Each Repo]]"   - "[[Maverick Skills Analysis - Cross-Reference with GitHub Repos]]"   - "[[Internship Tracking Dashboard — 2027 Cal
- ge 1 (skipped, off-topic) or stage 2 (reference material, not actionable). The problem worth flagging is a source that reaches stage 3 — gets a concrete "build this" verdict — and then nothing happens. That's the real gap, and it's the dominant

=== 60_Claude/20_Distilled_Notes/Sources - Plan/_Notes Created From Ingestion.md ===
- s, and distilled articles — the layer someone would actually use. Grouped by pass: PDF, Web, and (next session) GitHub. Each pass gets its own section appended after it runs — this file is never rewritten wholesale, only extended. Every row bel
-                                                                           | | [[Resume Tailoring, LinkedIn Search & Outreach Discovery]]          | New                     | [[PDF's Ingestion Implementation#CAREER TRACK: Integrated Resume + Job
- t-term); leaves the retroactive-link decision explicit rather than forced                                     | | [[Outreach Discovery & Automation Status]]                          | New                     | [[PDF's Ingestion Implementation#O
- scovery & Automation Status]]                          | New                     | [[PDF's Ingestion Implementation#OUTREACH TRACK: Professional Email Automation + Apify Enhancement Research - BUILD\|OUTREACH TRACK]]        | Apollo/Hunter disc
- [PDF's Ingestion Implementation#OUTREACH TRACK: Professional Email Automation + Apify Enhancement Research - BUILD\|OUTREACH TRACK]]        | Apollo/Hunter discovery-tool-only verdict + Knowledge Gathering automation-channel status             
- ERRED`) replacing open questions on every Tier-1 + resolved repo                                                    | | [[How Anant Uses Each Repo]]                                        | Extended                | [[PDF's Ingestion Implementat

=== 60_Claude/20_Distilled_Notes/Sources - Plan/00_Execution.md ===
-  - Cross-Reference with GitHub Repos]]"   - "[[Trading Resources Integration — TradingView Architecture Roadmap]]"   - "[[How Anant Uses Each Repo]]"   - "[[Useful Repos - Shortlist]]"   - "[[40_Resources/CS/Repos]]" next: "All three ingestion p
- ss-Reference with GitHub Repos]]"   - "[[Trading Resources Integration — TradingView Architecture Roadmap]]"   - "[[How Anant Uses Each Repo]]"   - "[[Useful Repos - Shortlist]]"   - "[[40_Resources/CS/Repos]]" next: "All three ingestion passes 
- erence with GitHub Repos]]"   - "[[Trading Resources Integration — TradingView Architecture Roadmap]]"   - "[[How Anant Uses Each Repo]]"   - "[[Useful Repos - Shortlist]]"   - "[[40_Resources/CS/Repos]]" next: "All three ingestion passes (PDF,
- e with GitHub Repos]]"   - "[[Trading Resources Integration — TradingView Architecture Roadmap]]"   - "[[How Anant Uses Each Repo]]"   - "[[Useful Repos - Shortlist]]"   - "[[40_Resources/CS/Repos]]" next: "All three ingestion passes (PDF, Web,
- h GitHub Repos]]"   - "[[Trading Resources Integration — TradingView Architecture Roadmap]]"   - "[[How Anant Uses Each Repo]]"   - "[[Useful Repos - Shortlist]]"   - "[[40_Resources/CS/Repos]]" next: "All three ingestion passes (PDF, Web, GitHub
- on in `Sources - Plan`. Pass 1 covers [[PDF's Ingestion Implementation]] only — Web and GitHub get their own pass next. Each entry states what actually happens next: build it, drop it, defer it, or fold it into an existing file. No header is le

=== 60_Claude/07_AI_Information/Session Logs/log.md ===
-  real behavior), explained why an earlier draft said "applied for" instead, and pointed at `Applying/Now.md` + `Tracker/Each One/Applied+Result/` as the actual "don't repeat an application" view — both already exist, both empty since zero real 
- empty since zero real applications have gone out yet. Cited Prompts 8 and 9 (Archive) as two independent sessions that reached the same read. - **Screen (Pipeline Step 2) gets a real artifact — new [[Internship Notes Standard]] §7.** Chose fro
- sult lifecycle, and a real, currently-live gap found and documented: `Internship - Dashboard.md` never queries `Tracker/Each One/` in any section, so a pre-application program (Appian, right now) is invisible to the Dashboard. - **[[Internship
- on't repeat") and the shipped system's actual `Viewed/` design (closed postings never applied to) — found that `Tracker/Each One/Applied+Result/` and `Applying/Now.md` already exist to serve the described need, just unpopulated (zero real appli
- sh): [[MOC Standard]] filled in (was an empty stub), plus two new note types added to the vault's taxonomy — `brief` (reuses `type: input`, its own [[Brief Standard]]) and `action` (new `type: action`, its own [[Action Standard]]). Templates: [
- ls/weekly-review.md` both hardcoded the old numbered filenames — updated both to the new 6-file set, and left a note in each pointing back to the Summer Plans index if a referenced file goes missing again. - **Built the reuse infrastructure th
  ```
- `mcp__jarvis__vault_get_document_map` — `{"path":"20_Progress/Projects/AI Use/Builds & Resources/Maverick Skills Mode-to-Repo Mapping.md"}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Projects/AI Use/Builds & Resources/Maverick Skills Mode-to-Repo Mapping.md","targetType":"heading","target":["Maverick Skills Mode-to-Repo Mapping","Category Verdicts (Full Detail in Source Note)"]}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Builds & Resources/Maverick Skills Mode-to-Repo Mapping.md","targetType":"heading","target":["Maverick Skills Mode-to-Repo Mapping","Category Verdicts (Full Detail in Source Note)"],"operation":"replace","ifMatch":"a4feeb","content":"- **Writing & Style** — 60% already have repos; 40% composited from anti-slop-editor + gstack; 0% need new custom skills.\n- **Artifacts & Creation** — 90% have direct repos (Claude Code native tools, Excalidraw); 10% light composition.\n- **Thinking & Reasoning** — 70% already covered (Claude native thinking, gstack, mattpocock); 30% were the `/challenge` gap, now closed.\n- **Learning & Mastery** — 80% covered; 20% are learning-agent improvements, already planned.\n- **Analysis & Strategy** — 50% covered via GSD + gstack; 50% were the `/strategy` gap, now closed.\n- **Creative & Content** — 80% covered by agency-agents (queued); 20% low priority, not content-marketing focused.\n- **Coding & Technical** — 100% covered by existing/queued repos (gstack, spec-kit, Claude native).\n- **Research & Deep Dives** — 70% covered (Applied ML, research-distiller agent); 30% light composition.\n- **Power Commands** — 100% covered — CPR (`/preserve`/`/compress`/`/resume`) is repo-scoped to `second-brain-claudekit` itself, per [[40_Resources/CS/AI/CPR - Compress Preserve Resume]] (real state, 2026-09-05: cleared with a blend verdict, still not promoted into that repo's own `.claude/commands/` — `[[How Anant Uses Each Repo]]` is retired, this is the live pointer now); gbrain supersedes the memsearch/context-sync half, see [[40_Resources/CS/AI/GBrain and gstack]].\n"}`
- `mcp__jarvis__vault_patch` — `{"path":"60_Claude/10_Source_Summaries/Github Ingestion/Claude Kit Implementation.md","targetType":"frontmatter","target":"notes","operation":"append","value":["[[40_Resources/CS/AI/GBrain and gstack]]","[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]"]}`
- `mcp__jarvis__vault_read` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","ECC (affaan-m/everything-claude-code)","graphify"]}`
- `mcp__jarvis__vault_patch` — `{"path":"20_Progress/Projects/AI Use/Claude Kit/Tool Map.md","targetType":"heading","target":["Claude Kit — second-brain-claudekit Tool Map","Tools","ECC (affaan-m/everything-claude-code)","graphify"],"operation":"append","content":"- **Real usage note:** [[40_Resources/CS/Concepts/Helpful Tools/Graphify]] (already live, pre-dating this clone — the round-2 sandbox triage below correctly dropped this `sandbox/graphify/` copy as redundant)."}`
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && git status --short && echo "---" && git diff --stat`
  ```
 M _docs/Design.md
 M _docs/Jarvis.md
?? context/OpsPilot/
?? context/Resq/
?? rules/internship-research-loop/
---
 _docs/Design.md | 2 +-
 _docs/Jarvis.md | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
  ```

## You

Commit everything that has been done so far and reflect the changes correctly in the commit message.

## Claude

Let me check what else is sitting uncommitted before deciding scope — there's a parallel session's work mixed into the tree.

This confirms it — the rest is unrelated, in-progress work from the parallel session (internship-research-loop mirror content I didn't touch and can't accurately describe). I'll commit only what I actually changed.

Only `_docs/Design.md` and `_docs/Jarvis.md` are staged — everything else stays untouched. Committing now.

Committed as `d9c0c94`.

The rest of the working tree (`instructions/internship-research-loop/CLAUDE.md` modified, plus `context/OpsPilot/`, `context/Resq/`, `context/internship-research-loop/`, `rules/internship-research-loop/`, `hooks/internship-research-loop/vault-write-guard.sh`) belongs to the parallel Windows-side session's in-progress work — I didn't produce it and left it uncommitted rather than fold it into a commit message describing changes I didn't make. Everything from Task 1 in the Jarvis vault (Tool Map.md, Log.md, Repos.md, the 8 new usage notes, the 2 retirements) already lives there directly — Obsidian vaults aren't git-tracked in this setup, so there's nothing further to commit for that side.

**Tool calls:**

- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && git status && echo "--- diff stat ---" && git diff --stat && echo "--- log -5 ---" && git log --oneline -5`
  ```
On branch main
Your branch is ahead of 'origin/main' by 35 commits.
  (use "git push" to publish your local commits)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   _docs/Design.md
	modified:   _docs/Jarvis.md
	modified:   instructions/internship-research-loop/CLAUDE.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	context/OpsPilot/
	context/Resq/
	context/internship-research-loop/
	hooks/internship-research-loop/vault-write-guard.sh
	rules/internship-research-loop/

no changes added to commit (use "git add" and/or "git commit -a")
--- diff stat ---
 _docs/Design.md                                 | 2 +-
 _docs/Jarvis.md                                 | 1 +
 instructions/internship-research-loop/CLAUDE.md | 4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)
--- log -5 ---
029b1f7 Document context/<Project>/ and rules/<Project>/ in the Vault Structure
054f95b Add context/ and rules/ staging categories; onboard Windows's new base layout
e21ff9e Populate Windows's global .claude/ with agents, commands, and 2 hooks
491a0c6 Fix 6 stale pre-reorg vault paths in WSL global agents/commands
167d563 Copy the 7 agent files into Jarvis's real .claude/agents/ (third hop)
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && git diff instructions/internship-research-loop/CLAUDE.md`
  ```
diff --git a/instructions/internship-research-loop/CLAUDE.md b/instructions/internship-research-loop/CLAUDE.md
index 9f448dd..74f6db1 100644
--- a/instructions/internship-research-loop/CLAUDE.md
+++ b/instructions/internship-research-loop/CLAUDE.md
@@ -62,10 +62,12 @@ If a new piece of recurring toil shows up and it's mechanical/deterministic (ano
 
 ## `.claude/rules/` — steering wrappers, same pattern as the Jarvis vault's
 
-Three files, each a thin pointer or narrowly-scoped addition — none restates content that already lives somewhere else, per the Jarvis build standard's anti-duplication principle ("if a sentence is true in both, one copy is wrong"):
+Five files, each a thin pointer or narrowly-scoped addition — none restates content that already lives somewhere else, per the Jarvis build standard's anti-duplication principle ("if a sentence is true in both, one copy is wrong"):
 - **`rules/internship-loop.md`** — pointer to this file's own "Conventions this codebase enforces" section above. Exists so the always-loaded `rules/` mechanism reinforces it, not because the content lives twice.
 - **`rules/jarvis.md`** — the vault-reachability check (sibling checkout vs. `jarvis` MCP tools) every vault-writing agent needs, stated once instead of five times across `program-writer`/`tracking`/`promotion`/`applying`/`/promote-dossier`.
 - **`rules/autonomous.md`** — which agents are safe to run unattended (read-only: `loop-verifier`, `testing-tools`, `contact-researcher`) versus never-autonomous (write real vault data: `program-writer`, `tracking`, `promotion`, `applying`, all gated behind explicit human consent already documented in each one's own file).
+- **`rules/hooks.md`** — catalog of this repo's two hooks (`review-reminder.sh`, `vault-write-guard.sh`) and the shared rule behind both: hooks here inform, they never deny.
+- **`rules/mcp-permissions.md`** — why `.claude/settings.json` pre-approves every `jarvis`/`jarvis-fs` call except `vault_delete`: the calling skill/agent's own consent gate is the real safety mechanism, not the MCP permission.
 
 ## Auto-mode classifier notes (this repo only)
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && git add _docs/Design.md _docs/Jarvis.md && git status --short`
  ```
M  _docs/Design.md
M  _docs/Jarvis.md
 M instructions/internship-research-loop/CLAUDE.md
?? context/OpsPilot/
?? context/Resq/
?? context/internship-research-loop/
?? hooks/internship-research-loop/vault-write-guard.sh
?? rules/internship-research-loop/
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && git commit -m "$(cat <<'EOF'
Cite Repos.md as the ingestion trail's origin in Design.md and Jarvis.md

Neither doc previously named 40_Resources/CS/Repos.md explicitly as
where the sandbox/tested-tools/Promotion-Criteria decision trail
starts, despite both already depending on it. Added next to each
file's existing Tool Map.md citation, following the same "path — what
it answers" pattern Claudekit Session Context.md's own table uses.

Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01JsWo1jTSecmfSAQJfbSn9a
EOF
)"
git log --oneline -1
git status --short
  ```
  ```
[main d9c0c94] Cite Repos.md as the ingestion trail's origin in Design.md and Jarvis.md
 2 files changed, 2 insertions(+), 1 deletion(-)
d9c0c94 Cite Repos.md as the ingestion trail's origin in Design.md and Jarvis.md
 M instructions/internship-research-loop/CLAUDE.md
?? context/OpsPilot/
?? context/Resq/
?? context/internship-research-loop/
?? hooks/internship-research-loop/vault-write-guard.sh
?? rules/internship-research-loop/
  ```

## You

Commit everything else as welll

## Claude

Everything staged, nothing left unstaged. Committing now with a message that accurately reflects both threads of work.

Committed as `dcffb5c`. Working tree is now clean — 37 commits ahead of `origin/main`, nothing left pending.

**Tool calls:**

- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && echo "=== context/OpsPilot ===" && find context/OpsPilot -type f
echo "=== context/Resq ===" && find context/Resq -type f
echo "=== context/internship-research-loop ===" && find context/internship-research-loop -type f
echo "=== rules/internship-research-loop ===" && find rules/internship-research-loop -type f
echo "=== hooks/internship-research-loop ===" && find hooks/internship-research-loop -type f
  ```
  ```
=== context/OpsPilot ===
context/OpsPilot/remote-main-and-merge.md
context/OpsPilot/keyword-map.md
context/OpsPilot/[REDACTED].md
context/OpsPilot/current-state.md
context/OpsPilot/6hour-status.md
context/OpsPilot/architecture.md
=== context/Resq ===
context/Resq/product-vision.md
context/Resq/12hour-execution.md
context/Resq/collections-action-implementation.md
context/Resq/current-state.md
context/Resq/architecture.md
=== context/internship-research-loop ===
context/internship-research-loop/jarvis.md
context/internship-research-loop/MEMORY.md
=== rules/internship-research-loop ===
rules/internship-research-loop/mcp-permissions.md
rules/internship-research-loop/jarvis.md
rules/internship-research-loop/autonomous.md
rules/internship-research-loop/internship-loop.md
rules/internship-research-loop/hooks.md
=== hooks/internship-research-loop ===
hooks/internship-research-loop/review-reminder.sh
hooks/internship-research-loop/vault-write-guard.sh
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && grep -rliE "api[_-]?key|secret|token|password|bearer|-----BEGIN" context/OpsPilot context/Resq context/internship-research-loop rules/internship-research-loop hooks/internship-research-loop 2>/dev/null`
  ```
context/OpsPilot/6hour-status.md
rules/internship-research-loop/autonomous.md
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && grep -inE "api[_-]?key|secret|token|password|bearer|-----BEGIN" context/OpsPilot/6hour-status.md rules/internship-research-loop/autonomous.md`
  ```
context/OpsPilot/6hour-status.md:45:- `ANTHROPIC_API_KEY`
rules/internship-research-loop/autonomous.md:18:## Secrets and repo-level boundaries
rules/internship-research-loop/autonomous.md:19:See `CLAUDE.md`'s "Auto-mode classifier notes" section (repo visibility, secrets, protected branches, soft-deny list) — not restated here; this file is about agent-level autonomy, that section is about repo-level operational boundaries.
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && head -20 rules/internship-research-loop/hooks.md rules/internship-research-loop/mcp-permissions.md
echo "=== vault-write-guard.sh head ===" && head -25 hooks/internship-research-loop/vault-write-guard.sh
echo "=== context/internship-research-loop/jarvis.md ===" && head -15 context/internship-research-loop/jarvis.md
echo "=== context/internship-research-loop/MEMORY.md ===" && head -10 context/internship-research-loop/MEMORY.md
echo "=== context/OpsPilot/current-state.md head ===" && head -10 context/OpsPilot/current-state.md
echo "=== context/Resq/current-state.md head ===" && head -10 context/Resq/current-state.md
  ```
  ```
==> rules/internship-research-loop/hooks.md <==
# Hooks in this repo

Two hooks, both advisory only — **hooks here inform, they never deny.** The
`ask` entries in `.claude/settings.json`'s permissions block are the actual
gate (currently just `mcp__jarvis__vault_delete` and a few `git`/`gh`
commands); a hook's job is to surface the right context at the right moment,
not to duplicate that gate. Both fail open on any parse problem — a broken
hook must never block real work.

- **`hooks/review-reminder.sh`** (`PostToolUse`, matches `Write|Edit|MultiEdit`) —
  fires after a local edit to one of this repo's four convention-sensitive
  files (`core/filter.py`, `core/relevance.py`, `core/classify.py`,
  `vault_writer/validate.py`, `run_pipeline.py`, `recheck.py`,
  `ingestion/*.py`) and points at `/review-loop-change` plus the specific
  convention from `CLAUDE.md` most relevant to the file just touched.
- **`hooks/vault-write-guard.sh`** (`PreToolUse`, matches the Jarvis
  write-family tools) — fires before `mcp__jarvis__vault_write/patch/move`,
  `mcp__jarvis__vault_delete`, and the `jarvis-fs` write/edit/move tools.
  For a write/patch/move: reminds that the human consent gate
  ([[jarvis]]) should already have happened and the note shape must match

==> rules/internship-research-loop/mcp-permissions.md <==
# Jarvis MCP permission model

`.claude/settings.json` pre-approves every `jarvis` and `jarvis-fs` call
**except one**: `mcp__jarvis__vault_delete` stays in the `ask` list. Read,
write, patch, move, and edit calls on both servers are auto-allowed.

This is deliberate, not lax: the MCP-level permission was never the safety
mechanism here. Every skill or agent that actually calls a write/patch/move
tool ([[program-writer]], [[tracking]], `promotion`, `applying`,
`/promote-dossier`, `/promote-manual-find`) already enforces its own human
consent gate *before* making that call — see [[jarvis]]'s "the write itself
is always consent-gated" section. Gating the MCP call a second time would
just be the same approval asked twice.

`vault_delete` is different: **no skill or agent in this repo has a
legitimate reason to call it.** Nothing in the promotion/tracking/applying
flows ever deletes a vault note — an unexpected `vault_delete` call is
itself the signal something's wrong (a bad path, a hallucinated cleanup
step), which is exactly the case where an interactive approval prompt earns
its cost. If a future skill genuinely needs to delete a vault note on
=== vault-write-guard.sh head ===
#!/bin/bash
# PreToolUse guard for internship-research-loop's Jarvis-vault write calls.
# Fires before mcp__jarvis__vault_write/patch/move/delete and the
# jarvis-fs write/edit/move tools - a no-op for anything else.
# Advisory only - never denies (PreToolUse *can* block, this one doesn't).
# The "ask" entry for vault_delete in settings.json is the real gate; this
# hook only adds context, it doesn't duplicate that gate.
# Fails open on any parse problem.

set -u
input="$(cat)"

tool_name="$(printf '%s' "$input" | jq -r '.tool_name // empty' 2>/dev/null)"
[ -z "$tool_name" ] && exit 0

case "$tool_name" in
  mcp__jarvis__vault_delete)
    msg="vault-write-guard: vault_delete is the one Jarvis call this repo always asks approval for (see .claude/rules/mcp-permissions.md) - confirm this is a single, human-approved deletion, not part of a batch or automated action."
    ;;
  mcp__jarvis__vault_write|mcp__jarvis__vault_patch|mcp__jarvis__vault_move|mcp__jarvis-fs__write_file|mcp__jarvis-fs__edit_file|mcp__jarvis-fs__move_file)
    msg="vault-write-guard: writing to the live Jarvis vault - confirm the human consent gate already happened (.claude/rules/jarvis.md) and the note shape matches CLAUDE.md's \"Note-template contracts\" section before this lands."
    ;;
  *)
    exit 0
    ;;
=== context/internship-research-loop/jarvis.md ===
=== context/internship-research-loop/MEMORY.md ===
=== context/OpsPilot/current-state.md head ===
# Current State

Updated: 2026-04-14

## Submission posture

OpsPilot is in final hackathon mode. The core demo workflow is implemented and verified:

`reservation completed -> invoice generated -> invoice paid -> finance row created -> review analyzed -> follow-up surfaced`

=== context/Resq/current-state.md head ===
# Current State

Updated: 2026-04-18

## Submission posture

The repo is already in the right product shell for **Resq**, an
autonomous SMB survival agent. The main work is no longer inventing the
product; it is tightening the hero flow, stabilizing TinyFish financing output,
and removing agent-doc noise.
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && git add context/OpsPilot context/Resq context/internship-research-loop rules/internship-research-loop hooks/internship-research-loop/vault-write-guard.sh instructions/internship-research-loop/CLAUDE.md && git status --short`
  ```
A  context/OpsPilot/6hour-status.md
A  context/OpsPilot/architecture.md
A  context/OpsPilot/current-state.md
A  context/OpsPilot/[REDACTED].md
A  context/OpsPilot/keyword-map.md
A  context/OpsPilot/remote-main-and-merge.md
A  context/Resq/12hour-execution.md
A  context/Resq/architecture.md
A  context/Resq/collections-action-implementation.md
A  context/Resq/current-state.md
A  context/Resq/product-vision.md
A  context/internship-research-loop/MEMORY.md
A  context/internship-research-loop/jarvis.md
A  hooks/internship-research-loop/vault-write-guard.sh
M  instructions/internship-research-loop/CLAUDE.md
A  rules/internship-research-loop/autonomous.md
A  rules/internship-research-loop/hooks.md
A  rules/internship-research-loop/internship-loop.md
A  rules/internship-research-loop/jarvis.md
A  rules/internship-research-loop/mcp-permissions.md
 M tested-tools/README.md
?? tested-tools/_future/
?? tests/skills/ai-job-search/
?? tests/skills/humanizer/
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && git diff tested-tools/README.md
echo "=== tested-tools/_future ===" && find tested-tools/_future -type f
echo "=== tests/skills/ai-job-search ===" && find tests/skills/ai-job-search -type f
echo "=== tests/skills/humanizer ===" && find tests/skills/humanizer -type f
  ```
  ```
diff --git a/tested-tools/README.md b/tested-tools/README.md
index 5b3a1c3..645e366 100644
--- a/tested-tools/README.md
+++ b/tested-tools/README.md
@@ -25,5 +25,6 @@ Three levels: artifact type (`agents/`, `commands/`, `hooks/`, `skills/`) at the
 | `agents/native-scaffold/`, `commands/native-scaffold/`, `hooks/native-scaffold/` | This repo's own initial scaffold commit (`d35f0b7`, 2026-04-03) | 15 files (4 agents, 8 commands, 3 hooks) written directly into this repo before the qualification pipeline existed — never modeled on or tested against an external repo. Confirmed zero-provenance 2026-08-19 by cross-referencing every distinctive phrase against all 30 clones in `sandbox/` and everything already in `tested-tools/` — no matches. Relocated here (decision: Anant, 2026-08-19) rather than left at the repo root implying pipeline-tested status they never had, or silently deleted. Not further subdivided by use case — these were never individually tested, only confirmed to have no external source. |
 
 | `mcp-servers/gbrain/` | `sandbox/gbrain/` (`garrytan/gbrain`) | **New 2026-08-20, new type bucket.** Personal-knowledge MCP server — not an agent/command/hook/skill, so it doesn't fit the three-level convention above. Cleared all four `_docs/Promotion-Criteria.md` questions for real — see `VERDICT.md` in that folder, including a real gbrain bug found and worked around while wiring the OpenAI embedding provider (`~/.gbrain/config.json`'s `embedding_disabled` sentinel doesn't clear via any of gbrain's own documented commands). Decision: cleared, global promotion candidate — actual global install happens in a separate session, not from this repo. |
+| `_future/humanizer/` | `sandbox/humanizer/` (`blader/humanizer`) | **New 2026-09-05.** First real entry in `_future/`. A single dependency-free Markdown skill (35 cited de-AI-writing patterns); cleared `_docs/Promotion-Criteria.md`'s Q1/Q4 for real (`scripts/validate-package.py` passed) but has no current consumer in `internship-research-loop` — the one place it would apply (the `applying` agent's cover-letter/outreach drafts) is blocked on `Main Resume.md`/`Main Cover Letter.md` not being real yet. See `FOR-WHAT.md` in that folder and `tests/skills/humanizer/2026-09-05-test-log.md` for the evidence. `MadsLorentzen/ai-job-search`, reviewed the same session for the same question, stayed in `sandbox/` — see `tests/skills/ai-job-search/2026-09-05-test-log.md` for why (mostly wrong-market/duplicate/ToS-risk, one flagged future capability gated on the same blocker). |
 
 `agents/`, `commands/`, `hooks/` (top-level, outside `tested-tools/`) are now per-destination-project staging folders, not draft-then-promote staging — see `CLAUDE.md` and `60_Claude/vault-rules/pipeline-conventions.md`.
=== tested-tools/_future ===
tested-tools/_future/humanizer/FOR-WHAT.md
tested-tools/_future/humanizer/SKILL.md
=== tests/skills/ai-job-search ===
tests/skills/ai-job-search/2026-09-05-test-log.md
=== tests/skills/humanizer ===
tests/skills/humanizer/2026-09-05-test-log.md
  ```
- `Bash` — `cd ~/projects/ai/claude/second-brain-claudekit && git add tested-tools/README.md tested-tools/_future tests/skills/ai-job-search tests/skills/humanizer && git status --short`
  ```
A  context/OpsPilot/6hour-status.md
A  context/OpsPilot/architecture.md
A  context/OpsPilot/current-state.md
A  context/OpsPilot/[REDACTED].md
A  context/OpsPilot/keyword-map.md
A  context/OpsPilot/remote-main-and-merge.md
A  context/Resq/12hour-execution.md
A  context/Resq/architecture.md
A  context/Resq/collections-action-implementation.md
A  context/Resq/current-state.md
A  context/Resq/product-vision.md
A  context/internship-research-loop/MEMORY.md
A  context/internship-research-loop/jarvis.md
A  hooks/internship-research-loop/vault-write-guard.sh
M  instructions/internship-research-loop/CLAUDE.md
A  rules/internship-research-loop/autonomous.md
A  rules/internship-research-loop/hooks.md
A  rules/internship-research-loop/internship-loop.md
A  rules/internship-research-loop/jarvis.md
A  rules/internship-research-loop/mcp-permissions.md
M  tested-tools/README.md
A  tested-tools/_future/humanizer/FOR-WHAT.md
A  tested-tools/_future/humanizer/SKILL.md
A  tests/skills/ai-job-search/2026-09-05-test-log.md
A  tests/skills/humanizer/2026-09-05-test-log.md
  ```
- `Bash`:
  ```bash
cd ~/projects/ai/claude/second-brain-claudekit && git commit -m "$(cat <<'EOF'
Stage OpsPilot/Resq context mirrors, internship-research-loop rules+hook, and the humanizer/ai-job-search sandbox verdicts

Per-destination-project staging catches up with three real, already-decided pieces of work:

- context/OpsPilot/ and context/Resq/: real project context docs mirrored
  into the new context/<Project>/ staging category.
- context/internship-research-loop/, rules/internship-research-loop/
  (mcp-permissions.md, hooks.md added to the existing three),
  hooks/internship-research-loop/vault-write-guard.sh: the two new
  rules files and the PreToolUse guard hook that back them, plus
  instructions/internship-research-loop/CLAUDE.md updated to document
  going from three rules files to five.
- tested-tools/_future/humanizer/: first real entry in _future/ — cleared
  Promotion-Criteria Q1/Q4 but has no current consumer until
  internship-research-loop's Main Resume/Cover Letter docs are real.
  tests/skills/humanizer/ and tests/skills/ai-job-search/ carry the
  2026-09-05 test logs backing that verdict and the sibling repo's
  stay-in-sandbox decision; tested-tools/README.md documents the new row.

Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01JsWo1jTSecmfSAQJfbSn9a
EOF
)"
git log --oneline -2
git status
  ```
  ```
[main dcffb5c] Stage OpsPilot/Resq context mirrors, internship-research-loop rules+hook, and the humanizer/ai-job-search sandbox verdicts
 25 files changed, 1535 insertions(+), 1 deletion(-)
 create mode 100644 context/OpsPilot/6hour-status.md
 create mode 100644 context/OpsPilot/architecture.md
 create mode 100644 context/OpsPilot/current-state.md
 create mode 100644 context/OpsPilot/[REDACTED].md
 create mode 100644 context/OpsPilot/keyword-map.md
 create mode 100644 context/OpsPilot/remote-main-and-merge.md
 create mode 100644 context/Resq/12hour-execution.md
 create mode 100644 context/Resq/architecture.md
 create mode 100644 context/Resq/collections-action-implementation.md
 create mode 100644 context/Resq/current-state.md
 create mode 100644 context/Resq/product-vision.md
 create mode 100644 context/internship-research-loop/MEMORY.md
 create mode 100644 context/internship-research-loop/jarvis.md
 create mode 100755 hooks/internship-research-loop/vault-write-guard.sh
 create mode 100644 rules/internship-research-loop/autonomous.md
 create mode 100644 rules/internship-research-loop/hooks.md
 create mode 100644 rules/internship-research-loop/internship-loop.md
 create mode 100644 rules/internship-research-loop/jarvis.md
 create mode 100644 rules/internship-research-loop/mcp-permissions.md
 create mode 100644 tested-tools/_future/humanizer/FOR-WHAT.md
 create mode 100644 tested-tools/_future/humanizer/SKILL.md
 create mode 100644 tests/skills/ai-job-search/2026-09-05-test-log.md
 create mode 100644 tests/skills/humanizer/2026-09-05-test-log.md
dcffb5c Stage OpsPilot/Resq context mirrors, internship-research-loop rules+hook, and the humanizer/ai-job-search sandbox verdicts
d9c0c94 Cite Repos.md as the ingestion trail's origin in Design.md and Jarvis.md
On branch main
Your branch is ahead of 'origin/main' by 37 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
  ```

## Actions Taken
- Files created: (none)
- Files modified: /home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Design.md, /home/anant_gupta/projects/ai/claude/second-brain-claudekit/_docs/Jarvis.md
- Files deleted: (none)
- Commands run: echo "=== git log -20 ===" && git log --oneline -20 && echo "=== git status ===" && git status && echo "=== git diff --stat ===" && git diff --stat, git log --format='%h %ad %s' --date=format:'%Y-%m-%d %H:%M' -30, python3 -c " import json with open('/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].json') as f: data = json.load(f) text = data[0]['text'] obj = json.loads(text) content = obj['content'] with open('/tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/scratchpad/prompts.md', 'w') as f: f.write(content) print(len(content)) " , grep -n "^## Round" /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/scratchpad/prompts.md, grep -n -i "round 9\|round9\|Round 8\|^##\|^# " /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/scratchpad/prompts.md | head -80, sed -n '19,108p' /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/scratchpad/prompts.md, cd ~/projects/ai/claude/second-brain-claudekit && echo "--- Design.md ---" && cat -n _docs/Design.md | sed -n '1,400p' | grep -n "Tool Map\|Log\.md" && echo "--- Jarvis.md ---" && grep -n "Tool Map\|Log\.md" _docs/Jarvis.md, cd ~/projects/ai/claude/second-brain-claudekit && echo "--- grep Repos.md ---" && grep -rn "Repos\.md\|40_Resources" _docs/*.md Architecture.md PRD.md 2>/dev/null; echo "--- grep Tool Map / Log.md across all _docs ---" && grep -n "Tool Map\|Log\.md" _docs/*.md, cd ~/projects/ai/claude/second-brain-claudekit && ls -d sandbox/*/ | wc -l && echo "---" && ls -d sandbox/*/ | sed 's|sandbox/||; s|/$||' | sort, cd ~/projects/ai/claude/second-brain-claudekit && echo "--- sandbox/skills remote ---" && git -C sandbox/skills remote -v 2>/dev/null; ls sandbox/skills 2>/dev/null | head -5; echo "--- tested-tools tree ---" && find tested-tools -maxdepth 3 -type d | sort, cd ~/projects/ai/claude/second-brain-claudekit && echo "=== _future ===" && find tested-tools/_future -maxdepth 2 && echo "=== gbrain VERDICT ===" && cat tested-tools/mcp-servers/gbrain/VERDICT.md 2>/dev/null | head -60 && echo "=== native-scaffold dirs listing ===" && ls tested-tools/agents/native-scaffold tested-tools/commands/native-scaffold tested-tools/hooks/native-scaffold 2>/dev/null && echo "=== cpr VERDICT ===" && find tested-tools/commands/cpr-compress-preserve-resume -maxdepth 1, echo "=== gbrain install check ===" && which gbrain 2>/dev/null; ls -la ~/.gbrain 2>/dev/null; echo "exit: $?" echo "=== WSL global .claude mcp config ===" && cat ~/.claude.json 2>/dev/null | grep -i gbrain echo "=== CPR VERDICT ===" && tail -40 ~/projects/ai/claude/second-brain-claudekit/tested-tools/commands/cpr-compress-preserve-resume/VERDICT.md 2>/dev/null echo "=== is cpr promoted anywhere (commands dirs)? ===" && find ~/projects/ai/claude/second-brain-claudekit -iname "*compress*" -o -iname "*preserve*" -o -iname "*resume*" 2>/dev/null | grep -v tested-tools | grep -v "\.git", echo "=== bun global installs ===" && bun pm ls -g 2>/dev/null; ls ~/.bun/install/global/node_modules 2>/dev/null echo "=== gbrain in PATH? ===" && command -v gbrain; command -v gb echo "=== WSL ~/.claude structure ===" && ls -la ~/.claude/ 2>/dev/null echo "=== mcp config files ===" && find ~ -maxdepth 2 -iname "*.mcp.json" -o -maxdepth 2 -iname ".claude.json" 2>/dev/null echo "=== grep gbrain across home configs ===" && grep -rl "gbrain" ~/.claude ~/.mcp.json ~/.claude.json 2>/dev/null, echo "=== .mcp.json (WSL) ===" && cat ~/.mcp.json 2>/dev/null echo "=== .claude/.mcp.json ===" && cat ~/.claude/.mcp.json 2>/dev/null echo "=== git show e21ff9e --stat ===" && git -C ~/projects/ai/claude/second-brain-claudekit show e21ff9e --stat | head -30 echo "=== git show 491a0c6 --stat ===" && git -C ~/projects/ai/claude/second-brain-claudekit show 491a0c6 --stat | head -30, cd ~/projects/ai/claude/second-brain-claudekit && echo "=== Promotion-Criteria.md ===" && cat _docs/Promotion-Criteria.md echo "=== cpr VERDICT full ===" && cat tested-tools/commands/cpr-compress-preserve-resume/VERDICT.md | tail -60, cd ~/projects/ai/claude/second-brain-claudekit && echo "=== .claude/commands ===" && ls .claude/commands/ 2>/dev/null echo "=== .claude/agents ===" && ls .claude/agents/ 2>/dev/null echo "=== .claude/hooks ===" && ls .claude/hooks/ 2>/dev/null echo "=== hooks/second-brain-claudekit ===" && ls hooks/second-brain-claudekit/ 2>/dev/null echo "=== diff pre-artifact-edit-check ===" && diff .claude/hooks/pre-artifact-edit-check.sh hooks/second-brain-claudekit/pre-artifact-edit-check.sh && echo IDENTICAL, cd ~/projects/ai/claude/second-brain-claudekit && echo "=== mattpocock test backlog ===" && cat tests/skills/mattpocock-engineering/README.md 2>/dev/null | head -60 echo "=== tests dir tree ===" && find tests -maxdepth 3 -type d, F="/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt" wc -l "$F" echo "--- grep Tool Map ---" && grep -o ".\{80\}Tool Map.\{80\}" "$F" | head -20 echo "--- grep gbrain ---" && grep -oi ".\{60\}gbrain.\{60\}" "$F" | head -20, cd ~/projects/ai/claude/second-brain-claudekit && echo "=== obsidian-mind structure ===" && find sandbox/obsidian-mind -maxdepth 3 -type f | grep -v "\.git/" | sort echo "=== obsidian-second-brain structure ===" && find sandbox/obsidian-second-brain -maxdepth 3 -type f | grep -v "\.git/" | sort | head -40 echo "=== agentic-inbox structure ===" && find sandbox/agentic-inbox -maxdepth 3 -type f | grep -v "\.git/" | sort, cd ~/projects/ai/claude/second-brain-claudekit && echo "=== agentic-inbox README (first 60 lines) ===" && head -60 sandbox/agentic-inbox/README.md echo "=== workers/lib/tools.ts (the 'agent triage' logic, if any) — first 80 lines ===" && head -80 sandbox/agentic-inbox/workers/lib/tools.ts 2>/dev/null, cd ~/projects/ai/claude/second-brain-claudekit && cat tested-tools/commands/native-scaffold/inbox-process.md 2>/dev/null | head -60, cd ~/projects/ai/claude/second-brain-claudekit && find hooks/Jarvis -type f 2>/dev/null && echo "---" && for f in hooks/Jarvis/*.ps1; do echo "=== $f ==="; head -15 "$f"; echo; done 2>/dev/null echo "=== settings.json hook registrations, if staged ===" && find . -path ./sandbox -prune -o -iname "settings.json" -print 2>/dev/null | grep -i jarvis, cd ~/projects/ai/claude/second-brain-claudekit && wc -l hooks/Jarvis/jarvis-session-continuity.ps1 && sed -n '1,60p' hooks/Jarvis/jarvis-session-continuity.ps1, cd ~/projects/ai/claude/second-brain-claudekit && find sandbox/obsidian-second-brain -maxdepth 2 -type d | grep -v "\.git" echo "--- rules-like files ---" find sandbox/obsidian-second-brain -iname "*rule*" -o -iname "*convention*" -o -iname "*standard*" | grep -v "\.git" echo "--- architecture.md head ---" head -50 sandbox/obsidian-second-brain/architecture.md, cd ~/projects/ai/claude/second-brain-claudekit && ls 60_Claude/vault-rules/ echo "=== write-rules.md (obsidian-second-brain) ===" && cat sandbox/obsidian-second-brain/references/write-rules.md echo "=== ai-first-rules.md (obsidian-second-brain), first 80 lines ===" && head -80 sandbox/obsidian-second-brain/references/ai-first-rules.md, cd ~/projects/ai/claude/second-brain-claudekit && wc -l 60_Claude/vault-rules/*.md, grep -i "bumblebee" /tmp/claude-1001/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/scratchpad/prompts.md cd ~/projects/ai/claude/second-brain-claudekit && grep -ri "bumblebee" _docs/*.md CLAUDE.md 2>/dev/null, python3 -c " import json with open('/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].json') as f: data = json.load(f) text = data[0]['text'] obj = json.loads(text) content = obj['content'] import re idx = content.lower().find('bumblebee') print(idx) print(content[max(0,idx-400):idx+400] if idx!=-1 else 'NOT FOUND in Repos.md') " , cd ~/projects/ai/claude/second-brain-claudekit && find . -path ./sandbox -prune -o -iname "*archive*" -type d -print 2>/dev/null | grep -v "\.git" echo "---" && find .claude -maxdepth 3 -type d, echo "=== ECC plugin marketplace ===" && ls ~/.claude/plugins/marketplaces/ 2>/dev/null cat ~/.claude/plugins/config.json 2>/dev/null | head -40 echo "=== ecc in settings/plugins enabled? ===" && grep -A3 -B3 "ecc" ~/.claude/settings.json 2>/dev/null | head -30 echo "=== llm-council skill in this repo? ===" && find ~/projects/ai/claude/second-brain-claudekit -iname "*llm-council*" | grep -v sandbox | grep -v "\.git" find ~/.claude/skills -iname "*llm*council*" -maxdepth 2 2>/dev/null, cd ~/projects/ai/claude/second-brain-claudekit && ls .claude/skills 2>/dev/null; echo "no .claude/skills or empty above" find ~/.claude/skills -maxdepth 1 -iname "*council*" 2>/dev/null echo "--- check this repo's own top-level skills/ dir (non-Jarvis) ---" ls skills/ 2>/dev/null | grep -v "\.claude_wsl\|Jarvis", find /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills -maxdepth 1 -iname "*council*" 2>/dev/null ls /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills 2>/dev/null | head -30, python3 -c " import json with open('/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].json') as f: data = json.load(f) text = data[0]['text'] obj = json.loads(text) print('BACKLINKS:', obj.get('backlinks')) print('LEN content:', len(obj['content'])) " , cd ~/projects/ai/claude/second-brain-claudekit echo "=== firecrawl skills installed (WSL) ===" && ls ~/.claude/skills | grep -i firecrawl echo "=== firecrawl skills (Windows global, via this repo's mirror) ===" && ls skills/.claude_windows 2>/dev/null | grep -i firecrawl echo "=== llm-council skill content (Jarvis real) ===" && wc -l /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills/llm-council/SKILL.md 2>/dev/null find /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills/llm-council -type f, cd ~/projects/ai/claude/second-brain-claudekit && ls skills/.claude_windows 2>/dev/null | grep -i firecrawl | head -5 echo "count:" && ls skills/.claude_windows 2>/dev/null | grep -ci firecrawl echo "=== sample one skill ===" && ls skills/.claude_windows 2>/dev/null | grep -i firecrawl | head -1 | xargs -I{} find "skills/.claude_windows/{}" -type f 2>/dev/null, cd ~/projects/ai/claude/second-brain-claudekit && find . -maxdepth 2 -iname "*.claude_windows*" echo "---" && find . -iname "*firecrawl*" 2>/dev/null | grep -v "\.git" | head -20, cd ~/projects/ai/claude/second-brain-claudekit && ls skills/.claude_windows/ 2>/dev/null echo "--- sync manifest windows entry ---" python3 -c " import json d = json.load(open('sync-manifest.json')) for e in d.get('projects', d if isinstance(d, list) else []): pass print(json.dumps(d, indent=2)[:200]) " grep -A 20 "claude_windows" sync-manifest.json | head -40, cd ~/projects/ai/claude/second-brain-claudekit && find . -maxdepth 1 -iname "sync-manifest*"; find . -iname "sync-manifest.json" | grep -v "\.git", cd ~/projects/ai/claude/second-brain-claudekit && git status --short | head -50, F="/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt" grep -o '"filename": "[^"]*"' "$F" | sort -u | grep -vi "05_Clippings" | head -40, F="/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt" python3 -c " import json with open('$F') as f: data=json.load(f) for item in data: if item['filename'] in ('60_Claude/07_AI_Information/How to Use Claude/Claude OS.md','20_Progress/Projects/AI Use/Claude Kit/Toolkit/Global/What Global.md','10_Areas/AI/Claude Code.md'): print('===', item['filename'], '===') for m in item['matches'][:5]: print(m['context']) print() " , cd ~/projects/ai/claude/second-brain-claudekit && cat 60_Claude/vault-rules/pipeline-conventions.md | head -20, python3 -c " import json with open('/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].json') as f: data = json.load(f) text = data[0]['text'] obj = json.loads(text) content = obj['content'] with open('/tmp/repos_full.md','w') as f: f.write(content) print(len(content)) " grep -n -i "gbrain\|gstack\|mattpocock\|cpr\b\|compress.*preserve\|everything-claude-code\|spec-kit\|claude-context\|promptfoo\|llm-council" /tmp/repos_full.md, grep -n -i "^\- \[CPR\]\|CPR —\|CPR:" /tmp/repos_full.md grep -n "CPR" /tmp/repos_full.md, grep -n -i "eliaalberti\|preserve-resume\|session.continuity\|compress.*resume" /tmp/repos_full.md, F="/home/anant_gupta/.claude/projects/-home-anant-gupta-projects-ai-claude-second-brain-claudekit/[REDACTED]/tool-results/[REDACTED].txt" python3 -c " import json with open('$F') as f: data=json.load(f) targets = [ '60_Claude/07_AI_Information/Session Logs/log.md', '60_Claude/20_Distilled_Notes/Sources - Plan/00_Execution.md', '60_Claude/20_Distilled_Notes/Sources - Plan/GitHub Ingestion Implementation.md', '60_Claude/20_Distilled_Notes/Sources - Plan/_Notes Created From Ingestion.md', '20_Progress/Projects/AI Use/Builds & Resources/Maverick Skills Mode-to-Repo Mapping.md', '60_Claude/20_Distilled_Notes/Ingestion Pipeline Audit — Clippings, Summaries & Implementation (2026-07-27).md', ] for item in data: if item['filename'] in targets: print('===', item['filename'], '===') for m in item['matches'][:6]: print('-', m['context'].replace(chr(10),' ')) print() " , cd ~/projects/ai/claude/second-brain-claudekit && git status --short && echo "---" && git diff --stat, cd ~/projects/ai/claude/second-brain-claudekit && git status && echo "--- diff stat ---" && git diff --stat && echo "--- log -5 ---" && git log --oneline -5, cd ~/projects/ai/claude/second-brain-claudekit && git diff instructions/internship-research-loop/CLAUDE.md, cd ~/projects/ai/claude/second-brain-claudekit && git add _docs/Design.md _docs/Jarvis.md && git status --short, cd ~/projects/ai/claude/second-brain-claudekit && git commit -m "$(cat <<'EOF' Cite Repos.md as the ingestion trail's origin in Design.md and Jarvis.md Neither doc previously named 40_Resources/CS/Repos.md explicitly as where the sandbox/tested-tools/Promotion-Criteria decision trail starts, despite both already depending on it. Added next to each file's existing Tool Map.md citation, following the same "path — what it answers" pattern Claudekit Session Context.md's own table uses. Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com> Claude-Session: https://claude.ai/code/[REDACTED] EOF )" git log --oneline -1 git status --short, cd ~/projects/ai/claude/second-brain-claudekit && echo "=== context/OpsPilot ===" && find context/OpsPilot -type f echo "=== context/Resq ===" && find context/Resq -type f echo "=== context/internship-research-loop ===" && find context/internship-research-loop -type f echo "=== rules/internship-research-loop ===" && find rules/internship-research-loop -type f echo "=== hooks/internship-research-loop ===" && find hooks/internship-research-loop -type f, cd ~/projects/ai/claude/second-brain-claudekit && grep -rliE "api[_-]?key|secret|token|password|bearer|-----BEGIN" context/OpsPilot context/Resq context/internship-research-loop rules/internship-research-loop hooks/internship-research-loop 2>/dev/null, cd ~/projects/ai/claude/second-brain-claudekit && grep -inE "api[_-]?key|secret|token|password|bearer|-----BEGIN" context/OpsPilot/6hour-status.md rules/internship-research-loop/autonomous.md, cd ~/projects/ai/claude/second-brain-claudekit && head -20 rules/internship-research-loop/hooks.md rules/internship-research-loop/mcp-permissions.md echo "=== vault-write-guard.sh head ===" && head -25 hooks/internship-research-loop/vault-write-guard.sh echo "=== context/internship-research-loop/jarvis.md ===" && head -15 context/internship-research-loop/jarvis.md echo "=== context/internship-research-loop/MEMORY.md ===" && head -10 context/internship-research-loop/MEMORY.md echo "=== context/OpsPilot/current-state.md head ===" && head -10 context/OpsPilot/current-state.md echo "=== context/Resq/current-state.md head ===" && head -10 context/Resq/current-state.md, cd ~/projects/ai/claude/second-brain-claudekit && git add context/OpsPilot context/Resq context/internship-research-loop rules/internship-research-loop hooks/internship-research-loop/vault-write-guard.sh instructions/internship-research-loop/CLAUDE.md && git status --short, cd ~/projects/ai/claude/second-brain-claudekit && git diff tested-tools/README.md echo "=== tested-tools/_future ===" && find tested-tools/_future -type f echo "=== tests/skills/ai-job-search ===" && find tests/skills/ai-job-search -type f echo "=== tests/skills/humanizer ===" && find tests/skills/humanizer -type f, cd ~/projects/ai/claude/second-brain-claudekit && git add tested-tools/README.md tested-tools/_future tests/skills/ai-job-search tests/skills/humanizer && git status --short, cd ~/projects/ai/claude/second-brain-claudekit && git commit -m "$(cat <<'EOF' Stage OpsPilot/Resq context mirrors, internship-research-loop rules+hook, and the humanizer/ai-job-search sandbox verdicts Per-destination-project staging catches up with three real, already-decided pieces of work: - context/OpsPilot/ and context/Resq/: real project context docs mirrored into the new context/<Project>/ staging category. - context/internship-research-loop/, rules/internship-research-loop/ (mcp-permissions.md, hooks.md added to the existing three), hooks/internship-research-loop/vault-write-guard.sh: the two new rules files and the PreToolUse guard hook that back them, plus instructions/internship-research-loop/CLAUDE.md updated to document going from three rules files to five. - tested-tools/_future/humanizer/: first real entry in _future/ — cleared Promotion-Criteria Q1/Q4 but has no current consumer until internship-research-loop's Main Resume/Cover Letter docs are real. tests/skills/humanizer/ and tests/skills/ai-job-search/ carry the 2026-09-05 test logs backing that verdict and the sibling repo's stay-in-sandbox decision; tested-tools/README.md documents the new row. Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com> Claude-Session: https://claude.ai/code/[REDACTED] EOF )" git log --oneline -2 git status
- Tool call tally: Bash (59), Edit (2), mcp__jarvis__search_simple (12), mcp__jarvis__vault_get_document_map (8), mcp__jarvis__vault_list (8), mcp__jarvis__vault_patch (20), mcp__jarvis__vault_read (18), mcp__jarvis__vault_write (8), Read (6), ToolSearch (4)

