-- リッチな通知とコマンドラインの中央表示
return {
  "folke/noice.nvim",
  keys = { ":" },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
      },
      messages = {
        enabled = true,
      },
      notify = {
        enabled = true,
        view = "notify",
        render = "wrapped-compact",
        max_width = 95,
      },
    })
  end,
}
