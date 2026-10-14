# ADR-011: sssd GPO access control set to permissive

**Status:** Accepted · **Lab:** 1, Hybrid identity

- **Context:** after LNX01 joined, AD accepted tuser1's password, but sssd still refused the login. It couldn't complete its check of the domain's Group Policy logon rights.
- **Options:** (1) keep enforcing and fix the GPO rights; (2) permissive: evaluate and log, but don't block; (3) turn the check off.
- **Decision:** permissive, in the lab.
- **Why:** it unblocks the test and still logs what would have been denied, so nothing is hidden.
- **Trade-offs:** it's weaker than enforcing. Production would keep enforcing, set the logon right through GPO, and limit Linux logins to a group with `realm permit -g`.

[Back to all decisions](README.md)
