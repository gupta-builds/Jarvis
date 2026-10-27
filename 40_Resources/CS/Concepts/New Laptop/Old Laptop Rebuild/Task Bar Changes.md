---
type: note
status: sprout
created: 2026-10-26
updated: 2026-10-26
course: Life
track:
  - laptop
  - windows
tags:
  - note
  - laptop
  - taskbar
  - windhawk
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[New Laptop Setup]]"
next: "Repeat this on the Dell: install Windhawk and the font, install the four mods, paste the four settings blocks, check the Wi-Fi tray icon, then tune height and font size for the Dell screen."
---
# Task Bar Changes

Goal: a centered, fully transparent Windows 11 taskbar (Rose Pine theme) with text labels on running apps, a clean one-line clock, the Wi-Fi and sound icons visible, and JetBrains Mono as the font. Built and finished on the Acer on 2026-10-26. Everything below is the exact saved state, read back from Windhawk's registry, so it can be repeated on the Dell.

Theme reference: the RosePine theme page in the ramensoftware windows-11-taskbar-styling-guide repo (Themes/RosePine/README.md).

## What was installed (Acer)

| Item | Version | Where |
|---|---|---|
| Windhawk | 1.7.3 | `C:\Program Files\Windhawk` (mods and settings in `C:\ProgramData\Windhawk`) |
| Windows 11 Taskbar Styler | 1.10 | Windhawk mod `windows-11-taskbar-styler` |
| Taskbar height and icon size | 1.3.10 | Windhawk mod `taskbar-icon-size` |
| Taskbar Labels for Windows 11 | 1.5.1 | Windhawk mod `taskbar-labels` |
| Taskbar Clock Customization | 1.8.1 | Windhawk mod `taskbar-clock-customization` |
| JetBrainsMono Nerd Font | 3.3.0 | `C:\Windows\Fonts` (96 files), copy in `D:\Apps\JetBrainsMono (Font)` |

Windows build on the Acer: 11 Home 10.0.26300 (a preview build; the Explorer shell reports 10.0.26100.x).

## Install order

1. Install the font first, so Explorer can load it. Windhawk mods cannot use a font that was installed after Explorer started, so restart Explorer if it was installed late.
   ```powershell
   winget install --id DEVCOM.JetBrainsMonoNerdFont -e
   ```
   Then copy `C:\Windows\Fonts\JetBrainsMono*.ttf` into `D:\Apps\JetBrainsMono (Font)` as the portable copy (same pattern as `D:\Apps\IosevkaTerm (Font)`).
2. Install Windhawk:
   ```powershell
   winget install --id RamenSoftware.Windhawk -e
   ```
   Accept the admin prompt.
3. Open the Windhawk app (Start menu or tray). Do not use the windhawk.net website for this. The "Get Windhawk to install this mod" button on the website only launches the setup program again, and its settings view is a read-only preview.
4. In the app, click Explore, search for each of the four mods below, and click Install.
5. For each mod, open its Settings tab, switch to Textual mode, paste its block from the next section, and click Save settings. Mods reload by themselves.
6. If the font does not show on labels or the clock, restart Explorer: `Stop-Process -Name explorer -Force` (it comes back on its own).

## Final settings (paste into Textual mode)

### Windows 11 Taskbar Styler
Keeps the built-in RosePine theme and adds one rule that brings back the tray icon the theme hides (Wi-Fi).
```yaml
theme: RosePine
styleConstants:
  - ''
controlStyles:
  - target: SystemTray.OmniButton#ControlCenterButton > Grid > ContentPresenter > ItemsPresenter > StackPanel > ContentPresenter[1] > SystemTray.IconView > Grid > Grid
    styles:
      - Visibility=Visible
themeResourceVariables:
  - ''
clickThroughTaskbar: 0
xamlDiagnosticsHandling: alert
```

### Taskbar height and icon size
```yaml
TaskbarHeight: 36
IconSize: 16
TaskbarButtonWidth: 37
IconSizeSmall: 16
TaskbarButtonWidthSmall: 37
```

### Taskbar Labels for Windows 11
```yaml
mode: labelsWithoutCombining
taskbarItemWidth: 0
runningIndicatorStyle: fullWidth
progressIndicatorStyle: fullWidth
excludedPrograms:
  - ''
minimumTaskbarItemWidth: 0
maximumTaskbarItemWidth: 100
fontSize: 11
fontFamily: JetBrainsMono NF
textTrimming: characterEllipsis
leftAndRightPaddingSize: 12
spaceBetweenIconAndLabel: 14
runningIndicatorHeight: 0
runningIndicatorVerticalOffset: 0
alwaysShowThumbnailLabels: 0
labelForSingleItem: '%name%'
labelForMultipleItems: '[%amount%] %name%'
```

