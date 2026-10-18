# WSL Parity scripts (Build 5, 2026-10-13)
Run order for the user (scripts marked DONE were already run by Claude with the user's approval):
- 30-wsl-config-parity.sh [--dry-run] [--with-tools]  DONE 2026-10-13 15:13
- wsl-clean.sh, wsl-watch.sh, 40-wsl-upkeep-install.sh  DONE (timers enabled)
- 34-miniconda-jupyter-base.sh --estimate / --install  DONE
- 33-repo-contract-audit.sh, 35-dcim-duplicate-report.sh, 36-wsl-check.sh  read-only, rerun any time
- 31-wsl-sudo-step.sh (copy at D:\WSL\ops\build5-sudo-step.sh)  DONE 2026-10-13 (socat installed, WSL Ollama disabled). Do not run it on the Acer: it disables a WSL Ollama service that does not exist there
- 50-wsl-export-verify.ps1 and 51-quarantine-old-tar.ps1: superseded and never used. The export, verification and quarantine ran through `60-build5b-host.ps1` (see `Windows Toolkit/_scripts/host-ops`). 52-wsl-vhdx-compact.ps1 (elevated, stops all of WSL) is still available but not recommended until D: free is under 150 GiB

Acer run (2026-10-15, from the Acer): `37-toolkit-apply.sh` and `38-toolkit-upgrade.sh` ran with 0 fails; `36-wsl-check.sh` now detects the vault root and the swap file name. Do not run `30-wsl-config-parity.sh` or `31-wsl-sudo-step.sh` on the Acer: `30` would overwrite the golden configs with the old snapshot, and `31` disables a WSL Ollama service that does not exist there. For `socat` on the Acer use `sudo apt-get update && sudo apt-get install -y socat bubblewrap`.

70-acer-wsl-update.ps1 (Acer, 2026-10-15): updates the WSL platform from Windows PowerShell. Dry run by default; `-Apply` asks for YES, runs `wsl --update` and `wsl --shutdown`, restarts the distro and prints version, systemd, memory, swap and Tailscale checks. Copy at `D:\WSL\ops\70-acer-wsl-update.ps1`. Never run it from inside WSL.

71-hostkey-fingerprint.sh (2026-10-15): run on the Dell in WSL with sudo. Prints the fingerprint of Tailscale SSH's ed25519 host key and compares it with the one the Acer accepted. Needed because `ssh-keygen -lf` rejects Tailscale's PKCS8 key file.

70-acer-wsl-update.ps1 ran on 2026-10-15 18:48: WSL 2.7.14.0 to 3.0.3.0, verified live afterwards. Known cosmetic gap: its `systemd:` line can print blank because it checks a few seconds after the restart; check `systemctl is-system-running` again after a minute (it was `running`).

The golden configs these scripts apply (37) and the tool pins (38) are explained file by file in [[WSL Toolkit Config Reference]]. The Dell's host scripts for the export, verification and quarantine are in ../../Windows Toolkit/_scripts/host-ops/.
