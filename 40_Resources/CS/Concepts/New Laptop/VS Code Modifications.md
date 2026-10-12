---
type: concept
status: seed
created: 2026-10-12
updated: 2026-10-12
course: Life
track:
  - laptop
  - vscode
  - ai-infrastructure
tags:
  - concept
  - proposals
notes:
  - "[[VS Code Professional Setup]]"
  - "[[VS Code - Terminal Environments]]"
  - "[[VS Code - Windows]]"
  - "[[VS Code - WSL]]"
  - "[[VS Code - MCP and Secrets]]"
  - "[[VS Code - Install Loop]]"
next: "Review the proposals; run the P1 test matrix in a real VS Code window on both sides before any default changes"
---
# VS Code Modifications
## One-Line Answer
==The current two-window model (Windows-local plus WSL-remote, joined by Settings Sync and the Install Loop) is still the right shape, and the one change with real payoff is switching Python environment activation from `command` to `shellStartup` on both sides, which needs a live-window test matrix before it becomes the default.== Everything below is a proposal as of 2026-10-12. Nothing in this note has been applied, and no setting was changed because of it.
## What Was Checked and What Could Not Be
- *Done from a headless session:* the installed Python Environments extension version, its bundled code, VS Code's own docs and release notes for 1.140 and 1.141, the machine's Windows update and tool state.
- *Not possible from a headless session:* opening a real VS Code window and a real integrated terminal. Every claim about how a terminal behaves after a setting change is therefore untested here and is marked so.
## Findings
### Environment auto-activation
- `python-envs.terminal.autoActivationType` has three values: `command` (the default, runs a visible command after the terminal opens), `shellStartup` (shell integration or a change to the shell's startup script; the settings reference lists zsh, fish, pwsh, bash and cmd) and `off`. It takes precedence over `python.terminal.activateEnvironment`. [Settings reference](https://code.visualstudio.com/docs/python/settings-reference.md).
- The setting applies when a terminal is created, so open terminals keep their old behavior until restarted. The extension has a command, `Python Envs: Revert Shell Startup Script Changes`, which removes the startup edits (in `cmd` the registry change stays). [February 2026 release notes](https://devblogs.microsoft.com/python/python-in-visual-studio-code-february-2026-release/), [vscode-python-environments PR 665](https://github.com/microsoft/vscode-python-environments/pull/665/files).
- *Read from the installed extension's code (1.38.0, `dist/extension.js`):*
  - It writes its own delimited block, `# >>> vscode python` to `# <<< vscode python` (and a `:: >>> vscode python` form for cmd), guarded by a `VSCODE_PYTHON_AUTOACTIVATE_GUARD` variable. The existing `# >>> vscode-env >>>` block in `.bashrc` and the `TERM_PROGRAM` guarded block in the PowerShell profiles use different markers, so the two should append side by side rather than overwrite each other. This is read from code, not observed in a file.
  - The bash variable is `VSCODE_PYTHON_BASH_ACTIVATE`, and the old name `VSCODE_BASH_ACTIVATE` is kept as `BASH_OLD_ENV_KEY`. The same pairing exists for PowerShell (`VSCODE_PYTHON_PWSH_ACTIVATE` and `VSCODE_PWSH_ACTIVATE`). So the rename the reported WSL bug blames is at least known to this version. Whether a fresh WSL terminal actually changes behavior is still untested.
  - It looks for `conda-hook.ps1` under the conda prefix (`shell\condabin`, `Library\shell\condabin`, `condabin`, `etc\profile.d`), which is the PowerShell conda support.
- The old archived doc claiming conda cannot auto-activate under PowerShell predates this extension, and no newer source confirms or denies it. The only way to settle it is `conda activate` in a real pwsh terminal in `shellStartup` mode.
### Agent sandboxing
- VS Code's sandbox applies to Copilot Agent Host sessions only. It does not cover the Local chat harness, so it does not wrap Claude Code. Setting: `chat.agent.sandbox.enabled` (`off` default). Linux and WSL2 need `bubblewrap` and `socat`; Windows is labeled Experimental and needs the September 8, 2026 update (KB5124008 for 24H2/25H2, KB5124012 for 26H1). [Sandbox agent terminal commands](https://code.visualstudio.com/docs/agents/run/agent-sandboxing), [1.141 notes](https://code.visualstudio.com/updates/v1_141).
- Network is not blocked by default (`allowNetwork` true), the working directory is read and write, and `allowDevToolAccess` (default true) lets sandboxed commands read dev-tool config and caches including registry tokens. It is not a VM or account boundary.
- *This machine:* `bwrap` and `socat` were not found in WSL, and `KB5124008` is not installed (build 10.0.26300; only that one KB was checked, and the 26H1 one was not).
### Worktrees and parallel sessions
- 1.140 added the experimental `git.worktreeSymlinkFolders` (symlinks ignored folders such as `node_modules` into new worktrees, including agent-session ones) and 1.141 added `Chat: Open Worktree Cleanup` and `chat.agentSessions.sessionStorageCleanupSuggestion.enabled`. [1.140](https://code.visualstudio.com/updates/v1_140), [1.141](https://code.visualstudio.com/updates/v1_141).
- Claude Code has its own worktree support in the CLI (`claude --worktree <name>`, introduced around v2.1.49 per third-party write-ups). That claim comes from blogs, not Anthropic's docs: [dev.to write-up](https://dev.to/stacknotice/git-worktrees-claude-code-run-parallel-ai-agents-on-the-same-repo-2026-mga), [heyuan110 guide](https://www.heyuan110.com/posts/ai/2026-02-28-claude-code-worktree-guide/). Confirm against Claude Code's own docs before relying on it. Installed here: Claude Code 2.1.296.
### Dev containers and local LLM work
- The Agents window can run sessions inside a dev container (`chat.agentHost.devContainer.enabled`; 1.140 added an idle timeout of 5 minutes and faster startup; 1.141 added experimental samples behind `chat.agentHost.devContainer.samples.enabled`). [1.140](https://code.visualstudio.com/updates/v1_140), [1.141](https://code.visualstudio.com/updates/v1_141).
- For a GPU Ollama sidecar, the community pattern is a Compose service with a `deploy.resources.reservations.devices` entry (`driver: nvidia`, `count: all`, `capabilities: [gpu]`), after confirming `nvidia-smi` works inside a container. Sources are community guides, not Microsoft or NVIDIA docs, and none was about `devcontainer.json` directly: [Ollama in Docker Compose with GPU](https://glukhov.org/llm-hosting/ollama/ollama-in-docker-compose/), [Run Ollama with GPU on Windows Docker WSL2](https://github.com/SayanAIMLDL/Run-Ollama-with-GPU-on-Windows-Docker-WSL2-). *This machine:* the GPU is an RTX 5070 Ti Laptop, `nvidia-smi` works on Windows and in WSL, and Docker 29.8.0 is present in WSL. Ollama already runs on the Windows host against the GPU, so a container adds isolation, not capability.
### Multi-root across Windows and WSL
- No source found shows a single window holding a Windows folder and a WSL folder. The WSL docs and the 2019 command-line blog describe one environment per window. [Developing in WSL](https://code.visualstudio.com/docs/remote/wsl), [2019 tips post](https://devblogs.microsoft.com/commandline/tips-and-tricks-for-linux-development-with-wsl-and-visual-studio-code).
- 1.140 added *multi-folder agent sessions* (experimental, `chat.agentHost.copilotAgent.multiRootEnabled`, `chat.agentHost.claudeAgent.multiRootEnabled`, `chat.agentHost.codexAgent.multiRootEnabled`). That is about an agent session spanning several folders on one host, not about unifying the two windows. [1.140](https://code.visualstudio.com/updates/v1_140).
### MCP
- 1.140's **MCP: Add Server** can now write portable files (`$COPILOT_HOME/mcp-config.json`, default `~/.copilot/mcp-config.json`, or a workspace `.mcp.json`), and the release screenshots label `.vscode/mcp.json` and the user configuration as deprecated. 1.141 lists discovered servers in the Agent Customizations editor. [1.140](https://code.visualstudio.com/updates/v1_140), [1.141](https://code.visualstudio.com/updates/v1_141). The registry in [[VS Code - MCP and Secrets]] writes the user `mcp.json`, so a future removal of that file would matter.
### Agent terminals
- Recent Copilot releases set a `VSCODE_AGENT` environment variable for agent-initiated terminal commands, so tools can adapt. [GitHub changelog, May 2026](https://github.blog/changelog/2026-05-06-github-copilot-in-visual-studio-code-may-releases/). It is not confirmed that Claude Code's terminals set it.
## Proposed Changes
| # | Proposal | What it changes | Why | Cost or risk |
|---|---|---|---|---|
| P1 | Switch `python-envs.terminal.autoActivationType` to `shellStartup` on both sides | User settings (Windows) and the WSL Machine settings file, which currently pins `command` | Immediate, silent activation instead of a visible command; Microsoft signals it as the future default | Edits `$PROFILE` and `.bashrc`; conda under pwsh, CSCI 5304's project-local path and the bash env-var rename are untested. Revert with `Python Envs: Revert Shell Startup Script Changes`, then set `command` |
| P2 | Enable the agent sandbox for Copilot Agent Host sessions | `chat.agent.sandbox.enabled: on` | Terminal containment for Copilot sessions | Does not cover Claude Code, so low value while Claude is the main agent; needs `sudo apt-get install bubblewrap socat` in WSL and the Windows update |
| P3 | Try `git.worktreeSymlinkFolders` and the worktree cleanup command | One experimental setting | Parallel agent worktrees without reinstalling dependencies | Experimental; only affects Agents window sessions, not `claude --worktree` |
| P4 | A GPU dev container for Ollama experiments | A `.devcontainer/` with a Compose Ollama service | Reproducible local-LLM setups per project | Ollama already works on the host; needs the NVIDIA Container Toolkit in WSL and a test of `nvidia-smi` in the container |
| P5 | Quiet the `vscode-env` header when `VSCODE_AGENT` is set | `init.ps1` and `init.sh` | Less noise in agent terminals | Unverified that Claude Code sets it; skip until observed |
| P6 | Watch the MCP file move | Nothing now; recheck each monthly release | `.vscode/mcp.json` is labeled deprecated | If it goes, the registry's VS Code target moves to the new location |
| P7 | Stage and test the multi-folder agent sessions | `chat.agentHost.claudeAgent.multiRootEnabled` | Might help sessions across a course folder and a vault | Experimental, off by default; do not treat as Windows/WSL unification |
## Sources
[Settings reference](https://code.visualstudio.com/docs/python/settings-reference.md), [Python in VS Code, February 2026](https://devblogs.microsoft.com/python/python-in-visual-studio-code-february-2026-release/), [vscode-python-environments PR 665](https://github.com/microsoft/vscode-python-environments/pull/665/files), [Sandbox agent terminal commands](https://code.visualstudio.com/docs/agents/run/agent-sandboxing), [VS Code 1.140](https://code.visualstudio.com/updates/v1_140), [VS Code 1.141](https://code.visualstudio.com/updates/v1_141), [Developing in WSL](https://code.visualstudio.com/docs/remote/wsl), [GitHub Copilot in VS Code, May 2026](https://github.blog/changelog/2026-05-06-github-copilot-in-visual-studio-code-may-releases/), plus the community links named inline.
