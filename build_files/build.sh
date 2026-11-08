#!/bin/bash
set -ouex pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Starting build process..."

# Copy system_files/ from the repo into the image root
echo "Copying system-files"
cp -avf "/ctx/system_files"/. /

echo "Installing and removing packages..."
bash "$SCRIPT_DIR/01packages.sh"

echo "Installing RPM Fusion packages..."
bash "$SCRIPT_DIR/02rpmfusion.sh"

echo "Installing third-party repo packages..."
bash "$SCRIPT_DIR/03thirdparty.sh"

echo "Installing Mission Center..."
bash "$SCRIPT_DIR/04missioncenter.sh"

echo "Enabling services..."
bash "$SCRIPT_DIR/05systemctl.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/06cleanup.sh"

echo "Build process completed."
