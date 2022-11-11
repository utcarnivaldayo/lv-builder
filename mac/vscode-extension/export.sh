#!/bin/bash

set -euo pipefail

echo "--- Export VSCode Extension: Start! ---"

extension_list="${1}"
touch "${extension_list}"
code --list-extensions >"${extension_list}"

echo "--- Export VSCode Extension: Finish! ---"
