#!/usr/bin/env bash

self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

source "${self_dir}/env.sh"
source ${self_dir}/bash-dep/dep/bash-get-options/src/src.sh

declare -A options_dict=(
  [f]=file
  [m]=machine
  [p]=path
)
declare -A options_defaults=(
  [file]="${VBC_FILE}"
  [machine]="${VBC_MACHINE}"
  [path]="${VBC_PATH}"
)
bgo_main

vagrant up --provision \
&& vagrant box update \
&& rm -f "${box_path}" \
&& realpath "${box_id_path}" 1>/dev/null 2 >&1 \
&& vagrant package \
  --base "$(cat ${box_id_path})" \
  --output "${box_path}" \
&& vagrant box add --force "${machine}" "${box_path}" \
&& rm -f "${box_path}" \
&& vagrant destroy -f
