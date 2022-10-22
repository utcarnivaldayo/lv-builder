#!/bin/bash
set -euo pipefail

# --- Uninstall vscode extension ---

echo "--- Uninstall VSCode Extension: Start! ---"
vscode_extensions="${1}"

while read -r line; do
    if [[ "${line}" == "id" ]]; then
        continue
    fi
    if [[ "${line}" -ne "" ]]; then
        code --uninstall-extension "${line}"
    fi
done <"${vscode_extensions}"
echo "--- Uninstall VSCode Extension: Finish! ---"
