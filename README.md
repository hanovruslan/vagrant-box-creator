# Vagrant pack helper #

Vagrant has [package](https://www.vagrantup.com/docs/cli/package.html) action which allows you to create custom VM box right on your local machine. With this helper you can minimize support of custom VM box.

## Why should i use this ? ##

1. To split up [build time](https://github.com/hanovruslan/sf-demo-security/blob/master/vagrant/sf-demo-pack.vagrantfile) and [runtime](https://github.com/hanovruslan/sf-demo-security/blob/master/vagrant/sf-demo.vagrantfile) of your vagrant provision routine
2. To solve [ssh problem after pack VM](https://github.com/mitchellh/vagrant/issues/5186). For this reason [fake id_rsa file](./fake-id_rsa) must be copied into VM

## How to use ##

1. Create build-time vagrantfile (build-time.vagrantfile)
1. Create runtime vagrantfile (runtime.vagrantfile)
1. ./pack.sh build-time /path/to/the/project/build-time.dir (not build-time.vagrantfile!)
1. cd /path/to/the/project/ && vagrant up --provision

### Examples ###

You can see just one example for now (links from sections above):

Symfony Security Demo:

* [build time](https://github.com/hanovruslan/sf-demo-security/blob/master/vagrant/sf-demo-pack.vagrantfile)
* [runtime](https://github.com/hanovruslan/sf-demo-security/blob/master/vagrant/sf-demo.vagrantfile)
