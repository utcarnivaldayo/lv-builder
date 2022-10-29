# --- install vscode extension ---

Write-Output "--- Install VSCode Extension: Start! ---"

$extension_ids = $args[0]

# install
foreach ($item in $extension_ids) {
    if ($item -ne "") {
        code --install-extension $item
    }
}

Write-Output "--- Install VSCode Extension: Finish! ---"
