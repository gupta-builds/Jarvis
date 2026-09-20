---
type: evergreen
status: sprout
created: 2026-09-05
updated: 2026-09-05
tags: [evergreen, ai, tooling, second-brain-claudekit]
notes:
  - "[[40_Resources/CS/Repos]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]]"
---
# LLM Council Skill

## For future Claude
Real "how Anant actually uses this now" content, written 2026-09-05. This is one of the few tools on this list that's **actually live and in real, routine use today** — most of this pipeline's tracked tools aren't there yet.

## Install state: live
Confirmed by direct filesystem check 2026-09-05: `/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/.claude/skills/llm-council/llm-council.md` exists in Jarvis's **real, live** `.claude/skills/`. `second-brain-claudekit` stages a copy at `skills/Jarvis/llm-council/` (per-destination-project staging, not the live copy — see `_docs/Jarvis.md`'s division of labor). Cited to `Tool Map.md`'s "claude-skills-llm-council + llm-council (Karpathy original)" entry, which is where the real decision to keep this and drop the alternatives is recorded.

## What it's for
Multi-model council deliberation as a Claude Code skill — invoked as `/llm-council`.

## The real decision this pipeline made around it
Two sandbox candidates were cloned 2026-07-30 specifically to compare against the already-live skill: `aiwithremy/claude-skills-llm-council` and `karpathy/llm-council` (the original). **Verdict, 2026-08-20: drop both.** Reasoning, verbatim from `Tool Map.md`'s sandbox-triage section: "This repo's own `/llm-council` skill is live and in routine use; three weeks with zero side-by-side comparison is itself the signal that this isn't a real priority. Revisit only if the existing skill shows a concrete limitation worth comparing against." Both clones remain on disk in `sandbox/` (dropped means off the active evaluation list, not erased), unreviewed.

## WSL vs. Windows split
The live skill lives in Jarvis's real `.claude/skills/` on the Windows-side vault (`D:\Users\_Anant\...`) — genuinely Jarvis/Obsidian-specific tooling, the clear Windows-side case per Anant's stated split. `second-brain-claudekit`'s own WSL-side staging copy (`skills/Jarvis/llm-council/`) is a draft/review artifact, not a second live install.

## Links
[[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] for the pipeline-stage record. [[40_Resources/CS/Repos|Repos]] for the wider inventory.
