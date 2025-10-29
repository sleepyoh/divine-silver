# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
ARG FEDORA_MAJOR_VERSION=43
FROM quay.io/fedora/fedora-silverblue${FEDORA_MAJOR_VERSION}
#FROM quay.io/fedora/fedora-kinoite

## Other possible base images include:
# Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:41
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10


#This copies all the files from folder rootfs to /
#This is how we get systemd-unit files, and other files we want to to copy to the immutable system.
COPY rootfs/ /


### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

## tmpfs needs to be on /var/tmp, /tmp gives us cross device build errors for cachyos kernel.
## We used to have--mount=type=tmpfs,dst=/tmp \ as last mount, but it fails with dracut/cacho kernel.
## We switched to ##--mount=type=tmpfs,dst=/var/tmp \ which builds, but looking at bluefin it doesn't seem necessary.

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    /ctx/build.sh
    
    ### LINTING
## Verify final image and contents are correct.
RUN bootc container lint    