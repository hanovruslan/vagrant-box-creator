#@IgnoreInspection BashAddShebang
export self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
source "${self_dir}/src.sh"
( \
  export machine="${1:-${VBC_MACHINE}}" \
  && export path="${2:-${VBC_PATH}}" \
  && export file="${3:-${VBC_FILE}}" \
  && export VAGRANT_CWD="${self_dir}/../" \
  && vbc_main ${machine} \
)
