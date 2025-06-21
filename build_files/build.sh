#!/bin/bash
set -ouex pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Starting build process..."


echo "enabling services and replacing flatpaks..."
bash "$SCRIPT_DIR/enable-services.sh"

echo "installing rpmrepo+mesa+codecs..."
bash "$SCRIPT_DIR/enarpmfus.sh"

echo "Installing and removing packages..."
bash "$SCRIPT_DIR/packages.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/cleanup.sh"

echo "Build process completed."

