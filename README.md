# CrashReportWatcher

A lightweight PowerShell script that helps track system and application crashes on Windows. Ideal for identifying critical errors after gaming sessions or issues related to unstable software like RGB Fusion.

## Features

- Scans Windows Event Logs (System and Application).
- Collects critical errors and crashes from the last 12 hours.
- Saves the logs with timestamped filenames in a `logs/` folder.

## Usage

1. Open **PowerShell as Administrator**.
2. Navigate to the project folder.
3. Run the script:

```powershell
.\watcher.ps1
