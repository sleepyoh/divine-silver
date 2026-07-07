#!/bin/bash
set -ouex pipefail

# Optional: log what you’re doing
echo "Installing user-specified Flatpaks..."

# Path to your list
LIST_FILE="/usr/local/share/my-flatpaks"


# Read & install each
while IFS= read -r app; do
  [[ -z "$app" ]] && continue  # skip empty lines
  echo "Installing $app..."
  flatpak --system install --noninteractive "$app"
done < "$LIST_FILE"

# Mark done so systemd can skip next time
touch /var/lib/flatpak/.my-flatpaks-initialized