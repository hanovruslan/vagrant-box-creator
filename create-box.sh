#!/usr/bin/env bash

name=${1:-default}
path="${2:-./}"
file=${3:-${name}.vagrantfile}
provider=virtualbox

export name=${name} \
&& export path=${path} \
&& export file=${file} \
&& vagrant destroy -f \
&& vagrant up --provision \
&& vagrant box update \
&& rm -f ./boxes/${name}.box \
&& realpath .vagrant/machines/${name}/${provider}/id 1>/dev/null 2 >&1 \
&& vagrant package \
  --base $(cat .vagrant/machines/${name}/${provider}/id) \
  --output ./boxes/${name}.box \
&& vagrant box add --force ${name} ./boxes/${name}.box \
&& rm -f ./boxes/${name}.box \
&& vagrant destroy -f
