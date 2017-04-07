#!/bin/bash
set -e
set -x

export DISPLAY=:0.0
export WINEPREFIX="/home/vagrant/.wine"
export WINEARCH="win32"
export FONTCONFIG_PATH="/etc/fonts"

cd /home/vagrant

# Set up framebuffer
Xvfb :0 -screen 0 1024x768x16 &

# Prepare WINE folder hierarchy
wine start.exe

# Only now is it safe to install Mono :/ it requires wine for setup
sudo apt-get install -y winbind mono-complete

# Install Tibbo tools
mkdir -p "/home/vagrant/.wine/drive_c/Program Files/Tibbo"
wget http://dev.dms-serwis.com.pl/misc/tide-tibbo-lite-5.1.3-win32.zip -O /tmp/tibbo.zip
unzip /vagrant/redist/tide-tibbo-lite-5.1.3-win32.zip -d "/home/vagrant/.wine/drive_c/Program Files/Tibbo"

cd /home/vagrant/.wine/drive_c
winetricks dotnet40 corefonts

# Kill framebuffer
kill -9 %1
