# ADR-005: Run Entra Connect on the domain controller

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** Entra Connect needs a Windows server joined to the domain.
- **Options:** (1) install it on DC01; (2) build a separate member server.
- **Decision:** install it on DC01.
- **Why:** saves RAM and disk on the lab host, and one fewer VM to patch.
- **Trade-offs:** Microsoft treats the sync server as "Tier 0", as sensitive as a domain controller. Production would use a separate, hardened server, plus a second one in staging mode as a backup.

[Back to all decisions](README.md)
