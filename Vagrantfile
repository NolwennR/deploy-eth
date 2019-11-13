# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  N = 3

  (1..N).each do |machine_id|
    config.vm.box = "ubuntu/xenial64"
    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "1024"
    end

    if machine_id == N
      config.vm.define "controller" do |machine|
        machine.vm.hostname = "controller"
        machine.vm.network "private_network", ip: "192.168.0.1#{machine_id}"
        machine.vm.provision "shell", inline: <<-SHELL
        apt-get update
        sudo apt-get -y upgrade
        sudo curl -O https://storage.googleapis.com/golang/go1.13.4.linux-amd64.tar.gz
        tar -xvf go1.13.4.linux-amd64.tar.gz
        sudo mv go /usr/local
        export PATH=$PATH:/usr/local/go/bin
        source ~/.profile
    
        sudo add-apt-repository -y ppa:ethereum/ethereum
        sudo apt-get update
        sudo apt-get install -y ethereum
    
        sudo apt-get install -y git
        sudo apt-get install -y build-essential

        go get github.com/ethereum/go-ethereum/cmd/puppeth

        mkdir node1 node2

        SHELL
      end
    else
      config.vm.define "ethnode#{machine_id}" do |machine|
        machine.vm.hostname = "ethnode#{machine_id}"
        machine.vm.network "private_network", ip: "192.168.0.1#{machine_id}"
        machine.vm.provision "shell", inline: <<-SHELL
        sudo add-apt-repository -y ppa:ethereum/ethereum
        sudo apt-get update
        sudo apt-get install -y \
            apt-transport-https \
            ca-certificates \
            curl \
            software-properties-common \
            ethereum \
            docker.io \
            docker-compose
a
        docker-compose --version
        sudo usermod -a -G docker $USER
        sudo service docker start
        SHELL
      end 
    end
  end
end

#vagrant@192.168.0.11
