#!/bin/bash

set -euo pipefail

readonly enviroment_name="basic"
readonly instance_name="${1:-${enviroment_name}}"
current_dir=$(pwd)
cd "../../workspace/${enviroment_name}"
readonly local_workspace_dir="${2:-$(pwd)}"
readonly virtual_workspace_dir="/home/ubuntu/synced-${instance_name}"
cd "${current_dir}"
bash ./launch.sh "${instance_name}" "${3:-2}" "${4:-24G}" "${5:-4G}" "../../config/multipass/${enviroment_name}/${enviroment_name}.yaml" "${6:-22.04}" "${local_workspace_dir}" "${virtual_workspace_dir}"
