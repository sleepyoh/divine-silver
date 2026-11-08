ARG FEDORA_MAJOR_VERSION=45

# Build context: makes build_files/ and system_files/ available to build.sh
# without copying them into the final image
FROM scratch AS ctx
COPY build_files /
COPY system_files /system_files

FROM quay.io/fedora/fedora-silverblue:${FEDORA_MAJOR_VERSION}

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

# Verify the final image is a valid bootc image
RUN bootc container lint
