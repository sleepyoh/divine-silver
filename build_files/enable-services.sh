#!/usr/bin/bash
set -euo pipefail

	# Enabling systemd-services
    systemctl enable podman.socket
    systemctl enable flatpak-add-flathub-repo.service
	systemctl enable flatpak-replace-fedora-apps.service
	systemctl enable flatpak-cleanup.timer
	systemctl enable install-my-flatpaks.service
	systemctl enable rpm-ostreed-automatic.timer
