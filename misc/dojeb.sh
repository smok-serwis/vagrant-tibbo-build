#!/bin/bash

if [ -z $1 ]; then
    echo "Argument required - user to install for"
    exit 1
fi

# Install WINE
dpkg --add-architecture i386
apt-get update
apt-get install -y wget xvfb wine winetricks unzip
# Load framebuffer
sudo -u $1 Xvfb :0 -screen 0 1024x768x16 &
sudo -u $1 wine start.exe
sudo -u $1 "ln -s /$1 /home/$1/.wine/drive_c/$1"
# Start framebuffer on VM start
echo "sudo -u $1 Xvfb :0 -screen 0 1024x768x16 &" >> /etc/rc.local
# Install Tibbo tools
sudo -u $1 wget http://dev.dms-serwis.com.pl/misc/tide-tibbo-lite-5.1.3-win32.zip -O /tmp/tibbo.zip
sudo -u $1 mkdir "/home/$1/.wine/drive_c/Program Files/Tibbo"
sudo -u $1 unzip /tmp/tibbo.zip -d  "/home/$1/.wine/drive_c/Program Files/Tibbo"
# WINE extensions
sudo -u $1 env DISPLAY=:0.0; cd /home/$1/.wine/drive_c; winetricks corefonts vcrun6
# Install command
cp tibbo_build.sh /usr/sbin/tibbo_build
chmod ugo+rx /usr/sbin/tibbo_build
