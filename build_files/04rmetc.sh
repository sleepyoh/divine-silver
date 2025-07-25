#!/usr/bin/bash
set -euox pipefail

rm \
    /etc/os-release \
    /etc/fedora-release \
    /etc/redhat-release \
    /etc/system-release \
    /etc/system-release-cpe \
    /usr/lib/fedora-release \
    /usr/lib/system-release-cpe \
    /usr/lib/os-release \
    /etc/yum.repos.d/rpmfusion* \
    /etc/yum.repos.d/fedora-cisco-openh264.repo \

    cp /usr/local/share/os-release /etc/os-release 
    cp /usr/local/share/os-release /usr/lib/os-release