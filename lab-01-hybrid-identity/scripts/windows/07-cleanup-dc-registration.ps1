<#
  Lab 1, Part 7: remove an accidental Entra registration from a domain controller
  (it happens when someone signs in to Edge on the DC and accepts "Allow my organization to manage my device")
#>
dsregcmd /cleanupaccounts
dsregcmd /status | Select-String "WorkplaceJoined"   # expect NO
# Then delete the DC01 device in Entra admin center > Devices > All devices.
