#!/bin/bash
set -e

echo "[*] Updating system..."
sudo pacman -Syu --noconfirm

# Official / repo packages
OFFICIAL_PKGS=(
  fastfetch
  fish
  hyprland
  kitty
  neovim
  qt6ct
  rofi
  thunar
  waybar
  wlogout
  nmtui
  blueman
  pavucontrol
  qalculate-gtk
  kate
  btop
  flatpak
  hyprpaper
  eza                 # added
  qt5-wayland         # added
  qt6-wayland         # added
  polkit-gnome        # added
  imagemagick         # added
  otf-font-awesome    # added
  ttf-firacode-nerd   # added
  pinta                # added
  libnotify            # added
  nm-connection-editor # added
  kio-admin            # added
)

# AUR / custom-only packages
AUR_PKGS=(
  matugen
  oh-my-posh
  swaync
  hyprcursor
  nwg-display
  nwg-look
  waypaper
  hyprshade
  zen-browser
  grimblast-git        # added
  papirus-icon-theme   # added (via AUR)
)

echo "[*] Installing official packages..."
sudo pacman -S --noconfirm --needed "${OFFICIAL_PKGS[@]}"

# Install yay if missing
if ! command -v yay &>/dev/null; then
  echo "[*] Installing yay..."
  sudo pacman -S --noconfirm --needed git base-devel
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  pushd /tmp/yay
  makepkg -si --noconfirm
  popd
fi

echo "[*] Installing AUR / custom packages..."
yay -S --noconfirm --needed "${AUR_PKGS[@]}"

# Set fish as default shell
if [[ "$SHELL" != "$(command -v fish)" ]]; then
  echo "[*] Making fish default shell..."
  chsh -s "$(command -v fish)"
fi

# Flatpak setup
sudo pacman -S --noconfirm --needed flatpak || true

if ! flatpak remote-list | grep -q flathub; then
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

echo "[*] Installing net.nokyan.Resources via Flatpak..."
flatpak install -y flathub net.nokyan.Resources

echo "[✔] Done. You might need to log out/in for shell changes."
