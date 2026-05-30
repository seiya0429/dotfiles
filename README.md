# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理。ソースの既定の場所は `~/.local/share/chezmoi` です（`sourceDir` の手動上書きは不要）。

## 初回（新規 Mac）

1. 事前準備: Apple ID ログインなど
2. 次のどちらか: Homebrew 経由で `brew install chezmoi`、または [one-line install](https://github.com/chezmoi/chezmoi#one-line-package-install) で chezmoi のみ入れる。Homebrew 自体は未導入でも、初回の `chezmoi apply` 内で `run_once_after_darwin-02-homebrew.sh` がインストールする（ネットワーク必須）。
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
5. 補足ブートストラップ: `chezmoi apply` 内で `run_after_darwin-01-xcode-clt.sh` が CLT 未導入時にインストーラを起動する。CLT のインストール完了後にもう一度 `chezmoi apply` するとよい。`dot_Brewfile` を変えたあとパッケージを揃える場合は、`chezmoi apply` 済みで `~/.Brewfile` があるなら `brew bundle --file ~/.Brewfile`、または PATH に Homebrew が無いときは `/opt/homebrew/bin/brew bundle --file ~/.Brewfile`。ソースだけ更新した段階なら `brew bundle --file ~/.local/share/chezmoi/dot_Brewfile`（chezmoi の既定のソースパス前提）。`run_once_*` を再実行したい場合は `chezmoi state delete-bucket --bucket=scriptState`（公式ドキュメント参照）。

## 日常的な編集

- ソースは `$(chezmoi source-path)`（通常 `~/.local/share/chezmoi`）で、変更後は `chezmoi apply` または `chezmoi cd` して `git` で push します。

## Claude Code マルチアカウント

個人用と仕事用で認証・履歴を分けつつ、`CLAUDE.md` / skills 等は chezmoi 管理の `~/.claude` を work 側へ symlink 同期する構成です。詳細は [Claude Codeで仕事用・個人用アカウントを使い分ける方法](https://zenn.dev/yamitake/articles/claude-code-multi-account) を参照。

| 用途 | コマンド / 条件 | 設定ディレクトリ |
|------|-----------------|------------------|
| 個人（デフォルト） | `claude` | `~/.claude`（chezmoi） |
| 仕事（手動） | `work-claude` | `~/.claude-work` |
| 仕事（自動） | 仕事リポで `direnv` が有効なとき `claude` | `~/.claude-work` |

`chezmoi apply` で `~/.claude-work` へのミラーが走ります（[`run_onchange_darwin-claude-work-mirror.sh.tmpl`](run_onchange_darwin-claude-work-mirror.sh.tmpl)）。

### 初回セットアップ

1. `chezmoi apply` 後、新しいシェルを開く（`direnv` は Brewfile 経由で入る）
2. 仕事アカウントで初回ログイン:

```bash
work-claude
```

ブラウザで仕事用アカウントにログインする。Claude Code 起動後 `/status` でアカウントを確認する。

3. 個人アカウント確認:

```bash
claude
# 起動後
/status
```

### 仕事用リポでの direnv

リポのルートに `.envrc`（共有可能）と `.envrc.local`（ローカルのみ、グローバル gitignore で除外）を置く。

```bash
# .envrc
source_env_if_exists .envrc.local
```

```bash
# .envrc.local
export CLAUDE_CONFIG_DIR=$HOME/.claude-work
```

```bash
cd /path/to/work-repo
direnv allow
claude
/status
```

### 既知の制限

プラグイン / marketplaces が `~/.claude` にハードコードされる問題があります（[anthropics/claude-code#15071](https://github.com/anthropics/claude-code/issues/15071)）。認証・履歴・`settings.local.json` の分離は問題なく動作します。

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

