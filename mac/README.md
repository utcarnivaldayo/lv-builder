# mac向けマニュアル

## 0. 準備

### Homebrewのインストール
`brew`コマンドが使えない場合は下記の手順を行なって下さい。
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 1. ローカル環境の構築
ローカル環境に必要なソフトウェアを一括インストールします。`mac/brew/basic.sh`を実行することで次のアプリケーションのインストールが可能です。
```
bash ./basic.sh
```
```
google-chrome
discord
git
gh
visual-studio-code
multipass
iterm2
```
## 2. VS Code Extensionのインストール
vscodeに推奨される拡張機能を一括インストールします。各自で拡張機能リストのファイルを作成することでカスタムインストールも可能です。`mac/vscode-extension/basic.sh`を実行することで次の拡張機能のインストールが可能です。`cpp.sh`や`rust.sh`を実行した場合、各言語のExtensionも`basic.sh`に加えて追加されます。
```
bash ./basic.sh
```
```
vscode-icons-team.vscode-icons
yzhang.markdown-all-in-one
mosapride.zenkaku
oderwat.indent-rainbow
VisualStudioExptTeam.vscodeintellicode
ms-vsliveshare.vsliveshare
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode.powershell
timonwong.shellcheck
streetsidesoftware.code-spell-checker
foxundermoon.shell-format
mhutchie.git-graph
hediet.vscode-drawio
janisdd.vscode-edit-csv
Gruntfuggly.todo-tree
jebbs.plantuml
```

## 3. 仮想環境の構築
※本ステップのみを行う場合、下記コマンドでmultipassのインストールを事前に済ませて下さい。（1. ローカル環境構築を行なっている場合は不要）
```sh
brew install --cask multipass
```
### 1. multipassインスタンスアクセスの有効化
macのファイアウォールが有効化されていると、multipassインスタンスを起動できない問題があるため、ファイアウォールの無効化を行います。インスタンス起動後はオンに戻してもOKです。

1. ディスクトップ画面左上の🍎アイコンをクリック
2. "システム環境設定"をクリック
3. "セキュリティとプライバシー"をクリック
4. "ファイアウォール"タブを選択
5. 左下の南京錠アイコンをクリックして、パスワードを入力。
6. 下記画像のように設定されていればOK
![multipassインスタンスアクセスの有効化](./img/multipass_firewall.png)

### 2. multipassへのフルディスクアクセスの有効化
osからmultipassへディレクトリのマウントを許可するため、下記の手順を行なって下さい。

1. ディスクトップ画面左上の🍎アイコンをクリック
2. "システム環境設定"をクリック
3. "セキュリティとプライバシー"をクリック
4. "プライバシー"タブを選択
5. 左の一覧から"フルディスクアクセス"を選択
6. 左下の南京錠をクリックして、パスワード入力
7. 右の一覧の"multipassd"にチェック
8. 下記画像のように設定されていればOK
![multipassへのフルディスクアクセスの有効化](./img/multipass_fullaccess.png)

### 3. 仮想環境構築スクリプトの実行
multipassによりubuntu仮想環境を構築します。
`mac/multipass`ディレクトリ下の各スクリプト`cpp.sh` / `cs.sh` / `nodejs.sh` / `rust.sh` / `docker.sh` / `python.sh`を実行することでc++ / cs / nodejs / rust / docker / pythonの仮想環境をそれぞれ構築できます。
```sh
bash ./cpp.sh
```
```sh
bash ./cs.sh
```
```sh
bash ./nodejs.sh
```
```sh
bash ./rust.sh
```
```sh
bash ./docker.sh
```
```sh
bash ./python.sh
```
また、上記のスクリプトを利用する場合、`workspace`下のmultipassインスタンス名に対応するディレクトリがマウントされるように動作します。
任意のディレクトリをマウントしたい・リソース割り振りを変更したい場合は上記バッチの代わりに各環境に対する下記のコマンドを`windows/multipass` ディレクトリ下で実行してください。(リソースのデフォルト値は`cpu: 2`, `disksize: 24[GByte]`, `memory: 4[GByte]`, `ubuntu version: 22.04`)
- c++環境
    ```sh
    bash ./cpp.sh <任意のインスタンス名> <マウント対象ディレクトリへのフルパス(マウント対象ディレクトリの名前はインスタンス名と同名)> 2 24G 4G 22.04
    ```
- cs環境(x64のみ)
    ```sh
    bash ./cs.sh <任意のインスタンス名> <マウント対象ディレクトリへのフルパス(マウント対象ディレクトリの名前はインスタンス名と同名)> 2 24G 4G 22.04
    ```
- nodejs環境
    ```sh
    bash ./nodejs.sh <任意のインスタンス名> <マウント対象ディレクトリへのフルパス(マウント対象ディレクトリの名前はインスタンス名と同名)> 2 24G 4G 22.04
    ```
- rust環境
    ```sh
    bash ./rust.sh <任意のインスタンス名> <マウント対象ディレクトリへのフルパス(マウント対象ディレクトリの名前はインスタンス名と同名)> 2 24G 4G 22.04
    ```
- docker環境
    ```sh
    bash ./docker.sh <任意のインスタンス名> <マウント対象ディレクトリへのフルパス(マウント対象ディレクトリの名前はインスタンス名と同名)> 2 40G 4G 22.04
    ```
- python環境
    ```sh
    bash ./python.sh <任意のインスタンス名> <マウント対象ディレクトリへのフルパス(マウント対象ディレクトリの名前はインスタンス名と同名)> 2 24G 4G 22.04
    ```
