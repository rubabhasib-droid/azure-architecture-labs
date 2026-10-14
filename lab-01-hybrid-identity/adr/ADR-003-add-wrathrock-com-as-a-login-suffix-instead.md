# ADR-003: Add wrathrock.com as a login suffix instead of renaming the domain

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** lab.local can't be used in the cloud because nobody can prove they own ".local". Users need a real domain in their sign-in name.
- **Options:** (1) add wrathrock.com as an extra UPN suffix; (2) rename the AD domain.
- **Decision:** add a UPN suffix and give synced users @wrathrock.com logins.
- **Why:** it's a two-minute, low-risk change. Renaming a domain is slow and risky, and it breaks things like Exchange and some apps.
- **Trade-offs:** the internal domain name (lab.local) and the sign-in name differ, which can confuse help desk staff at first.

[Back to all decisions](README.md)
