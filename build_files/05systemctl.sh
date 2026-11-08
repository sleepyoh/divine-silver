#!/usr/bin/bash
set -euox pipefail

# Enable services
systemctl enable podman.socket

# Disable services I don't need
# bluetooth.service stays enabled: these are laptops.
systemctl disable mdmonitor.service          # no LVM/RAID
systemctl disable lvm2-monitor.service       # no LVM/RAID
systemctl disable raid-check.timer           # no software RAID
systemctl disable ModemManager.service       # no mobile/dial-up modem
systemctl disable sssd.service               # LDAP/Active Directory
systemctl disable gssproxy.service           # Kerberos/GSSAPI/AD
systemctl disable switcheroo-control.service # hybrid graphics laptops
systemctl disable systemd-homed.service      # not using systemd-homed

# cups.service is gone because the printing removal block in 01packages.sh removes CUPS.
# REMINDER: if that block is ever removed, uncomment this line to keep CUPS disabled.
#systemctl disable cups.service               # no printer

# The VM guest services are gone because 01packages.sh removes the guest tools, and
# "systemctl disable" fails the build when the unit doesn't exist.
# REMINDER: if that block is ever removed, uncomment these lines to keep them disabled.
#systemctl disable vboxservice.service        # VirtualBox guest
#systemctl disable vgauthd.service            # VMware guest
#systemctl disable vmtoolsd.service           # VMware guest
