# ADR-008: Hybrid join instead of Seamless SSO

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** users on domain PCs should get into cloud apps without typing a password again.
- **Options:** (1) Seamless SSO, an older Kerberos-based feature; (2) Microsoft Entra hybrid join, which gives the PC a Primary Refresh Token (PRT).
- **Decision:** hybrid join, with Seamless SSO left off.
- **Why:** the PRT is Microsoft's current SSO method. It also lets Conditional Access check the device, which Seamless SSO can't.
- **Trade-offs:** only works on Windows 10 and later. Older machines would still need Seamless SSO.

[Back to all decisions](README.md)
