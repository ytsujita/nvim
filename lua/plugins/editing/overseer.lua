return {
  'stevearc/overseer.nvim',
  lazy = true,
  cmd = { "OverseerToggle", "OverseerRun" },
  keys = {
    { "<Leader>oo", "<cmd>OverseerToggle<CR>", mode = "n", desc = "overseer toggle" },
    { "<Leader>or", "<cmd>OverseerRun<CR>",    mode = "n", desc = "overseer toggle" },
  },
  config = function()
    require('overseer').setup()
  end
}
