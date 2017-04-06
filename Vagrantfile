# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/contrib-jessie64"

  config.vm.provision "shell", inline: <<-SHELL

    # Install WINE
    dpkg --add-architecture i386
    apt-get update
    apt-get install -y wget xvfb wine winetricks

    sudo -u vagrant Xvfb :0 -screen 0 1024x768x16 &
    sudo -u vagrant wine start.exe
    sudo -u vagrant "ln -s /vagrant ~/.wine/drive_c/vagrant"
    sudo -u vagrant "cd ~/.wine/drive_c/users; wget http://tibbo.com/downloads/open/tide/tide-5-03-04.exe; export DISPLAY=:0.0; wine tide-5-03-04.exe /S &"

  SHELL
end
