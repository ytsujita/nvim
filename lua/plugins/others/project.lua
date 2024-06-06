return {
  "ahmedkhalf/project.nvim",
  lazy = true,
  event = "VimEnter",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("project_nvim").setup({})
    require("telescope").load_extension("projects")
  end,
}
