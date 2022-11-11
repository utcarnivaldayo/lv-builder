#!/bin/bash
set -euo pipefail

echo "--- Install App: Start! ---"
app_ids=${1}
while read -r line; do
    if [[ "${line}" = id ]]; then
        continue
    fi
    if [[ "${line}" != "" ]]; then
        brew install "${line}"
    fi
done <"${app_ids}"
echo "--- Install App: Finish! ---"
