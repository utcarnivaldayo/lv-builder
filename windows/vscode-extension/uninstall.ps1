# --- uninstall vscode extension ---

Write-Output "--- Uninstall VSCode Extension: Start! ---"

$extension_ids = $args[0]

# install
foreach ($item in $extension_ids) {
    if ($item -ne "") {
        code --uninstall-extension $item
    }
}

Write-Output "--- Uninstall VSCode Extension: Finish! ---"