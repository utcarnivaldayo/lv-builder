$instance_name="rust"
$local_workspace_dir=(Convert-Path ../../workspace/$instance_name)
$virtual_workspace_dir="/home/ubuntu/synced-$instance_name"
pwsh ./launch.ps1 "${instance_name}" "2" "24G" "4G" "../../config/multipass/${instance_name}.yaml" "22.04" "$local_workspace_dir" "$virtual_workspace_dir"
