#!/bin/bash

set -euo pipefail

sudo apt update
sudo apt -y install apt-transport-https ca-certificates gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update
sudo apt info docker-ce
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker "${USER}"
