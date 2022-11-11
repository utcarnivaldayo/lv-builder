
# set enviroment name
$enviroment_name = $args[0]
if ($null -eq $enviroment_name) {
    $enviroment_name = "basic"
}

$local_config_dir = (Convert-Path ../../config/multipass/$enviroment_name)

# set instance name
$instance_name = $args[1]
if ($null -eq $instance_name) {
    $instance_name = $enviroment_name
}
$virtual_home = "/home/ubuntu"
$virtual_workspace_dir = "$virtual_home/synced-$instance_name"

# set local workspace path
$local_workspace_dir = $args[2]
if ($null -eq $local_workspace_dir) {
    $local_workspace_dir = (Convert-Path ../../workspace/$enviroment_name)
}
New-Item "$local_workspace_dir" -itemType Directory

# set resource parameters
$cpus = $args[3]
if ($null -eq $cpus) {
    $cpus = "2"
}
$disk = $args[4]
if ($null -eq $disk) {
    $disk = "40G"
}
$mem = $args[5] 
if ($null -eq $mem) {
    $mem = "4G"
}

# set ubuntu version
$ubuntu_version = $args[6]
if ($null -eq $ubuntu_version) {
    $ubuntu_version = "22.04"
}

# launch multipass instance
multipass launch --cpus "$cpus" --disk "$disk" --mem "$mem" --cloud-init "$local_config_dir/${enviroment_name}.yaml" --name "$instance_name" "$ubuntu_version"
multipass exec "$instance_name" -- mkdir "$virtual_workspace_dir"

# transfer init-files
multipass exec "$instance_name" -- mkdir "${virtual_home}/init"
$init_files = (Get-Content "$local_config_dir/init-files") -as [string[]]
foreach ($item in $init_files) {
    Write-Output $item
    multipass transfer "$local_config_dir/$item" "${instance_name}:${virtual_home}/init/"
}

# execute init-command
$init_commands = (Get-Content "$local_config_dir/init-commands") -as [string[]]
foreach ($item in $init_commands) {
    multipass exec "$instance_name" -- "$item"
}

# ensure multipassd is running
multipass set local.privileged-mounts=true
Restart-Service -Name multipass
sleep 10

# mount
multipass mount "$local_workspace_dir" "${instance_name}:$virtual_workspace_dir"

# stop instance
multipass stop "$instance_name"
