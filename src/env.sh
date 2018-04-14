#@IgnoreInspection BashAddShebang
self_dir="$(dirname $(readlink -f ${BASH_SOURCE[0]}))"
export VBC_MACHINE=${VBC_MACHINE:-"debian-stretch-64-box"}
export VBC_PATH=${VBC_PATH:-"${self_dir}/../examples/boxes"}
export VBC_FILE=${VBC_FILE:-"${VBC_MACHINE}.vagrantfile"}
export VBC_PROVIDER="virtualbox"
export VBC_BOXES_PATH="${self_dir}/../boxes"
