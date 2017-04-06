# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/contrib-jessie64"

  config.vm.provision "shell", inline: <<-SHELL
    bash misc/install.sh vagrant
  SHELL
end
