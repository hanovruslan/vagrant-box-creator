#!/usr/bin/env bash

self_dir=$(dirname $(readlink -f ${0}))

source ${self_dir}/vagrant-common.sh

vagrant up --provision
