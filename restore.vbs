Dim objShell
Set objShell = CreateObject("WScript.Shell")

' Restore Task Manager
objShell.Run "reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f", 0, True

' Restore Lock Workstation
objShell.Run "reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /f", 0, True

' Restore Windows Keys
objShell.Run "reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWinKeys /f", 0, True

' Restore Explorer.exe
objShell.Run "explorer.exe", 0, True

' Delete prank scripts
objShell.Run "cmd /c del /F /Q %USERPROFILE%\sys_maintenance.ps1", 0, True
objShell.Run "cmd /c del /F /Q %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\system_update.vbs", 0, True

Set objShell = Nothing
