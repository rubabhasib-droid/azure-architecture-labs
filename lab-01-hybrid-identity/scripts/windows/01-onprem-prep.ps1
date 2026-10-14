<#
  Lab 1, Part 2: on-prem preparation (run on DC01 as a domain admin)
  - Adds wrathrock.com as a UPN suffix (lab.local can't be used in the cloud)
  - Creates the CloudSync OU: only objects in this OU are synced to Entra ID
  - Creates two test users with @wrathrock.com sign-in names
  Change the domain values before running in another environment.
#>
$UpnSuffix = "wrathrock.com"
$DomainDN  = "DC=lab,DC=local"
$SyncOU    = "OU=CloudSync,$DomainDN"

# Check the domain name and existing suffixes
Get-ADDomain | Select-Object DNSRoot, NetBIOSName
Get-ADForest | Select-Object -ExpandProperty UPNSuffixes

# Add the login suffix
Get-ADForest | Set-ADForest -UPNSuffixes @{Add = $UpnSuffix}

# OU that holds only the accounts we sync
New-ADOrganizationalUnit -Name "CloudSync" -Path $DomainDN

# Two test users (the password is typed in, never stored in the script)
$pw = Read-Host "Password for test users" -AsSecureString
foreach ($n in 1..2) {
    New-ADUser -Name "Test User$n" -GivenName "Test" -Surname "User$n" `
      -SamAccountName "tuser$n" -UserPrincipalName "tuser$n@$UpnSuffix" `
      -Path $SyncOU -AccountPassword $pw -Enabled $true
}

# Check
Get-ADUser -SearchBase $SyncOU -Filter * | Select-Object Name, UserPrincipalName, Enabled
