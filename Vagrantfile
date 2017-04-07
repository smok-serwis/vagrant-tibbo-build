
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty32"

  config.vm.provision "shell", privileged: false, inline: <<-SHELL

    export DISPLAY=:0.0
    export WINEPREFIX="/home/vagrant/.wine"
    export WINEARCH="win32"
    export FONTCONFIG_PATH="/etc/fonts"

    sudo apt-get update
    sudo apt-get install -y python-software-properties fontconfig xorg dbus-x11 xvfb unzip xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic
    # Accept EULA
    sudo echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

    # Repositories
    ## Mono
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
    sudo echo "deb http://download.mono-project.com/repo/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

    sudo wget https://dl.winehq.org/wine-builds/Release.key
    sudo apt-key add Release.key
    sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

    sudo apt-get update

    # Install fontconfig, wait for processing

    sudo apt-get install -y --install-recommends winehq-stable winetricks

    ln -s /vagrant /home/vagrant/.wine/drive_c/comp

    # Install command
    sudo echo """#!/bin/bash
export DISPLAY=:0.0
export WINEPREFIX="/home/vagrant/.wine"
export WINEARCH="win32"
export FONTCONFIG_PATH="/etc/fonts"
cd \$USER/.wine/drive_c/comp
wine "C:\\Program Files\\Tibbo\\TIDE\\Bin\\tmake.exe" $1 -b "C:\\Program Files\\Tibbo\\TIDE\\Bin" -p "C:\\Program Files\\Tibbo\\TIDE\\Platforms" -v
cp -f /.wine/drive_c/comp/*.tpc /vagrant
rm -rf \$USER/.wine/drive_c/comp || true
""" > /usr/bin/tibbo_build
    sudo chmod ugo+rx /usr/bin/tibbo_build

    # Sanitize
    sudo chown -R vagrant:vagrant /home/vagrant

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

  SHELL
end
