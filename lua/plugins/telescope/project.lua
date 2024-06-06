return {
  "nvim-telescope/telescope-project.nvim",
  keys = {
    { "<Leader>fp", "<cmd> Telescope project <CR>", mode = "n", desc = "find project" },
  },
  config = function()
    require("telescope").load_extension("project")
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}
