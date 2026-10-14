# ADR-002: Password hash sync for cloud sign-in

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** users sign in to cloud apps with their AD password. DC01 is turned off whenever the lab isn't in use.
- **Options:** (1) password hash sync (PHS): a scrambled copy of the password hash goes to Entra, and Entra checks passwords itself; (2) pass-through authentication (PTA): Entra asks an on-prem agent to check each sign-in; (3) federation with AD FS: sign-in happens on on-prem servers.
- **Decision:** password hash sync.
- **Why:** cloud sign-in keeps working when DC01 is off. There's nothing extra to host. It also turns on leaked-password detection in Entra.
- **Trade-offs:** password changes take about 2 minutes to reach the cloud, and disabling an account on-prem only stops cloud sign-in after the next sync (seen in the leaver test). Companies that don't allow password hashes to leave the building would pick PTA.

[Back to all decisions](README.md)
