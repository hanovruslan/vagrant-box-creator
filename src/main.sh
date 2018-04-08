#!/usr/bin/env bash

self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"

source "${self_dir}/env.sh"
source "${self_dir}/bash-dep/bash-get-options/src/src.sh"

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
options=$(bgo_get_options ${#} ${@} options_dict options_defaults)
options=$(t=${options#*=} && echo ${t:1:-1})
declare -A options="${options}"
for key in ${!options_dict[@]}
do
  export ${options_dict[$key]}="${options[${options_dict[${key}]}]}"
done

box_path="${VBC_BOXES_PATH}/${machine}.box"
box_id_path=".vagrant/machines/${machine}/${VBC_PROVIDER}/id"

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
