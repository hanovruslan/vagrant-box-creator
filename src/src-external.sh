#@IgnoreInspection BashAddShebang
export self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
source "${self_dir}/src.sh"
# bg_hint () {
#   echo "run \"${self_dir}/$(basename ${BASH_SOURCE[0]})\" \${machine_name} \${path_to_dir_with_vagrantfile} \${vagrantfile_name}"
# }
( \
  export machine="${1:-${VBC_MACHINE}}" \
  && export path="${2:-${VBC_PATH}}" \
  && export file="${3:-${VBC_FILE}}" \
  && export VAGRANT_CWD="${self_dir}/../" \
  && vbc_main ${machine} \
)
#
# bg_hint
