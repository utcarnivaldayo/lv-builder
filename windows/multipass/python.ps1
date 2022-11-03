$instance_name = "python"
$local_workspace_dir = (Convert-Path ../../workspace/${instance_name})
$virtual_home = "/home/ubuntu"
$virtual_workspace_dir = "/home/ubuntu/synced-${instance_name}"

$local_config_dir = (Convert-Path ../../config/multipass/${instance_name})
$init_files = @("install-pyenv.sh", "install-python.sh")

pwsh -ExecutionPolicy Bypass ./launch.ps1 "${instance_name}" "2" "24G" "4G" "../../config/multipass/${instance_name}/${instance_name}.yaml" "22.04" "$local_workspace_dir" "$virtual_workspace_dir"
sleep 3
multipass start "${instance_name}"
multipass exec "${instance_name}" -- mkdir "${virtual_home}/init"
foreach ($item in $init_files) {
    multipass transfer "${local_config_dir}/${item}" "${instance_name}:${virtual_home}/init/"
}
multipass stop "${instance_name}"