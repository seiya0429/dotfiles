# dotfiles

## 使い方

```
$ cd ~
$ git clone git@github.com:seiya0429/dotfiles.git
$ chmod 774 dotfiles/.bin/init.sh dotfiles/.bin/link.sh dotfiles/.bin/defaults.sh dotiles/.bin/brew.sh dotfiles/.bin/github.sh
$ make all
```

## SSH鍵の設定
1PasswordのSSH鍵を使うための設定追加
SSHエージェントを1Passwordアプリから確認して追加する
```
$ cat ~/.ssh/config
Host *
	IdentityAgent "~/Library/Group Containers/XXXXXXX.com.1password/t/agent.sock"
```

## Mas CLIでインストールするアプリケーションIDを探す方法
```
mas search "アプリケーション名"
```