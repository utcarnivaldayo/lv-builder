#!/bin/bash
set -euo pipefail

# --- Install vscode extension ---

echo "--- Install VSCode Extension: Start! ---"
vscode_extensions="${1}"

while read -r line; do
    if [[ "${line}" != "" ]]; then
        code --install-extension "${line}"
    fi
done <"${vscode_extensions}"
echo "--- Install VSCode Extension: Finish! ---"
