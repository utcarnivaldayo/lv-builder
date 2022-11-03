#!/bin/bash

set -euo pipefail

sudo apt update
sudo apt -y install git \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    llvm \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev

curl https://pyenv.run | bash &&
    echo 'export PATH="${HOME}/.pyenv/bin:$PATH"' >>~/.bashrc &&
    echo 'eval "$(pyenv init -)"' >>~/.bashrc &&
    echo 'eval "$(pyenv virtualenv-init -)"' >>~/.bashrc &&
    . ~/.bashrc
