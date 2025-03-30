' This VBScript restores the system by re-enabling disabled features 
' (Task Manager, Lock Workstation, Windows Keys) and restarting Explorer. 
' It also deletes the prank scripts from the Startup folder and user directory.

' Create a WScript Shell object to execute system restoration commands
Dim objShell
Set objShell = CreateObject("WScript.Shell")

' Re-enable Task Manager by deleting the corresponding registry value
objShell.Run "reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f", 0, True

' Re-enable workstation locking by deleting the registry value
objShell.Run "reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /f", 0, True

' Re-enable Windows key shortcuts by deleting the registry value
objShell.Run "reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoWinKeys /f", 0, True

' Restart Explorer to restore the desktop environment
objShell.Run "explorer.exe", 0, True

' Remove the prank scripts from the system:
' - Delete the PowerShell file from the user's directory
' - Delete the VBScript file from the Startup folder
objShell.Run "cmd /c del /F /Q %USERPROFILE%\sys_maintenance.ps1", 0, True
objShell.Run "cmd /c del /F /Q %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\system_update.vbs", 0, True

' Clean up the shell object
Set objShell = Nothing
