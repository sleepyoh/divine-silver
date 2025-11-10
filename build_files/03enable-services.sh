#!/usr/bin/bash
set -euox pipefail

	# Enabling systemd-services
    systemctl enable libvirtd.service
	systemctl enable podman.socket
    systemctl enable flatpak-add-flathub-repo.service
	systemctl enable flatpak-remove-all.service
	systemctl enable flatpak-cleanup.timer
	#systemctl enable install-my-flatpaks.service
	systemctl enable rpm-ostreed-automatic.timer
	###Disabling stuff I dont want or need
	systemctl disable bluetooth.service # I dont have bluetooth
	systemctl disable mdmonitor.service # I dont use any lvm or raid
	systemctl disable lvm2-monitor.service #I dont use any lvm or raid
	systemctl disable ModemManager.service #I have fiber not 56k
	systemctl disable vboxservice.service #virtualbox thing
	systemctl disable vgauthd.service #wmvare ting
	systemctl disable vmtoolsd.service #vmware thing
	systemctl disable sssd.service #ldap/active directory
	systemctl disable switcheroo-control.service #optimus graphic/hybrid laptop
	##systemctl disable qemu-guest-agent.service I use vm's often
	##this is probably needed