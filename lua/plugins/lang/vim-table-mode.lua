-- mdのテーブルを楽に書く
return {
  "dhruvasagar/vim-table-mode",
  ft = "md",
  cond = function()
    return vim.g.vscode == nil
  end,
  lazy = true,
}
