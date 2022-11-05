# python environment
## 1. pyenvのインストール
```sh
cd ~/init
bash ./install-pyenv.sh
```

## 2. pyenvコマンドの有効化
`exit`コマンドで仮想環境から出て、ローカル環境で下記コマンドを実行して下さい。
```sh
multipass restart python
multipass shell python
```

## 3. pythonのインストール
```sh
cd ~/init
bash ./install-python <pythonのバージョン(例: 3.11.0)>
```



