# Purpose

This repository is a custom build of Fedora silverblue, inspired originally by Ublue, and it's images. 

# Goal

Everything possible that are standard applications are removed, every flatpak is removed. Every app possible is installed from flatpak.

Installs all good codecs from rpmfusion, we change mesa to mesa-freeworld to benefit from full hardware acceleration on Amd graphics cards.  

We install some useful things like Distrobox, Fastfetch and gparted.

We get latest CachyOs kernel from official copr repo.

Steam-vapor theme is included.


# How does it work?

The containerfile sets up so we can have bash scripts in build_files instead of having a giant containerfile with everything. Only reason for this is to make simpler, and comparmentalize different steps in the build. 

All scripts that installs, removes, enables systemd timers and so on lives in build_files directory, Build.sh  points to the other scripts where we do what we want. We can add more, disable current scripts, and so on. All systemd files where we do a bunch of magic with timers, one shot and conditions, are installed rootfs/usr/local or /rootfs/lib/systemd/system.

The containerfile is also responsible for copying all our files from repo rootfs to /. Here we can add themes, systemd unit files, anything we want to copy over to the Immutables system. 


## INSPIRED BY
- [Ublue](https://github.com/ublue-os/image-template)
- [bluefusion](https://github.com/aguslr/bluefusion/tree/main)
- [fp-os](https://github.com/fptbb/fp-os/tree/main)
- [Amy OS](https://github.com/astrovm/amyos)
- [VeneOS](https://github.com/Venefilyn/veneos)
