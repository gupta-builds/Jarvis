---
type: concept
status: sprout
created: 2026-09-19
tags:
  - concept
  - laptop
  - ai-infrastructure
notes:
  - "[[Cross-Laptop Sync - Build Roadmap]]"
  - "[[Cross-Laptop Sync - Build 6 Findings]]"
  - "[[Cross-Laptop Sync - Rollback Procedure]]"
next: "[[Cross-Laptop Sync - Build Roadmap]]"
---
# Cross-Laptop Sync - Build 7 Prompt
**Run this one on the Acer, not the Dell** - the first build in this sequence to do so, since git identity and Drive's Acer-side state genuinely need checking from that machine. Paste the block below into a fresh Claude Code session opened in the Acer's Jarvis vault (Syncthing has it fully synced as of Build 6, so it's the same vault, same notes, different machine). Self-contained. Full context: [[Cross-Laptop Sync - Build Roadmap]].
```
You are executing Build 7 of a cross-laptop sync project for an Obsidian vault - the final build closing out Jarvis's side of this entire process before it moves to a sibling vault, The Plan. You are running on the Acer (the new laptop), not the Dell (the old one) - the first build in this sequence to do so. Read this entire prompt first. Then read, in order: 40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build Roadmap.md (full strategy, decisions, build order), 40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build 6 Findings.md (how the Dell-Acer pairing actually went, including a real incident and its fix), and 40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Rollback Procedure.md.

## Situation
Builds 0-6 built, hardened, and proved Syncthing sync for the Jarvis vault (a public GitHub repo, gupta-builds/Jarvis) between the Dell and this Acer - both devices are confirmed live and bidirectionally in sync as of Build 6, verified independently from both sides down to matching SHA-256 file hashes. What's never been built yet: an automatic git commit/push schedule for Jarvis (Syncthing keeps the working tree converged in real time, but git's own version history and GitHub backup still only happen when someone manually commits), a check on whether Google Drive's account consolidation (mentioned by the user as possibly already done through a separate effort) is actually true, and the two new Unison manifest entries (`new-laptop-windows`, `new-laptop-wsl`) that need this exact machine to exist at all.

## Priority order - do not treat these as equally weighted
Do task 1 thoroughly, even if it takes the whole session. Do tasks 2-4 as time and access allow, and report clearly if any of them don't get done rather than rushing them to check a box.

### 1. Scheduled Git auto-commit/push (the primary deliverable)
Write a script - PowerShell, since this runs on Windows - that: pulls with rebase first, commits Jarvis if there's anything to commit (a real diff, not a no-op commit), pushes, and on a push rejection (the other laptop pushed first), pulls with rebase again and retries once before giving up and logging the conflict for a human to resolve manually. Test this specifically: simulate a rejected push (e.g. make a commit look stale by having the remote move ahead some other way) and confirm the rebase-retry actually recovers instead of just failing. A manual dry run with nothing to commit must exit cleanly with nothing staged - do not let the script create empty commits.
Write this script to a path inside the Jarvis vault itself (something like `30_Order/System/claude-workflow/scripts/git-auto-sync.ps1`, matching this vault's existing script-location convention - check what's already there first) rather than somewhere Acer-only. Since the vault is Syncthing-synced, the script text itself reaches the Dell automatically the next time it syncs - the Dell does not need its own separate build for this, only its own Scheduled Task registered locally pointing at the same script once it arrives. Document that one remaining step clearly in your findings note so it's obvious what's still needed on the Dell.
Register a Scheduled Task on this Acer that runs the script on an interval (match the existing `ClaudeKit-Sync-All` cadence of 15 minutes unless you find a real reason not to - check that task's own registration for the pattern to follow, including whatever fixed a console-popup/exit-code bug in that task's own history, documented in [[Sync - Unison]]). Verify the task is registered correctly and actually fires once before calling this done.

### 2. Check Google Drive's real current state
The user has said this may already be consolidated to one account with Mirror mode on the Dell and Stream mode on the Acer, done through a separate effort outside these numbered builds. Check directly on this machine - which Google account Drive for Desktop is signed into, and whether it's in Mirror or Stream mode - rather than assuming either way. Report the actual state. Only make a change here if you find something actively wrong (e.g. still on Mirror mode, which would defeat the point of using Stream on the Acer to save disk space) - otherwise this task is just verification and documentation.

### 3. `new-laptop-windows` / `new-laptop-wsl` Unison manifest wiring, if reachable this session
This requires `second-brain-claudekit` to be cloned on this Acer's WSL side. Check whether it already is. If cloning it and wiring the two manifest entries (matching the shape of the other 9 existing entries in `sync-manifest.json`, writing to distinct per-machine paths per Build 4's race-surface finding, not shared ones) is realistic to complete in this session, do it and get both entries running clean at least once before flipping them from `candidate` to `live`. If it's not realistic (WSL not set up the way this needs, or genuinely too much for this session alongside task 1), stop and document exactly what's blocking it rather than doing a partial, unverified wiring.

### 4. Wrap-up note for Jarvis's entire cross-laptop sync process
Once tasks 1-3 are as complete as this session gets them, write a summary note covering Builds 0 through 7: what each build actually did (pull the real outcomes from the Roadmap note's own Build Order section and each build's Findings note, don't re-derive from scratch), what's still open (the Dell-side git Scheduled Task registration from task 1, anything task 2 or 3 didn't finish, the still-unfixed `PreToolUse:Edit` hook false-positive on `.stignore`, any remaining user-preference-only plugin decisions from the gap tracker), and a plain statement of whether Jarvis's cross-laptop sync is genuinely done or has a named list of loose ends. Revisit 40_Resources/Obsidian/Plugins/Plugin Gaps Recommendations and Verification.md one more time and update it if anything changed.

## Research standard
Every claim about git's own rebase/retry behavior, the Scheduled Task registration, and Google Drive's actual mode must be checked against this machine's real state or current official documentation this session - not assumed from how the Dell's equivalent pieces work, even where they're a reasonable starting guess.

## Boundaries
Do not touch The Plan vault or begin migrating anything to it - that is explicitly the next phase, after this build, not part of it. Do not edit `.stignore` or the Syncthing folder configuration on either machine - that's settled as of Build 6. Do not edit the `PreToolUse:Edit` hook or any Claude Code settings file. Do not change any Obsidian plugin's actual behavioral settings, only document them. Commit your work on the `infra/cross-laptop-sync` branch, matching every prior build - do not merge to master, do not push to a different branch. If you're unsure whether something is safe to automate (especially the git rebase-retry logic, since a mistake there could create a messy merge history), ask the user rather than guessing.

## When finished
Write two new notes: 40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build 7 Findings.md (matching the style and rigor of the prior findings notes - this session should independently verify its own claims the way Build 6's follow-up verified that session's, not just report what it intended to do) and 40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Jarvis Wrap-Up.md (the Build 0-7 summary from task 4). Update the Build 7 entry in Cross-Laptop Sync - Build Roadmap.md to mark it complete (or partially complete, naming exactly what's left) with a short factual outcome.
```
