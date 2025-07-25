#!/bin/bash
set -ouex pipefail

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