<#
  Lab 1, Part 6: joiner and leaver test (run on DC01)
#>
# Joiner: create a user in the synced OU and note the time
$pw = Read-Host "Password for tuser3" -AsSecureString
New-ADUser -Name "Test User3" -GivenName "Test" -Surname "User3" `
  -SamAccountName "tuser3" -UserPrincipalName "tuser3@wrathrock.com" `
  -Path "OU=CloudSync,DC=lab,DC=local" -AccountPassword $pw -Enabled $true
$created = Get-Date; "Created: $created"

# Leaver: disable on-prem, then sync. New cloud sign-ins fail with error 50057.
Disable-ADAccount -Identity tuser3
Start-ADSyncSyncCycle -PolicyType Delta

# Existing cloud sessions keep working until tokens expire. To end them at once:
# Entra admin center > Users > Test User3 > Revoke sessions
# (or Revoke-MgUserSignInSession with Microsoft Graph PowerShell)
