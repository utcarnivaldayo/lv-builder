#!/bin/bash

set -euo pipefail

readonly enviroment_name="python"
readonly instance_name="${1:-${enviroment_name}}"
readonly virtual_home="/home/ubuntu"
readonly virtual_workspace_dir="${virtual_home}/synced-${instance_name}"

# create workspace directory
current_dir=$(pwd)
cd "../../workspace/${enviroment_name}"
readonly local_workspace_dir="${2:-$(pwd)}"
mkdir -p "${local_workspace_dir}/${instance_name}"

# set config file path
cd "${current_dir}"
cd "../../config/multipass/${enviroment_name}"
local_config_dir=$(pwd)

cd "${current_dir}"
bash ./launch.sh "${instance_name}" "${3:-2}" "${4:-24G}" "${5:-4G}" "../../config/multipass/${enviroment_name}/${enviroment_name}.yaml" "${6:-22.04}" "${local_workspace_dir}" "${virtual_workspace_dir}"
sleep 10
multipass start "${instance_name}"
multipass exec "${instance_name}" -- mkdir "${virtual_home}/init"
while read -r line; do
    multipass transfer "${local_config_dir}/${line}" "${instance_name}:${virtual_home}/init/"
done <"${local_config_dir}/init-files"
multipass stop "${instance_name}"
