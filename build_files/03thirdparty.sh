#!/bin/bash
set -ouex pipefail

# Apps from vendor repos (repo files are in system_files/etc/yum.repos.d/)
dnf5 install -y \
    codium \
    github-desktop
