---
type: input
status: sprout
created: 2026-10-11
tags:
  - input
notes:
  - "[[Old Laptop Rebuild - Index]]"
next: "[[Old Laptop Rebuild - Index]]"
---

# Acer Dotfile Snapshot - VERSIONS

Collected 2026-10-11 during the read-only dotfile export. See [[MANIFEST]] for the file list.

## Tool versions

### WSL (Ubuntu-24.04), captured via `<tool> --version` with `.bashrc` sourced (default user `anant_gupta`)

| Tool | Version |
|---|---|
| starship | 1.26.0 |
| yazi | 26.9.1 (8dd895c, 2026-09-01) |
| lazygit | 0.65.1 (commit 17cb09fa, build 2026-09-13) |
| bat | 0.24.0 |
| ripgrep (`rg`) | 14.1.0 |
| delta | 0.19.2 |
| gh (GitHub CLI) | 2.45.0 (2025-07-18, Ubuntu build) |
| gh-dash (gh extension) | v4.25.2 |
| git | 2.43.0 |
| tmux | 3.7c |
| atuin | 18.22.0 |
| sesh | 2.30.1 |
| ncdu | 1.19 |

### Windows

| Tool | Version | Notes |
|---|---|---|
| PowerShell 5.1 | 5.1.26100.9549 | Windows-bundled |
| PowerShell 7 | 7.6.6 | installed at `C:\Program Files\WindowsApps\Microsoft.PowerShell_7.6.6.0_x64__8wekyb3d8bbwe\pwsh.exe` |
| starship | installed, path confirmed (`C:\Program Files\starship\bin\starship.exe`) | exact version string not captured - see limitation note below |
| yazi | installed, path confirmed (winget-linked `yazi.exe`) | exact version string not captured; **no config present** (see Differences) |
| ripgrep (`rg`) | installed, path confirmed (winget package `ripgrep-15.2.0-x86_64-pc-windows-msvc`) | folder name implies 15.2.0, not independently confirmed via `--version` |
| gh (GitHub CLI) | installed, path confirmed (`C:\Program Files\GitHub CLI\gh.exe`) | exact version string not captured |
| git | installed, path confirmed (`C:\Program Files\Git\cmd\git.exe`) | exact version string not captured |
| Windows Terminal (`wt`) | installed, path confirmed | exact version string not captured |
| winget | installed, path confirmed | exact version string not captured |
| lazygit | **not installed** | |
| bat | **not installed** | |
| delta | **not installed** | |
| gh-dash | **not installed** | |

**Limitation:** mid-session, a safety classifier blocked all further Bash/PowerShell execution for the rest of this conversation (unrelated to any specific command - see session history). The Windows version strings above that say "not captured" were only confirmed by installation path (`Get-Command`) before that block landed; `--version` was never run for them. Everything with an exact version number was captured before the block.

## Font families

Installed, per-user (`System.Drawing.Text.InstalledFontCollection`, filtered to common mono/nerd-font name patterns - this filter itself missed Iosevka, corrected below):
- Cascadia Code (+ ExtraLight, Light, SemiBold, SemiLight)
- Cascadia Mono (+ ExtraLight, Light, SemiBold, SemiLight)
- Lucida Sans Unicode
- Monotype Corsiva
- Ubuntu Sans Mono (+ ExtraLight, Light, Medium, SemiBold, Thin)

Installed, system-wide (`C:\Windows\Fonts`, confirmed via directory listing):
- **IosevkaTerm Nerd Font** - confirmed present as `IosevkaTermNerdFont-*.ttf`, `IosevkaTermNerdFontMono-*.ttf`, and `IosevkaTermNerdFontPropo-*.ttf`, with the full weight/style range (Thin through Heavy/ExtraBold, upright and oblique/italic). Not found under the per-user font directory (`%LOCALAPPDATA%\Microsoft\Windows\Fonts`) - it is a system-wide (all-users) install.
- Could not independently confirm the exact internal font family *display name* (e.g. whether it registers as "IosevkaTerm NFM") - that requires parsing the TTF `name` table, which is outside what Read/Grep/Glob can do. The filename convention and presence strongly support the vault notes' claim; see Differences below.

## Config-folder environment variables (names and non-secret paths only)

| Side | Variable | Value |
|---|---|---|
| WSL | `NVM_DIR` | `/home/anant_gupta/.nvm` |
| WSL | `XDG_RUNTIME_DIR` | `/run/user/1000` |
| Windows | `HERMES_HOME` | `D:\Apps\Hermes` |

No custom override variables (`STARSHIP_CONFIG`, `BAT_CONFIG_PATH`, `RIPGREP_CONFIG_PATH`, `YAZI_CONFIG_HOME`, `LAZYGIT_CONFIG_DIR`, `XDG_CONFIG_HOME`, etc.) were set on either side - every tool is using its default config-folder resolution (`~/.config/<tool>/...` on WSL, OS defaults on Windows).

## Differences from the vault notes

The vault's existing notes say the Windows side runs Yazi with a Tokyo Night Storm flavor and uses the IosevkaTerm Nerd Font (registered as "IosevkaTerm NFM"). Checked directly against this Acer:

- **Yazi + Tokyo Night Storm - contradicted for Windows, true for WSL.** This Windows side has no `yazi.exe` config at all (`~\.config\yazi` does not exist, and there is no yazi config anywhere else on Windows). The yazi install with the `tokyonight-storm.yazi` flavor, the `git.yazi`/`full-border.yazi`/`smart-filter.yazi` plugins, `keymap.toml`, `theme.toml`, etc. all live on the **WSL** side (`/home/anant_gupta/.config/yazi/`), not Windows. The vault notes appear to have attributed the WSL yazi setup to "the Windows side."
- **IosevkaTerm Nerd Font - confirmed, not contradicted.** The font family is genuinely installed system-wide on this Acer's Windows (62 `.ttf` files across the base/Mono/Propo IosevkaTerm Nerd Font variants). The claimed internal registered name ("IosevkaTerm NFM") could not be independently verified byte-for-byte (requires TTF metadata parsing outside Read/Grep/Glob), but the installed family itself is real.
- **PowerShell 7 - confirmed installed** on Windows (7.6.6).
- **Starship - confirmed installed** on Windows (`starship.exe` present and on PATH; exact version string not captured, see limitation above).

## Tool/font presence by side (summary)

| Tool/Font | Windows | WSL |
|---|---|---|
| starship | yes (binary) | yes (1.26.0) |
| yazi (binary + config) | binary only, **no config** | yes (26.9.1, Tokyo Night Storm flavor) |
| lazygit | no | yes (0.65.1) |
| bat | no | yes (0.24.0) |
| ripgrep | yes (binary), no config | yes (14.1.0, no config) |
| delta | no | yes (0.19.2) |
| gh-dash | no | yes (gh extension v4.25.2) |
| gh (GitHub CLI) | yes (binary) | yes (2.45.0) |
| git | yes (binary) | yes (2.43.0) |
| PowerShell 7 | yes (7.6.6) | n/a |
| PowerShell 5.1 | yes (5.1.26100.9549) | n/a |
| tmux | n/a (Windows has no tmux) | yes (3.7c) |
| atuin | n/a | yes (18.22.0) |
| sesh | n/a | yes (2.30.1) |
| ncdu | n/a | yes (1.19) |
| IosevkaTerm Nerd Font | yes (system-wide) | n/a (rendering is done by Windows Terminal, not WSL) |
| Cascadia Code/Mono, Ubuntu Sans Mono | yes (per-user) | n/a |
