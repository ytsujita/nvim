-- insert modeで行数を絶対値に
return {
  "myusuf3/numbers.vim",
  event = "InsertEnter",
  lazy = true,
  cond = function()
    return vim.g.vscode == nil
  end,
  init = function()
    -- 行番号の非表示を行うfiletype列挙
    vim.g.numbers_exclude = {
      "tagbar",
      "NvimTree",
      "nerdtree",
      "gundo",
      "minibufexpl",
      "toggleterm",
      "dashboard",
      "packer",
    }
  end,
}
