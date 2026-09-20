' Silent launcher for Jarvis-WeeklyReview.
' Same proven pattern as git-auto-sync-silent.vbs / sync-all-silent.vbs:
' WindowStyle 0 = hidden, prevents a console popup on every fire.
' waitOnReturn = True means this launcher blocks until run-weekly-review.ps1
' actually finishes and exits with its real return code, so Task Scheduler's
' LastTaskResult reflects whether the headless Claude Code invocation
' genuinely succeeded, not just whether wscript.exe managed to start it.
' A headless /weekly-review run can take several minutes (real LLM work,
' not a deterministic script), so this launcher's own wait is expected to
' be long-lived, unlike the 15-minute-cadence sync tasks' launchers.
Option Explicit
Dim sh, exitCode, scriptDir, psScript
Set sh = CreateObject("WScript.Shell")
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
psScript = scriptDir & "\run-weekly-review.ps1"
exitCode = sh.Run("powershell.exe -NoProfile -ExecutionPolicy Bypass -File """ & psScript & """", 0, True)
WScript.Quit(exitCode)
