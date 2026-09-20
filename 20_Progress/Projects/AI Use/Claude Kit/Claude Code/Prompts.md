---
type: input
status: active
created: 2026-08-11
updated: 2026-09-05
tags:
  - claude-kit
  - prompts
  - second-brain-claudekit
notes:
  - "[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]"
  - "[[20_Progress/AI/Claude Code/second-brain-claudekit/Setup]]"
  - "[[20_Progress/AI/Claude Code/Sync - Unison]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Claude Code/Claudekit Session Context]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Claude Code/WSL Environment]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Claude Code/Windows Environment]]"
next: "Claudekit Round 10's Tasks 2-3 are still open (sandbox re-audit, real 40_Resources/CS/AI usage docs, retiring the two stale docs) — confirmed 2026-09-05 that Task 1 landed but 2-3 didn't. Next new prompt in any header should be numbered/dated past what's recorded below."
---
# Claude Kit — Build Prompts
==Only prompts live in this note, each inside a fenced block, ready to paste into a fresh session. Everything else — context, background, open questions — lives in [[20_Progress/Projects/AI Use/Claude Kit/Claude Code/Claudekit Session Context]]. Rewritten 2026-08-19; that note's prior content (dated 2026-08-11) is preserved there, not lost. Cleared out 2026-09-05: every prompt below had actually been run, so the fenced blocks were removed and replaced with a one-line last-state summary per header — full history for anything summarized here lives in [[20_Progress/Projects/AI Use/Claude Kit/Log]] and this repo's own commit history, not duplicated back into this file.==
## Sequencing
**Run `# Claudekit` first.** It lays out the repo's own structural base — nothing in `# Jarvis` should be attempted until that base is real, because `# Jarvis`'s job is to document what the base actually became, not what it was planned to become. Read the Claudekit session's final report (or its `git log`/diff) before starting `# Jarvis`.

# Claudekit

**Last run: Round 10, 2026-09-05.** Round 9 (2026-09-05, the "third hop" round) is confirmed complete by Anant's own report: 7 real agents now live in Jarvis's `.claude/agents/` (6 written fresh + `learning-agent` merged into two modes), Jarvis's `CLAUDE.md` agent table updated to list all 7, `internship-research-loop` fully onboarded (manifest entry, real sync run, `Setup.md`/`MOC.md` updated, this repo's 4 staging folders populated), the `hooks/Jarvis/` gap closed (real cause was a missing manifest path, not a missing bucket — Jarvis's hooks actually live at `30_Order/System/claude-workflow/hooks/`), all 11 manifest entries cross-checked clean, both home syncs verified mechanically healthy, `ecc` deliberately left out of the manifest per Anant's call, logged in [[20_Progress/Projects/AI Use/Claude Kit/Log]].

Round 10 (2026-09-05, citing the vault's ingestion trail + sandbox re-audit + real usage docs) is **only partially confirmed**. Task 1 — citing `40_Resources/CS/Repos.md` and the rest of the ingestion trail in `_docs/Design.md`/`_docs/Jarvis.md` — verified done by direct read 2026-09-05. **Tasks 2 and 3 show no evidence of having run**: no new notes exist in `40_Resources/CS/AI/`, and both `How Anant Uses Each Repo.md` and `Useful Repos - Shortlist.md` are still `status: sprout`, not retired. Next Claudekit round should pick up Round 10's Tasks 2 (sandbox re-audit — what's in `sandbox/` now, what's cleared-but-unpromoted in `tested-tools/`, the WSL-vs-Windows split applied per decision) and 3 (write real usage docs for the ~15-20 repos with an actual decision, retire the two stale docs) before starting anything new.

# Jarvis

**Last run: Round 8, 2026-08-21.** Verification-only round confirming the `instructions/<repo>/` scope fix (third correction, mechanism-level) actually landed in the live repo. Confirmed done per [[20_Progress/Projects/AI Use/Claude Kit/Log]]'s 2026-08-21 entries — the sync-build phase closed out; `tests/` was the next real work at the time, since superseded by the Round 9/10 work above.

# Cursor — Grok 4.6 → Sonnet 5

**Last run: 2026-08-22.** WSL + Windows global-config setup, two-phase handoff (Grok 4.6 plans, Sonnet 5 corrects-then-executes). Confirmed executed to completion 2026-09-05: both `_global-config-plan.md` scratch files (WSL and Windows) are gone, per the prompt's own final cleanup step, which only runs after a confirmed-correct apply — not just attempted. Windows's `.claude/agents/`+`commands/`+`hooks/` now hold real content matching WSL's own set (`obsidian-architect`/`obsidian-researcher`/`obsidian-session-archivist` agents; `obsidian-daily-review`/`obsidian-session-review`/`second-brain-*` commands; `after-edit-log.ps1`/`session-wrapup.ps1` hooks), consistent with this plan's "keep global" verdicts having actually been applied to both homes, not just decided.

# Windows Home Directory — base layout, official-docs-verified

**Last run: 2026-09-05.** Confirmed done by direct inspection the same day: `CLAUDE.md` now `@AGENTS.md`-imports a real `AGENTS.md` stub and `@context/MEMORY.md`-imports a real `context/MEMORY.md`, plus a short, explicitly-marked-placeholder "Jarvis is this machine's central knowledge base" section. `rules/windows-paths.md` is real and narrow, not a CLAUDE.md restatement. **Note, not re-litigated here:** `agents/`/`commands/`/`hooks/` ended up populated with real content (the same set the Cursor round above pushed to Windows), not left as empty stubs — this round's own instructions asked for scaffolding only, so either the executing session judged this content already-decided and safe to land in the same pass, or the two rounds' work overlapped in execution order. Worth confirming which, next time either home directory is touched, but not re-done here.
