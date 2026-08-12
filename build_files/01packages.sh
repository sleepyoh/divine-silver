#!/bin/bash
set -ouex pipefail

# Virtualization stuff
#dnf5 install -y @virtualization

# this installs packages from all fedora/rpm repos
dnf5 install -y \
    file-roller-nautilus \
    fastfetch \
    distrobox \
    adobe-source-code-pro-fonts \
    steam-devices \
    just \
    tmux \
    yt-dlp \
    traceroute \
    nmap \
    unar \
    htop \
    btop \
    gdu \
    fish \
    lolcat \
    cowsay \
    cmatrix

# remove default useless packages
    dnf5 remove -y \
    yelp \
    gnome-tour \
    firefox \
    firefox-langpacks \
    gnome-software