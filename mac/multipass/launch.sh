#!/bin/bash
set -euo pipefail

echo "--- Multipass: Start! ---"

readonly enviroment_name="${1:-basic}"
readonly instance_name="${2:-${enviroment_name}}"
readonly virtual_home="/home/ubuntu"
readonly virtual_workspace_dir="${virtual_home}/synced-${instance_name}"

# create workspace directory
current_dir=$(pwd)
cd "../../workspace/${enviroment_name}"
readonly local_workspace_dir="${3:-$(pwd)}"
mkdir -p "${local_workspace_dir}"

# set config file path
cd "${current_dir}"
cd "../../config/multipass/${enviroment_name}"
local_config_dir=$(pwd)

# set resource parameters
cpus=${4:-2}
disk=${5:-24G}
mem=${6:-4G}
ubuntu_version=${7:-22.04}

# launch multipass instance
cd "${current_dir}"
multipass launch --cpus "${cpus}" --disk "${disk}" --mem "${mem}" --cloud-init "${local_config_dir}/${enviroment_name}.yaml" --name "${instance_name}" "${ubuntu_version}"
multipass exec "${instance_name}" -- mkdir "${virtual_workspace_dir}"

# transfer init-files
multipass exec "${instance_name}" -- mkdir "${virtual_home}/init"
while read -r line; do
    multipass transfer "${local_config_dir}/${line}" "${instance_name}:${virtual_home}/init/"
done <"${local_config_dir}/init-files"

# execute init-command
while read -r line; do
    echo "${line}"
    multipass exec "${instance_name}" --working-directory "${virtual_home}/init" -- eval "${line}"
done <"${local_config_dir}/init-commands"

# mount
multipass mount "${local_workspace_dir}" "${instance_name}:${virtual_workspace_dir}"

multipass stop "${instance_name}"

echo "--- Multipass: Finish! ---"
