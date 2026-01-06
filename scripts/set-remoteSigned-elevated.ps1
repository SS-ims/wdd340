# Elevate self if not running as Administrator
$IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $IsAdmin) {
    $script = $MyInvocation.MyCommand.Definition
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile","-ExecutionPolicy","Bypass","-File","$script" -Verb RunAs
    exit
}

# Running elevated: set LocalMachine policy
try {
    Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force -ErrorAction Stop
    Write-Host "LocalMachine execution policy set to RemoteSigned.`n"
} catch {
    Write-Error "Failed to set execution policy: $_"
}

Write-Host "Press any key to close..."
$x = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
