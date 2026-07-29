#!/bin/bash
set -ouex pipefail

# To disable all RPM Fusion repos with a wildcard (if supported)
#dnf5 -y config-manager setopt "rpmfusion*.enabled=0"
#dnf5 -y config-manager setopt "fedora-cisco-openh264.enabled=0"

# Disabling a default fedora repo for som copr-python thing
dnf5 -y copr remove phracek/PyCharm

### Cleaning
# Clean package manager cache
dnf5 clean all

# Cleanup specific to bootc (important for non-empty boot issue) not needed if not changing to CachyOs kernel.
#rm -rf /boot && mkdir /boot 