# Purpose

This repository is a custom build of Fedora silverblue, inspired originally by Ublue, and it's images. 

# Goal

The goal of this image is to create a stable Immutable Gnome desktop with as many packages removed from base Gnome as possible, and opting for everything from Flatpak@Flathub. This means all removed to give a blank Gnome canvas.

We switch all Fedora flatpaks to Flathub flatpaks on first boot, and then disable Fedora flatpak repo, and we enable a timer that removes old unused flatpaks on boot. 

we get all good codecs from rpmfusion, we change mesa to mesa-freeworld to benefit from full hardware acceleration on Amd graphics cards.  

We install some useful things like Distrobox, Fastfetch and Htop.

That's about it (for now)!

# How does it work?

The containerfile sets up so we can have bash scripts in build_files instead of having a giant containerfile with everything. Only reason for this is to make simpler, and comparmentalize different steps in the build. 

All scripts that installs, removes, enables systemd timers and so on lives in build_files directory, Build.sh  points to the other scripts where we do what we want. We can add more, disable current scripts, and so on. 

The containerfile is also responsible for copying all our files from repo rootfs to /. Here we can add themes, systemd unit files, anything we want to copy over to the Immutables system. 



## INSPIRED BY
- [Ublue](https://github.com/ublue-os/image-template)
- [bluefusion](https://github.com/aguslr/bluefusion/tree/main)
- [fp-os](https://github.com/fptbb/fp-os/tree/main)
- [Amy OS](https://github.com/astrovm/amyos)
- [VeneOS](https://github.com/Venefilyn/veneos)
