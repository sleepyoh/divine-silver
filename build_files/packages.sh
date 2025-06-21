#!/bin/bash
set -ouex pipefail

# this installs a package from fedora repos
dnf5 install -y \
    gparted \
    fastfetch \
    distrobox \
    #ptyxis \
    adobe-source-code-pro-fonts \
    steam-devices \
    just


# remove default useless packages
    dnf5 remove -y \
    firefox \
    firefox-langpacks \
    yelp \  
    gnome-tour   
    





