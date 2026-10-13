---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-13
course: Life
track:
  - laptop
  - wsl
tags:
  - note
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[Google Drive Sync Policy]]"
next: "Waiting for the user's answers to E1 to E10 (Phase 2 checkpoint). Nothing has been changed on the machine yet."
---
# Old Laptop Rebuild - Build 5 WSL and D Drive Findings

## One-Line Answer
==Phases 1 and 2 are done and read-only: the Dell WSL config drift is exactly as the notes said, nothing is broken, and no state has changed; Phase 3 starts when E1 to E10 are answered.==

## Status ledger (live, 2026-10-13)
| # | Item | Status | Evidence |
|---|---|---|---|
| 1 | WSL version | PASS | 3.0.3.0, kernel 6.18.54.1-1, WSLg 1.0.79 |
| 2 | systemd | PASS | `running`, 0 failed units (the 3.0.1 degraded state is closed) |
| 3 | `.wslconfig` | PASS | mirrored, firewall, 20GB, 10 CPUs, swap 8GB at `D:\WSL\swap.vhdx`, both idle timeouts -1, gradual reclaim, sparseVhd=true |
| 4 | `/etc/wsl.conf` | PASS (cosmetic DIFF) | 99 B live vs 95 B Acer, spacing only; leave |
| 5 | VHDX sparse | DIFF | `ext4.vhdx` 107.6 GiB (115,507,986,432 B) although `sparseVhd=true`; the setting is for new distros, an existing VHD needs `--set-sparse` (host step, restart) |
| 6 | Disk | PASS | `/` 56 GiB used, 901 GiB free; D: 450 GiB free; C: 145 GiB free |
| 7 | swap.vhdx | PASS | 5 MB on D: (grows on use) |
| 8 | Config files vs Acer hashes | DIFF | 13 differ, 3 plugin groups (10 files) match, 7 Yazi files missing: `package.toml` plus 6 files in `flavors/tokyonight-storm.yazi` (the prompt named 3 of them: package.toml, flavor.toml, tmtheme.xml) |
| 9 | Tool versions | DIFF | see tool table below |
| 10 | ruff, shfmt, shellcheck | DIFF (missing) | install user-space with `--with-tools` |
| 11 | socat | DIFF (missing) | needs the sudo script |
| 12 | bubblewrap | PASS | 0.9.0 installed |
| 13 | Ollama in WSL | DIFF | `ollama.service` active and enabled, 127.0.0.1:11434, only 3 cloud models, `~/.ollama` holds no model data; blocks the Windows Ollama |
| 14 | Editor servers | PASS (no editor attached) | no `vscode-server`, `cursor-server` or container process running; .vscode-server 5.0 G, .cursor-server 3.6 G, .vscode-remote-containers 1.1 G |
| 15 | `~/.npm/_npx` | DIFF | 4.4 G in 32 cache dirs, largest 2.0 GiB; regenerable |
| 16 | `~/.cache` / `~/.npm` | INFO | 2.4 G / 363 M |
| 17 | Miniconda / jupyter-base | DIFF (absent) | dry-run estimate after E6 |
| 18 | Upkeep timers | PASS (clean start) | one default timer (`launchpadlib-cache-clean`), crontab has only the two PAUSED internship lines |
| 19 | `.bashrc` block | DIFF | Dell marker `# >>> JARVIS_WSL_ENV_BLOCK (Build 1: from notes, not from Acer) >>>` at lines 164-186, plus the Build 2 block at 191-200; not among the 13; see E1b |
| 20 | `.gitconfig` | DIFF | Dell keeps identity, credentials, lfs and Build 2 keys; the Acer adds delta sections |
| 21 | `core.autocrlf` (E5) | PASS | `input` in the global config |
| 22 | `core.excludesfile` | PASS | unset; default `~/.config/git/ignore` used |
| 23 | Tarball integrity | UNKNOWN (running) | result goes in the Phase 6 section |
| 24 | Repos | INFO | 18 working repos under `~/projects` at depth 4, none touched; the 53 `.git` count includes nested and vendored trees; Phase 4 re-counts |
| 25 | Acer `.wslconfig` 16/8 vs 20/18 | UNKNOWN | only the Acer can answer |
| 26 | Drive Mirror vs Stream | UNKNOWN | Drive not running; needs its Preferences page |
| 27 | Host-key comparison, Acer clones, large transfer, Tunnel sign-in, sync-check, port 2222, repo pilot, Firecrawl key rotation | WAITING USER | none attempted |
| 28 | ConversationCapture-Backfill-WSL | WAITING USER (report only) | task Ready; starts `wsl.exe` on a repetition; harmless with both idle timers at -1 |

