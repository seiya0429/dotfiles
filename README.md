# dotfiles

## 事前準備
- Apple Accountのログイン

## 使い方

```
$ cd ~
$ git clone https://github.com/seiya0429/dotfiles.git
$ make all
```

## 手動での設定

### Google日本語入力の設定

### SSH鍵の設定
1PasswordのSSH鍵を使うための設定追加
SSHエージェントを1Passwordアプリから確認して追加する

下記が追加されていることを確認

```
$ cat ~/.ssh/config
Host *
	IdentityAgent "~/Library/Group Containers/XXXXXXX.com.1password/t/agent.sock"
```
### Raycastの設定

- 以前のPCからRaycastの設定ファイルをexportして新しいPCにimportする

`FiraCode Nerd Font`に設定

### asdfの設定

#### Ruby

opensslのパスを指定しないとエラーが出る

```bash
$ asdf plugin add ruby
$ asdf install ruby 3.3.0 --with-openssl-dir="/opt/homebrew/bin/openssl"
$ asdf global ruby 3.3.0
```

### Node.js


```bash
$ asdf plugin add nodejs
$ asdf install nodejs 18.16.0
$ asdf global nodejs 18.16.0
```

### TablePlusの設定

- ライセンスキーの設定

### CleanMyMacの設定

- ライセンスキーの設定

## TIPS

### Mas CLIでインストールするアプリケーションIDを探す方法
```
mas search "アプリケーション名"
```