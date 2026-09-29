' Silent launcher for Jarvis-Syncthing-Health.
' Same pattern as claude-workflow/scripts/git-auto-sync-silent.vbs:
' WindowStyle 0 hides the console popup, waitOnReturn = True so
' Task Scheduler's LastTaskResult reflects the script's real exit code
' (0 = fully synced, 1 = unsynced bytes/errors/unreachable device).
Option Explicit
Dim sh, exitCode, scriptDir, psScript
Set sh = CreateObject("WScript.Shell")
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
psScript = scriptDir & "\check-syncthing-status.ps1"
exitCode = sh.Run("powershell.exe -NoProfile -ExecutionPolicy Bypass -File """ & psScript & """", 0, True)
WScript.Quit(exitCode)
