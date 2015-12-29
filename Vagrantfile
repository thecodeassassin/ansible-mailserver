# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = 'mail.tca0.nl'

  # for testing debian bases distros
  config.vm.box = "ubuntu/trusty64"

  config.vm.network :private_network, ip: "192.168.33.39"
  config.vm.network "forwarded_port", guest: 2375, host: 2375

  #config.ssh.username = "root"

  #config.vm.provider "docker" do |d|
  #  d.image = "kshlm/vagrant-centos"
  #  d.has_ssh = true
  #  d.remains_running = true
  #  d.expose = [6783,22]

  #end

  config.vm.provider :virtualbox do |v|
    v.name = "test-mailserver"
    v.memory = 256
    v.cpus = 1
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # Enable provisioning with Ansible.
  config.vm.provision "ansible" do |ansible|
    #ansible.verbose = "vvv"
    ansible.groups = {
      "tutum-nodes" => ["node01"],
      "all_groups:children" => ["tutum-nodes"]
    }
    ansible.playbook = "sample-playbook.yml"
  end

end
