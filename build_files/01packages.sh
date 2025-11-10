#!/bin/bash
set -ouex pipefail

# Virtualization stuff
#dnf5 install -y @virtualization

# this installs packages from all fedora/rpm repos
dnf5 install -y \
    intel-media-driver \
    gparted \
    gnome-clocks \
    gnome-weather \
    gnome-calculator \
    gnome-calendar \
    evince \
    loupe \
    file-roller-nautilus \
    fastfetch \
    distrobox \
    google-roboto-fonts \
    rsms-inter-fonts \
    adobe-source-code-pro-fonts \
    steam-devices \
    zstd \
    just \
    tmux \
    yt-dlp \
    traceroute \
    nmap \
    unrar \
    htop \
    btop \
    gdu \
    fish \
    speedtest-cli \
    lolcat \
    cowsay \
    cmatrix

# remove default useless packages
    dnf5 remove -y \
    yelp \
    gnome-tour