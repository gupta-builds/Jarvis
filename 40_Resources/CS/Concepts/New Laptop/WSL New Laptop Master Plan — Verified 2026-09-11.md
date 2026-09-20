---
type: concept
status: sprout
created: 2026-09-11
updated: 2026-09-19
course: Life
track:
  - laptop
  - wsl
  - ai-infrastructure
mastery_level: 1
prerequisites:
  - "[[New Laptop Setup]]"
  - "[[Ubuntu - WSL]]"
  - "[[WSL Session Briefing]]"
  - "[[Jarvis MCP and REST API Setup]]"
  - "[[VS Code Professional Setup]]"
used_in: []
evidence:
  - "Live WSL inspection on 2026-09-11"
  - "Official WSL, uv, GitHub CLI, VS Code, and Obsidian plugin documentation checked on 2026-09-11"
tags:
  - concept
  - cards/laptop
related:
  - "[[New Laptop Setup]]"
  - "[[Ubuntu - WSL]]"
  - "[[WSL Session Briefing]]"
  - "[[Jarvis MCP and REST API Setup]]"
  - "[[VS Code Professional Setup]]"
---

> [!WARNING]
> **Further correction, 2026-09-15.** The 2026-09-13 callout below (WSL onto C:) is itself reversed. Confirmed real Acer split is ~310GB C: / ~690GB D:; the WSL VHDX's unbounded growth (Docker included) risks C:'s headroom, so WSL and Docker's WSL disk go back onto **D:** (`D:\WSL\Ubuntu`, `D:\WSL\Docker`). Use D: for every drive-letter prompt in the commands below. See [[Installations]] for the full reasoning. This supersedes the callout immediately below.

> [!WARNING]
> **WSL placement reversed 2026-09-13.** Phase 2 below still describes installing WSL onto a D: data volume or a dedicated second disk. That is superseded: WSL now goes entirely on **C:** (e.g. `C:\WSL\Ubuntu`), with Docker's WSL disk image at `C:\WSL\Docker`. Substitute `C:` wherever these phases prompt for or reference a WSL/data drive letter. See [[Installations]] for the current rule.

# WSL New Laptop Master Plan — Verified 2026-09-11

