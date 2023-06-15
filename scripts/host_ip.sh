#!/bin/bash
readonly wk_dir_script="$(dirname $0)"
readonly dir_script="$(cd ${wk_dir_script}; pwd)"
cd "${dir_script}" || exit 1

host_ip=$(./_vpn_host_ip.sh 2>/dev/null)
if [[ "x" == "${host_ip}x" ]]; then
  host_ip=$(./_wifi_host_ip.sh)
fi

echo "${host_ip}"
