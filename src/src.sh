#@IgnoreInspection BashAddShebang
self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
source "${self_dir}/env.sh"
vbc_main () {
  local machine="${1}"
  local box_path="$(vbc_get_box_path ${machine})"
  local box_id_path="$(vbc_get_box_id_path ${machine})"

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
}
vbc_get_box_path() {
  local machine="${1}"
  echo "${VBC_BOXES_PATH}/${machine}.box"
}
vbc_get_box_id_path () {
  local machine="${1}"
  echo "${self_dir}/../.vagrant/machines/${machine}/${VBC_PROVIDER}/id"
}
