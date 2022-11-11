#!/bin/bash

PYTHON_VERSION="${1}"               # 導入するpythonのバージョンを指定
pyenv update                        # pyenv環境のアップデート
pyenv install ${PYTHON_VERSION}     # 上記で指定したバージョンのpythonをインストール
pyenv global ${PYTHON_VERSION}      # 環境のptyhonコマンドのバージョンを指定
python -m pip install --upgrade pip # pipのアップグレード
