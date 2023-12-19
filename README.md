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
- Mason依存先のインストール
  - gzip curl unzip wget tar pwsh 7z
- treesitter依存先 gcc のインストール
- nodejs, 多分あったほうがいい
- その他 checkhealth でWARNになっているものを必要に応じてインストール

#### 環境変数の設定

- 環境変数の設定
  - XDG_CACHE_HOME : ~/.cache/nvim
  - XDG_CONFIG_HOME : ~/.config
  - XDG_DATA_HOME : ~/.cache/nvim-data
  - XDG_STATE_HOME : ~/.cache/nvim-data

### init.luaなど設定の取得

#### 設定情報の取得

`git clone https://github.com/yscurea/nvim.git ~/.config/nvim`

#### efm-langserverによるformatterやlinterの設定

`git clone https://github.com/yscurea/efm-langserver.git ~/.config/efm-langserver`

windowsの場合は”%APPDATA%/efm-langserver/config.yaml” に配置する。

