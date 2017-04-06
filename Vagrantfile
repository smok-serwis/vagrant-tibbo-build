# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/contrib-jessie64"

  config.vm.provision "shell", inline: <<-SHELL

    # Install WINE
    dpkg --add-architecture i386
    apt-get update
    apt-get install -y

    # Load framebuffer
    sudo -u vagrant Xvfb :0 -screen 0 1024x768x16 &
    sudo -u vagrant wine start.exe
    sudo -u vagrant "ln -s /vagrant /home/vagrant/.wine/drive_c/vagrant"

    # Persist framebuffer
    echo "sudo -u vagrant Xvfb :0 -screen 0 1024x768x16 &" > /etc/rc.local

    # Install Tibbo tools
    sudo -u vagrant mkdir "/home/vagrant/.wine/drive_c/Program Files/Tibbo"
    sudo -u vagrant unzip /vagrant/redist/tide-tibbo-lite-5.1.3-win32.zip -d  "/home/vagrant/.wine/drive_c/Program Files/Tibbo"

    # WINE extensions
    sudo -u vagrant "export DISPLAY=:0.0; winetricks corefonts vcrun6"

  SHELL
end
