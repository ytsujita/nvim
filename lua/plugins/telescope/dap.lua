return {
  "nvim-telescope/telescope-dap.nvim",
  keys = {
    { "<Leader>dc", "<cmd> Telescope dap commands <CR>",     mode = "n", desc = "dap commands" },
    { "<Leader>db", "<cmd> Telescope dap break points <CR>", mode = "n", desc = "dap break points" },
    { "<Leader>dv", "<cmd> Telescope dap variables <CR>",    mode = "n", desc = "dap variables" },
  },
  config = function()
    require("telescope").load_extension('dap')
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap",
  },
}
