# windows向けマニュアル

## 0. 準備
### 1. パッケージマネージャ（winget）のインストール
1. スタートメニューの"Microsoft Store"のアイコンをクリック
2. 検索欄に"アプリインストーラ"と入力して検索
3. 検索結果の一覧から"アプリインストーラを選択"
4. インストールのボタンがあればそれをクリックしてインストール（ボタンなければ既にインストール済み）


### 2. powershell7のインストール
システムのpowershellは新しいpowershellを利用することを推奨しているため（powershell7が既にインストールされている場合にはこの作業は不要）

システム内蔵のpowershellを起動し、次のコマンドを実行してください。
```powershell
winget install --id Microsoft.Powershell --source winget
```

### 3. DLしてきたps1ファイルの実行を有効化

1. powershell7を管理者権限で実行し、下記コマンドを実行
    ```powershell  
    Set-ExecutionPolicy Bypass
    ```
2. スクリプト実行権限の変更確認
    ```powershell
    Get-ExecutionPolicy
    ```
    `Bypass`と表示されればOK


### 4. msstoreの承認
msstoreからアプリケーションをインストールには認証が必要です。
![msstoreの承認](./img/msstore-approve.png)

1. 下記コマンドをpowershell7上で実行
    ```powershell
    winget install -e --id Google.Chrome
    ``` 
2. "すべてのソーズ条件に同意しますか？"と聞かれるので`Y`を入力
3. 既にChromeがインストールされている状態であれば、`ctrl + C`でインストールをキャンセル
### 5. Hyper-vの有効化
次の条件のいずれかを満たしている場合この作業は必要ありません。

- multipassによる仮想環境の構築が不要
- Virtual Boxが既にインストール済み
- OSがWindows10・11 Pro

1. `windows/multipass/enable-hyper-v.bat`を管理者権限で実行（この作業を行うとOSが再起動するため、`enable-hyper-v.bat`の実行前に他のアプリケーションを終了しておく）
2. Hyper-vの有効化を次の手順で確認
![Hyper-vの有効化確認](./img/hyperv-enable-check.png)
    1. 
## ローカル環境の構築
ローカル環境に必要なソフトウェアを一括インストールします。各自でソフトウェアのリストのファイルを作成することでカスタムインストールも可能です。`local-basic.bat`では次のアプリケーションのインストールを行います。
```
Google.Chrome
Discord.Discord
WinSCP.WinSCP
Git.Git
GitHub.cli
Microsoft.VisualStudioCode
Canonical.Multipass
```

## VS Code Extensionのインストール
vscodeに推奨される拡張機能を一括インストールします。各自で拡張機能リストのファイルを作成することでカスタムインストールも可能です。`windows/vscode-extension/vscode-extension-basic.bat`では次の拡張機能のインストールを行います。
```
vscode-icons-team.vscode-icons
yzhang.markdown-all-in-one
mosapride.zenkaku
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
```


## 仮想環境の構築
multipassによりubuntu仮想環境を構築します。
構築環境としては、c++・node・rustを

- c++環境
```powershell
```
- node環境
```powershell

```
- rust環境
```powershell

```
