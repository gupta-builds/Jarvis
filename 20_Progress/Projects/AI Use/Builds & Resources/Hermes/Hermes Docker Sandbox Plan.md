---
type: reference
status: seed
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - docker
  - runbook
reference_kind: runbook
machine: acer
notes:
  - "[[Hermes System]]"
  - "[[Hermes Local Build Log]]"
  - "[[Hermes Video Notes]]"
  - "[[Local AI Memory Budget]]"
next: Decide whether to update Hermes to the current stable tag first, then run step 1.
---
# Hermes Docker Sandbox Plan
## Why This Note Exists
Hermes runs commands and code on the host by default, so a prompt injection or a bad tool call can read any file the user account can. This note plans the Docker terminal backend: the agent stays on the host, but every shell command and code run happens in a container that sees only the folders mounted into it. It follows the sandbox video in [[Hermes Video Notes]]. ==The goal is access without execution: the agent sees chosen files and runs code only inside the container.== Nothing here has been run yet.
## Gate
- Docker Desktop 29.8 is installed and its disk image is on `D:\WSL\DockerDesktopWSL`. It does not start with Windows.
- The RAM work in [[Local AI Memory Budget]] is done, or the Docker phase waits. `.wslconfig` caps the WSL VM at 20 GB and Docker shares it.
- No part of the vault is mounted. Only a dedicated folder is.
- The Ollama endpoint stays on the host. The container never needs the GPU.
## Steps
1. **Changes state.** Decide on updating Hermes. v0.21.3 may predate the fix for Desktop ignoring `docker_volumes` (issues 61115 and 63383 in July and August 2026; the fix status was not confirmed). v0.22 and later need Python 3.14 and, on Windows, the signed MSIX desktop build on Windows 11 22H2 or newer. Back up `D:\Apps\Hermes` first (config, `state.db`, `memories`, `skills`), then run `hermes update`.
2. **Changes state.** Lower the `.wslconfig` memory cap (a value near 8 GB) and run `wsl --shutdown`.
3. Start Docker Desktop and confirm `docker info` works and the image path is on D:.
4. **Changes state.** Create `D:\AI\hermes\workspace` and `D:\AI\hermes\exports`.
5. **Changes state.** Back up `config.yaml`, then set `terminal.backend` to `docker`, `terminal.cwd` to `/workspace`, and `terminal.docker_volumes` to `D:/AI/hermes/workspace:/workspace`. Leave `docker_mount_cwd_to_workspace` false, because the video found it unreliable in the desktop app. The commented options in the config also include `docker_image`, `docker_run_as_host_user`, `docker_forward_env` and `docker_extra_args`. Use `docker_extra_args` for `--memory` and `--cpus` caps, and forward no environment variables.
6. Restart Hermes and ask it to write `hello.txt`. Confirm the container exists with `docker ps`, then run `docker inspect <id> --format "{{json .Mounts}}"`. Expect exactly one bind mount, and the file in the host folder.
7. Negative test: ask Hermes to list `D:\_Anant` and `C:\Users\anant`. Both must fail because the folders do not exist in the container.
8. **Changes state.** Only after step 7, add read-only mounts for named vault folders with `:ro`, for example `D:/.../Jarvis/40_Resources:/jarvis/resources:ro`, and one writable agent inbox. Never the whole vault, never the home folder.
9. Review what the sandbox does not cover. Skills do not necessarily run in the container, and `computer_use` drives the real desktop. Look at `hermes secrets` and `hermes egress` (a credential-injection firewall) before giving the agent any key.
## Checkpoints
None yet. Nothing in this note has been run.
## Open Questions
- Which container image gives Playwright and Chrome DevTools what they need? The default is `nikolaik/python-nodejs:python3.11-nodejs20`.
- Should the whole agent run inside Docker later (`nousresearch/hermes-agent`, data in `/opt/data`, gateway on port 8642), with the desktop app as a remote window? It is stronger isolation and harder to give the agent Obsidian.
