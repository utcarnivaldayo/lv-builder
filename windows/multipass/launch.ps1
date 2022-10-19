# --- multipass ---
Write-Output "--- Multipass: Start! ---"

$instance_name = $args[0]
$cpus = $args[1]
$disk = $args[2]
$mem = $args[3]
$cloud_init = $args[4]
$image_name = $args[5]

multipass launch --cpus $cpus --disk $disk --mem $mem --cloud-init $cloud_init --name $instance_name $image_name
multipass exec $instance_name -- mkdir "sync"
multipass stop $instance_name

Write-Output "--- Multipass: Finish! ---"