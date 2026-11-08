#!/bin/bash
set -ouex pipefail

# Disable repos I don't need
dnf5 -y config-manager setopt "fedora-cisco-openh264.enabled=0"

# Disable third-party repos (used in 03thirdparty.sh), like RPM Fusion below
dnf5 -y config-manager setopt "vscodium.enabled=0" "shiftkey-desktop.enabled=0"

# Remove RPM Fusion repos (added in 02rpmfusion.sh); installed packages stay
dnf5 remove -y rpmfusion-free-release rpmfusion-nonfree-release

# Clean package manager cache
dnf5 clean all

# Remove build leftovers in /run so "bootc container lint" doesn't warn about them.
# /run is empty at boot anyway; gluster and setrans are recreated by their tmpfiles.d entries.
rm -rf /run/dnf /run/gluster /run/selinux-policy /run/setrans

# Remove dnf's per-repo state (countme files) from the build
rm -rf /var/lib/dnf/repos

# Not needed: /tmp is a tmpfs mount in the Containerfile, so it never ends up in the image.
# Uncomment if that mount is ever removed.
#rm -rf /tmp/*
