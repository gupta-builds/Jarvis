#!/usr/bin/env bash
# 31-wsl-sudo-step.sh (Build 5). Run once:  sudo bash 31-wsl-sudo-step.sh
# Step 1 apt update, 2 install socat (bubblewrap is already present; named so apt keeps it),
# 3 stop+disable the WSL Ollama service (binary kept) so the Windows Ollama can own port 11434,
# 4 verify. Does NOT touch AppArmor or any sandbox setting: the agent sandbox stays off.
set -euo pipefail
[ "$(id -u)" -eq 0 ] || { echo "Run with sudo: sudo bash $0"; exit 1; }
step() { printf '\n== STEP %s: %s\n' "$1" "$2"; }

step 1 "apt-get update"
apt-get update

step 2 "install socat (and keep bubblewrap)"
DEBIAN_FRONTEND=noninteractive apt-get install -y socat bubblewrap

step 3 "stop and disable the WSL ollama service (binary stays)"
systemctl disable --now ollama

step 4 "verify"
printf 'socat   : '; socat -V | sed -n 2p
printf 'bwrap   : '; bwrap --version
printf 'ollama enabled: '; systemctl is-enabled ollama || true
printf 'ollama active : '; systemctl is-active ollama || true
printf 'binary kept   : '; ls -l /usr/local/bin/ollama
if ss -ltn | grep -q ':11434 '; then echo "WARNING: something still listens on 11434"; ss -ltnp | grep ':11434 '; exit 1; else echo "port 11434 is free"; fi
echo "Sandbox settings untouched. Done."
