
Vagrant.configure("2") do |config|
  config.vm.box = "debian/contrib-jessie64"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y curl

    bash /vagrant/build.sh
    sudo -H -u vagrant bash /vagrant/build_as_vagrant.sh

    # Minify
    apt-get clean
    rm -f /usr/bin/wynurz
    dd if=/dev/zero of=/EMPTY bs=1M
    rm -f /EMPTY
    rm -rf /tmp/*
    # udev rules
    rm /etc/udev/rules.d/70-persistent-net.rules || true
    mkdir /etc/udev/rules.d/70-persistent-net.rules || true
    rm -rf /dev/.udev/ || true
    rm /lib/udev/rules.d/75-persistent-net-generator.rules || true

  SHELL
end
