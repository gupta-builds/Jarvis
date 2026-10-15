#!/usr/bin/env bash
# 71-hostkey-fingerprint.sh (2026-10-15). Run on the DELL in WSL:  sudo bash 71-hostkey-fingerprint.sh
# Prints the SHA256 fingerprint of Tailscale SSH's ed25519 host key, so it can be compared with the one the Acer accepted.
# Why this exists: Tailscale stores the key as a plain PKCS8 PEM ("BEGIN PRIVATE KEY"), which ssh-keygen -lf rejects ("is not a key file").
# Only the PUBLIC half is derived and hashed; the private key is never printed. Method verified against ssh-keygen on a test key.
set -euo pipefail
[ "$(id -u)" -eq 0 ] || { echo "Run with sudo: sudo bash $0"; exit 1; }
KEY=/var/lib/tailscale/ssh/ssh_host_ed25519_key
echo "key file header: $(head -n 1 "$KEY")"
FP=$(openssl pkey -in "$KEY" -pubout -outform DER | tail -c 32 | { printf '\0\0\0\x0bssh-ed25519\0\0\0\x20'; cat; } | openssl dgst -sha256 -binary | base64 | tr -d '=')
echo "Dell host key fingerprint : SHA256:$FP"
echo "Fingerprint the Acer holds: SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA"
if [ "SHA256:$FP" = "SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA" ]; then echo "RESULT: MATCH"; else echo "RESULT: DIFFERENT (stop; do not accept another key)"; exit 2; fi
