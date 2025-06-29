#!/bin/bash
set -ouex pipefail

# Add COPRs
#dnf5 -y copr enable ublue-os/packages

#dnf5 -y install \
    #ublue-os-just

    #dnf5 -y copr remove ublue-os/packages

    #Trying to see if you can use CachyOS kernel, for fun.

    #We need this to be able to load kernel modules if we change kernel, because of se-linux.
    setsebool -P domain_kernel_load_modules on

    dnf5 -y copr enable bieszczaders/kernel-cachyos

    rpm-ostree override remove \
     kernel \
     kernel-core \
     kernel-modules \
     kernel-modules-core \
     kernel-modules-extra \
     --install kernel-cachyos

     #Removing repos after build

dnf5 -y copr remove bieszczaders/kernel-cachyos