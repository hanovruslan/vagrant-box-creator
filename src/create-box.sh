#!/usr/bin/env bash

self_dir=$(dirname $(readlink -f ${0}))

source ${self_dir}/vagrant-common.sh

vagrantfile="${3:-${machine_name}-box.vagrantfile}"
provider="virtualbox"
root_path="./boxes"
box_path="${root_path}/${machine_name}.box"
box_id_path=".vagrant/machines/${machine_name}/${provider}/id"

export vagrantfile

vagrant destroy -f \
&& vagrant up --provision \
&& vagrant box update \
&& rm -f "${box_path}" \
&& realpath "${box_id_path}" 1>/dev/null 2 >&1 \
&& vagrant package \
  --base "$(cat ${box_id_path})" \
  --output "${box_path}" \
&& vagrant box add --force "${machine_name}" "${box_path}" \
&& rm -f "${box_path}" \
&& vagrant destroy -f
