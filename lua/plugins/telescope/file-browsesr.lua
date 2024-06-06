return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    { "<Leader>fe", "<cmd> Telescope file_browser <CR>", mode = "n", desc = "file browser" },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}
