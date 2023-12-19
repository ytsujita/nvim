-- デフォルトのより早いfiletype
return {
  "nathom/filetype.nvim",
  event = "VimEnter",
  init = function()
    vim.g.did_load_filetypes = 1
  end,
  config = function()
    require("filetype").setup({})
  end,
}
