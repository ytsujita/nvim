-- 構文解析によるハイライト

-- INFO:
-- dependencies gcc
-- scoop install gcc : on windows

return {
  "nvim-treesitter/nvim-treesitter",
  -- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {},
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    })
  end,
}
