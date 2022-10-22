
$instance_name = $args[0]
$tmp = New-TemporaryFile
multipass info $instance_name | Select-String -SimpleMatch "=>" | % { $_ -replace "Mounts:", "" } | % { $_ -replace " +", "" } | % { $_ -replace "=>", " ${instance_name}:" } | % { $_ -replace "^", "multipass mount " } >> $tmp
$mount_commands = Import-Csv $tmp -Encoding UTF8
$app_ids | Format-Table