# --- multipass remote ---

$instance_name = $args[0]
$tmp = New-TemporaryFile
Write-Output "command" >> $tmp
multipass info $instance_name | Select-String -SimpleMatch "=>" | % { $_ -replace "Mounts:", "" } | % { $_ -replace " +", "" } | % { $_ -replace "=>", " ${instance_name}:" } | % { $_ -replace "^", "multipass mount " } >> $tmp
multipass umount $instance_name
$mount_commands = Import-Csv $tmp -Encoding UTF8
$mount_commands | Format-Table
foreach ($item in $mount_commands) {
    if ($item.command -ne "") {
        Invoke-Expression $item.command
    }
}