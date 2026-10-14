# ADR-012: Monthly budget and no always-on network services

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** the whole lab must cost under 20 USD a month.
- **Options:** (1) no budget; (2) a budget with alerts, and avoid services that bill by the hour (VPN gateway, Azure Firewall, Bastion).
- **Decision:** a 20 USD monthly budget with alerts, and identity features only, which have no hourly charge.
- **Why:** keeps the lab affordable while showing cost awareness, which architects are expected to have.
- **Trade-offs:** an Azure budget only warns; it doesn't stop spending. Hourly services still have to be avoided by habit.

[Back to all decisions](README.md)
