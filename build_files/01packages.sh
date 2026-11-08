#!/bin/bash
set -ouex pipefail

# Install packages
dnf5 install -y \
    file-roller-nautilus \
    fastfetch \
    distrobox \
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

# Install applications
dnf5 install -y \
    bottles \
    gnome-boxes \
    gnome-calculator \
    evince \
    loupe \
    gnome-weather \
    vlc \
    drawing \
    sushi \
    gnome-extensions-app \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-blur-my-shell

# Remove default packages I don't use
dnf5 remove -y \
    yelp \
    gnome-tour \
    gnome-software \
    gnome-disk-utility \
    gnome-system-monitor

# Remove printing and scanning (no printer/scanner on these laptops)
# cups-libs and cups-pk-helper stay: gnome-control-center and gnome-settings-daemon need them.
# If you delete this block, uncomment "systemctl disable cups.service" in 05systemctl.sh
dnf5 remove -y \
    cups \
    cups-filters \
    cups-browsed \
    cups-filters-driverless \
    cups-client \
    cups-ipptool \
    bluez-cups \
    system-config-printer-udev \
    system-config-printer-libs \
    python3-cups \
    hplip \
    hplip-common \
    hplip-libs \
    gutenprint \
    gutenprint-cups \
    gutenprint-libs \
    ptouch-driver \
    splix \
    c2esp \
    printer-driver-brlaser \
    mpage \
    ghostscript-tools-printing \
    dymo-cups-drivers \
    braille-printer-app \
    sane-backends \
    sane-backends-drivers-cameras \
    sane-backends-drivers-scanners \
    sane-airscan \
    libsane-airscan \
    libsane-hpaio

# Remove VM guest tools (this runs on bare metal, not inside a VM)
# qemu-guest-agent stays on purpose.
# If you delete this block, uncomment the VM guest lines in 05systemctl.sh
dnf5 remove -y \
    open-vm-tools \
    open-vm-tools-desktop \
    virtualbox-guest-additions \
    hyperv-daemons

# Remove Asian-language input engines (CJK fonts stay, so Asian text still displays)
# ibus itself must stay: gnome-shell requires it.
dnf5 remove -y \
    ibus-anthy \
    ibus-anthy-python \
    ibus-hangul \
    ibus-libpinyin \
    ibus-m17n \
    ibus-typing-booster \
    ibus-chewing
