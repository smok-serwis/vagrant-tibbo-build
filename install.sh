#!/bin/bash

# single argument - name of user to install for
# run this as root

# Install WINE
dpkg --add-architecture i386
apt-get update
apt-get install -y

# Load framebuffer
sudo -u $1 Xvfb :0 -screen 0 1024x768x16 &
sudo -u $1 wine start.exe
sudo -u $1 "ln -s /$1 /home/$1/.wine/drive_c/$1"

# Persist framebuffer
echo "sudo -u $1 Xvfb :0 -screen 0 1024x768x16 &" > /etc/rc.local

# Install Tibbo tools
sudo -u $1 mkdir "/home/$1/.wine/drive_c/Program Files/Tibbo"
sudo -u $1 unzip /$1/redist/tide-tibbo-lite-5.1.3-win32.zip -d  "/home/$1/.wine/drive_c/Program Files/Tibbo"

# WINE extensions
sudo -u $1 "env DISPLAY=:0.0; winetricks corefonts vcrun6"

mv misc/tibbo_build.sh /usr/sbin/tibbo_build
chmod ugo+rx /usr/sbin/tibbo_build