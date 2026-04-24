# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理。ソースの既定の場所は `~/.local/share/chezmoi` です（`sourceDir` の手動上書きは不要）。

## 初回（新規 Mac）

1. 事前準備: Apple ID ログインなど
2. Homebrew 未導入なら [公式](https://brew.sh) の手順でインストール。または [install script](https://github.com/chezmoi/chezmoi#one-line-package-install) で chezmoi のみ入れて次へ。
3. リポジトリを元に初期化（GitHub 上の URL に置き換え）:

   ```bash
   chezmoi init https://github.com/seiya0429/dotfiles.git
   chezmoi apply
   ```

   このとき **sudo を求められる**ことがあります（`run_onchange_darwin-macos-defaults.sh` 内のファイアウォール・Spotlight 等）。

4. 任意: [mizchi/chezmoi-dotfiles](https://github.com/mizchi/chezmoi-dotfiles#install) 同様、追加の skills 用 symlink が必要なら:

   ```bash
   ~/.claude/skills/install.sh
   ```

5. 補足ブートストラップ（Brew や Xcode ツールの一括チェック等）: `./init.sh` → `chezmoi apply` → `make brew` など（[`Makefile`](Makefile) の `all` 参照）

## 日常的な編集

- ソースは `$(chezmoi source-path)`（通常 `~/.local/share/chezmoi`）で、変更後は `chezmoi apply` または `chezmoi cd` して `git` で push します。

## 手動での設定

### SSH鍵の設定
1PasswordのSSH鍵を使うための設定追加
SSHエージェントを1Passwordアプリから確認して追加する

下記が追加されていることを確認

```bash
cat ~/.ssh/config
```

例:

```
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
asdf plugin add nodejs
asdf install nodejs 20.9.0
asdf global nodejs 20.9.0
```

## TIPS

### Mas CLIでインストールするアプリケーションIDを探す方法

```bash
mas search "アプリケーション名"
```

### 移行前に `git clone` で `~/dotfiles` していた場合

- 以降の正は `~/.local/share/chezmoi` の VCS です。内容を揃えたうえで `chezmoi init` し直すか、手元の clone を捨てて上記 `chezmoi init <url>` から入り直すと一貫します。
