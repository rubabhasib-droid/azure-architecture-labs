<#
  Lab 1, troubleshooting: AADSTS700027 "key expired / not yet valid"
  Cause: DC01 was set to Pacific Time, so its real (UTC) clock was one hour fast.
  Fix: correct time zone, point the domain's time source at an internet clock.
  Run on DC01 (the PDC emulator, which sets time for the whole domain).
#>
# Find the exact rejection reason in the Entra Connect setup log
$log = Get-ChildItem "C:\ProgramData\AADConnect\trace-*.log" | Sort-Object LastWriteTime | Select-Object -Last 1
Select-String -Path $log.FullName -Pattern "AADSTS" | Select-Object -Last 5

# Fix
Set-TimeZone -Id "Mountain Standard Time"
w32tm /config /manualpeerlist:"time.windows.com,0x8" /syncfromflags:manual /reliable:yes /update
Restart-Service w32time
w32tm /resync /force
w32tm /stripchart /computer:time.windows.com /samples:3 /dataonly   # offset should now be about 0
