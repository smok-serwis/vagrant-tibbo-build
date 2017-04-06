#!/bin/bash

# Install WINE
dpkg --add-architecture i386
apt-get update
apt-get install -y wget xvfb wine winetricks unzip

# Install command
cp -f /vagrant/tibbo_build.sh /usr/sbin/tibbo_build
chmod ugo+rx /usr/sbin/tibbo_build
