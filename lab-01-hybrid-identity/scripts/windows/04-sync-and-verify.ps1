<#
  Lab 1: Entra Connect Sync checks (run on DC01 in a NEW PowerShell window after install)
#>
Import-Module ADSync
Get-ADSyncScheduler | Select-Object SyncCycleEnabled, CurrentlyEffectiveSyncCycleInterval, NextSyncCycleStartTimeInUTC

# Next scheduled sync in local time (the scheduler reports UTC)
(Get-ADSyncScheduler).NextSyncCycleStartTimeInUTC.ToLocalTime()

# Force a delta sync now
Start-ADSyncSyncCycle -PolicyType Delta

# Result of the last few sync runs
Get-ADSyncRunProfileResult -NumberRequested 4 | Select-Object RunProfileName, Result, StartDate, EndDate
