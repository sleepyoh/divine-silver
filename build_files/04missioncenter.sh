#!/bin/bash
set -ouex pipefail

# Mission Center from its official AppImage (latest GitLab release).
# Extracted into /usr/lib so it runs without FUSE.
RELEASE_API="https://gitlab.com/api/v4/projects/mission-center-devs%2Fmission-center/releases/permalink/latest"
URL=$(curl -fsSL "$RELEASE_API" | jq -r '.assets.links[] | select(.name == "AppImage (x86_64)") | .url')

cd /tmp
curl -fsSL -o MissionCenter.AppImage "$URL"
chmod +x MissionCenter.AppImage
./MissionCenter.AppImage --appimage-extract >/dev/null
rm MissionCenter.AppImage

# squashfs-root may be a symlink to the real extracted folder
mv "$(readlink -f squashfs-root)" /usr/lib/mission-center
rm -f squashfs-root

# Launcher, menu entry and icon
cat > /usr/bin/missioncenter <<'EOF'
#!/bin/sh
exec /usr/lib/mission-center/AppRun "$@"
EOF
chmod 755 /usr/bin/missioncenter

install -Dm644 /usr/lib/mission-center/io.missioncenter.MissionCenter.desktop \
    /usr/share/applications/io.missioncenter.MissionCenter.desktop
install -Dm644 /usr/lib/mission-center/io.missioncenter.MissionCenter.svg \
    /usr/share/icons/hicolor/scalable/apps/io.missioncenter.MissionCenter.svg
