#!/bin/bash
set -euo pipefail

app_ids=${1}
echo "--- Install App: Start! ---"
while read -r line; do
    if [[ "${line}" == "id" ]]; then
        continue
    fi
    if [[ "${line}" -ne "" ]]; then
        brew install "${line}"
    fi
done <"${app_ids}"
echo "--- Install App: Finish! ---"
