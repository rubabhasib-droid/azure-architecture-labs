# Scripts

The commands from the [build guide](../build-guide.md), grouped by part so they can be re-run.
They are written for this lab (domain `lab.local`, suffix `wrathrock.com`); change the values at the top of each script for another environment.
No passwords are stored: every password is typed in at run time.

| Script | Runs on | Build guide |
|---|---|---|
| [windows/01-onprem-prep.ps1](windows/01-onprem-prep.ps1) | DC01 | Part 2 |
| [windows/02-preflight-checks.ps1](windows/02-preflight-checks.ps1) | DC01 | Step 6 |
| [windows/03-fix-time-source.ps1](windows/03-fix-time-source.ps1) | DC01 | Troubleshooting |
| [windows/04-sync-and-verify.ps1](windows/04-sync-and-verify.ps1) | DC01 | Verification |
| [windows/05-hybrid-join.ps1](windows/05-hybrid-join.ps1) | DC01 and Workstation01 | Part 4 |
| [windows/06-lifecycle-test.ps1](windows/06-lifecycle-test.ps1) | DC01 | Part 6 |
| [windows/07-cleanup-dc-registration.ps1](windows/07-cleanup-dc-registration.ps1) | DC01 | Part 7 |
| [linux/lnx01-domain-join.sh](linux/lnx01-domain-join.sh) | LNX01 | Part 9 |

The Entra admin center steps (Conditional Access, SAML app) are click-through and are described in the build guide.
