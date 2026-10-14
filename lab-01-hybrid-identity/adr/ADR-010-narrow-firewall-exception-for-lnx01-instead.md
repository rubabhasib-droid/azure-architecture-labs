# ADR-010: Narrow firewall exception for LNX01 instead of opening the DMZ

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** LNX01 sits in a DMZ (OPT1), where a rule blocks all traffic to the internal network. Joining the domain needs LNX01 to reach DC01.
- **Options:** (1) remove or loosen the block rule; (2) move LNX01 into the internal network; (3) add one rule allowing only LNX01 to DC01 on the AD ports.
- **Decision:** option 3. One pass rule above the block rule: source LNX01, destination DC01, ports DNS, Kerberos, time, LDAP, SMB and Global Catalog only, TCP and UDP.
- **Why:** least privilege at the network level. The DMZ stays a DMZ; even ping from LNX01 to DC01 still fails.
- **Trade-offs:** a compromised LNX01 could now talk to DC01 on those ports, so DC01 becomes more exposed. In production, a read-only domain controller or a jump host in between would reduce that.

[Back to all decisions](README.md)
