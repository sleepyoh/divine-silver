#!/bin/bash
set -ouex pipefail

# Virtualization stuff
dnf5 install -y @virtualization

# this installs packages from all fedora/rpm repos
dnf5 install -y \
    libva-intel-driver \
    gparted \
    gnome-maps \
    gnome-clocks \
    gnome-weather \
    gnome-calculator \
    gnome-calendar \
    evince \
    loupe \
    file-roller-nautilus \
    kolourpaint \
    steam \
    obs-studio \
    obs-studio-plugin-vkcapture \
    obs-studio-plugin-vaapi \
    obs-studio-plugin-x264 \
    obs-studio-plugin-vlc-video \
    telegram-desktop \
    vlc \
    libreoffice-core \
    libreoffice-writer \
    libreoffice-impress \
    libreoffice-calc \
    mangohud \
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