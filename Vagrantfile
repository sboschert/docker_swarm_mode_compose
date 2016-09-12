# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.provision :shell, path: "scripts/provision_docker.sh", privileged: true

  config.vm.define "master", primary: true do |master|
    master.vm.box = "bento/ubuntu-16.04"
    master.vm.provision :shell, path: "scripts/provision_master.sh", privileged: true
    master.vm.provision :shell, path: "scripts/provision_docker_compose.sh", privileged: true
    master.vm.network "private_network", ip: "10.4.27.10"
    master.vm.network :forwarded_port, guest: 30000, host: 30000
    master.vm.synced_folder "synced_folder/", "/home/vagrant/synced_folder"
  end
end
