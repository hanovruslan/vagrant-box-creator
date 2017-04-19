# Vagrant pack helper #

Vagrant has [package](https://www.vagrantup.com/docs/cli/package.html) action which allows you to create custom VM box right on your local machine. With this helper you can minimize support of custom VM box.

## Why should i use this ? ##

1. To split up [build time](examples/example-box.vagrantfile) and [runtime](examples/example.vagrantfile) of your vagrant provision routine
2. To solve [ssh problem after pack VM](https://github.com/mitchellh/vagrant/issues/5186). For this reason [fake id_rsa file](./fake-id_rsa) must be copied into VM

## How to use ##

1. Create build-time vagrantfile (example: [build time](examples/example-box.vagrantfile))
1. Create runtime vagrantfile (example: [runtime](examples/example.vagrantfile))
1. ./create-box.sh build-time /path/to/the/project/build-time.dir (not build-time.vagrantfile!)
1. cd /path/to/the/project/ && vagrant up --provision

### Examples ###

1. default example:
    1. ```./create-box.sh```
    1. ```vagrant up --provision``` or ```./vagrant-up.sh```
    1. ```vagrant status``` or ```./vagrant-status.sh```
    1. ```vagrant ssh``` or ```vagrant ssh example``` or ```./vagrant-ssh.sh example```
1. other example:
    1. ```./create-box.sh my-debian```
    1. ```./vagrant-up.sh my-debian```
    1. ```./vagrant-status.sh my-debian```
    1. ```./vagrant-ssh.sh example```
1. example from custom dir (```cp -R examples /tmp/```):
    1. ```./create-box.sh my-debian /tmp/examples/```
