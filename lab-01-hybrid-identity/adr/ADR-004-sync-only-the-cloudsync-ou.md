# ADR-004: Sync only the CloudSync OU

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** AD holds admins, service accounts and test users. Not all of them should exist in the cloud.
- **Options:** (1) sync the whole domain (the Express default); (2) sync only selected OUs.
- **Decision:** sync only the CloudSync OU.
- **Why:** least privilege. Admin and service accounts never reach the cloud, so a stolen cloud session can't touch them. Putting a user or computer in the OU is a clear on and off switch.
- **Trade-offs:** someone has to remember to place new users in the right OU. In production, a naming rule or an automation would handle it.

[Back to all decisions](README.md)
