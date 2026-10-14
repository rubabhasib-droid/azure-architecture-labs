<#
  Lab 1, Step 6: pre-flight checks before installing Entra Connect Sync (run on DC01)
#>
# Can DC01 reach Microsoft sign-in through the firewall?
Resolve-DnsName login.microsoftonline.com | Select-Object -First 1
Test-NetConnection login.microsoftonline.com -Port 443 | Select-Object ComputerName, TcpTestSucceeded

# Entra Connect runs signed scripts during install
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine -Force

# .NET version (528040 or higher means 4.8)
(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").Release

# Clock check: certificates and Kerberos fail when the clock drifts (see troubleshooting)
Get-TimeZone
w32tm /stripchart /computer:time.windows.com /samples:3 /dataonly

# AD Recycle Bin, recommended by Microsoft. It can't be turned off later.
Enable-ADOptionalFeature "Recycle Bin Feature" -Scope ForestOrConfigurationSet -Target "lab.local" -Confirm:$false
