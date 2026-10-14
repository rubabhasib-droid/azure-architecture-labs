# ADR-007: DC01 takes its time from time.windows.com

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** the first Entra Connect install failed because DC01's clock was one hour fast (wrong time zone), so its certificate looked "not valid yet".
- **Options:** (1) leave the VM's default time; (2) set the right time zone and point DC01 at an internet time source.
- **Decision:** Mountain Time, synced from time.windows.com.
- **Why:** certificates and Kerberos both fail when clocks drift. DC01 is the time source for the whole domain, so it must be right.
- **Trade-offs:** none worth noting. Every new VM still needs its time zone checked (SQL01 and Workstation01 were also on Pacific).

[Back to all decisions](README.md)
