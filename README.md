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

### SSH鍵の設定
1PasswordのSSH鍵を使うための設定追加
SSHエージェントを1Passwordアプリから確認して追加する

下記が追加されていることを確認

```
$ cat ~/.ssh/config
Host *
	IdentityAgent "~/Library/Group Containers/XXXXXXX.com.1password/t/agent.sock"
```

### MacOSの設定手動変更

- Spotlightのショートカットを無効化する
- デフォルトブラウザを変更する
- ライブ変換オフ

### asdfの設定

### Node.js

```bash
$ asdf plugin add nodejs
$ asdf install nodejs 20.9.0
$ asdf global nodejs 20.9.0
```

## TIPS

### Mas CLIでインストールするアプリケーションIDを探す方法
```
mas search "アプリケーション名"
```