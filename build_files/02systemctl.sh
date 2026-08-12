#!/usr/bin/bash
set -euox pipefail

	# Enabling systemd-services
    #systemctl enable libvirtd.service
	systemctl enable podman.socket
	systemctl enable flatpak-cleanup.timer
	###Disabling stuff I dont want or need
	systemctl disable lvm2-monitor.service #I dont use any lvm or raid
	systemctl disable ModemManager.service #I have fiber not 56k
	systemctl disable sssd.service #ldap/active directory
	systemctl disable switcheroo-control.service #optimus graphic/hybrid laptop
	#More stuff removed.
	systemctl disable sssd-kcm.service #kerberos credential manager
	systemctl disable pcscd.service #smart card daemon
	systemctl disable pcscd.socket #smart card socket listener
	systemctl disable cups.service #cups print scheduler
	systemctl disable cups.socket #cups print socket listener