> [!IMPORTANT] Superseded by actual execution, 2026-09-18
> WSL is fully installed and configured on the Acer as of 2026-09-18 - this note's phase-by-phase runbook below is historical (it's what was planned, not always what actually ran) and no longer needs following. Real execution diverged from it in a few specific ways worth knowing before trusting anything below verbatim: `gh` was installed from Ubuntu's own default apt repo, not GitHub's separate signed repo (simpler, avoided a real corruption bug); Yazi needed a GitHub-release binary, not `cargo install`; the swap file needed its own explicit `.wslconfig` redirect that this plan never mentions; and SSH-key migration was dropped entirely in favor of `gh`'s HTTPS credential helper. For the current, real state of the machine and what's still open, see [[Ubuntu - WSL#Current State - Acer, as of 2026-09-18]] and the full log in [[Acer Live State — 2026-09-16#WSL execution log — 2026-09-18]]. **What's still genuinely useful here going forward:** the [[WSL New Laptop Master Plan — Verified 2026-09-11#Maintenance Cadence|Maintenance Cadence]] section at the end of this note, and this plan's own decision reasoning if WSL is ever rebuilt from scratch on a third machine.

## One-Line Answer

This is the corrected, hardware-gated map for rebuilding WSL on the new Windows laptop: audit the physical disks first; use one data volume on a one-SSD machine or a second physical SSD when one is actually installed; install Ubuntu 24.04 as WSL 2 under the chosen Windows volume’s `<letter>:\\WSL\\Ubuntu` path; keep Linux projects under the Linux filesystem; use nvm + pnpm + uv with per-project isolation; authenticate GitHub before migrating code; recreate MCP from live Obsidian settings and fresh secrets; and verify every layer before copying or deleting anything.

## Source-note map

This note is the execution index for all seven notes in the New Laptop folder. Their background remains useful, but dated execution results are historical evidence, not current truth.

- [[New Laptop Setup]] — Windows-side architecture decisions, Day 1 ordering, drive layout, app installation, and the hand-off into WSL (formerly a separate note, "Windows Setup Master Plan", now merged and deleted).
- [[New Laptop Setup#PART 0 — WHAT WENT WRONG ON THIS LAPTOP (THE HONEST AUDIT)]] — historical Windows/WSL mistakes.
- [[New Laptop Setup#PART 4 — DAY 1 WSL SETUP (CRITICAL — DO THIS BEFORE USING WSL)]] — original WSL phases; corrected below.
- [[New Laptop Setup#PART 5 — PYTHON ENVIRONMENTS: WHAT WENT WRONG AND HOW TO DO IT RIGHT]] — Python isolation model; corrected uv details below.
- [[New Laptop Setup#PART 6 — NODE.JS STRATEGY]] — original nvm plan; retain nvm, discard unsupported fnm claim.
- [[New Laptop Setup#PART 7 — CLAUDE CODE + MCP SETUP]] — original Windows/MCP plan; use the WSL-native config below.
- [[New Laptop Setup#PART 8 — BACKUP STRATEGY (THE GAP)]] — backup intent; do not use its unsafe auto-commit alias.
- [[New Laptop Setup#PART 9 — ONGOING MAINTENANCE (WHAT PROFESSIONAL DEVELOPERS ACTUALLY DO)]] — maintenance intent; VHDX compaction remains Windows-side.
- [[Ubuntu - WSL#Mechanism]] — VHDX and filesystem-performance model.
- [[Ubuntu - WSL#Failure Modes / Misconceptions]] — why deletion does not automatically shrink a VHDX.
- [[WSL Session Briefing#Concrete task checklist (investigate and confirm each before changing anything — do not batch-apply fixes you haven't individually verified are still needed)]] — audit-first discipline.
- [[WSL Session Briefing#Execution Results (2026-08-26 WSL session)]] — historical fixes and findings.
- [[WSL Session Briefing#Final closure (2026-08-26, Windows-side verification of the WSL session's last report)]] — historical repo inventory; stale now.
- [[Jarvis MCP and REST API Setup#Mechanism]] — two MCP paths and config scope.
- [[Jarvis MCP and REST API Setup#New Laptop Checklist]] — vault/plugin/key checklist; ports must be re-read.
- [[VS Code Professional Setup#Part 9 — Remote Development: what's actually happening under the hood]] — WSL server/extensions.
- [[VS Code Professional Setup#Suggested build order for the next VS Code session (for discussion, not started)]] — optional editor backlog, not WSL installation.

## Verified current baseline — 2026-09-11

Live inspection of the current WSL environment found:

- Ubuntu 24.04.4 LTS; WSL 2 kernel 5.15.167.4.
- D:\WSL\Ubuntu\ext4.vhdx exists and is approximately 103 GB.
- /etc/wsl.conf has systemd=true, default user anant_gupta, and interop settings. It correctly has no [wsl2] section.
- %UserProfile%\.wslconfig currently has networkingMode=mirrored, firewall=true, memory=16GB, processors=8. free -h reports 15 GiB and nproc reports 8.
- Interactive nvm resolves default and lts/* to Node v24.14.1. fnm is not installed.
- Installed tools report Node 24.14.1, npm 11.11.0, pnpm 10.33.2, uv 0.10.9, and Python 3.12.3.
- Git identity is Anant Gupta <anantmahi721@gmail.com>; autocrlf=false, default branch main, pull.rebase=true. No work conditional include exists.
- SSH private/public keys exist with modes 600/644.
- gh auth status is currently invalid for gupta-builds. GitHub backup/push is therefore not verified.
- There are 58 Git repositories under ~/projects, including many nested sandbox repositories. The old four-category/21-repository inventory is stale.
- ~/.vscode-server/bin and ~/.cursor-server/bin each contain one hash directory, but their total directories are about 5.3 GB and 3.6 GB. Do not remove anything while an editor is running.
- Caches are about 5.9 GB ~/.npm, 44 MB ~/.cache/uv, and 4.1 GB ~/.local/share/pnpm; the old “already cleaned” numbers are stale.
- MCP endpoint probes returned no response because Obsidian was not running/reachable during the probe; this did not validate or invalidate the keys.
- WSL logs still show recurring CheckConnection getaddrinfo/connect failures and an occasional telemetry buffer error. The earlier “fixed-pending-confirmation” conclusion is no longer current.

## Decisions and corrections

### WSL configuration files

Use /etc/wsl.conf only for per-distro settings: [boot], [user], [interop], [automount], and related distro options. Use %UserProfile%\.wslconfig for WSL 2 VM settings such as memory, processors, swap, and networking. Putting memory/processors in /etc/wsl.conf is wrong. See [Microsoft’s WSL configuration reference](https://learn.microsoft.com/en-us/windows/wsl/wsl-config).

### Node

The supposed deeper WSL plan at /home/anant_gupta/.claude/plans/new-laptop-setup.md never existed. Its fnm performance claim is not evidence. The live system’s nvm is working interactively, so the initial new-laptop mirror is nvm, not fnm. Use only the LTS version until a real project needs another version. The current nvm release checked on this date is v0.40.7: [nvm releases](https://github.com/nvm-sh/nvm/releases).

### GitHub credentials

Do not run git config --global credential.helper store; it writes credentials in plaintext and conflicts with the GitHub CLI helper. Use gh auth login and gh auth setup-git. Do not copy the current invalid gh credential or ~/.mcp.env.

### Shell files and secrets

Do not copy .bashrc wholesale. The current file starts an SSH agent, duplicates .profile initialization, and contains a hardcoded Firecrawl API key. Recreate safe nvm/uv/MCP initialization and place secrets in a mode-600 file. Never place API keys in this note, a Git repository, or shell history.

### Source-plan commands that are not retained

- The source plan’s [wsl2] block inside /etc/wsl.conf is wrong.
- Its “manual tar import is the only safe WSL install” claim is stale; current WSL supports --location.
- Its Store first-run plus sudo adduser sequence is wrong if the user was already created by first launch.
- Its blanket nvm install 20/24 plan is stale; install only project-required versions.
- Its gh install through an unspecified Ubuntu archive is replaced by GitHub’s official signed repository.
- Its credential.helper store line is rejected.
- Its uv init comment is wrong: uv init creates project metadata; .venv/uv.lock are created lazily when needed.
- Its Jupyter kernel name placeholder is not copyable; use a real project name.
- Its auto gitpush alias is unsafe.
- Its exact 150 GB C: recommendation and “25+ GB” hiberfile saving claim are hardware-dependent, not guarantees.
- VS Code Tasks, Debugging, Test Explorer, Profiles, multi-root workspaces, and Task Scheduler are research/backlog items in [[VS Code Professional Setup]], not prerequisites.

## New-laptop runbook

## Phase 0 — migration boundary

This is a fresh WSL install, not a VHDX copy.

Restore only after review:

- D:\Users\_Anant\ and the two vaults.
- The SSH key via encrypted/secure transfer.
- Safe Git and shell settings.
- Project source only after Git status and remote state are recorded.

Do not restore:

- The old WSL VHDX, node_modules, .venv, build output, caches, crash dumps, or editor server folders.
- ~/.mcp.env, raw API keys, GitHub tokens, Claude credential files, or hardcoded secrets.
- Unreviewed repository changes.

Before any destructive operation, inventory every repo. Current uncommitted work exists in multiple repositories, including hub/portfolio, hub/Assisto_website, hub/tradingview, hackathon/Resq, hub/DNA_BJJ_APP, hub/GymMangment_app_demo, ai/claude/second-brain-claudekit, and work/internship-research-loop.

## Phase 1 — Windows prerequisites

Complete the Windows-side audit before touching partitions, WSL, Docker, or imported files.

1. Confirm the exact Acer model/SKU, Windows edition/build, BitLocker status and recovery-key availability.
2. Run the read-only PowerShell inventory supplied in the current session. It must show `Get-Disk`, `Get-Partition`, and `Get-Volume` output.
3. Decide whether the laptop has one installed physical SSD or a second physical SSD. Do not infer physical-disk count from the advertised “1 TB” capacity.
4. If a clean slate is wanted and the import contains no needed files, use Windows Reset this PC only after confirming the recovery path. For a clean baseline choose Remove everything + Cloud download; do not enable “restore preinstalled apps” if the intention is to remove OEM customizations. Keep Acer hardware drivers/PredatorSense only if they are needed, and reinstall them later from Acer support.
5. After Windows Update and the hardware decision, create at most C: and a data volume on a one-SSD machine. Use a second physical disk for WSL/Docker only when `Get-Disk` proves it exists and it is empty/backed up.

Do not delete `C:\Windows`, `C:\Program Files\WindowsApps`, `C:\ProgramData`, EFI/MSR/Recovery/OEM partitions, or broad `AppData` trees.

## Phase 2 — WSL engine and Ubuntu on D:

Run in elevated PowerShell. Microsoft documents these flags in [Basic commands for WSL](https://learn.microsoft.com/en-us/windows/wsl/basic-commands).

~~~powershell
wsl --install --no-distribution
~~~

Restart if requested. Then reopen elevated PowerShell:

~~~powershell
wsl --update
wsl --set-default-version 2
wsl --list --online
~~~

Before installation, assign and record a stable drive letter to the dedicated, empty WSL/Linux disk in Windows Disk Management. The new laptop’s letter must not be assumed to be D:. Install without launching:

~~~powershell
$wslDriveLetter = Read-Host "Enter the single drive letter assigned to the dedicated WSL disk (for example, E)"
if ($wslDriveLetter -notmatch '^[A-Za-z]$') { throw "Enter exactly one drive letter, without a colon." }
$wslRoot = "${wslDriveLetter}:\WSL\Ubuntu"
New-Item -ItemType Directory -Path $wslRoot -Force
wsl --install --distribution Ubuntu-24.04 --location $wslRoot --no-launch
wsl --set-default Ubuntu-24.04
wsl --list --verbose
~~~

Expected result: Ubuntu-24.04 appears as version 2. If the online list uses another exact name, use that name consistently in every later command. Do not use bare `wsl --install` when placement matters. The old claim that `--location` cannot be used is false.

Tar import is only a fallback when the needed distro is not available through install:

~~~powershell
$tarPath = Read-Host "Enter the full path to the Ubuntu tar file"
if (-not (Test-Path -LiteralPath $tarPath -PathType Leaf)) { throw "Tar file not found: $tarPath" }
wsl --import Ubuntu-24.04 $wslRoot $tarPath --version 2
~~~

The import syntax is documented in [Import any Linux distribution to use with WSL](https://learn.microsoft.com/en-us/windows/wsl/use-custom-distro). Imported distros start as root and use /etc/wsl.conf for their default user.

## Phase 3 — first launch and /etc/wsl.conf

Launch:

~~~powershell
wsl -d Ubuntu-24.04
~~~

For a Store-installed distro, complete the first-run username/password prompt using anant_gupta. Do not then run adduser for the same user.

For a tar-imported root session only:

~~~bash
adduser anant_gupta
usermod -aG sudo anant_gupta
passwd anant_gupta
~~~

Configure the distro; there is intentionally no [wsl2] section:

~~~bash
sudo tee /etc/wsl.conf >/dev/null <<'EOF'
[boot]
systemd=true

[user]
default=anant_gupta

[interop]
enabled=true
appendWindowsPath=true
EOF
~~~

Restart only this distro:

~~~powershell
wsl --terminate Ubuntu-24.04
wsl -d Ubuntu-24.04
~~~

Verify:

~~~bash
whoami
systemctl is-system-running
cat /etc/wsl.conf
~~~

If systemd is degraded, inspect before editing:

~~~bash
systemctl --failed --no-legend
journalctl -b -p warning..alert --no-pager
~~~

Reference: [Microsoft systemd for WSL](https://learn.microsoft.com/en-us/windows/wsl/systemd).

## Phase 4 — .wslconfig and networking decision

If the new machine is comparable to the current 32 GB/12-logical-processor machine, use the tested 16 GB/8-processor cap:

~~~powershell
@'
[wsl2]
memory=16GB
processors=8
'@ | Set-Content -Path "$env:USERPROFILE\.wslconfig" -Encoding ascii
wsl --shutdown
~~~

Verify:

~~~powershell
wsl -d Ubuntu-24.04 -- free -h
wsl -d Ubuntu-24.04 -- nproc
~~~

Do not copy networkingMode=mirrored as a required fix. It is supported on Windows 11 22H2+, but the current machine still produces recurring CheckConnection errors while using it. Start the new laptop with default NAT. Enable mirrored only after a concrete localhost/VPN requirement and a clean baseline test:

~~~ini
networkingMode=mirrored
~~~

References: [WSL configuration](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) and [WSL networking](https://learn.microsoft.com/en-us/windows/wsl/networking).

## Phase 5 — Linux prerequisites and GitHub CLI

Inside Ubuntu:

~~~bash
sudo apt update
sudo apt full-upgrade -y
sudo apt install -y git git-lfs curl wget build-essential unzip zip ca-certificates gnupg
git --version
git lfs version
~~~

Install gh from its official signed repository:

~~~bash
type -p wget >/dev/null || sudo apt install -y wget
sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg >/dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
sudo mkdir -p -m 755 /etc/apt/sources.list.d
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
sudo apt update
sudo apt install -y gh
gh --version
~~~

Reference: [GitHub CLI Linux installation](https://github.com/cli/cli/blob/trunk/docs/install_linux.md).

## Phase 6 — SSH, gh, and Git identity

Restore the existing key securely into ~/.ssh/, then:

~~~bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
ssh -T git@github.com
~~~

Authenticate GitHub; the browser flow is deliberate:

~~~bash
gh auth login --hostname github.com --web --git-protocol https
gh auth setup-git
gh auth status
~~~

Configure non-secret Git defaults:

~~~bash
git config --global user.name "Anant Gupta"
git config --global user.email "anantmahi721@gmail.com"
git config --global core.autocrlf false
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global --get-regexp '^(user|core\.autocrlf|init\.defaultBranch|pull\.rebase)'
~~~

Do not set credential.helper store. Use a conditional work identity only if a real work directory and correct work email have been decided.

## Phase 7 — nvm, Node, and pnpm

Install the pinned nvm release and the current LTS:

~~~bash
export NVM_VERSION=v0.40.7
curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | bash
unset NVM_VERSION
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm alias default 'lts/*'
nvm use default
node --version
npm --version
~~~

Keep nvm in the interactive profile. Do not override cd automatically until there is a demonstrated need. Add .nvmrc only when a real project requires a specific version; do not write 20 into every repository.

For pnpm, use Corepack when the installed Node release provides it. Node.js no longer bundles Corepack starting with Node 25, so the fallback is explicit:

~~~bash
if command -v corepack >/dev/null 2>&1; then
  corepack enable
  corepack install --global pnpm@latest
else
  npm install --global pnpm@latest
fi
pnpm --version
~~~

Keep dependencies per-project. Do not blindly mirror the current global list. The old prefer-offline setting is optional; current WSL reports false and works:

~~~bash
npm config set prefer-offline true
npm config get prefer-offline
~~~

## Phase 8 — uv and Python projects

Install uv:

~~~bash
curl -LsSf https://astral.sh/uv/install.sh | sh
. "$HOME/.local/bin/env"
uv --version
~~~

uv init creates project metadata; .venv and uv.lock are lazy-created. For a genuinely new project:

~~~bash
mkdir -p "$HOME/projects/ai/example-project"
cd "$HOME/projects/ai/example-project"
uv init
uv add requests
uv sync
uv run python -c 'import requests; print(requests.__version__)'
~~~

For an existing project with pyproject.toml:

~~~bash
cd "$HOME/projects/ai/existing-project"
uv sync
uv run python --version
~~~

Do not run uv init when pyproject.toml already exists. Add only a named dependency after review. The following is syntax, not a migration command until a real package is chosen:

~~~bash
uv add package-name
~~~

Use [uv features](https://docs.astral.sh/uv/getting-started/features/) and [uv environments](https://docs.astral.sh/uv/pip/environments/) as authority. Keep Miniconda, if still desired, as a Windows-only Jupyter exception; it is not required inside WSL.

## Phase 9 — Jupyter and WSL VS Code

For a real project notebook:

~~~bash
cd "$HOME/projects/ai/example-project"
uv add --dev ipykernel
uv run ipython kernel install --user --env VIRTUAL_ENV "$PWD/.venv" --name=example-project
uv run --with jupyter jupyter lab
~~~

Open the project in WSL-aware VS Code:

~~~bash
cd "$HOME/projects/ai/example-project"
code .
~~~

Select example-project in the kernel picker. WSL-side extensions are separate from Windows-side extensions. See [[VS Code Professional Setup#Part 9 — Remote Development: what's actually happening under the hood]], [[VS Code Professional Setup#Part 10 — Settings Sync: the actual new-laptop lever]], and [Remote development in WSL](https://code.visualstudio.com/docs/remote/wsl-tutorial).

The Tasks/Debugging/Test Explorer/Profiles/multi-root/Task Scheduler material in [[VS Code Professional Setup#Part 1 — Tasks: the professional's one-keystroke command layer]] through [[VS Code Professional Setup#Part 13 — Adjacent, not VS Code itself: Windows Task Scheduler]] is optional backlog, not an install prerequisite.

## Phase 10 — project taxonomy and read-only inventory

Create directories without moving existing repositories:

~~~bash
mkdir -p "$HOME/projects"/{ai,hub,hackathon,scratch,work}
mkdir -p "$HOME/tools"
~~~

The current machine also has umn/ and nested repositories. Do not flatten or delete it. Clone/restore only after gh authentication succeeds.

Inventory repositories:

~~~bash
find "$HOME/projects" -type d -name .git -prune -print | sort
~~~

Read-only status inventory:

~~~bash
find "$HOME/projects" -type d -name .git -prune -print | sort |
while IFS= read -r git_dir; do
  repo_dir=$(dirname "$git_dir")
  printf '\n## %s\n' "$repo_dir"
  git -C "$repo_dir" status --short --branch
done
~~~

Do not commit, push, merge, rebase, delete, or unregister from this inventory command. Resolve each modified, untracked, ahead, behind, or divergent repository deliberately.

## Phase 11 — WSL-native MCP

The live Obsidian plugin files show:

- Jarvis: HTTPS 27126; HTTP/insecure 27123 enabled.
- The Plan: HTTPS 27125; HTTP/insecure 27124 enabled.

The WSL configuration intentionally contains four servers:

- `jarvis`: HTTP `http://127.0.0.1:27123/mcp/`, bearer token from `JARVIS_OBSIDIAN_API_KEY`.
- `the-plan`: HTTP `http://127.0.0.1:27124/mcp/`, bearer token from `THE_PLAN_OBSIDIAN_API_KEY`.
- `jarvis-fs`: stdio filesystem access to the Jarvis vault directory.
- `github`: stdio GitHub server with `GITHUB_PERSONAL_ACCESS_TOKEN`.

`the-plan-fs` is deliberately not configured. The Plan remains available through its HTTP MCP server, with the same tool policy as Jarvis: all vault tools are enabled except `vault_delete`. This policy is represented in Codex by `disabled_tools = ["vault_delete"]` and in Claude Code by wildcard allow rules plus explicit deny rules.

Do not copy a Windows project-local MCP file into WSL. Its Windows paths and command assumptions will not resolve correctly. The WSL filesystem server path must be generated from the actual Windows data-volume letter selected on the new laptop.

After Obsidian is installed, both vaults are opened, and the fresh Local REST API keys and GitHub token exist, run this in WSL. It writes only the new WSL client configuration; it does not print secrets:

~~~bash
read -r -p "Enter the Windows data-drive letter (for example, D): " data_drive_letter
data_drive_letter=$(printf '%s' "$data_drive_letter" | tr '[:upper:]' '[:lower:]')
case "$data_drive_letter" in
  [a-z]) ;;
  *) printf 'Enter one Windows data-drive letter, without a colon.\n' >&2; return 1 2>/dev/null || exit 1 ;;
esac
vault_root="/mnt/$data_drive_letter/Users/_Anant/10_Areas/Documents/Jarvis"
test -d "$vault_root" || { printf 'Vault path not found: %s\n' "$vault_root" >&2; return 1 2>/dev/null || exit 1; }

cat > "$HOME/.mcp.json" <<EOF
{
  "mcpServers": {
    "jarvis": {
      "type": "http",
      "url": "http://127.0.0.1:27123/mcp/",
      "headers": { "Authorization": "Bearer ${JARVIS_OBSIDIAN_API_KEY}" }
    },
    "the-plan": {
      "type": "http",
      "url": "http://127.0.0.1:27124/mcp/",
      "headers": { "Authorization": "Bearer ${THE_PLAN_OBSIDIAN_API_KEY}" }
    },
    "jarvis-fs": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "$vault_root"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": { "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}" }
    }
  }
}
EOF
chmod 600 "$HOME/.mcp.json"
~~~ 

Create `~/.mcp.env` with fresh values only after the new Obsidian plugins generate keys and GitHub authentication is complete. Set mode 600, source it only from a safe shell initialization path, and never print or commit it. Prefer HTTPS if the client can trust the plugin’s self-signed certificate.

The endpoint check below proves reachability only; it does not validate the bearer key:

~~~bash
for endpoint in \
  "http://127.0.0.1:27123/mcp/" \
  "http://127.0.0.1:27124/mcp/"; do
  curl --max-time 5 -sS -o /dev/null -w "%{http_code} %{url_effective}\n" "$endpoint" || true
done
~~~

## Phase 12 — safe shell baseline

On a fresh profile, recreate safe blocks once:

~~~bash
cat >> "$HOME/.bashrc" <<'EOF'

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

[ -f "$HOME/.mcp.env" ] && . "$HOME/.mcp.env"
EOF
~~~

Do not run this append repeatedly. Remove duplicates manually on an existing profile. Do not add hardcoded Firecrawl credentials, automatic cd hooks, or automatic SSH-agent startup until explicitly chosen.

Test interactive and login behavior:

~~~bash
bash -ic 'command -v nvm; nvm current; node --version'
bash -lc 'command -v node; node --version'
~~~

Interactive shell functions are not guaranteed in noninteractive scripts; source nvm deliberately or use a known project runtime path.

## Phase 13 — completion gates

Run all of these before declaring the mirror complete.

~~~powershell
wsl --status
wsl --list --verbose
wsl -d Ubuntu-24.04 -- cat /etc/os-release
wsl -d Ubuntu-24.04 -- free -h
wsl -d Ubuntu-24.04 -- nproc
~~~

~~~bash
whoami
command -v git
git --version
git lfs version
command -v node
node --version
npm --version
pnpm --version
uv --version
python3 --version
gh auth status
git config --global --get user.email
git config --global --get credential.helper
~~~

The helper must be deliberate and not plaintext store. Also confirm:

1. Obsidian is open with both vaults and Local REST API enabled.
2. Each vault’s current port and fresh API key were read from its own settings.
3. MCP secrets exist by variable name without printing values.
4. Jarvis, The Plan, filesystem, and GitHub MCP servers start without errors.
5. code . opens a WSL remote window and the terminal shows Linux paths.
6. Python/Jupyter extensions are installed in the WSL remote context after opening a real project.
7. Every repository has an explicit backup/ownership decision.

## Phase 14 — maintenance and VHDX

Inside WSL, prefer verification before destructive cleanup:

~~~bash
npm cache verify
uv cache clean
pnpm store prune
~~~

Use `npm cache clean --force` only when reclaiming npm cache is intentional. None of these commands compacts the Windows VHDX.

Free Linux blocks first:

~~~bash
sudo fstrim -av
~~~

Only after closing WSL, editors, and Docker, confirm the exact Windows file before any host-side compaction. Enter the drive letter assigned to the dedicated WSL disk; do not assume D::

~~~powershell
$wslDriveLetter = Read-Host "Enter the single drive letter assigned to the dedicated WSL disk (for example, E)"
if ($wslDriveLetter -notmatch '^[A-Za-z]$') { throw "Enter exactly one drive letter, without a colon." }
$wslVhdx = "${wslDriveLetter}:\WSL\Ubuntu\ext4.vhdx"
wsl --shutdown
Get-Item -LiteralPath $wslVhdx
~~~

Do not paste an unqualified diskpart compact command. VHDX compaction is Windows-host work; the VHDX is not a backup. Microsoft’s disk guidance is [How to manage WSL disk space](https://learn.microsoft.com/en-us/windows/wsl/disk-space).

## Open items

- Current gh authentication is invalid and must be repaired.
- The current 58-repository inventory contains active modified/untracked/ahead/behind work; it is not ready for blind migration.
- CheckConnection errors still recur; test default NAT and mirrored networking deliberately on the new laptop.
- Confirm new-laptop Windows build and RAM/CPU before copying the 16 GB/8-processor cap.
- Decide Windows Node strategy separately from WSL nvm.
- Decide whether Windows Miniconda remains a Jupyter-only exception.
- Generate fresh Obsidian API keys and read both vaults’ current ports before configuring MCP.

## Official references and evidence

- [[New Laptop Setup#PART 4 — DAY 1 WSL SETUP (CRITICAL — DO THIS BEFORE USING WSL)]]
- [[New Laptop Setup#PART 5 — PYTHON ENVIRONMENTS: WHAT WENT WRONG AND HOW TO DO IT RIGHT]]
- [[New Laptop Setup#PART 6 — NODE.JS STRATEGY]]
- [[New Laptop Setup#PART 7 — CLAUDE CODE + MCP SETUP]]
- [[New Laptop Setup#PART 8 — BACKUP STRATEGY (THE GAP)]]
- [[New Laptop Setup#PART 9 — ONGOING MAINTENANCE (WHAT PROFESSIONAL DEVELOPERS ACTUALLY DO)]]
- [[Ubuntu - WSL#Contrast / What It Is Not]]
- [[Ubuntu - WSL#Failure Modes / Misconceptions]]
- [[WSL Session Briefing#What the Windows-side sessions already fixed (context, not yours to redo)]]
- [[WSL Session Briefing#Windows-side follow-up (2026-08-26, after the WSL session's report above)]]
- [[WSL Session Briefing#Follow-Up: .wslconfig Fix Verification + Repo Decisions (2026-08-26, continued)]]
- [[Jarvis MCP and REST API Setup#Mechanism]]
- [[Jarvis MCP and REST API Setup#Failure Modes / Misconceptions]]
- [[VS Code Professional Setup#Part 9 — Remote Development: what's actually happening under the hood]]
- [Install WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
- [Basic commands for WSL](https://learn.microsoft.com/en-us/windows/wsl/basic-commands)
- [Advanced WSL configuration](https://learn.microsoft.com/en-us/windows/wsl/wsl-config)
- [Working across file systems](https://learn.microsoft.com/en-us/windows/wsl/filesystems)
- [Remote development in WSL](https://code.visualstudio.com/docs/remote/wsl-tutorial)
- [GitHub CLI auth](https://cli.github.com/manual/gh_auth_login)
- [uv installation](https://docs.astral.sh/uv/getting-started/installation/)
- [uv with Jupyter](https://docs.astral.sh/uv/guides/integration/jupyter/)
- [Obsidian Local REST API with MCP](https://github.com/coddingtonbear/obsidian-local-rest-api)

## Flashcards

Why do WSL memory and processor caps belong in .wslconfig?::Because .wslconfig configures the WSL 2 VM globally while /etc/wsl.conf configures one distro.
#cards/laptop

What is the initial Node strategy?::nvm with the current LTS as default; install only project-required extra versions. The old fnm authority did not exist.
#cards/laptop

Why not copy ~/.mcp.env?::It contains machine-specific Obsidian keys and GitHub credentials; recreate secrets on the new laptop.
#cards/laptop

What blocks claiming GitHub backup is ready?::gh auth status is currently invalid, and the repositories contain active local work that must be reviewed.
#cards/laptop

Why do projects live in ~/projects?::Linux tools avoid the slower cross-filesystem bridge used by /mnt/c and /mnt/d.
#cards/laptop
## Hardware-gated clean-start addendum — Acer received 2026-09-11

### What is actually verified

The uploaded Windows About screenshot is a **Dell Latitude 5530**, not the Acer. It shows an Intel Core i7-1255U, 32 GB DDR4-3200 memory, Intel Iris Xe integrated graphics, and approximately 954 GB usable storage with 566 GB used. The current WSL terminal also reports host DESKTOP-3VBG0JH, Ubuntu 24.04.4, and C:/D: mounts sized like the old Dell. This session therefore cannot truthfully inspect the new Acer’s disk table.

Acer lists multiple Predator Helios Neo 16S AI PHN16S-71 configurations. One official US configuration lists Core Ultra 9 275HX, 24 cores, 32 GB DDR5, RTX 5070 Ti with 12 GB, and a 1 TB PCIe 4.0 NVMe SSD. Another official Acer configuration lists Core Ultra 7 255HX, 32 GB DDR5, RTX 5060 with 8 GB, and a 1 TB SSD with one of two M.2 2280 slots empty. The family name plus “32 GB/1 TB” is not enough to establish the exact CPU, GPU, installed physical-disk count, or available second slot. Confirm the SKU on the laptop before applying model-specific conclusions.

Evidence: [Acer US PHN16S-71-98RF specifications](https://www.acer.com/us-en/predator/laptops/helios/helios-neo-16s-ai/pdp/NH.U0KAA.001), [Acer PHN16S-71 configuration showing storage slots](https://www.acer.com/jp-ja/predator/laptops/helios/helios-neo-16s-ai/pdp/NH.QX9SJ.004), [Microsoft WSL installation commands](https://learn.microsoft.com/en-us/windows/wsl/basic-commands).

### First action on the Acer — read-only audit

Open PowerShell, not WSL, and run this block. It makes no partition, deletion, installation, or authentication change and does not print environment-variable values:

~~~powershell
$computer = Get-CimInstance Win32_ComputerSystem
$product = Get-CimInstance Win32_ComputerSystemProduct
$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor
$gpu = Get-CimInstance Win32_VideoController

[ordered]@{
  Computer = $computer | Select-Object Manufacturer,Model,TotalPhysicalMemory
  Product = $product | Select-Object Name,Version
  OS = $os | Select-Object Caption,Version,BuildNumber,OSArchitecture
  CPU = $cpu | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors
  GPU = $gpu | Select-Object Name,AdapterRAM,DriverVersion
  Disks = @(Get-Disk | Select-Object Number,FriendlyName,BusType,PartitionStyle,OperationalStatus,IsBoot,IsSystem,Size)
  Partitions = @(Get-Partition | Sort-Object DiskNumber,PartitionNumber | Select-Object DiskNumber,PartitionNumber,DriveLetter,Type,Size,Offset)
  Volumes = @(Get-Volume | Sort-Object DriveLetter | Select-Object DriveLetter,FileSystemLabel,FileSystem,HealthStatus,Size,SizeRemaining)
  Users = @(Get-ChildItem 'C:\Users' -Force | Select-Object Name,Mode,LastWriteTime)
  ProfileTopLevel = @(Get-ChildItem $env:USERPROFILE -Force | Select-Object Name,Mode,Length,LastWriteTime)
  EnvironmentVariableNames = @(Get-ChildItem Env: | Sort-Object Name | Select-Object -ExpandProperty Name)
} | ConvertTo-Json -Depth 5
~~~

Save or paste the output for review. Do not paste values from .mcp.env, credential files, SSH keys, or any secret-bearing environment variable.

### Clean Windows baseline before any developer installation

Because the machine has only had Microsoft-account sign-in/import and the imported setup is not wanted, the preferred clean-start path is:

1. Confirm there are no needed local files in the imported profile. Confirm the device is activated and record the BitLocker recovery key before reset.
2. Pause or disconnect OneDrive folder backup and Windows Backup restore while the cleanup decision is being made. Do not allow OneDrive Known Folder Move and manual local-folder redirection to own the same folders.
3. If the inventory confirms there is nothing to preserve, use Settings → System → Recovery → Reset this PC → Remove everything → Cloud download. Disable Restore preinstalled apps only if the goal is a generic Windows baseline; then reinstall only the Acer drivers/utilities that are actually needed from Acer Support. Microsoft documents that Remove everything removes files, apps, and settings, while Cloud download obtains a fresh Windows copy.
4. If reset is not chosen, remove imported applications through Settings → Apps → Installed apps and review Settings → System → Storage → Cleanup recommendations/Temporary files. Never manually delete C:\Windows, C:\Program Files\WindowsApps, C:\ProgramData, WinSxS, EFI/MSR/Recovery/OEM partitions, or broad AppData trees.
5. Reboot and install Windows updates and essential Acer hardware drivers before WSL, Docker, Node, Claude, Cursor, Codex, Obsidian, or MCP configuration.

Evidence: [Microsoft Reset this PC](https://support.microsoft.com/en-us/windows/experience/backup-recovery/reset-your-pc), [Microsoft Storage settings](https://support.microsoft.com/en-us/windows/experience/storage-filemanagement/storage-settings-in-windows), [Microsoft Storage Sense](https://support.microsoft.com/en-us/windows/experience/storage-filemanagement/manage-drive-space-with-storage-sense), [Microsoft Disk Management overview](https://learn.microsoft.com/en-us/windows-server/storage/disk-management/overview-of-disk-management).

### Disk decision rule — two physical disks versus three

“C:, D:, and E:” are volumes/drive letters; they are not automatically three physical disks. Get-Disk is authoritative for physical-disk count. The advertised 1 TB SSD is not evidence that three disks exist.

- **One installed physical SSD:** use C: for Windows, drivers, applications, updates, and usually a system-managed pagefile; create one data volume (normally D:) for PARA data, installers, games, and WSL/Docker VHDX storage. Do not create a third partition for WSL. A starting C: range of 250–300 GB is a planning range only; choose it after observing the actual Windows/OEM/recovery layout.
- **Two installed physical SSDs:** keep the Windows volume on the boot SSD; use remaining space on that SSD for data if useful, and use the second physical SSD as a single WSL/Docker volume after confirming it is empty/backed up and assigning a stable letter. Do not call this a third disk unless Get-Disk reports three physical devices.
- **No reason to install or plan for three physical disks:** the Acer’s value comes from its CPU/GPU/RAM and NVMe performance; three storage devices would add management overhead without helping this setup. Add a second NVMe later only if measured WSL/Docker/game capacity requires it.

The old plan’s 150 GB C: recommendation and its dedicated-third-disk assertion are not defaults for this Acer. Microsoft warns that EFI, MSR, and Recovery partitions are normal; do not delete them. Partition only after the audit, recovery confirmation, and clean baseline.

### PARA and the one-code-folder rule

Use one Windows data-volume root for user-facing files, such as <data-drive>:\PARA\Projects, Areas, Resources, and Archives. Keep the Jarvis/The Plan vaults under the chosen Resources location. Do not duplicate the code tree for ChatGPT UI, Codex CLI, and the Codex app.

Inside WSL, keep the single code root at $HOME/projects. This is inside the Linux filesystem/VHDX, physically stored under the selected WSL Windows path. Use GitHub as the source-controlled backup and clone fresh repositories only after GitHub authentication succeeds. Avoid developing from /mnt/c or /mnt/d because those paths cross WSL’s Windows filesystem bridge; Windows-side vault access is the exception for the MCP filesystem server.

### Execution boundary

No cleanup script, partition command, wsl --unregister, wsl --import, VHDX move, credential copy, or AI-platform home-directory sync is authorized by this addendum until the PowerShell audit is reviewed. The next valid input is the audit output plus the exact Acer SKU; after that, choose the one-SSD or two-SSD branch and generate the final copyable commands with real drive letters.

## Maintenance Cadence

Added 2026-09-18, once WSL was actually up and running - this is what keeps it clean going forward, not a one-time setup step. Pulled forward from [[Ubuntu - WSL]], which no longer carries commands now that install is done.

**One code root, no exceptions.** Every repo lives under `~/projects/{ai,hub,hackathon,scratch,work}`. Every standalone CLI binary not managed by nvm/uv/cargo/apt goes in `~/tools`. Nothing gets cloned or built under `/mnt/c` or `/mnt/d` - that crosses the 9P bridge and makes every file operation 5-20x slower (see [[Ubuntu - WSL#Failure Modes / Misconceptions]]). The one standing exception is reading vault markdown through `/mnt/d` for MCP/filesystem access.

**Per-project isolation, not global installs.** `.venv` per Python project via `uv`, `.nvmrc` only where a project genuinely needs a pinned Node version, no global `pip install` or unpinned `npm install -g` beyond what's already deliberately installed.

**Monthly - cache hygiene.** These free Linux-side blocks; none of them shrink the Windows-side `.vhdx` on their own:

~~~bash
npm cache verify
uv cache clean
pnpm store prune
~~~

Use `npm cache clean --force` only when actually reclaiming space is the goal, not as a routine step.

**Monthly, or when D: feels tight - VHDX growth, watched not ignored.** `rm -rf` inside WSL frees blocks inside the disk image, not the image's footprint on D:. Use `ncdu ~` to actually see what's growing before deciding anything needs cleaning, then compact deliberately when it matters, only after shutting down WSL and any editor/Docker process:

~~~bash
ncdu ~
sudo fstrim -av
~~~

~~~powershell
wsl --shutdown
Get-Item -LiteralPath "D:\WSL\Ubuntu\ext4.vhdx"
~~~

Compact from Windows (`Optimize-VHD` if the Hyper-V module is present, or `diskpart`'s `compact vdisk`) only after confirming the size actually justifies it. Docker Desktop's own WSL disk image needs its own separate redirect to `D:\WSL\Docker` in Docker Desktop's settings (Resources > Advanced) once it's installed - relocating one thing to D: never automatically relocates another, the same lesson the swap file already taught.

**As needed - scheduling local-model / cron work.** WSL does not run anything while no distro is active - a `cron` job inside Ubuntu only fires while that instance is already running, which isn't guaranteed on a laptop that sleeps. Two real options:
- For anything that must run even when the laptop is asleep or WSL isn't already open, use **Windows Task Scheduler** to trigger `wsl -d Ubuntu-24.04 -- <command>` on a schedule - this wakes WSL, runs the command, and lets it terminate again.
- For anything that only needs to run while you're already working inside WSL, a plain `cron` job (`sudo systemctl enable --now cron`, since `systemd=true` is already set) is simpler than a Windows-side trigger.

**Always - backup discipline.** `~/projects/` lives inside the VHDX on D:, which is not the separately Google-Drive-synced `D:\Users\_Anant\` tree - nothing inside WSL is backed up automatically. Push to GitHub as the actual backup; treat any repo with unpushed commits as at-risk.

**Always - dotfile discipline.** The `.bashrc` block (marker: `JARVIS_WSL_ENV_BLOCK`) is already guarded against duplicates. Never write a raw API key, token, or secret directly into `.bashrc`/`.profile`/`.zshrc` - everything secret-bearing goes in the mode-600 `~/.mcp.env`.

**Local models stay on the Windows side, reached over `127.0.0.1`, not duplicated in WSL.** Ollama is already planned Windows-side per [[Installations]] with models on `D:` - WSL reaches it at `http://127.0.0.1:11434` through the same built-in NAT localhost forwarding that already covers Jarvis's MCP servers, with zero extra setup. A second, WSL-native Ollama install would double the on-disk model footprint for no real benefit. Jan is a Windows GUI app decision, not a WSL package. Kronos is a Python/PyTorch dependency scoped to the TradingView project's own `.venv` once that build reaches it, not a general WSL tool.

**Weekly, once actually used for real work - `tmux` hygiene.** `tmux ls` to see what's still attached before assuming a session is gone; kill anything genuinely finished with `tmux kill-session -t <name>` rather than letting sessions accumulate indefinitely.

**Added 2026-09-19, from the terminal-tuning round - two more standing rules.** Never put a real secret directly in a `direnv` `.envrc` file - it's stored in plaintext by design; source it from a separate, already-gitignored file instead. And don't assume `apt` always has the current version of a small standalone tool - `chafa` shipped stuck at 1.14.0 in Ubuntu 24.04's repos while Yazi needed 1.16.0+, silently breaking a feature with no error message; when a tool in `~/.local/bin` starts behaving like the docs say it shouldn't, check its actual version against the tool's own current release before assuming the config is wrong.