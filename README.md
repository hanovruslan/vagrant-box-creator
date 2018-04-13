# Vagrant box creator #

## Pre ##

Init bash-get-options via bash-dep

run `./src/post-checkout.sh`

## About ##

Vagrant has [package](https://www.vagrantup.com/docs/cli/package.html) action which allows you to create custom VM box right on your local machine. With this helper you can minimize support of custom VM box.

## Why should i use this ? ##

1. To split up **build time**  and **runtime** of your vagrant provision routine
2. To solve [ssh problem after pack VM](https://github.com/mitchellh/vagrant/issues/5186). For this reason [fake id_rsa file](./vagrant/fake-id_rsa) must be copied into VM

## How to use ##

1. Create build-time vagrantfile
1. Create runtime vagrantfile

See [examples](./examples)

### Example ###

```
./main.sh -m my-debian -f my-debian-box.vagrantfile -p ./examples/

```

This will gives you vagrant box with name **my-debian** available on the host.
