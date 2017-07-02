# -*- mode: ruby -*-
# vi: set ft=ruby :

$machine_name = ENV.key?("machine_name") ? ENV["machine_name"] : "default"
$vagrantfile = ENV.key?("vagrantfile") ? ENV["vagrantfile"] : $machine_name + ".vagrantfile"
$vagrantfile_path = ENV.key?("vagrantfile_path") ? ENV["vagrantfile_path"] : File.expand_path("./examples", File.dirname(__FILE__))

load File.expand_path($vagrantfile, $vagrantfile_path)
load File.expand_path("vagrant/Vagrantfile", File.dirname(__FILE__))
