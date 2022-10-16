# --- uninstall vscode extension ---

Write-Output "--- Uninstall VSCode Extension: Start! ---"

extension_ids_path = $args[0]

extension_ids = Import-Csv $extension_ids_path -Encoding UTF8
$extension_ids | Format-Table

# install
foreach ($item in $extension_id) {
    if ($item.id -ne "") {
        code --uninstall-extension $item.id
    }
}

Write-Output "--- Uninstall VSCode Extension: Finish! ---"