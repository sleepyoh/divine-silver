#!/bin/bash
set -ouex pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo "Starting build process..."

echo "installing rpmrepo+mesa+codecs..."
bash "$SCRIPT_DIR/00enarpmfus.sh"

echo "Installing and removing packages..."
bash "$SCRIPT_DIR/01packages.sh"

#echo "Installing copr stuff..."
#bash "$SCRIPT_DIR/02cachy-kernel.sh"

echo "enabling services..."
bash "$SCRIPT_DIR/03enable-services.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/04rmetc.sh"

echo "Cleaning up..."
bash "$SCRIPT_DIR/05cleanup.sh"

echo "Build process completed."

