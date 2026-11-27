---
type: project
status: archived
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - docker
project_kind: plan
next: none
related_progress:
  - "[[Hermes System]]"
notes:
  - "[[Hermes Local Build Log]]"
  - "[[Hermes Video Notes]]"
  - "[[Local AI Memory Budget]]"
  - "[[Hermes Primed Home Plan]]"
---
# Hermes Docker Sandbox Plan
## Goal
==Hermes runs every shell command and code run inside a Docker container that sees one mounted folder and nothing else, so a bad tool call or a prompt injection cannot read the rest of the machine.== The agent stays on the host, the Ollama endpoint stays on the host, and the container never needs the GPU. This follows the sandbox video in [[Hermes Video Notes]]. Nothing here has been run yet; the checks below were planned on 2026-11-26.
## Sequence
Before step 1, confirm: Docker Desktop 29.8 is installed with its disk image on `D:\WSL\DockerDesktopWSL` and does not start with Windows; the RAM work in [[Local AI Memory Budget]] is done or this plan waits, because `.wslconfig` caps the WSL VM at 20 GB and Docker shares it; and no part of the vault is mounted.
1. **Changes state.** Decide on updating Hermes. v0.21.3 may predate the fix for Desktop ignoring `docker_volumes` (issues 61115 and 63383 in July and August 2026; the fix status was not confirmed). v0.22 and later need Python 3.14 and, on Windows, the signed MSIX desktop build on Windows 11 22H2 or newer. Back up `D:\Apps\Hermes` first (config, `state.db`, `memories`, `skills`), then run `hermes update`. Done when `hermes --version` shows the new tag and `hermes doctor` is clean.
2. **Changes state.** Lower the `.wslconfig` memory cap to about 8 GB and run `wsl --shutdown`. Done when `wsl -l -v` shows both distributions stopped and a fresh start respects the cap.
3. Start Docker Desktop. Done when `docker info` answers and the data path is on D:.
4. **Changes state.** Create `D:\AI\hermes\workspace` and `D:\AI\hermes\exports`.
5. **Changes state.** Back up `config.yaml`, then set `terminal.backend` to `docker`, `terminal.cwd` to `/workspace`, and `terminal.docker_volumes` to `D:/AI/hermes/workspace:/workspace`. Leave `docker_mount_cwd_to_workspace` false, because the video found it unreliable in the desktop app. The commented options in the config also include `docker_image`, `docker_run_as_host_user`, `docker_forward_env` and `docker_extra_args`. Use `docker_extra_args` for `--memory` and `--cpus` caps and forward no environment variables. Done when `hermes config get terminal.backend` prints `docker`.
6. Restart Hermes and ask it to write `hello.txt`. Done when `docker ps` shows the container, `docker inspect <id> --format "{{json .Mounts}}"` shows exactly one bind mount, and the file is in the host folder.
7. Negative test. Ask Hermes to list `D:\_Anant` and `C:\Users\anant`. Done when both fail because the folders do not exist in the container.
8. **Changes state.** Only after step 7, add read-only mounts for named vault folders with `:ro`, for example `D:/.../Jarvis/40_Resources:/jarvis/resources:ro`, and one writable agent inbox. Never the whole vault, never the home folder. Done when `docker inspect` lists exactly those mounts.
9. Review what the sandbox does not cover. Skills do not necessarily run in the container and `computer_use` drives the real desktop. Look at `hermes secrets` and `hermes egress` (a credential-injection firewall) before giving the agent any key.
*Out of scope this round:* running the whole Hermes instance inside Docker (`nousresearch/hermes-agent`, data in `/opt/data`, gateway on port 8642) with the desktop app as a remote window. It isolates more and makes giving the agent Obsidian harder.
## Open Questions
- [ ] Which container image gives Playwright and Chrome DevTools what they need? The default is `nikolaik/python-nodejs:python3.11-nodejs20`.
- [ ] Should the update in step 1 wait until the other open questions in [[Hermes System]] are settled?
## Corrections
### 2026-11-26: dropped, replaced by the primed home
The plan above stays as written. On 2026-11-26 the owner decided not to build it: a container has to be maintained and primed with its own settings, and the agent would still be cut off from the vault it exists to work in. The replacement is [[Hermes Primed Home Plan]], which keeps the terminal backend `local` and relies on approvals, deny rules, hooks, checkpoints, git and backups ([[Hermes Control Surface]]). What survives from this note: the finding that `docker_mount_cwd_to_workspace` was unreliable in the desktop app, the rule never to mount the home folder, and the fallback of running one risky job class in a container later. The two open questions above are closed with the plan.
