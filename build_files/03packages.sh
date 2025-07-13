#!/bin/bash
set -ouex pipefail

# Virtualization stuff
dnf5 install -y @virtualization

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
    libva-intel-driver \
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
    firefox \
    firefox-langpacks \
    yelp \
    gnome-tour