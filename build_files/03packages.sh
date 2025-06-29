#!/bin/bash
set -ouex pipefail

# this installs packages from all fedora/rpm repos
dnf5 install -y \
    gparted \
    fastfetch \
    distrobox \
    ptyxis \
    adobe-source-code-pro-fonts \
    steam-devices \
    zstd \
    just \
    libva-intel-driver

# remove default useless packages
    dnf5 remove -y \
    firefox \
    firefox-langpacks \
    yelp \
    gnome-tour

