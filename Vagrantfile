# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder ".", "/home/ubuntu/code"
  config.vm.network "forwarded_port", guest: 3000, host: 13000
  config.vm.provision "shell", path: "bootstrap.sh"
end
