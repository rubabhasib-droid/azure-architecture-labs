# ADR-006: Keep a cloud-only break-glass Global Admin

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** Conditional Access policies can lock everyone out if they're set up wrong. Synced admins also depend on DC01 and on sync working.
- **Options:** (1) rely on normal admin accounts; (2) keep one emergency account that lives only in the cloud.
- **Decision:** a cloud-only break-glass Global Admin, excluded from every Conditional Access policy.
- **Why:** it still works after a bad policy, a lost phone, or DC01 being down.
- **Trade-offs:** it's a powerful account that skips policy, so it needs a very long password kept offline, and every sign-in on it should raise an alert. Production would have two.

[Back to all decisions](README.md)
