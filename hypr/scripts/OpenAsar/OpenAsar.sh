#!/bin/bash

# Ask for sudo upfront
if [ "$EUID" -ne 0 ]; then
  echo "This script requires sudo privileges. Prompting for password..."
  sudo "$0" "$@"
  exit
fi

# Copy the file
cp "/home/elhobo/.config/hypr/scripts/OpenAsar/app.asar" "/var/lib/flatpak/app/com.discordapp.Discord/current/active/files/discord/resources"


# Kill Discord
echo "Killing Discord..."
pkill -f discord
