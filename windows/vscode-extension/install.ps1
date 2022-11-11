# --- install vscode extension ---

Write-Output "--- Install VSCode Extension: Start! ---"

$extension_ids = (Get-Content $args[0]) -as [string[]]

# install
foreach ($item in $extension_ids) {
    if ($item -ne "") {
        code --install-extension $item
    }
}

Write-Output "--- Install VSCode Extension: Finish! ---"
