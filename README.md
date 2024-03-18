# dotfiles

## 使い方

```
$ cd ~
$ git clone git@github.com:seiya0429/dotfiles.git
$ make all
```

## 手動での設定

### Google日本語入力の設定

### SSH鍵の設定
1PasswordのSSH鍵を使うための設定追加
SSHエージェントを1Passwordアプリから確認して追加する

```
$ cat ~/.ssh/config
Host *
	IdentityAgent "~/Library/Group Containers/XXXXXXX.com.1password/t/agent.sock"
```

### Terminalのフォント設定

### Raycastの設定

- 以前のPCからRaycastの設定ファイルをexportして新しいPCにimportする
- 1Password Extensionの設定で、1Password CLIのパスを設定する

`FiraCode Nerd Font`に設定

## TIPS

### Mas CLIでインストールするアプリケーションIDを探す方法
```
mas search "アプリケーション名"
```