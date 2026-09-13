#!/usr/bin/bash
set -euox pipefail

	# Enabling systemd-services
    #systemctl enable libvirtd.service
	systemctl enable podman.socket
	systemctl enable flatpak-cleanup.timer
	systemctl enable rpm-ostreed-automatic.timer
	###Disabling stuff I dont want or need
	#systemctl disable bluetooth.service # I dont have bluetooth
	systemctl disable mdmonitor.service # I dont use any lvm or raid
	systemctl disable lvm2-monitor.service #I dont use any lvm or raid
	systemctl disable ModemManager.service #I have fiber not 56k
	systemctl disable vboxservice.service #virtualbox thing
	systemctl disable vgauthd.service #wmvare ting
	systemctl disable vmtoolsd.service #vmware thing
	systemctl disable sssd.service #ldap/active directory
	systemctl disable switcheroo-control.service #optimus graphic/hybrid laptop
	systemctl disable cups.service # I dont use a printer 
	systemctl disable systemd-homed.service # I dont use systemd-homed 
	systemctl disable gssproxy.service # I dont use kerberos/GSSAPI/AD 
	systemctl disable raid-check.timer # I dont use software RAID
	##systemctl disable qemu-guest-agent.service I use vm's often
	##this is probably needed