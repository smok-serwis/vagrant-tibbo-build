
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty32"

  config.vm.provision "shell", inline: <<-SHELL

    export DISPLAY=:0.0
    export WINEPREFIX="/home/vagrant/.wine"
    export WINEARCH="win32"
    export FONTCONFIG_PATH="/etc/fonts"

    apt-get update
    apt-get install -y python-software-properties fontconfig xorg dbus-x11 xvfb unzip xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic
    # Accept EULA
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

    # Repositories
    ## Mono
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
    echo "deb http://download.mono-project.com/repo/ubuntu trusty main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

    wget https://dl.winehq.org/wine-builds/Release.key
    apt-key add Release.key
    apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

    apt-get update

    # Install fontconfig, wait for processing

    apt-get install -y --install-recommends winehq-stable

    # Install command
    cp -f /vagrant/tibbo_build.sh /usr/sbin/tibbo_build
    chmod ugo+rx /usr/sbin/tibbo_build

    # Sanitize
    chown -R vagrant:vagrant /home/vagrant

    # the Vagrant part
    su vagrant -c 'bash /vagrant/build_as_vagrant.sh'

  SHELL
end
