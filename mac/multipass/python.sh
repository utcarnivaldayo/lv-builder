#!/bin/bash

set -euo pipefail

instance_name="python"
current_dir=$(pwd)
cd "../../workspace/${instance_name}"
local_workspace_dir=$(pwd)
virtual_home="/home/ubuntu"
virtual_workspace_dir="${virtual_home}/synced-${instance_name}"

cd "${current_dir}"
cd "../../config/multipass/${instance_name}"
local_config_dir=$(pwd)
init_files=("install-pyenv.sh" "install-python.sh" "install-discord-bot.sh")

cd "${current_dir}"
bash ./launch.sh "${instance_name}" "2" "24G" "4G" "${local_config_dir}/${instance_name}.yaml" "22.04" "${local_workspace_dir}" "${virtual_workspace_dir}"
sleep 10
multipass start "${instance_name}"
multipass exec "${instance_name}" -- mkdir "${virtual_home}/init"
for i in "${init_files[@]}"; do
    multipass transfer "${local_config_dir}/${i}" "${instance_name}:${virtual_home}/init/"
done
multipass stop "${instance_name}"