### Config hash table (live vs `hashes-wsl.txt`, LF-normalised)
| File | Result |
|---|---|
| starship.toml | DIFF (live 956 B, Acer 2379 B; keep the LF copy) |
| yazi: yazi.toml, init.lua, keymap.toml, theme.toml | DIFF x4 |
| yazi plugins (smart-filter, git, full-border; 10 files) | MATCH |
| yazi package.toml and flavors/tokyonight-storm.yazi (7 files) | MISSING |
| atuin, sesh, gh-dash, lazygit, ncdu, git/ignore, .tmux.conf | DIFF x7 |
| .gitconfig | DIFF (merge) |
| /etc/wsl.conf | cosmetic DIFF |

### Tool versions
| Tool | Dell | Acer (snapshot or notes) | Action |
|---|---|---|---|
| node | 24.14.1 | 24.21.0 | no change proposed |
| pnpm | 10.33.2 | 12.4.2 | no change; major-version gap logged, test on the Acer first |
| uv | 0.12.23 | 0.12.17 | no change (Dell newer) |
| claude | 2.1.296 | 2.1.277 | no change (Dell newer) |
| tmux | 3.4 (apt) | 3.7c | stays different: a source build is not worth it; I test-load the Acer config on 3.4 in the dry run |
| delta | 0.20.1 | 0.19.2 | no change (Dell newer) |
| starship, yazi, lazygit | 1.26.0, 26.9.1, 0.65.1 | same | PASS |
| atuin / sesh | 18.23.0 / 2.32.0 | 18.22.0 / 2.30.1 | no change (Dell newer) |
| conda, ruff, shfmt, shellcheck, socat | missing | conda 26.7.1 present | E4, E6, sudo step |

## Contradictions logged (live won)
| Claim | Live |
|---|---|
| WSL 3.0.1 degraded | 3.0.3.0 running, 0 failed |
| core.excludesfile set | unset, default path used, harmless |
| tarball 73 GiB | 39,454,945,280 B = 36.75 GiB |
| bubblewrap missing | installed 0.9.0; socat missing |
| Ollama Windows-only | WSL service active and enabled |
| Acer .wslconfig | snapshot 16/8; the correction cannot be verified from here |
| repo count 58 vs 53 | 18 at depth 4; the difference is nested trees |
| 3 Yazi items missing | 7 files missing (the whole flavor folder plus package.toml) |

