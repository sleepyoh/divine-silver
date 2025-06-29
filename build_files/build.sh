#!/bin/bash
set -ouex pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Starting build process..."

echo "enabling services and replacing flatpaks..."
bash "$SCRIPT_DIR/01enable-services.sh"

echo "installing rpmrepo+mesa+codecs..."
bash "$SCRIPT_DIR/02enarpmfus.sh"

echo "Installing and removing packages..."
bash "$SCRIPT_DIR/03packages.sh"

echo "Installing copr stuff..."
bash "$SCRIPT_DIR/04copr.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/05rmetc.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/06cleanup.sh"

echo "Build process completed."

