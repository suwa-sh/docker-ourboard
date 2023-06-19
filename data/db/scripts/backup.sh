#!/bin/bash
readonly wk_dir_script="$(dirname $0)"
readonly dir_script="$(cd ${wk_dir_script}; pwd)"
cd "${dir_script}" || exit 1

readonly dir_dumps=/tmp/data/dumps
readonly file=$(date '+%Y%m%d%H%M%S').dmp

# データだけをバックアップ
pg_dump \
  -d ${POSTGRES_USER} \
  -U ${POSTGRES_USER} \
  --clean --if-exists -v > ${dir_dumps}/${file}
