# -*- mode: ruby -*-
# vi: set ft=ruby :

dir = Dir.pwd
vagrant_dir = File.expand_path(File.dirname(__FILE__))

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

#  config.ssh.username = "ubuntu"
#  config.ssh.password = "ubuntu"

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"
  # Ubuntu Server 16.04 LTS (Xenial Xerus)
  # config.vm.box_url = "http://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-vagrant.box"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # The hostname the machine should have.
  config.vm.hostname = "ubuntu"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # https://www.vagrantup.com/docs/virtualbox/configuration.html
  # https://www.virtualbox.org/manual/ch08.html#vboxmanage-modifyvm
  config.vm.provider "virtualbox" do |vbox|
    vbox.name = "ubuntu_16_04_lts"
    vbox.gui = true
    vbox.memory = 6144
    vbox.cpus = 2
    vbox.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    vbox.customize ["modifyvm", :id, "--vram", 32]
    vbox.customize ["modifyvm", :id, "--nic1", "nat"]
    #vbox.customize ["modifyvm", :id, "--nic2", "bridged"]
    vbox.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vbox.customize ["modifyvm", :id, "--draganddrop", "disabled"]
  end

  config.vm.provision "shell", path: "post_deploy.sh"
  config.vm.provision "shell", inline: "reboot"

#  config.vm.provision "shell", path: "post_deploy_2.sh"

#  if File.exists?(File.join(vagrant_dir,'post_deploy.sh')) then
#    config.vm.provision :shell, :path => File.join( "post_deploy.sh" )
#  end

#  config.vm.provision "shell", inline: <<-SHELL
#    reboot
#  SHELL

#  if File.exists?(File.join(vagrant_dir,'post_deploy.sh')) then
#    config.vm.provision :shell, :path => File.join( "post_deploy.sh" )
#  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
#  config.vm.provision "shell", inline: <<-SHELL
#    apt-get update && apt-get -y upgrade && apt-get -y autoremove
#    apt-get install -y ubuntu-desktop
#  SHELL

end
