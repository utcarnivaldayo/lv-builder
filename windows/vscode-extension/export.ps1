# --- install vscode extension ---

Write-Output "--- Export VSCode Extension: Start! ---"

$extension_list = $args[0]
New-Item -Type File $extension_list
code --list-extensions > $extension_list

Write-Output "--- Export VSCode Extension: Finish! ---"
