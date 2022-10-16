# --- install app ---

Write-Output "--- Install App: Start! ---"

$app_ids_path = $args[0]

$app_ids = Import-Csv $app_ids_path -Encoding UTF8
$app_ids | Format-Table

# read
foreach ($item in $app_ids) {
    if ($item.id -ne "") {
        $ids += $item.id
    }
    if ($item.path -ne "") {
        $paths += $item.path
    }
}

# install
foreach($item in $ids) {
    if ("$(winget list --id $item)".Contains(($item))) {
        Write-Output "$item has already installed."
    }
    else {
        winget install -e --id $item
    }
}

# --- Add Enviroment Path ---
foreach($item in $paths) {
    $oldSystemPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
    if (!$oldSystemPath.Contains($item)) {
        $oldSystemPath += ";" + $item
        [System.Environment]::SetEnvironmentVariable("Path", $oldSystemPath, "User")
        Write-Output "Set path: $item"
    } else {
        Write-Output "$item has already set."
    }
}

Write-Output "--- Install App: Finish! ---"
