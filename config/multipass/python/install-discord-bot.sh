#!/bin/bash

set -euo pipefail

sudo apt update
sudo apt -y install libffi-dev libnacl-dev python3-dev
python -m pip install -U discord.py
