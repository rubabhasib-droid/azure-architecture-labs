#!/usr/bin/env bash
# Lab 1, Part 9: join an Ubuntu server (LNX01) to lab.local with realmd and sssd.
# Prerequisites:
#   - LNX01 can reach DC01 on the AD ports (DNS 53, Kerberos 88/464, NTP 123,
#     LDAP 389/636, SMB 445, Global Catalog 3268/3269), TCP and UDP.
#     In this lab that needed one pfSense rule on the DMZ interface (see ADR-010).
#   - Run as a user with sudo rights.
set -euo pipefail

DC_IP="10.10.10.10"      # DC01, the domain's DNS server
DOMAIN="lab.local"
IFACE="ens33"

# 1. Tools for the join
sudo DEBIAN_FRONTEND=noninteractive apt install -y realmd sssd sssd-tools libnss-sss \
  libpam-sss adcli samba-common-bin oddjob oddjob-mkhomedir packagekit krb5-user

# 2. Use DC01 for DNS (keep the DHCP address, ignore DHCP's DNS server)
sudo tee /etc/netplan/99-lab-dns.yaml > /dev/null <<NETPLAN
network:
  version: 2
  ethernets:
    ${IFACE}:
      dhcp4: true
      dhcp4-overrides:
        use-dns: false
      dhcp6-overrides:
        use-dns: false
      nameservers:
        addresses: [${DC_IP}]
        search: [${DOMAIN}]
NETPLAN
sudo chmod 600 /etc/netplan/99-lab-dns.yaml
sudo netplan apply

# 3. Can we find the domain controller?
resolvectl query -t SRV _ldap._tcp.${DOMAIN}
realm discover ${DOMAIN}

# 4. Join (asks for the AD Administrator password)
sudo realm join -U Administrator ${DOMAIN} --verbose

# 5. Create home folders on first sign-in, then verify AD users resolve
sudo pam-auth-update --enable mkhomedir
realm list
id tuser1@${DOMAIN}

# 6. Lab only: GPO logon check in permissive mode (see ADR-011).
#    Production: keep enforcing and allow a group with: sudo realm permit -g linux-admins@${DOMAIN}
sudo sed -i "/^\[domain\/${DOMAIN}\]/a ad_gpo_access_control = permissive" /etc/sssd/sssd.conf
sudo sss_cache -E
sudo systemctl restart sssd

echo "Test with: ssh tuser1@${DOMAIN}@<lnx01-ip>, then run whoami, pwd and klist"
