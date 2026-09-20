---
type: note
status: sprout
created: 2026-09-12
updated: 2026-09-18
course: Life
track:
  - laptop
prerequisites:
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
  - "[[Ubuntu - WSL]]"
related:
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
  - "[[Ubuntu - WSL]]"
  - "[[Acer Live State — 2026-09-16]]"
tags:
  - note
---
# Old Laptop Decommission Checklist

## Why this note exists

The Acer (Predator PHN16S-71) is now the active machine: BIOS updated V1.26→V1.28, C:/D: partitioned (250GB/~700GB), Documents/Downloads/Desktop/Pictures redirected to D:\Users\_Anant\, Vivaldi installed and synced. The old Dell Latitude 5530 — the machine every prior WSL/Windows session in this folder ran on — is being retired. This note is the gate that must be fully green before anything on the Dell is wiped.

> [!WARNING]
> **Do not run any reset/wipe on the Dell until every item in "Execution gate" below is checked.** This is the machine holding 58 WSL git repos, some with unpushed work, and the only remaining copy of a few things not yet verified as migrated.

## Execution gate — all must be true first

- [x] **WSL installed and working on the Acer** — done 2026-09-18: platform + Ubuntu-24.04 on `D:\WSL\Ubuntu`, base packages, `gh` auth (HTTPS credential helper, no SSH key needed), git identity, Node/pnpm/uv, all AI CLIs, `tmux`/`ncdu`/`semgrep`. Full state in [[Ubuntu - WSL#Current State - Acer, as of 2026-09-18]]; every bug hit and fixed along the way in [[Acer Live State — 2026-09-16#WSL execution log — 2026-09-18]]. The swap-file-defaults-to-C: bug documented there is the most likely explanation for any "WSL silently ate 35GB of C:" symptom on the Dell — check whether the Dell's own `.wslconfig` ever had a `swapfile=` line before assuming that machine's C: pressure was something else.
- [ ] Acer fully usable as a daily driver: WSL done (above); Obsidian + Jarvis/The Plan MCP still **not** wired — deferred until Jarvis/Obsidian actually migrates to this laptop, tracked as the one open item in [[Ubuntu - WSL#Current State - Acer, as of 2026-09-18]]; Git identity configured (done, part of the WSL work above, and already done Windows-side too, per [[New Laptop Setup#Day 1 - Windows, what actually happened]]).
- [ ] Every WSL repo on the Dell reviewed for push status. Per [[WSL Session Briefing#Final closure (2026-08-26, Windows-side verification of the WSL session's last report)]], as of the last check these still needed attention:
  - `ai/claude/second-brain-claudekit` — **22 commits ahead of origin, unpushed.** Push before wiping.
  - `work/internship-research-loop` — **25 commits behind its own origin.** Pull/rebase decision needed, not urgent for data-loss but resolve before this machine is gone.
  - `hub/portfolio`, `hub/Assisto_website` — large uncommitted diffs (55 and 45 modified files respectively) — review and commit/push or explicitly decide to discard.
  - `hub/tradingview`, `hub/GymMangment_app_demo`, `hub/DNA_BJJ_APP`, `work/gupta-builds`, `hackathon/Resq`, `ai/lovable/boom-tracer`, `ai/claude/everything-claude-code`, `ai/claude/adx-worktree-throwaway-test` — smaller untracked/modified counts, lower risk but still unreviewed.
- [ ] SSH key migrated to Acer by hand (not synced/copied via any tool) and tested (`ssh -T git@github.com`) before the Dell's copy is wiped.
- [ ] `gh auth status` fixed and verified on the Acer (it was already invalid on the Dell as of 2026-09-11 — don't carry that problem forward, fix fresh on the new machine).
- [ ] Any browser-saved passwords/autofill on the Dell exported or confirmed already in a cloud-synced password manager.
- [ ] BitLocker recovery key recorded (Microsoft account or printed) if BitLocker is/was enabled on the Dell — needed even if you never intend to unlock it again, in case of an interrupted reset.
- [ ] Final full backup pass confirmed complete and spot-checked (not just "sync says done") — actually open a few files from the destination.
- [ ] Any per-device-licensed software signed out/deactivated (Adobe, any single-seat license) before wipe.

## What NOT to bother migrating (already decided, [[New Laptop Setup#Cross-laptop scope]])

- `~/.claude`, `.cursor`, `.codex` and any AI-platform home directory — fresh install on Acer, never copied.
- `.mcp.json`, `.mcp.env`, `.credentials.json` — regenerated fresh on Acer, never copied from the Dell.
- The WSL VHDX itself, `node_modules`, `.venv`, build output, editor server folders, crash dumps.

## Decommission steps (once the gate above is fully checked)

1. Sign out of Microsoft account, Google account, and any other cloud account on the Dell (Settings → Accounts).
2. Settings → System → Recovery → **Reset this PC → Remove everything → Cloud download** (same clean method already used on the Acer).
3. If the Dell is being sold/donated/recycled rather than kept as a spare: after reset, verify no personal account is still attached before it leaves your possession.
4. If keeping it as a spare/backup machine instead of wiping: skip the reset, but still complete the credential/SSH/password steps above so it stops being a second live copy of anything sensitive.

## Open question for the user

Is the Dell being wiped and repurposed, sold, or kept as a genuine backup machine? The steps above assume "eventually wiped" per your stated intent, but the final action (reset vs. keep-but-declaw) depends on that answer.
