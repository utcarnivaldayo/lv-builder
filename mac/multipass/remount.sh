#!/bin/bash
set -euo pipefail

instance_name="${1}"
tmp="$(mktemp)"
multipass info "${instance_name}" | grep "=>" | sed -E "s/Mounts://g" | sed -E "s/ +//g" | sed -E "s/=>/ $instance_name:/g" | sed -E "s/^/multipass mount /g" >>"${tmp}"
multipass umount "${instance_name}"
while read -r line; do
    eval "${line}"
done <"${tmp}"
