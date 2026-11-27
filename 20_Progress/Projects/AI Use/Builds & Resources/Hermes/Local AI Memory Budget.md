---
type: reference
status: sprout
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - local-ai
  - memory
  - acer
reference_kind: research
area:
  - ai
notes:
  - "[[Hermes Map]]"
  - "[[Local Model Lineup]]"
  - "[[Hermes Local Build Log]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Machine Audit 2026-10-22]]"
next: Run the RAM session prompt, then re-measure Available RAM with Obsidian and VS Code open.
---
# Local AI Memory Budget
A measured account of where this laptop's 31.4 GiB of RAM goes and what a local model can count on. The vault uses it to decide which model lane can load and what to change first. Read it before loading anything larger than the 12B and 9B models.
## What the numbers said
==With Obsidian and VS Code open, about 16 GiB of RAM is reachable, not 28.== Windows, kernel, drivers, compositor, Defender and the Acer utilities cost about 7 GiB before any app opens. On 2026-11-26 Windows showed 9.4 GiB Available, but that figure was almost all standby cache (reclaimable files) and truly free memory was 0.02 GiB.
RAMMap Use Counts, in GiB:

| Category | Active | Standby | Modified |
|---|---|---|---|
| Process private | 10.8 | 0.7 | 1.3 |
| Mapped files | 3.2 | 8.2 | 0 |
| Shareable | 0.9 | 0 | 1.0 |
| Paged and nonpaged pool | 2.6 | 0 | 0 |
| Page tables, system PTE, kernel stacks | 1.1 | 0 | 0 |
| Metafile and driver locked | 1.0 | 0.4 | 0 |
| Total | 19.8 | 9.3 | 2.3 |

*What is not available:* the 2.3 GiB modified list must be written to disk before reuse, so it does not count as available. Standby is available and is where model files sit after loading.
## Who holds it
Resident private memory by app: Windows memory compression 2.1, Vivaldi 1.6 (already trimmed by hand), Claude Desktop 1.2 across 14 processes, Obsidian 0.9 resident and 2.2 private across 5 processes, Defender 0.55, ChatGPT 0.36, Toggl 0.30, WebView2 hosts 0.27, NVIDIA App 0.21, PredatorSense about 1.1 across 5 processes. `dwm.exe` holds 2.2 GiB of shared GPU memory, which is system RAM used as graphics memory because the display runs on the Intel iGPU.
Syncthing, Tailscale and Google Drive together hold about 0.4 GiB, so the sync setup is not the cause. Virtualization-based security with memory integrity is running, and Riot Vanguard's kernel driver is loaded at boot.
Two processes show large commitments but little real memory. The MinerU PDF server held 6.9 GiB committed and about 0.2 GiB resident, and stopping it dropped committed memory by 11.3 GB but raised Available by only 0.4 GiB. The `cowork-vm-1e08e7cc` VM, confirmed with `hcsdiag list`, is Claude Desktop's Cowork sandbox: 4 GB committed, 0.2 GiB resident, and a 9.17 GB `vm_bundles` disk image on C:.
## What a model needs
| Lane | RAM it needs | Fits today |
|---|---|---|
| 12B and 9B models in VRAM | 2 to 3 GiB | yes, with dev tools open |
| 35B mixture-of-experts with experts in RAM | 6 to 12 GiB | marginal at 9.6 GiB |
| Qwen3.8-27B at Q3 | 2 to 4 GiB | yes, but its speed is the risk |

The 12 GB card holds more of each model than the 8 GB laptops in the PolyStrata benchmarks, so spill figures here are smaller than its published RAM estimates. Those estimates assume an 8 GB card.
## Rules decided
- The MinerU server holds about 10 GB of commit while it runs. The script `mineru-pdf.ps1` now stops it when a parse finishes (`-KeepServer` for batches), and the global `CLAUDE.md` says never to leave it running. Tested on 2026-11-26: the server started, parsed in 41 s, and ended stopped with no processes left.
- `mineru read` and `mineru search` need the server, so start it for them and stop it after.
- Do not move the display onto the NVIDIA GPU to save the 2.2 GiB. The VRAM matters more.
- Do not turn off memory integrity without a decision. It trades security for a few hundred MB and some speed.
- Dev work (Playwright, localhost servers, Chrome DevTools) runs beside the VRAM-only lane. The 35B lane waits until dev tools are closed or capped.
## What is still open
- Obsidian's 2.2 GiB private memory has not been audited by plugin.
- The Cowork VM can be disabled in Claude Desktop, which would remove 4 GB of commit and 9.2 GB of disk. Not decided.
- `.wslconfig` caps the WSL VM at 20 GB, and Docker Desktop shares that VM. It needs a lower cap before the Docker phase.
- A session prompt for the RAM work exists and has not been run. It leaves Obsidian and VS Code open, never kills an app that is not on an approved list, and builds an AI-mode switch script.
SSD health was checked the same day: CrystalDiskInfo showed Good at 100%, 61 C, 4,942 GB written over 1,467 powered hours and 26 unsafe shutdowns, with no media errors. The C: bloat and idle-write findings belong to the cleanup work in [[C Drive Bloat - Failure Log and Prevention Rules]].