### Taskbar Clock Customization
One line, for example `Mon, 26 Oct  10:28 PM`, in rose-coloured JetBrains Mono. The bottom line is hidden.
```yaml
ShowSeconds: 0
TimeFormat: "hh':'mm tt"
DateFormat: ddd',' dd MMM
DateLocale: ''
WeekdayFormat: dddd
WeekdayFormatCustom: Sun, Mon, Tue, Wed, Thu, Fri, Sat
TopLine: '%date%  %time%'
BottomLine: ''
MiddleLine: ''
TooltipLine: ''
TooltipLineMode: append
Width: 180
Height: 60
MaxWidth: 0
TextSpacing: 0
DataCollection:
  NetworkMetricsFormat: mbs
  NetworkMetricsFixedDecimals: -1
  DiskMetricsFormat: sameAsNetwork
  DiskMetricsFixedDecimals: -1
  PercentageFormat: spacePaddingAndSymbol
  UpdateInterval: 1
  NetworkAdapterName: ''
  GpuAdapterName: ''
MediaPlayer:
  IgnoredPlayers:
    - ''
  MaxLength: 28
  MediaInfoFormat: '%media_artist% - %media_title%'
  NoMediaText: No media
  RemoveBrackets: 0
WebContentWeatherLocation: ''
WebContentWeatherFormat: '%c 🌡️%t 🌬️%w'
WebContentWeatherUnits: autoDetect
WebContentsItems:
  - Url: ''
    BlockStart: <item>
    Start: <title>
    End: </title>
    ContentMode: xmlHtml
    SearchReplace:
      - Search: ''
        Replace: ''
    MaxLength: 28
WebContentsUpdateInterval: 10
TimeZones:
  - Eastern Standard Time
TimeStyle:
  Hidden: 0
  TextColor: '#ebbcba'
  TextAlignment: ''
  FontSize: 12
  FontFamily: JetBrainsMono NF
  FontWeight: SemiLight
  FontStyle: ''
  FontStretch: ''
  CharacterSpacing: 0
  LineHeight: 0
DateStyle:
  Hidden: 1
  TextColor: ''
  TextAlignment: ''
  FontSize: 0
  FontFamily: JetBrainsMono NF
  FontWeight: ''
  FontStyle: ''
  FontStretch: ''
  CharacterSpacing: 0
  LineHeight: 0
oldTaskbarOnWin11: 0
```

## Taskbar behavior (Windows setting, not a mod)
Auto-hide is on (Settings, Personalization, Taskbar, Taskbar behaviors, Automatically hide the taskbar). Alignment stays centered. The Rose Pine bar is fully transparent with no border, so no extra background or border rules are used.

## Things that went wrong on the Acer (do not repeat)

- Do not set `FontFamily` on `SystemTray.TextIconContent`. The tray icons are font symbols that JetBrains Mono does not contain, so Wi-Fi and sound turned into empty boxes and the three-dots icon changed.
- Do not add Fill rules for `Rectangle#BackgroundFill` or `Rectangle#BackgroundStroke`. They added a tinted bar and a visible top border. The theme's default (fully transparent, no border) is the look that was chosen.
- Do not raise `maximumTaskbarItemWidth` above 100 with many windows open. With 14 windows at 150 the buttons filled the whole bar and everything looked left-aligned. If it still fills the bar at 100, lower it to 90 or 80.
- On Windows 11 the clock has only two lines: the top line and the bottom line. "Middle line", "Height" and "Width" are Windows 10 only and are ignored. A two-line clock does not fit a 36 px bar.
- The theme author's clock JSON uses older key names and a weather service on `localhost:8089` that only existed on their PC. Use the YAML above, not that JSON.
- The README for the theme blanks the network glyph with two `Text=` rules whose icon characters get lost when the page is copied as plain text. That is why the built-in RosePine theme is kept and only one override is added on top.

## Things to check on the Dell

- Confirm the Wi-Fi icon appears next to the speaker. The rule above targets tray position `[1]`, which is the icon the theme hides on the Acer. If a different icon shows, use the Styler's element tools to find the right index.
- Tune `TaskbarHeight`, `IconSize` and `fontSize` for the Dell's screen size and display scaling.
- Preview Windows builds can break the Styler between updates. If something looks wrong after a Windows update, turn the mods off in Windhawk to go back to the stock taskbar.
- Per-app label renaming is not possible with these mods. `%name%` is the window title or app name, and the Labels mod offers only `%name%` and `%amount%`. To change a label, change the title at its source (for example the Terminal tab title).

## Check the live settings (PowerShell)
```powershell
foreach ($m in 'windows-11-taskbar-styler','taskbar-icon-size','taskbar-labels','taskbar-clock-customization') {
  "----- $m"
  (Get-ItemProperty "HKLM:\SOFTWARE\Windhawk\Engine\Mods\$m\Settings").PSObject.Properties |
    Where-Object { $_.Name -notlike 'PS*' -and "$($_.Value)" -ne '' } |
    ForEach-Object { "  $($_.Name) = $($_.Value)" }
}
```

## Font setup (same day)

| Where | Setting |
|---|---|
| Windows Terminal | `profiles.defaults.font.face` = `IosevkaTerm Nerd Font` (JetBrains Mono was tried on 2026-10-26 and reverted, Iosevka was preferred) |
| VS Code terminal | `terminal.integrated.fontFamily` = `'IosevkaTerm NFM', 'IosevkaTerm Nerd Font Mono', Consolas, monospace` |
| VS Code editor | `editor.fontFamily` not set (VS Code default) |
| Taskbar labels and clock | `JetBrainsMono NF` (set in the Labels and Clock mods) |

Family names: `JetBrainsMono NF` is the normal width variant, `JetBrainsMono NFM` is the Mono variant (single-width icons, best for terminals), `JetBrainsMono NFP` is proportional. Each also has the long form `JetBrainsMono Nerd Font` and `JetBrainsMono Nerd Font Mono`. Windows Explorer and the rest of the Windows UI keep Segoe UI Variable on purpose, since Windows 11 has no supported way to change the system font.

Open: Obsidian. The vault theme (AnuPpuccin, via the Style Settings plugin) asks for Rubik (source and live preview) and Overpass (reading view), and neither font is installed on the Acer, so Obsidian falls back to its defaults. The Monospace font in Obsidian's Appearance settings is unset, so code blocks use the default mono font too. Decide between installing Rubik and Overpass or choosing new fonts, then set the code font to JetBrainsMono Nerd Font.
