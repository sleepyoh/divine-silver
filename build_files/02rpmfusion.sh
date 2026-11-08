#!/bin/bash
set -ouex pipefail

# Enable RPM Fusion (removed again in 06cleanup.sh)
dnf5 install -y \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

# Full multimedia codecs
dnf5 swap -y ffmpeg-free ffmpeg --allowerasing

# Hardware video decoding/encoding. Both sets stay installed: libva picks by GPU at runtime.
# AMD (T14 Gen 1)
dnf5 install -y mesa-va-drivers-freeworld
# Intel (T450, Broadwell): full iHD driver plus the older i965 driver
dnf5 swap -y libva-intel-media-driver intel-media-driver --allowerasing
dnf5 install -y libva-intel-driver

# Applications from RPM Fusion
dnf5 install -y \
    steam \
    telegram-desktop \
    pcsx2
