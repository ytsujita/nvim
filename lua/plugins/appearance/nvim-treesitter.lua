-- 構文解析

-- INFO:
-- dependencies gcc
-- scoop install gcc : on windows

return {
  "nvim-treesitter/nvim-treesitter",
  -- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  event = "BufReadPost",
  lazy = true,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {},
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
        disable = { "dart" } -- because dart ls format too slow
      },
    })
  end,
  cond = function()
    return vim.g.vscode == nil
  end,
}
