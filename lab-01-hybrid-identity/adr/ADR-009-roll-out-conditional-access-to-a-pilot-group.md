# ADR-009: Roll out Conditional Access to a pilot group first

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** MFA is needed, but a wrong policy can block everyone, including admins.
- **Options:** (1) one policy for all users at once; (2) pilot group first, then widen; (3) keep Security Defaults.
- **Decision:** a pilot group (CA-Lab-MFA-Users) for user MFA, plus Microsoft's admin MFA and block-legacy-auth templates. Break-glass excluded everywhere. Security Defaults turned off, because it can't run alongside Conditional Access.
- **Why:** a small group shows problems before they reach everyone. Templates follow Microsoft's baseline. Blocking legacy sign-in closes the most common password-spray route.
- **Trade-offs:** Conditional Access needs an Entra ID P1 or P2 licence for every user it covers. Turning off Security Defaults means the policies must be right, because nothing else protects the tenant.

[Back to all decisions](README.md)
