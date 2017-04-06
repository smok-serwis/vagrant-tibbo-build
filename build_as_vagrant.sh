#!/bin/bash

Xvfb :0 -screen 0 1024x768x16 &
wine start.exe
ln -s /vagrant /home/vagrant/.wine/drive_c/vagrant

# Start framebuffer on VM start
echo " Xvfb :0 -screen 0 1024x768x16 &" >> /etc/rc.local

# Install Tibbo tools
mkdir "/home/vagrant/.wine/drive_c/Program Files/Tibbo"
unzip /vagrant/tide-tibbo-lite-5.1.3-win32.zip -d  "/home/vagrant/.wine/drive_c/Program Files/Tibbo"

# WINE extensions
export DISPLAY=:0.0
cd /home/vagrant/.wine/drive_c
winetricks corefonts vcrun6