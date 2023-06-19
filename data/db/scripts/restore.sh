#!/bin/bash
readonly wk_dir_script="$(dirname $0)"
readonly dir_script="$(cd ${wk_dir_script}; pwd)"
cd "${dir_script}" || exit 1

readonly dir_dumps=/tmp/data/dumps

file=$1
# 引数が指定されていない場合、最新のファイル
if [[ "x" == "${file}x" ]]; then
  file=$(ls -tr ${dir_dumps} | tail -n 1)
fi

psql \
  -d ${POSTGRES_USER} \
  -U ${POSTGRES_USER} \
  -f ${dir_dumps}/${file}
