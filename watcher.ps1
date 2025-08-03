# watcher.ps1
$now = Get-Date
$timeRange = (Get-Date).AddHours(-12)
$logFile = "logs\CrashLog_$($now.ToString('yyyyMMdd_HHmmss')).txt"

if (!(Test-Path -Path "logs")) {
    New-Item -ItemType Directory -Path "logs" | Out-Null
}

"Crash Report - $now" | Out-File $logFile
"=========================" | Out-File $logFile -Append

# System Errors and Criticals
Get-WinEvent -FilterHashtable @{
    LogName='System'
    Level=1,2
    StartTime=$timeRange
} | Sort-Object TimeCreated -Descending |
  Format-Table TimeCreated, Id, LevelDisplayName, ProviderName, Message -Wrap |
  Out-File $logFile -Append

"`n---`n" | Out-File $logFile -Append

# Application Errors and Crashes
Get-WinEvent -FilterHashtable @{
    LogName='Application'
    Level=1,2
    StartTime=$timeRange
} | Sort-Object TimeCreated -Descending |
  Format-Table TimeCreated, Id, LevelDisplayName, ProviderName, Message -Wrap |
  Out-File $logFile -Append

"`n---`n`nCompleted." | Out-File $logFile -Append

Write-Host "Report saved to: $logFile"
