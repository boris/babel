# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/precise64"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.network "forwarded_port", guest: 3000, host: 13000
  config.vm.provision "shell", path: "bootstrap.sh"
end
