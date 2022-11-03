#!/bin/bash

set -euo pipefail

instance_name="cs"
current_dir=$(pwd)
cd "../../workspace/${instance_name}"
local_workspace_dir=$(pwd)
virtual_workspace_dir="/home/ubuntu/synced-${instance_name}"
cd "${current_dir}"
bash ./launch.sh "${instance_name}" "2" "24G" "4G" "../../config/multipass/${instance_name}/${instance_name}.yaml" "22.04" "${local_workspace_dir}" "${virtual_workspace_dir}"
