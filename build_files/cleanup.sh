#!/bin/bash
set -ouex pipefail

### Cleaning
# Clean package manager cache
dnf5 clean all

# Clean temporary files
rm -rf /tmp/*

# Clean /var directory while preserving essential files
find /var/* -maxdepth 0 -type d \! -name cache -exec rm -fr {} \;
find /var/cache/* -maxdepth 0 -type d \! -name libdnf5 \! -name rpm-ostree -exec rm -fr {} \;

# Restore and setup directories
mkdir -p /var/tmp
chmod -R 1777 /var/tmp

# Cleanup specific to bootc (important for non-empty boot issue)
# Remove tmp files and everything in dirs that make bootc unhappy
rm -rf /boot && mkdir /boot # This line is good and should be kept, we get non empty boot errors otherwise.
