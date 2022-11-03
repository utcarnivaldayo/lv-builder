# --- multipass launch---
Write-Output "--- Multipass: Start! ---"

$instance_name = $args[0]
$cpus = $args[1]
$disk = $args[2]
$mem = $args[3]
$cloud_init_path = $args[4]
$image_name = $args[5]
$local_workdir_fullpath = $args[6]
$virtual_workdir_fullpath = $args[7]

# launch multipass instance
multipass launch --cpus $cpus --disk $disk --mem $mem --cloud-init $cloud_init_path --name $instance_name $image_name
multipass exec $instance_name -- mkdir $virtual_workdir_fullpath
multipass stop $instance_name
multipass set local.privileged-mounts=true
sleep 1

# ensure multipassd is running
Restart-Service -Name multipass
sleep 10

# mount
multipass mount $local_workdir_fullpath ${instance_name}:$virtual_workdir_fullpath

Write-Output "--- Multipass: Finish! ---"