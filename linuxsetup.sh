#!/bin/sh

# RPMFusion

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

# Flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Ensure necessary packages are installed

sudo dnf install python3-pip kicad esptool

flatpak install flathub org.thonny.Thonny

sudo pip install adafruit-ampy

# Setup environments

mkdir -p ~/Programming/AstroPi ~/Programming/CanSat

python3 -m venv ~/Programming/AstroPi/env
~/Programming/AstroPi/env/bin/pip install skyfield astro-pi-orbit sense-hat
pip install astro-pi-replay


