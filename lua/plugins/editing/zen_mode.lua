return {
  "folke/zen-mode.nvim",
  lazy = true,
  keys = {
    { "<Leader>z", "<cmd>ZenMode<CR>", mode = "n", desc = "Toggle ZenMode" },
  },
  config = function()
    require("zen-mode").setup()
  end,
}
