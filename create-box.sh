#!/usr/bin/env bash

name=${1:-example}
path="${2:-./examples}"
file=${3:-${name}-box.vagrantfile}
box_path=${4:-./boxes}
provider=virtualbox

export name=${name} \
&& export path=${path} \
&& export file=${file} \
&& vagrant destroy -f \
&& vagrant up --provision \
&& vagrant box update \
&& rm -f ${box_path}/${name}.box \
&& realpath .vagrant/machines/${name}/${provider}/id 1>/dev/null 2 >&1 \
&& vagrant package \
  --base $(cat .vagrant/machines/${name}/${provider}/id) \
  --output ${box_path}/${name}.box \
&& vagrant box add --force ${name} ${box_path}/${name}.box \
&& rm -f ${box_path}/${name}.box \
&& vagrant destroy -f
