# --- install vscode extension ---

Write-Output "--- Install VSCode Extension: Start! ---"

extension_ids_path = $args[0]

$extension_ids = Import-Csv $extension_ids_path -Encoding UTF8
$extension_ids | Format-Table

# install
foreach ($item in $extension_id) {
    if ($item.id -ne "") {
        code --install-extension $item.id
    }
}

Write-Output "--- Install VSCode Extension: Finish! ---"
