# -*- mode: ruby -*-
# vi: set ft=ruby :

$name = ENV.key?("name") ? ENV["name"] : "default"
file = ENV.key?("file") ? ENV["file"] : $name + ".vagrantfile"
path = ENV.key?("path") ? ENV["path"] : File.dirname(__FILE__)

load File.expand_path(file, path)
load File.expand_path("create-box-post-action.vagrantfile", File.dirname(__FILE__))
