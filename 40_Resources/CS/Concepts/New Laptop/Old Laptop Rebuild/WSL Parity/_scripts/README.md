# WSL Parity scripts (Build 5, 2026-10-13)
Run order for the user (scripts marked DONE were already run by Claude with the user's approval):
- 30-wsl-config-parity.sh [--dry-run] [--with-tools]  DONE 2026-10-13 15:13
- wsl-clean.sh, wsl-watch.sh, 40-wsl-upkeep-install.sh  DONE (timers enabled)
- 34-miniconda-jupyter-base.sh --estimate / --install  DONE
- 33-repo-contract-audit.sh, 35-dcim-duplicate-report.sh, 36-wsl-check.sh  read-only, rerun any time
- 31-wsl-sudo-step.sh (copy at D:\WSL\ops\build5-sudo-step.sh)  USER: sudo bash /mnt/d/WSL/ops/build5-sudo-step.sh
- 50-wsl-export-verify.ps1, 51-quarantine-old-tar.ps1, 52-wsl-vhdx-compact.ps1 (copies; the runnable ones live in D:\WSL\ops)  USER, Windows PowerShell

Acer run (2026-10-15, from the Acer): `37-toolkit-apply.sh` and `38-toolkit-upgrade.sh` ran with 0 fails; `36-wsl-check.sh` now detects the vault root and the swap file name. Do not run `30-wsl-config-parity.sh` or `31-wsl-sudo-step.sh` on the Acer: `30` would overwrite the golden configs with the old snapshot, and `31` disables a WSL Ollama service that does not exist there. For `socat` on the Acer use `sudo apt-get update && sudo apt-get install -y socat bubblewrap`.
