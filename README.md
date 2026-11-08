# divine-silver

A custom [Fedora Silverblue](https://fedoraproject.org/atomic-desktops/silverblue/) (GNOME) image for my laptops, built with bootc and based on the [Universal Blue image template](https://github.com/ublue-os/image-template).

## What it does

- Bakes every application into the image as a native package instead of a Flatpak
- Removes default applications I don't use
- Adds command-line tools I use daily
- Includes video drivers for both AMD and Intel, so one image runs on both laptops
- Removes VM guest tools and printing, and disables services I don't need
- Shortens the systemd shutdown timeout to 15 seconds

## Install

Install Fedora Silverblue, then switch to this image and reboot:

```
sudo bootc switch ghcr.io/sleepyoh/sleepy-linux:latest
```

## How it works

The `Containerfile` uses the official Fedora Silverblue image as its base and runs `build_files/build.sh`, which:

1. Copies `system_files/` into the image
2. Runs the numbered scripts in `build_files/` (packages, RPM Fusion, third-party apps, services, cleanup)

The image is built and published by GitHub Actions daily and on every push to `main`. It can also be built locally with `just build sleepy-linux latest`.

## Inspired by

- [Universal Blue](https://github.com/ublue-os/image-template)
- [bluefusion](https://github.com/aguslr/bluefusion/tree/main)
- [fp-os](https://github.com/fptbb/fp-os/tree/main)
- [Amy OS](https://github.com/astrovm/amyos)
- [VeneOS](https://github.com/Venefilyn/veneos)
