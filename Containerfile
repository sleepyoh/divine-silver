# Base Image tag we want to use
ARG FEDORA_MAJOR_VERSION=44

# Stage 1 build. Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /
COPY system_files /system_files

# Base Image
FROM quay.io/fedora/fedora-silverblue:${FEDORA_MAJOR_VERSION}
# quay.io/fedora-ostree-desktops/silverblue This is apparently new location? in between the bootc locaiton 
# they are in the process of migrating to? not sure. 

## Other possible base images include:
#Universal Blue Images: https://github.com/orgs/ublue-os/packages
# Fedora base image: quay.io/fedora/fedora-bootc:44
# CentOS base images: quay.io/centos-bootc/centos-bootc:stream10

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    /ctx/build.sh
    
### LINTING
## Verify final image and contents are correct.
RUN bootc container lint    