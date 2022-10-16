# --- install app ---

Write-Output "--- Uninstall App: Start! ---"

$app_ids_path = $args[0]

$app_ids = Import-Csv $app_ids_path -Encoding UTF8
$app_ids | Format-Table

# uninstall
foreach($item in $app_ids) {
    if ("$(winget list --id $item.id)".Contains(($item.id))) {
        winget uninstall -e --id $item.id
    }
    else {
        Write-Output $item.id "dose not exist"
    }
}

Write-Output "--- Uninstall App: Finish! ---"
