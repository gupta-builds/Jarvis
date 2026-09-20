' Silent launcher for Jarvis-GitAutoSync.
' WindowStyle 0 = hidden, prevents a console popup every 15 minutes.
' Matches the proven fix already used by ClaudeKit-Sync-All's own launcher
' (sync-all-silent.vbs, see that file's 2026-08-10 correction comment):
' registering the Scheduled Task with -Hidden alone only hides it from the
' Task Scheduler library UI, not the console window a directly-invoked
' console executable (here, powershell.exe) opens in an interactive session.
' waitOnReturn = True means this launcher blocks until git-auto-sync.ps1
' actually finishes and exits with its real return code, so Task
' Scheduler's LastTaskResult reflects whether the sync genuinely succeeded,
' not just whether wscript.exe managed to start it.
Option Explicit
Dim sh, exitCode, scriptDir, psScript
Set sh = CreateObject("WScript.Shell")
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
psScript = scriptDir & "\git-auto-sync.ps1"
exitCode = sh.Run("powershell.exe -NoProfile -ExecutionPolicy Bypass -File """ & psScript & """", 0, True)
WScript.Quit(exitCode)
