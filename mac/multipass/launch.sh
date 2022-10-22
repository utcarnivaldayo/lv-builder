#!/bin/bash
set -euo pipefail

# --- multipass launch---
echo "--- Multipass: Start! ---"

instance_name="${1}"
cpus="${2}"
disk="${3}"
mem="${4}"
cloud_init_path="${5}"
image_name="${6}"
local_workdir_fullpath="${7}"
virtual_workdir_fullpath="${8}"

# launch multipass instance
multipass launch --cpus $cpus --disk $disk --mem $mem --cloud-init "$cloud_init_path" --name $instance_name $image_name
multipass exec $instance_name -- mkdir "$virtual_workdir_fullpath"
multipass stop $instance_name
multipass set local.privileged-mounts=true

# ensure multipassd is running
Restart-Service -Name multipassd

# mount
multipass mount "$local_workdir_fullpath" "$instance_name":"$virtual_workdir_fullpath"

echo "--- Multipass: Finish! ---"
