<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Timothy Kigozi
    LinkedIn        : https://www.linkedin.com/in/tim-kigozi/
    GitHub          : https://github.com/Tim-Kigozi
    Date Created    : 2025-12-29
    Last Modified   : 2025-12-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .STIG-ID-WN10-AU-000500.ps1 
#>

$RegPath   = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'
$ValueName = 'MaxSize'
$ValueData = 0x00008000  # 32768 hexadecimal

# Ensure registry path exists
if (-not (Test-Path -Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the registry value (create or update)
Set-ItemProperty `
    -Path $RegPath `
    -Name $ValueName `
    -Value $ValueData `
    -Type DWord

Write-Output 'MaxSize registry policy configured successfully.'
