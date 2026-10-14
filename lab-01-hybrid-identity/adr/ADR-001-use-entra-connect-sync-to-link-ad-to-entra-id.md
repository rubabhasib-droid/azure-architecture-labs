# ADR-001: Use Entra Connect Sync to link AD to Entra ID

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** users and computers live in on-prem AD (lab.local). They need the same accounts in the cloud.
- **Options:** (1) Entra Connect Sync, installed software on a Windows server; (2) Entra Cloud Sync, a light agent managed from the cloud; (3) create cloud accounts by hand.
- **Decision:** Entra Connect Sync.
- **Why:** it supports hybrid join of Windows devices, which Cloud Sync doesn't. It's still the most common tool in existing companies, so it's the one worth knowing.
- **Trade-offs:** heavier to run and upgrade. Microsoft is steering new setups towards Cloud Sync, so a new company with no device needs should probably start there.

[Back to all decisions](README.md)
