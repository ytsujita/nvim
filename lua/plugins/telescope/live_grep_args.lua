return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  keys = {
    { "<Leader>fwa", "<cmd> Telescope live_grep_args <CR>", desc = "find word", mode = "n" },
  },
  config = function()
    require("telescope").load_extension("live_grep_args")
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}
