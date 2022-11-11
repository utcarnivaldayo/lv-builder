# --- uninstall vscode extension ---

Write-Output "--- Uninstall VSCode Extension: Start! ---"

$extension_ids = (Get-Content $args[0]) -as [string[]]

# install
foreach ($item in $extension_ids) {
    if ($item -ne "") {
        code --uninstall-extension $item
    }
}

Write-Output "--- Uninstall VSCode Extension: Finish! ---"