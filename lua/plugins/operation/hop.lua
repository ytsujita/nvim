-- jump
return {
  "phaazon/hop.nvim",
  branch = "v2",
  keys = {
    { "<Leader>jw", "<cmd>HopWord<CR>",     desc = "jump word",     mode = "n" },
    { "<Leader>jv", "<cmd>HopVertical<CR>", desc = "jump vertical", mode = "n" },
  },
  config = function()
    require("hop").setup({})
  end,
  lazy = true,
}
