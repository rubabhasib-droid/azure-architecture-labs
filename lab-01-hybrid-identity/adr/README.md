# Architecture Decision Records

**What an ADR is:** a short note that records one design decision: what the situation was, which options there were, what was chosen, why, and what it costs. The summary table lists the decisions in one line each; the ADR files explain them. They're written so they can be reused as answers to "Why did you choose X over Y?" in an interview.

Each one uses the same five headings:

- **Context:** the problem or situation
- **Options:** what could have been done
- **Decision:** what was done
- **Why:** the reasons
- **Trade-offs:** what it costs, or what would make a different choice better

## Index

| ADR | Decision |
|---|---|
| [ADR-001](ADR-001-use-entra-connect-sync-to-link-ad-to-entra-id.md) | Use Entra Connect Sync to link AD to Entra ID |
| [ADR-002](ADR-002-password-hash-sync-for-cloud-sign-in.md) | Password hash sync for cloud sign-in |
| [ADR-003](ADR-003-add-wrathrock-com-as-a-login-suffix-instead.md) | Add wrathrock.com as a login suffix instead of renaming the domain |
| [ADR-004](ADR-004-sync-only-the-cloudsync-ou.md) | Sync only the CloudSync OU |
| [ADR-005](ADR-005-run-entra-connect-on-the-domain-controller.md) | Run Entra Connect on the domain controller |
| [ADR-006](ADR-006-keep-a-cloud-only-break-glass-global-admin.md) | Keep a cloud-only break-glass Global Admin |
| [ADR-007](ADR-007-dc01-takes-its-time-from-time-windows-com.md) | DC01 takes its time from time.windows.com |
| [ADR-008](ADR-008-hybrid-join-instead-of-seamless-sso.md) | Hybrid join instead of Seamless SSO |
| [ADR-009](ADR-009-roll-out-conditional-access-to-a-pilot-group.md) | Roll out Conditional Access to a pilot group first |
| [ADR-010](ADR-010-narrow-firewall-exception-for-lnx01-instead.md) | Narrow firewall exception for LNX01 instead of opening the DMZ |
| [ADR-011](ADR-011-sssd-gpo-access-control-set-to-permissive.md) | sssd GPO access control set to permissive |
| [ADR-012](ADR-012-monthly-budget-and-no-always-on-network.md) | Monthly budget and no always-on network services |

## Summary table

One line per decision. Each one is explained in its own ADR file, listed below.

| Decision | Chosen | Alternative | Why |
| --- | --- | --- | --- |
| Sync tool | Entra Connect Sync | Entra Cloud Sync | Matches the plan and covers hybrid join. Cloud Sync is lighter and worth comparing in the ADR |
| Sign-in method | Password hash sync | Pass-through authentication, federation | Cloud sign-in keeps working when DC01 is off. PTA would fail whenever the lab is shut down |
| Login suffix | wrathrock.com added to the forest | Renaming the lab.local domain | Adding a suffix is the standard, low-risk fix for a non-routable domain |
| Sync scope | Only the CloudSync OU | Whole domain (Express) | Least privilege. Admin and service accounts never reach the cloud |
| Sync server | DC01 | Dedicated member server | Saves lab RAM. Production would use a separate Tier 0 server |
| Emergency access | Cloud-only break-glass Global Admin | Rely on synced admins | Survives a bad Conditional Access policy, a lost phone, or DC01 being down |
| Time source | DC01 syncs from time.windows.com | Default VM time | Certificate sign-in fails if the clock drifts. DC01 sets the time for the whole domain |
| Seamless SSO | Off | On | Hybrid join provides SSO in the modern way |
| Cost control | 20 USD monthly budget with alerts, no always-on network services | No budget | Keeps the lab affordable. Alerts warn but don't stop spending |

**What I'd do differently in production:** run Entra Connect on a hardened, dedicated server, add a second server in staging mode for disaster recovery, and alert on every break-glass sign-in.