## Research used (official first)
- WSL config (`.wslconfig`, `wsl.conf`, networkingMode values, swap defaults, apply with `wsl --shutdown`): [Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config). The search excerpt cut off before the `[experimental]` table, so `sparseVhd` and `autoMemoryReclaim` semantics are UNVERIFIED on Learn until I read the page in full.
- Mirrored mode: [Accessing network applications with WSL](https://learn.microsoft.com/en-us/windows/wsl/networking).
- systemd in WSL: [Use systemd to manage Linux services with WSL](https://learn.microsoft.com/en-us/windows/wsl/systemd).
- Export, import, import-in-place, `--vhd`: [Basic commands for WSL](https://learn.microsoft.com/en-us/windows/wsl/basic-commands); export and import as the backup and move method: [FAQ](https://learn.microsoft.com/en-us/windows/wsl/faq).
- VHDX growth, compaction, sparse: the Learn disk-space page covers expansion only (`wsl --manage`, WSL 2.5 or newer). Shrinking is not built in. Community and issue reports: [microsoft/WSL#4699](https://github.com/microsoft/WSL/issues/4699), [#10703](https://github.com/microsoft/WSL/issues/10703), [#12103](https://github.com/microsoft/WSL/issues/12103). Sparse mode is experimental, has corruption reports, and does not shrink an already large disk. Community-reported, not official guidance.
- Tarball verification: no official verifier. `tar -tf` proves the archive reads end to end, SHA-256 proves later copies match, only an import test proves it boots (not done: it would register a distro).
- systemd timers: freedesktop `systemd.timer` and `systemctl` manuals, from excerpts only: `Persistent=` catches up missed runs and needs `OnCalendar=`; a user timer outside a login needs `loginctl enable-linger`; check expressions with `systemd-analyze calendar`. I confirm against `man systemd.timer` locally in Phase 5.
- Google Drive for desktop admin: [Advanced Drive for desktop configuration](https://support.google.com/a/answer/7644837). `ContentCachePath` (string, NTFS path) moves the content cache, default `%LOCALAPPDATA%\Google\DriveFS`; set under `HKLM\Software\Google\DriveFS`, `HKCU\Software\Google\DriveFS` or `HKLM\Software\Policies\Google\DriveFS`; data moves on restart; deleting the value moves it back. `ContentCacheMaxKbytes` is admin only and capped at 20 percent of free disk. See also [Drive FAQ for admins](https://support.google.com/a/answer/2490100). I found no registry value for the folder backup list.
- Drive folder list in the app: [Customize Drive for desktop settings](https://support.google.com/drive/answer/13470231) (Preferences, Folders from your computer). A search excerpt said Google ends Google Photos backup, and stops letting users configure new backup folders from the app, around 2026-08-10. UNVERIFIED: I read that page itself in Phase 6 before saying the stale list can be fixed in the app.

## Parity plan
| Group | Action |
|---|---|
| Replace from snapshot (11) | starship.toml (LF), yazi.toml, init.lua, keymap.toml, theme.toml, atuin config, sesh.toml, lazygit config, ncdu config, git/ignore, .tmux.conf |
| Add (7) | yazi package.toml, flavors/tokyonight-storm.yazi (6 files) |
| Merge | `.gitconfig`: keep Dell `[user]`, `[credential]`, `[filter "lfs"]` and Build 2 keys; take the Acer's delta, pager, merge and diff sections (the snapshot copy is redacted, so I show you the diff first) |
| Merge | gh-dash `config.yml`: the Acer file with the Dell's `repoPaths: {}` |
| Leave | `.wslconfig`, `/etc/wsl.conf`, the 3 plugin groups, extra `flavors/tokyo-night.yazi`, `plugins-src/` (25 folders), `.bashrc` |
| `.bashrc` | not replaced: the Dell block is guarded, sits next to the Firecrawl and OpenAI exports, and I will not print it. Leave and log the marker difference (E1b). |
| Script | `30-wsl-config-parity.sh` in `Old Laptop Rebuild/WSL Parity/_scripts/`: `--dry-run`, `--with-tools`, own PATH, backups to `~/.config/.toolkit-backups/<timestamp>/`, secret scan before copy, SHA-256 table, non-zero exit on required failure, reusing the snapshot scripts' scan and hash patterns |
| Verification after you run it | hashes, `starship prompt`, a throwaway `tmux -L` server reading the config, yazi and atuin config parse checks, `git config --list` read-back |

## Decisions E1 to E10 (recommendation first)
| # | Decision | Recommendation |
|---|---|---|
| E1 | Config replacement | The plan above: replace 11, add 7, merge 2, leave the rest. E1b: leave `.bashrc` alone |
| E2 | Ollama in WSL | `sudo systemctl disable --now ollama`, keep the binary. Only cloud models, no local data to lose. Frees 127.0.0.1:11434 for the Windows Ollama (D:\Apps\Ollama, 9.2 GB models). WSL cloud-model calls then go to the Windows server on the same port under mirrored mode |
| E3 | PowerShell 7 in WSL | keep |
| E4 | ruff, shfmt, shellcheck | install user-space via `--with-tools` |
| E5 | autocrlf | verified `input`; Acer stays false |
| E6 | Miniconda + jupyter-base | dry-run size estimate first, install only after you see it |
| E7 | Editor servers | itemised list, per-item yes; nothing is attached right now |
| E8 | Tarball | verify (running), fresh export first via host script, then quarantine the old tar, never delete |
| E9 | D: and Drive | canonical tree below, duplicate report before moves, Drive cache stays on C: |
| E10 | Upkeep | yes: weekly systemd user timer (user-level only) plus a daily read-only watcher that writes an alert file; do not duplicate Toolkit-Watch-C |

## Upkeep plan (E10)
- Weekly cleanup as a systemd user timer with `Persistent=true`. Scope: `~/.cache` entries older than 30 days except a keep-list, `~/.npm/_npx` dirs older than 14 days, editor logs older than 14 days. No sudo. No `.vscode-server` extension or server deletion (manual and itemised). A dry-run log first. Deletions limited to regenerable caches.
- Daily watcher: `df /`, `ext4.vhdx` size, `swap.vhdx` size, `~/.cache`, `~/.npm`, the three editor-server dirs, journal size, load. Thresholds write `~/.local/state/wsl-watch/ALERT` and a CSV line. It reads the VHDX size from `latest.json` (`ubuntu_vhdx_gb`) instead of measuring again, so Toolkit-Watch-C stays the one owner of host-side numbers.
- VHDX compaction and `--set-sparse` both need WSL stopped. Used 56 GiB inside a 107.6 GiB file means up to about 50 GiB is reclaimable on D:, but D: has 450 GiB free. Recommendation: do nothing now (as the earlier note says), revisit if D: free drops under 150 GiB.

## D: drive and Drive plan (summary; details in Phase 6)
- Tarball: `tar -tf` and SHA-256 running now over `/mnt/d`. Recommendation: keep it until a fresh verified export exists in `D:\Backup\WSL`, then move the old tar to `D:\Quarantine\wsl-tar-review-<date>` with a review date. Never delete.
- Canonical `_Anant`: keep the vault's numbered scheme. `D:\Users\_Anant` stays the Windows known-folder target (Documents, Downloads, Media, Music, Videos, Favorites). `D:\_Anant` is the one place for everything else (00_Inbox, 20_Progress, 30_Resources, 99_Archive). One place per kind, and only the vault in `10_Areas\Documents`. The Acer's vault root `D:\_Anant\20_Progress\Documents\Jarvis` differs by design; Syncthing maps the two roots, so nothing there moves.
- Candidates, quarantine only after your approval: `.tmp.driveupload` (0.5 GiB, 6010 files), BS\DCIM duplicates (hash report first), empty school folders in Backup, the stray `syncthing.exe` and node installer in Inbox, `.conda` and `node_modules` inside UMN and Real coding.
- Google Drive: not running, three account IDs, stale folder list. Fix in the app (Preferences, Folders from your computer), subject to the UNVERIFIED note. `ContentCachePath` would move the content cache (about 2 MiB, so almost nothing); the 4.2 GiB is sqlite metadata and I have no source saying it relocates. Recommendation: leave the cache on C:, change no registry value.

## Waiting on you or the Acer
Acer: `.wslconfig` values, host-key fingerprint comparison, clone and worktree inventory, large-transfer measurement, sync-check from the Acer. You: VS Code Tunnel sign-in, port-2222 decision, repo pilot choice, Firecrawl key rotation at the provider, ConversationCapture-Backfill-WSL decision, every sudo command, every host script.

## State-changing commands
None so far. One background read-only job: `tar -tf` plus `sha256sum` on `wsl-ubuntu.tar`.

## Errors and root causes
- First Bash call was blocked by a fact-forcing hook; fixed by stating the request and purpose.
- `pkill -f tarcheck.sh` ended my own shell (the pattern matched its own command line); the first tar listing kept running and I killed it by PID. Rule: kill by PID.
- The first tar run wrote one warning per entry (`Ignoring unknown extended header keyword LIBARCHIVE.xattr...`) into its log. Reran with stderr discarded. The warnings come from bsdtar-written headers and are not corruption.

## Growth rules
Written in Phase 7.
