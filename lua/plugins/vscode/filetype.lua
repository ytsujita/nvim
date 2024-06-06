-- デフォルトのより早いfiletype
return {
  "nathom/filetype.nvim",
  event = "VimEnter",
  cond = function()
    return vim.g.vscode == nil
  end,
  init = function()
    vim.g.did_load_filetypes = 1
  end,
  config = function()
    require("filetype").setup({})
  end,
}
