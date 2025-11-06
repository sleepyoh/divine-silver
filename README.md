# Purpose

This repository is a custom build of Fedora silverblue, inspired originally by Ublue, and it's images. 

# Goal

A "ready to use" image customized for my needs. 

Removing unused included applications, for peace of mind.

Installing Codecs and hardware drivers from Rpmfusion to get proper hw-acceleration.

Including every terminal program I use daily, instead of relying on Distrobox. Things like nmap need access to hardware and needs to be natively installed to work properly. 

Every program I daily use and which is available to install from standard repos is installed. Steam, Bottles, Obs, Virt-manager, etc. Flatpak is used only for applications not existing as native rpm-packages, things like vscodium, podman-desktop etc.  

Switching to Cachy-os kernel.

May contain more changes, but this is basically it!

# How does it work?

The containerfile sets up so we can have bash scripts in build_files instead of having a giant containerfile with everything. This makes it very modular, since we have one script referencing all the other scripts, we can easily remove or add build scripts that we will be executed in the order we select. 


There are some unit files with conditions for execution which sets up and installs some Flatpaks at first boot. All systemd files where we do a bunch of magic with timers, one shot and conditions, are installed rootfs/usr/local or /rootfs/lib/systemd/system.

The containerfile is also responsible for copying all our files from repo rootfs to /. Here we can add themes, systemd unit files, anything we want to copy over to the Immutables system. 


## INSPIRED BY
- [Ublue](https://github.com/ublue-os/image-template)
- [bluefusion](https://github.com/aguslr/bluefusion/tree/main)
- [fp-os](https://github.com/fptbb/fp-os/tree/main)
- [Amy OS](https://github.com/astrovm/amyos)
- [VeneOS](https://github.com/Venefilyn/veneos)
