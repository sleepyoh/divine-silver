#!/bin/bash
set -ouex pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Starting build process..."

# Copy the contents of system_files/ of the git repo to /

echo "Copying system-files"
cp -avf "/ctx/system_files"/. /

echo "installing rpmrepo+mesa+codecs..."
bash "$SCRIPT_DIR/00fusionmedia.sh"

echo "Installing and removing packages..."
bash "$SCRIPT_DIR/01packages.sh"

echo "enabling services..."
bash "$SCRIPT_DIR/02systemctl.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/03osrls.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/04cleanup.sh"

echo "Build process completed."

