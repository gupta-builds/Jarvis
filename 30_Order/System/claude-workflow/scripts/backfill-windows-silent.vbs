' Silent launcher for ConversationCapture-Backfill-Windows.
' WindowStyle 0 = hidden. Synchronous wait (waitOnReturn=True) + honest exit
' code, same corrected pattern as sync-all-silent.vbs (2026-08-11). This is
' a safety-net catch-up for anything the SessionEnd/Stop hooks missed - the
' hooks are the primary capture mechanism, this just closes the gap when a
' hook doesn't fire (crash, forced close, machine sleep mid-session).
Option Explicit
Dim sh, exitCode, scriptDir, exportScript, healthScript
Set sh = CreateObject("WScript.Shell")
scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
exportScript = scriptDir & "\export-claude-session.ps1"
healthScript = scriptDir & "\update-capture-health.ps1"
exitCode = sh.Run("powershell -NoProfile -ExecutionPolicy Bypass -File """ & exportScript & """ -BackfillAll", 0, True)
' Records this run's honest exit code to the Capture Health dashboard note
' (added 2026-08-19 - reliability gap fix). Runs after the real work so it
' can never mask exitCode below; ignore its own exit status.
sh.Run "powershell -NoProfile -ExecutionPolicy Bypass -File """ & healthScript & """ -TaskLabel Windows -ExitCode " & exitCode, 0, True
WScript.Quit(exitCode)
