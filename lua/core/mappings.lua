return {
  i = {
    ["jj"] = { "<ESC>", "Escape" },
    ["jk"] = { "<Esc>", "Escape" },
    ["kk"] = { "<Esc>", "Escape" },
    ["kj"] = { "<Esc>", "Escape" },
    ["<C-j>"] = { "<C-o>j", "下に" },
    ["<C-k>"] = { "<C-o>k", "上に" },
  },
  n = {
    ["<ESC>"] = { ":noh<CR>", "ハイライト削除" },

    ["<Leader>ww"] = { ":w<CR>", "ファイル保存" },
    ["<Leader>wa"] = { ":wa<CR>", "全ファイル保存" },
    ["<Leader>q"] = { ":q<CR>", "ウィンドウを閉じる" },
    ["yd"] = { '"_d', "ヤンクせずに削除" },
    ["yc"] = { '"_c', "ヤンクせずに削除" },

    -- window操作系
    ["ss"] = { ":sp<CR>", "画面の上下分割" },
    ["sv"] = { ":vs<CR>", "画面の左右分割" },
    ["sJ"] = { "<C-w>J", "ウィンドウを下に移動" },
    ["sK"] = { "<C-w>K", "ウィンドウを上に移動" },
    ["sL"] = { "<C-w>L", "ウィンドウを右に移動" },
    ["sH"] = { "<C-w>H", "ウィンドウを左に移動" },
    ["sj"] = { "<C-w>j", "下ウィンドウに移動" },
    ["sk"] = { "<C-w>k", "上ウィンドウに移動" },
    ["sl"] = { "<C-w>l", "右ウィンドウに移動" },
    ["sh"] = { "<C-w>h", "左ウィンドウに移動" },
    ["s>"] = { "<C-w>>", "ウィンドウ左右に拡大" },
    ["s<"] = { "<C-w><", "ウィンドウ左右に縮小" },
    ["s+"] = { "<C-w>+", "ウィンドウ上下に拡大" },
    ["s-"] = { "<C-w>-", "ウィンドウ上下に縮小" },
    ["s="] = { "<C-w>=", "ウィンドウ左右に揃える" },
    ["s_"] = { "<C-w>_", "ウィンドウ縦に最大化" },
    ["s|"] = { "<C-w>|", "ウィンドウ横に最大化" },
    ["sc"] = { "<C-w>c", "ウィンドウを閉じる" },
    ["sn"] = { "<C-w>w", "次ウィンドウへ" },
    ["sp"] = { "<C-w>W", "前ウィンドウへ" },

    ["<C-j>"] = { "+", "一行下に" },
    ["<C-k>"] = { "-", "一行上に" },
    ["zj"] = { "zt", "カーソルを画面最上部に" },
    ["zk"] = { "zb", "カーソルを画面最下部に" },
    ["+"] = { "<C-a>", "Increment" },
    ["-"] = { "<C-x>", "Decrement" },
    ["<Leader>re"] = { ":%s;\\<<C-R><C-W>\\>;g<Left><Left>;", "Replace" },
    ["<Leader>p"] = { '"0p', "paste 0 register" },
    ["<Leader><Leader>"] = { "<C-^>", "Toggle between previous file and current file." },
    ["<Leader>n"] = { ":cnext<CR>", "Next quickfix." },
    ["<Leader>N"] = { ":cprevious<CR>", "Next quickfix." },
    ["<Leader>gj"] = { "10j", "Next quickfix." },
    ["<Leader>gk"] = { "10k", "Next quickfix." },
  },
  v = {
    ["<Leader>p"] = { '"0p', "0レジスタをペースト" },
  },
  t = {
    ["<A-j>"] = { "<C-\\><C-n>", "ターミナルノーマルモードへ" },
  },
  o = {
    ["("] = { "i(", "()内指定" },
    ['"'] = { 'i"', '"内指定' },
    ["'"] = { "i'", "'内指定" },
    ["@"] = { "i`", "`指定" },
    ["["] = { "i[", "[]内指定" },
    ["{"] = { "i{", "{}内指定" },
  },
}
