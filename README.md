# Nvimの設定

lazy.nvimによって初期ダウンロードと各プラグインの遅延読み込みが行われる

## インストール

### 前提環境の構築

#### ツールのインストール

- windows なら scoop を使うと楽
- neovim本体のインストール（執筆時点ではv0.9.4)
- luaのインストール、多分あったほうがいい
- efm-langserverのインストール
  - go をインストールしてgo installするといい
- treesitter依存先 gcc のインストール
- nodejs, 多分あったほうがいい
- その他 checkhealth でWARNになっているものを必要に応じてインストール

#### 環境変数の設定

- 環境変数の設定
  - HOME : `~`
  - XDG_CACHE_HOME : `~/.cache`
  - XDG_CONFIG_HOME : `~/.config`
  - XDG_DATA_HOME : `~/.local/share`
  - XDG_STATE_HOME : `~/.local/state`

