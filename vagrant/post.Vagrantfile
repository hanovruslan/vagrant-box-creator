# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
    config.vm.define $machine do |machine|
        machine.vm.hostname = $machine
        machine.vm.provider :virtualbox do |provider|
            provider.name = $machine
        end
        machine.ssh.insert_key = false
        machine.ssh.private_key_path = File.expand_path("fake-id_rsa", File.dirname(__FILE__))
        machine.vm.box_check_update = false
        machine.vm.synced_folder "./", "/vagrant", disabled: true
        machine.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
    end
end
