# Purpose

This repository is a custom build of Fedora silverblue, inspired originally by Ublue, and it's images. 

# Goal

A "ready to use" image customized for my needs. 

Removing unused included applications, for peace of mind.

Installing Codecs and hardware drivers from Rpmfusion to get proper hw-acceleration on Intel-T450.

# How does it work?

The containerfile sets up so we can have bash scripts in build_files instead of having a large containerfile with everything. This makes it very modular, since we have one script referencing all the other scripts, we can easily remove or add build scripts that we will be executed in the order we select. 

The containerfile is also responsible for copying all our files from repo rootfs to /. Here we can add themes, systemd unit files, anything we want to copy over to the Immutables system. 


## INSPIRED BY
- [Ublue](https://github.com/ublue-os/image-template)
- [bluefusion](https://github.com/aguslr/bluefusion/tree/main)
- [fp-os](https://github.com/fptbb/fp-os/tree/main)
- [Amy OS](https://github.com/astrovm/amyos)
- [VeneOS](https://github.com/Venefilyn/veneos)
