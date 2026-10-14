<#
  Lab 1, Part 4: hybrid join Workstation01
  Prerequisite: in the Entra Connect wizard, Configure device options >
  Configure Hybrid Microsoft Entra ID join > Windows 10 or later, with the SCP set for lab.local.
#>
# --- On DC01: put the computer in the synced OU ---
Get-ADComputer "WORKSTATION01" | Move-ADObject -TargetPath "OU=CloudSync,DC=lab,DC=local"

# --- On Workstation01 (admin): register the device ---
Set-TimeZone -Id "Mountain Standard Time"
schtasks /run /tn "\Microsoft\Windows\Workplace Join\Automatic-Device-Join"

# --- On DC01: the device certificate written by Workstation01 must sync up ---
Get-ADComputer WORKSTATION01 -Properties userCertificate |
  Select-Object Name, @{n = 'Certificates'; e = { $_.userCertificate.Count }}
Start-ADSyncSyncCycle -PolicyType Delta

# --- On Workstation01 after a restart: check (look at Device Name first!) ---
dsregcmd /status   # expect AzureAdJoined: YES, DomainJoined: YES, and AzureAdPrt: YES for a signed-in user
