# Vagrant pack helper #

Vagrant has [package](https://www.vagrantup.com/docs/cli/package.html) action which allows you to create custom VM box right on your local machine. With this helper you can minimize support of custom VM box.

## Why should i use this ? ##

1. To split up [build time](examples/default-box.vagrantfile) and [runtime](examples/default.vagrantfile) of your vagrant provision routine
2. To solve [ssh problem after pack VM](https://github.com/mitchellh/vagrant/issues/5186). For this reason [fake id_rsa file](./fake-id_rsa) must be copied into VM

## How to use ##

1. Create build-time vagrantfile ([example 1](examples/default-box.vagrantfile), [example 2](examples/my-debian-box.vagrantfile))
1. Create runtime vagrantfile ([example 2](examples/default.vagrantfile), [example 2](examples/my-debian.vagrantfile))
1. ./create-box.sh machine-name /path/to/the/project/machine/box/vagrantfile/dir
1. cd /path/to/the/project/ && vagrant up --provision

### Examples ###

1. default example:
    1. ```./create-box.sh```
    1. ```vagrant up --provision``` or ```./vagrant-up.sh```
    1. ```vagrant status``` or ```./vagrant-status.sh```
    1. ```vagrant ssh``` or ```vagrant ssh default``` or ```./vagrant-ssh.sh default```
1. other example:
    1. ```./create-box.sh my-debian```
    1. ```./vagrant-up.sh my-debian```
    1. ```./vagrant-status.sh my-debian```
    1. ```./vagrant-ssh.sh default```
1. example from custom dir (```cp -R examples /tmp/```):
    1. ```./create-box.sh my-debian /tmp/examples/```
