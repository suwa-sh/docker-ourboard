#!/bin/bash
readonly wk_dir_script="$(dirname $0)"
readonly dir_script="$(cd ${wk_dir_script}; pwd)"
cd "${dir_script}" || exit 1

readonly dir_repo_root="$(cd ..; pwd)"

# host IP
host_ip=$(./host_ip.sh)
sed -e "s/%HOST_IP%/${host_ip}/g" \
  "${dir_repo_root}/.env.tmpl" > "${dir_repo_root}/.env"
