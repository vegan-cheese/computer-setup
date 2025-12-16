#!/bin/sh

# RPMFusion

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf update @core

# Install multimedia codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf install intel-media-driver

# Flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Setup Repositories
sudo dnf install dnf-plugins-core
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null


# Install Packages
dnf check-update
sudo dnf install code brave-browser yakuake steam python3-pip neovim git gh gcc-c++ cmake ninja-build piper kicad rpi-imager cascadia-code-fonts

flatpak install flathub com.github.tchx84.Flatseal com.bitwarden.desktop org.gimp.GIMP org.onlyoffice.desktopeditors org.thonny.Thonny org.prismlauncher.PrismLauncher com.discordapp.Discord

# Setup System
mkdir ~/Programming
git set --global user.name "Vegan Cheese"
git set --global user.email "110762965+vegan-cheese@users.noreply.github.com"
gh auth login

wget https://github.com/ankitects/anki/releases/download/25.09/anki-launcher-25.09-linux.tar.zst -O ~/Downloads/anki-launcher-25.09-linux.tar.zst
tar -xf ~/Downloads/anki-launcher-25.09-linux.tar.zst
sudo ~/Downloads/anki-launcher-25.09-linux/install.sh
