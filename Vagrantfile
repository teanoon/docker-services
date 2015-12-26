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

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.99.101"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../projects", "/projects"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
    vb.cpus = 2
  #   # Customize the amount of memory on the VM:
    vb.memory = 4096

    vhd_location = 'f:/projects.vhd'
    vb.customize ['createhd', '--format', 'vhd', '--filename', vhd_location, '--size', 500 * 1024] unless File.exist?(vhd_location)
    vb.customize ['storageattach', :id, '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', vhd_location]
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", name: 'apt', privileged: false, inline: <<-SHELL
    wget https://gist.githubusercontent.com/teanoon/175eeb157dc83df72419/raw/731c84f9c0db3cac7e1291559646f9bf28331716/sources.list.aliyun
    sudo cp sources.list.aliyun /etc/apt/sources.list && rm sources.list.aliyun
    sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
    echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
    sudo apt-get update
    sudo apt-get install -y git zsh htop
  SHELL

  config.vm.provision "shell", name: 'config', privileged: false, inline: <<-SHELL
    sudo hostname docker-machine
    if [ ! -d ~/.ssh ]; then
      ssh-keygen -f ~/.ssh/id_rsa -N ''
    fi
  SHELL

  config.vm.provision "shell", name: 'storage', privileged: false, inline: <<-SHELL
    # TODO please manually mount the storage vhd for now
  SHELL

  config.vm.provision "shell", name: 'tools', privileged: false, inline: <<-SHELL
    if [ ! -f ~/.zshrc ]; then
      git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
      cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
      sudo chsh -s /bin/zsh vagrant
    fi
  SHELL

  config.vm.provision "shell", name: 'docker', privileged: false, inline: <<-SHELL
    if [ ! -f /usr/local/bin/docker-compose ]; then
      sudo apt-get install -y linux-image-extra-$(uname -r)
      sudo apt-get install -y docker-engine
      curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
      chmod +x /usr/local/bin/docker-compose
    fi
    sudo usermod -aG docker vagrant
  SHELL
end
